From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [BUG] 5.6-rc1 breaks sdhci on tegra-30 ouya
Date: Fri, 6 Mar 2020 10:32:38 +0000
Message-ID: <1ebbe390-68a6-84a2-8ff9-8dc0d263a69b@nvidia.com>
References: <CAMdYzYoxsBAyBhp+S6LKE060qLLq=XioVVPUmOka0auOo8aXcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMdYzYoxsBAyBhp+S6LKE060qLLq=XioVVPUmOka0auOo8aXcg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

On 05/03/2020 20:56, Peter Geis wrote:
> Good Afternoon,
> 
> I have been fighting a bug with sdhci on the tegra-30 based ouya since 5.6-rc1.
> I've traced it to the following commit:
> 
> mmc: core: Specify timeouts for BKOPS and CACHE_FLUSH for eMMC
> 24ed3bd01d6a844fd5e8a75f48d0a3d10ed71bf9
> 
> [   51.401369] mmc0: Card stuck being busy! mmc_poll_for_busy
> [   51.407288] mmc0: cache flush error -110
> [   51.412347] blk_update_request: I/O error, dev mmcblk0, sector 0 op
> 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
> 
> It also caused issues with hitching with the bcm4330 sdio wifi chip.
> 
> Reverting this commit fixes the issue.
> 
> After reverting this commit, with the following commit still intact:
> 
> mmc: core: Default to generic_cmd6_time as timeout in __mmc_switch()
> 
> I am seeing a lot of the following messages:
> [   22.626377] mmc0: unspecified timeout for CMD6 - use generic
> [   22.687349] mmc0: unspecified timeout for CMD6 - use generic
> [   23.362736] mmc0: unspecified timeout for CMD6 - use generic
> [   23.487824] mmc0: unspecified timeout for CMD6 - use generic
> [   23.547674] mmc0: unspecified timeout for CMD6 - use generic
> [   23.745527] mmc0: unspecified timeout for CMD6 - use generic
> [   23.817678] mmc0: unspecified timeout for CMD6 - use generic
> [   24.045600] mmc0: unspecified timeout for CMD6 - use generic
> [   24.155577] mmc0: unspecified timeout for CMD6 - use generic
> [   24.223448] mmc0: unspecified timeout for CMD6 - use generic
> [   24.286257] mmc0: unspecified timeout for CMD6 - use generic

Yes we are seeing this on other Tegra platforms. This is being triaged
in the following thread ...

https://lkml.org/lkml/2020/2/13/781

Cheers
Jon

-- 
nvpublic
