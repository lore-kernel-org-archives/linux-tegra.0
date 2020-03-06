From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v2 3/8] partitions: Introduce NVIDIA Tegra Partition Table
Date: Thu, 5 Mar 2020 18:22:53 -0800
Message-ID: <14ebbc7f-91f3-16dd-b998-ddd71385c772@infradead.org>
References: <20200306021220.22097-1-digetx@gmail.com>
 <20200306021220.22097-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200306021220.22097-4-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 3/5/20 6:12 PM, Dmitry Osipenko wrote:
> All NVIDIA Tegra devices use a special partition table format for the
> internal storage partitioning. Most of Tegra devices have GPT partition
> in addition to TegraPT, but some older Android consumer-grade devices do
> not or GPT is placed in a wrong sector, and thus, the TegraPT is needed
> in order to support these devices properly in the upstream kernel. This
> patch adds support for NVIDIA Tegra Partition Table format that is used
> at least by all NVIDIA Tegra20 and Tegra30 devices.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mach-tegra/tegra.c   |  54 ++++
>  block/partitions/Kconfig      |   9 +
>  block/partitions/Makefile     |   1 +
>  block/partitions/check.c      |   4 +
>  block/partitions/tegra.c      | 510 ++++++++++++++++++++++++++++++++++
>  block/partitions/tegra.h      |  83 ++++++
>  include/soc/tegra/bootdata.h  |  46 +++
>  include/soc/tegra/common.h    |   9 +
>  include/soc/tegra/partition.h |  18 ++
>  9 files changed, 734 insertions(+)
>  create mode 100644 block/partitions/tegra.c
>  create mode 100644 block/partitions/tegra.h
>  create mode 100644 include/soc/tegra/bootdata.h
>  create mode 100644 include/soc/tegra/partition.h

Hi Dmitry,


> diff --git a/block/partitions/Kconfig b/block/partitions/Kconfig
> index 702689a628f0..d3c5c6ad6d58 100644
> --- a/block/partitions/Kconfig
> +++ b/block/partitions/Kconfig
> @@ -268,3 +268,12 @@ config CMDLINE_PARTITION
>  	help
>  	  Say Y here if you want to read the partition table from bootargs.
>  	  The format for the command line is just like mtdparts.
> +
> +config TEGRA_PARTITION
> +	bool "NVIDIA Tegra Partition support" if PARTITION_ADVANCED
> +	default y if ARCH_TEGRA
> +	depends on ARCH_TEGRA || COMPILE_TEST
> +	select MMC_BLOCK

You shouldn't select MMC_BLOCK unless MMC is already enabled,
so this entire config should depend on MMC also.
As is, without MMC set/enabled, it should give you a kconfig warning.

(no, you should not also select MMC here.)

(This is just based on reading the patch--I haven't tested it
with CONFIG_MMC not set/enabled.  Have you?)


> +	help
> +	  Say Y here if you would like to be able to read the hard disk
> +	  partition table format used by NVIDIA Tegra machines.

Thanks.
-- 
~Randy
