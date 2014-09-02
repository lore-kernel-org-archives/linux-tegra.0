From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra: Add APB misc MIPI pad control
Date: Tue, 02 Sep 2014 14:31:09 -0600
Message-ID: <5406290D.6000404@wwwdotorg.org>
References: <1409678286-28139-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409678286-28139-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/02/2014 11:18 AM, Sean Paul wrote:
> This patch adds MIPI CSI/DSIB pad control mux register
> from the APB misc block to tegra pinctrl.
>
> Without writing to this register, the dsib pads are
> muxed as csi, and cannot be used.
>
> The register is not yet documented in the TRM, here is
> the description:
>
> 70000820: APB_MISC_GP_MIPI_PAD_CTRL_0
> 	[31:02] RESERVED
> 	[01:01] DSIB_MODE       [CSI=0,DSIB=1]
> 	[00:00] RESERVED

That's a very unfortunate HW design, but oh well:-(

I slightly wonder whether it's legitimate to even consider that register 
part of the pinmux controller; I certainly don't see any mention of it 
in the pinmux spreadsheets. It feels like some unrelated bolt-on 
feature. Still, I suppose requiring a separate driver for it just 
because the registers aren't all nicely grouped is a bit silly. At least 
a quick glance implies there aren't any other missing cases like this, 
so we shouldn't need to add any more later.

I don't suppose there's any chance you could update:
git://github.com/NVIDIA/tegra-pinmux-scripts.git
with an equivalent change?

> diff --git a/drivers/pinctrl/pinctrl-tegra124.c b/drivers/pinctrl/pinctrl-tegra124.c

> +#define TEGRA_PIN_CSI_DSIB			_PIN(8)

Is that actually the name of the pin on the Tegra package? I don't see 
anything like that the board schematic I have.

>   #define DRV_PINGROUP_REG_A		0x868	/* bank 0 */
>   #define PINGROUP_REG_A			0x3000	/* bank 1 */
> +#define APB_MISC_PINGROUP_REG_A		0x820	/* bank 2 */

In order for that to work, an extra reg entry will be required in DT so 
that registers in bank 2 can be accessed. I would expect this patch (or 
series) to contain an addition to 
Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt to 
mention this. I assume you'll send a patch to 
arch/arm/boot/dts/tegra124.dtsi separately to add that entry.

> +#define APB_MISC_PINGROUP(pg_name, r, b, f0, f1, f_safe)		\

f_safe isn't present in any of the upstream Tegra pinctrl drivers any 
more, so that parameter isn't needed any more...

> +	{								\
> +		.name = #pg_name,					\
> +		.pins = pg_name##_pins,					\
> +		.npins = ARRAY_SIZE(pg_name##_pins),			\
> +		.funcs = {						\
> +			TEGRA_MUX_ ## f0,				\
> +			TEGRA_MUX_ ## f1,				\
> +		},							\
> +		.func_safe = TEGRA_MUX_ ## f_safe,			\

... and I don't think that line will even compile, since that field 
doesn't exist?

All 4 entries in .funcs[] should be initialized too. If two don't make 
sense, then they should at least be hard-coded to TEGRA_MUX_RSVD3/4. It 
would be nice if the driver knew that this pin only had two valid mux 
options, but I suppose updating the code to handle that special case 
isn't really worth it.

>   	DRV_PINGROUP(ao4,         0x9c8,  2,  3,  4,  12,  7,  20,  7,  28,  2,  30,  2,  Y),
> +
> +       /*			pg_name,	r	b	f0,	f1,	f_safe */
> +       APB_MISC_PINGROUP(	csi_dsib,	0x820,	1,	CSI,	DSIB,	DSIB)
>   };

Can you make the indentation of the added lines consistent here. The 
existing code uses a TAB at the start of the line (but the patch uses 
spaces), and spaces internally (but the patch uses TABs) so columns 
don't have to waste space being TAB aligned. The pg_name column should 
be nestled right against the opening (, without any intervening space.
