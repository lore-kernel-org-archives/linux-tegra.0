From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v4 3/6] partitions: Introduce NVIDIA Tegra Partition Table
Date: Thu, 14 May 2020 18:58:05 -0700
Message-ID: <055fc187-6181-6ccb-04a8-ab4324270ed7@infradead.org>
References: <20200515014143.12984-1-digetx@gmail.com>
 <20200515014143.12984-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200515014143.12984-4-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Nils_=c3=96stlund?= <nils-ElENwYY5mljQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-efi <linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 5/14/20 6:41 PM, Dmitry Osipenko wrote:
> diff --git a/block/partitions/Kconfig b/block/partitions/Kconfig
> index 702689a628f0..2c1408cba1a6 100644
> --- a/block/partitions/Kconfig
> +++ b/block/partitions/Kconfig
> @@ -268,3 +268,11 @@ config CMDLINE_PARTITION
>  	help
>  	  Say Y here if you want to read the partition table from bootargs.
>  	  The format for the command line is just like mtdparts.
> +
> +config TEGRA_PARTITION
> +	bool "NVIDIA Tegra Partition support" if PARTITION_ADVANCED
> +	default y if ARCH_TEGRA
> +	depends on (ARCH_TEGRA && MMC_BLOCK) || COMPILE_TEST

That looks odd. Such depends are more often like:
	depends on MMC_BLOCK && (ARCH_TEGRA || COMPILE_TEST)

but that's just my experience. If this works when ARCH_TEGRA and MMC_BLOCK
are not set and COMPILE_TEST is set, that's fine.

> +	help
> +	  Say Y here if you would like to be able to read the hard disk
> +	  partition table format used by NVIDIA Tegra machines.

thanks.
-- 
~Randy
