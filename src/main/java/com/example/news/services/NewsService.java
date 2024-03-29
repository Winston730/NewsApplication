package com.example.news.services;

import com.example.news.models.Image;
import com.example.news.models.News;
import com.example.news.models.User;
import com.example.news.repositories.NewsRepository;
import com.example.news.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class NewsService {
    private final NewsRepository newsRepository;
    private final UserRepository userRepository;

    public List<News> listNews(String title) {
        if (title != null) return newsRepository.findByTitle(title);
        return newsRepository.findAll();
    }

    public void saveNews(Principal principal, News news, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {

        news.setUser(getNewsByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            news.addImageToNews(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            news.addImageToNews(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            news.addImageToNews(image3);
        }
        log.info("Saving new Product. Title: {}; Author email: {}", news.getTitle(), news.getUser().getEmail());
        News newsFromDb = newsRepository.save(news);
        newsFromDb.setPreviewImageId(newsFromDb.getImages().get(0).getId());
        newsRepository.save(news);
    }

    public User getNewsByPrincipal(Principal principal) {
        if (principal==null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteNews(Long id) {
        newsRepository.deleteById(id);
    }

    public News getNewsById(Long id) {
        return newsRepository.findById(id).orElse(null);
    }
}