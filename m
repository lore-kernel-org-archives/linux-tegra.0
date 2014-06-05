From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v7 1/5] ARM: tegra: export apb dma readl/writel
Date: Thu, 05 Jun 2014 12:06:23 -0600
Message-ID: <5390B19F.7090008@wwwdotorg.org>
References: <1401973754-19701-1-git-send-email-pdeschrijver@nvidia.com> <1401973754-19701-2-git-send-email-pdeschrijver@nvidia.com> <5390AF88.9050007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5390AF88.9050007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/05/2014 11:57 AM, Stephen Warren wrote:
> On 06/05/2014 07:09 AM, Peter De Schrijver wrote:
>> Export APB DMA readl and writel. These are needed because we can't access
>> the fuses directly on Tegra20 without potentially causing a system hang.
>> Also have the APB DMA readl and writel return an error in case of a read
>> failure instead of just returning zero or ignore write failures.
> 
>> diff --git a/include/linux/tegra-soc.h b/include/linux/tegra-soc.h
> 
>> +int tegra_apb_readl_using_dma(unsigned long offset, u32 *value);
>> +int tegra_apb_writel_using_dma(u32 value, unsigned long offset);
> 
> Hmm. I wonder why we're exporting those low-level internal functions
> rather than the higher-level tegra_apb_readl()/writel() wrappers that
> "clients" are supposed to be using.

Oh, I suppose this is just for rivers/misc/fuse/tegra/fuse-tegra20.c to
use it, not for arbitrary clients, so this is probably OK.

Any reason not to move all the DMA-related fuse-reading code into
fuse-tegra20.c instead? After this series, is there code left in
arch/arm/mach-tegra which will still need to call into the fuse-reading
code and hence requires tegra_apb_readl_using_dma() to exist?
