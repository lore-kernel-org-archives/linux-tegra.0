From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/12] soc/tegra: Add efuse driver for Tegra
Date: Sun, 19 Oct 2014 11:12:45 +0800
Message-ID: <20141019031241.GA18880@tiger>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <1405080971-7609-6-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405080971-7609-6-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 11, 2014 at 02:16:04PM +0200, Thierry Reding wrote:
> diff --git a/drivers/misc/fuse/Makefile b/drivers/misc/fuse/Makefile
> new file mode 100644
> index 000000000000..0679c4febc89
> --- /dev/null
> +++ b/drivers/misc/fuse/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_ARCH_TEGRA)	+= tegra/

I just happened to notice this change on linux-next introduced by this
patch?  It's a leftover from early version of the patch, I guess?

Shawn
