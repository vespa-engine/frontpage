#YAML Data Files

This directory contains the various data files used to build the files:

| Filename | Description |
| -------- | ------- |
| `blogposts.yml` | List of recent blog posts. Manually updated (see below)! |
| `features.yml` | The four feature boxes below the use-cases on the frontpage. |
| `footerlinks.yml` | The links in the footer of the page. |
| `usecases.yml` | The use cases listed under "What is Vespa used for?". |
| `users.yml` | Companies listed under "Companies who…" |

### Updating `blogposts.yml`
While we wait for some automated way of doing this, the `blogposts.yml`
file must be manually updated. The easiest way is to use the YAML feed 
generated on blog.vespa.ai:
```
curl 'https://blog.vespa.ai/blogposts.yml' > blogposts.yml 
```

