From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: remove <mach/dma.h>
Date: Mon, 15 Oct 2012 12:06:22 -0600
Message-ID: <507C509E.2020103@wwwdotorg.org>
References: <1349206245-22560-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1349206245-22560-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/02/2012 01:30 PM, Stephen Warren wrote:
> Remove includes of <mach/dma.h> from sound/soc; nothing from it is used.
> 
> Remove include of <mach/dma.h> from mach-tegra/apbio.c; since the DMA
> transfers made by this file don't need flow-control with any peripheral,
> there's no need to set any slave ID.
> 
> Once those changes are made, there are no remaining users of <mach/dma.h>
> so remove it. Drivers should get this information from device tree. This
> removal is necessary for single zImage.

Applied to Tegra's for-3.8/cleanup branch.
