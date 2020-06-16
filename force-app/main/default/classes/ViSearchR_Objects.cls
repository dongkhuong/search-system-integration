public class ViSearchR_Objects {
    public class Video {
        public Video() {
            items = new List<Item>();
        }
        public String kind {get; set;}
        public String etag {get; set;}
        public String nextPageToken {get; set;}
        public String regionCode {get; set;}
        public PageInfo pageInfo {get; set;}
        public List<Item> items {get; set;}
    }
    public class PageInfo {
        public Integer totalResults {get; set;}
        public Integer resultsPerPage {get; set;}
    }

    public class Id_Video {
        public String kind {get; set;}
        public String videoId {get; set;}
    }
    
    public class Quality_Image {
        public String url {get; set;}
        public Integer width {get; set;}
        public Integer height {get; set;}
    }
    
    public class Thumbnail {
        public Quality_Image normal {get; set;}
        public Quality_Image medium {get; set;}
        public Quality_Image high {get; set;}
    }

    public class Snippet {
        public String publishedAt {get; set;}
        public String channelId {get; set;}
        public String title {get; set;}
        public String description {get; set;}
        public Thumbnail thumbnails {get; set;}
        public String channelTitle {get; set;}
        public String liveBroadcastContent {get; set;}
    }
    
    public class Item {
        public String kind {get; set;}
        public String etag {get; set;}
        public Id_Video id {get; set;}
        public Snippet snippet {get; set;}
    }
}