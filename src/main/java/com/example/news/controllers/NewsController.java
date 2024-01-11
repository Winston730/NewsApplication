package com.example.news.controllers;

import com.example.news.models.News;
import com.example.news.services.NewsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class NewsController {
    private final NewsService newsService;

    @GetMapping("/")
    public String newss(@RequestParam(name = "title", required = false) String title, Model model, Principal principal) {
        model.addAttribute("newss", newsService.listNews(title));
        model.addAttribute("user", newsService.getNewsByPrincipal(principal));
        return "news";
    }

    @GetMapping("/news/{id}")
    public String newsInfo(@PathVariable Long id, Model model,Principal principal) {
        News news = newsService.getNewsById(id);
        model.addAttribute("news", news);
        model.addAttribute("images", news.getImages());
        model.addAttribute("user", newsService.getNewsByPrincipal(principal));
        return "news-info";
    }
    @GetMapping("/create")
    public String getCreationNewsPage(Model model, Principal principal){
        model.addAttribute("user", newsService.getNewsByPrincipal(principal));
        return "create-page";
    }

    @PostMapping("/news/create")
    public String createNews(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                             @RequestParam("file3") MultipartFile file3, News news, Principal principal) throws IOException {
        /*String formattedString = news.getText().replace("\n", "<br>");
        news.setText(formattedString);*/
        newsService.saveNews(principal, news, file1, file2, file3);
        return "redirect:/";
    }

    @PostMapping("/news/delete/{id}")
    public String deleteNews(@PathVariable Long id) {
        newsService.deleteNews(id);
        return "redirect:/";
    }
}