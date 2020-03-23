From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/10] Introduce NVIDIA Tegra Partition Table
Date: Mon, 23 Mar 2020 19:49:37 +0300
Message-ID: <021a340f-e289-b1ee-db4f-ef61ee2b4004@gmail.com>
References: <20200323163431.7678-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200323163431.7678-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

23.03.2020 19:34, Dmitry Osipenko пишет:
> Some NVIDIA Tegra devices have GPT entry at a wrong location and others may
> even not have it at all. So either a custom workaround for GPT parsing or
> TegraPT support is needed for those devices if we want to support them in
> upstream kernel. The former solution was already rejected [1], let's try
> the latter.
> 
> [1] https://patchwork.ozlabs.org/patch/1240809/
> 
> Big thanks to everyone who helped with figuring out the TegraPT format!
> 
> Changelog:
> 
> v3: - Fixed "BUG: KASAN: slab-out-of-bounds in tegra_partition". Thanks to
>       Peter Geis for noticing the problem.
> 
>     - The MMC boot partitions scanning is now opt-in. See this patch:
> 
>         mmc: block: Support partition-table scanning on boot partitions
> 
>     - The found MMC boot partitions won't be assigned to the MMC boot
>       block device ever due to the new GENHD_FL_PART_SCAN_ONCE flag.
> 
>       This makes us to ensure that the old behavior of the MMC core is
>       preserved for a non-Tegra MMC-block users.
> 
>     New patches in v3:
> 
>         block: Introduce GENHD_FL_PART_SCAN_ONCE
>         mmc: sdhci-tegra: Enable boot partitions scanning on Tegra20 and Tegra30

I forgot to mention that the TegraPT Kconfig entry now depends on MMC,
which was suggested by Randy Dunlap in the review comment to the v2.
