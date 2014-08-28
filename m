From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 2/5] ARM: tegra: Add legacy interrupt controller nodes
Date: Thu, 28 Aug 2014 18:11:53 +0200
Message-ID: <4707330.BNuO2MquVF@wuerfel>
References: <1409239879-12376-1-git-send-email-thierry.reding@gmail.com> <1409239879-12376-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409239879-12376-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 28 August 2014 17:31:16 Thierry Reding wrote:
> +       interrupt-controller@60004000 {
> +               compatible = "nvidia,tegra114-ictlr", "nvidia,tegra30-ictlr";
> +               reg = <0x60004000 0x40>, /* primary controller */
> +                     <0x60004100 0x40>, /* secondary controller */
> +                     <0x60004200 0x40>, /* tertiary controller */
> +                     <0x60004300 0x40>, /* quaternary controller */
> +                     <0x60004400 0x40>; /* quinary controller */
> +       };
> +
>         timer@60005000 {
>                 compatible = "nvidia,tegra114-timer", "nvidia,tegra20-timer";
> 

Don't you need an interrupt-parent and interrupts property here to point to
the GIC interrupts? I would assume this is a nested irqchip.

	Arnd
