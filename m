From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 04/10] arm/tegra: Fix PWM clock programming
Date: Tue, 28 Feb 2012 13:01:14 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1E52@HQMAIL01.nvidia.com>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
 <1329923841-32017-5-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329923841-32017-5-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Wednesday, February 22, 2012 8:17 AM:
> PWM clock source registers in Tegra 2 have different clock source selection bit
> fields than other registers.  PWM clock source bits in CLK_SOURCE_PWM_0 register
> are located at bit field bit[30:28] while others are at bit field bit[31:30] in
> their respective clock source register.
> 
> This patch updates the clock programming to correctly reflect that, by adding a
> flag to indicate the alternate bit field format and checking for it when
> selecting a clock source (parent clock).

tegra30_clocks.c needs this change too, although on Tegra30, it's bits
29:28 for the PWM, and bits 31:30 for non-PWM.

> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c

+#define PERIPH_CLK_SOURCE_4BIT_MASK	(7<<28)
+#define PERIPH_CLK_SOURCE_4BIT_SHIFT	28

Why is this (and the flag that enables it) called "4 bit"; the existing
code supports a 2-bit mux field (4-values), whereas this new code supports
a 3-bit field (potentially 8 values, but only 5 actually assigned).
Can this be renamed something more accurate, especially since on Tegra30
the difference is only the bit position of the field, not the number of
bits in the field.

> @@ -908,9 +910,16 @@ static void tegra2_periph_clk_init(struct clk *c)
>  	u32 val = clk_readl(c->reg);
>  	const struct clk_mux_sel *mux = NULL;
>  	const struct clk_mux_sel *sel;
> +	u32 shift;
> +
> +	if (c->flags & PERIPH_SOURCE_CLK_4BIT)
> +		shift = PERIPH_CLK_SOURCE_4BIT_SHIFT;
> +	else
> +		shift = PERIPH_CLK_SOURCE_SHIFT;

I think you should assign a "mask" variable here too...

> +
>  	if (c->flags & MUX) {
>  		for (sel = c->inputs; sel->input != NULL; sel++) {
> -			if (val >> PERIPH_CLK_SOURCE_SHIFT == sel->value)
> +			if (val >> shift == sel->value)
>  				mux = sel;

Because in the new case, bit 31 isn't part of the field, so just
shifting doesn't isolate the mux field. In practice, this probably isn't
an issue since bit 31 is undefined, but better to be safe than sorry...

-- 
nvpublic
