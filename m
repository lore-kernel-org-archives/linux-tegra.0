From: Coly Li <colyli-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH -next] bcache: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Thu, 16 Jul 2020 17:54:17 +0800
Message-ID: <a0f9b92b-d8f2-7c03-8c48-9e71e506361b@suse.de>
References: <20200716090313.13216-1-miaoqinglang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200716090313.13216-1-miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qinglang Miao <miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kent Overstreet <kent.overstreet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 2020/7/16 17:03, Qinglang Miao wrote:
> From: Yongqiang Liu <liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> 

Hi Qianlang and Yongqiang,

> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> 
> Signed-off-by: Yongqiang Liu <liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/md/bcache/closure.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/md/bcache/closure.c b/drivers/md/bcache/closure.c
> index 99222aa5d..37b9c5d49 100644
> --- a/drivers/md/bcache/closure.c
> +++ b/drivers/md/bcache/closure.c
> @@ -159,7 +159,7 @@ void closure_debug_destroy(struct closure *cl)
>  
>  static struct dentry *closure_debug;
>  
> -static int debug_seq_show(struct seq_file *f, void *data)
> +static int debug_show(struct seq_file *f, void *data)
>  {
>  	struct closure *cl;
>  
> @@ -188,17 +188,7 @@ static int debug_seq_show(struct seq_file *f, void *data)
>  	return 0;
>  }
>  
> -static int debug_seq_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, debug_seq_show, NULL);
> -}
> -

Here NULL is sent to single_open(), in DEFINE_SHOW_ATTRIBUTE()
inode->i_private is sent into single_open(). I don't see the commit log
mentions or estimates such change.


> -static const struct file_operations debug_ops = {
> -	.owner		= THIS_MODULE,
> -	.open		= debug_seq_open,
> -	.read_iter		= seq_read_iter,

I doubt this patch applies to Linux v5.8-rc, this is how debug_ops is
defined in Linux v5.8-rc5,

196 static const struct file_operations debug_ops = {
197         .owner          = THIS_MODULE,
198         .open           = debug_seq_open,
199         .read           = seq_read,
200         .release        = single_release
201 };

> -	.release	= single_release
> -};
> +DEFINE_SHOW_ATTRIBUTE(debug);
>  
>  void  __init closure_debug_init(void)
>  {
> @@ -209,7 +199,7 @@ void  __init closure_debug_init(void)
>  		 * about this.
>  		 */
>  		closure_debug = debugfs_create_file(
> -			"closures", 0400, bcache_debug, NULL, &debug_ops);
> +				"closures", 0400, bcache_debug, NULL, &debug_fops);
>  }
>  #endif

Do you test your change with upstream kernel ? Or at least you should
try to apply and compile the patch with latest upstream kernel.

Thanks.

Coly Li
