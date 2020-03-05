From: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [BUG] 5.6-rc1 breaks sdhci on tegra-30 ouya
Date: Thu, 5 Mar 2020 15:56:22 -0500
Message-ID: <CAMdYzYoxsBAyBhp+S6LKE060qLLq=XioVVPUmOka0auOo8aXcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Good Afternoon,

I have been fighting a bug with sdhci on the tegra-30 based ouya since 5.6-rc1.
I've traced it to the following commit:

mmc: core: Specify timeouts for BKOPS and CACHE_FLUSH for eMMC
24ed3bd01d6a844fd5e8a75f48d0a3d10ed71bf9

[   51.401369] mmc0: Card stuck being busy! mmc_poll_for_busy
[   51.407288] mmc0: cache flush error -110
[   51.412347] blk_update_request: I/O error, dev mmcblk0, sector 0 op
0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0

It also caused issues with hitching with the bcm4330 sdio wifi chip.

Reverting this commit fixes the issue.

After reverting this commit, with the following commit still intact:

mmc: core: Default to generic_cmd6_time as timeout in __mmc_switch()

I am seeing a lot of the following messages:
[   22.626377] mmc0: unspecified timeout for CMD6 - use generic
[   22.687349] mmc0: unspecified timeout for CMD6 - use generic
[   23.362736] mmc0: unspecified timeout for CMD6 - use generic
[   23.487824] mmc0: unspecified timeout for CMD6 - use generic
[   23.547674] mmc0: unspecified timeout for CMD6 - use generic
[   23.745527] mmc0: unspecified timeout for CMD6 - use generic
[   23.817678] mmc0: unspecified timeout for CMD6 - use generic
[   24.045600] mmc0: unspecified timeout for CMD6 - use generic
[   24.155577] mmc0: unspecified timeout for CMD6 - use generic
[   24.223448] mmc0: unspecified timeout for CMD6 - use generic
[   24.286257] mmc0: unspecified timeout for CMD6 - use generic

Very Respectfully,
Peter Geis
