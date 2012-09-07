From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Fix data type for io address
Date: Fri, 07 Sep 2012 09:25:57 -0600
Message-ID: <504A1205.7090405@wwwdotorg.org>
References: <1346996455-31697-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346996455-31697-1-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/06/2012 11:40 PM, Prashant Gaikwad wrote:
> Warnings were generated because following commit changed data type for
> address pointer
> 
> 195bbca ARM: 7500/1: io: avoid writeback addressing modes for __raw_ accessors
> 
> arch/arm/mach-tegra/tegra30_clocks.c: In function 'clk_measure_input_freq':
> arch/arm/mach-tegra/tegra30_clocks.c:418:2: warning: passing argument 2 of '__raw_writel' makes pointer from integer without a cast
> .../arch/arm/include/asm/io.h:88:20: note: expected 'volatile void *' but argument is of type 'unsigned int
> 
> Signed-off-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, applied to Tegra's for-3.7/common-clk branch.
