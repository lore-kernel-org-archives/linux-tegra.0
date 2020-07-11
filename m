From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 15/23] seq_file: switch over direct seq_read method calls
 to seq_read_iter
Date: Sat, 11 Jul 2020 12:47:04 +0100
Message-ID: <b838bf55-bd1e-7ff8-fcf5-fe372944dc9f@nvidia.com>
References: <20200707174801.4162712-1-hch@lst.de>
 <20200707174801.4162712-16-hch@lst.de>
 <5a2a97f1-58b5-8068-3c69-bb06130ffb35@nvidia.com>
 <20200711064857.GA29078@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200711064857.GA29078-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Luis Chamberlain <mcgrof-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Iurii Zaikin <yzaikin-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 11/07/2020 07:48, Christoph Hellwig wrote:
> Please try this one:
> 
> ---
> From 5e86146296fbcd7593da1d9d39b9685a5e6b83be Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> Date: Sat, 11 Jul 2020 08:46:10 +0200
> Subject: debugfs: add a proxy stub for ->read_iter
> 
> debugfs registrations typically go through a set of proxy ops to deal
> with refcounting, which need to support every method that can be
> supported.  Add ->read_iter to the proxy ops to prepare for seq_file to
> be switch to ->read_iter.
> 
> Reported-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> ---
>  fs/debugfs/file.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
> index 8ba32c2feb1b73..dcd7bdaf67417f 100644
> --- a/fs/debugfs/file.c
> +++ b/fs/debugfs/file.c
> @@ -231,6 +231,10 @@ FULL_PROXY_FUNC(read, ssize_t, filp,
>  			loff_t *ppos),
>  		ARGS(filp, buf, size, ppos));
>  
> +FULL_PROXY_FUNC(read_iter, ssize_t, iocb->ki_filp,
> +		PROTO(struct kiocb *iocb, struct iov_iter *iter),
> +		ARGS(iocb, iter));
> +
>  FULL_PROXY_FUNC(write, ssize_t, filp,
>  		PROTO(struct file *filp, const char __user *buf, size_t size,
>  			loff_t *ppos),
> @@ -286,6 +290,8 @@ static void __full_proxy_fops_init(struct file_operations *proxy_fops,
>  		proxy_fops->llseek = full_proxy_llseek;
>  	if (real_fops->read)
>  		proxy_fops->read = full_proxy_read;
> +	if (real_fops->read_iter)
> +		proxy_fops->read_iter = full_proxy_read_iter;
>  	if (real_fops->write)
>  		proxy_fops->write = full_proxy_write;
>  	if (real_fops->poll)
> 


Thanks! Works for me.

Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
