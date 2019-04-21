## OctoberCMS deploy tips & tricks

### 




### Optimalizations
Most of the bottlenecks of any php application are that people forgot to do:

- Optimalize composer autoloader `composer install --optimize-autoloader`
- Run `php artisan config:cache` to cache config files
- Use OPcache on server
- Disable debug and enabled cache for everything
- Use memory cache (redis, memcached...)
