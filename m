From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: tegra: Add SMMU enabler in AHB
Date: Tue, 24 Apr 2012 20:59:02 +0100
Message-ID: <20120424195901.GC3628@n2100.arm.linux.org.uk>
References: <1335269116-9578-1-git-send-email-hdoyu@nvidia.com> <1335269116-9578-2-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1335269116-9578-2-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, H Hartley Sweeten <hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 24, 2012 at 03:05:15PM +0300, Hiroshi DOYU wrote:
> +#define AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE_DONE	1
> +#define AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE_SHIFT	17
> +
>  struct __tegra_ahb {
>  	void __iomem	*regs;
>  	struct device	*dev;
> @@ -95,6 +98,21 @@ static inline void gizmo_writel(unsigned long value, unsigned long offset)
>  	writel(value, tegra_ahb->regs + offset);
>  }
>  
> +#ifdef CONFIG_ARCH_TEGRA_3x_SOC
> +
> +void tegra_ahb_enable_smmu(void)
> +{
> +	unsigned long val;
> +
> +	val = gizmo_readl(AHB_ARBITRATION_XBAR_CTRL);
> +	val |= AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE_DONE <<
> +		AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE_SHIFT;

In addition to what Felipe said...

Why do you need two constants where you have only one use point?
What's wrong with having just a single definition which gives you
the right bitmask?
