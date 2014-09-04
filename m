From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegra-pinmux-scripts PATCH] Add APB misc MIPI pad control
Date: Thu, 04 Sep 2014 10:14:23 -0600
Message-ID: <54088FDF.5060202@wwwdotorg.org>
References: <1409845617-22025-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409845617-22025-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/04/2014 09:46 AM, Sean Paul wrote:
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

> diff --git a/configs/jetson-tk1.board b/configs/jetson-tk1.board

> @@ -192,6 +192,16 @@ pins = (
>       ('usb_vbus_en0_pn4',       'usb',          None,      'up',   False, True,  True,  False),
>       ('usb_vbus_en1_pn5',       'usb',          None,      'up',   False, True,  True,  False),
>       ('dp_hpd_pff0',            'dp',           None,      'up',   False, True,  False, False),
> +    ('dsi_b_clk_n',	       'csi',         None,      'none', False, False, False, False),
> +    ('dsi_b_clk_p',	       'csi',         None,      'none', False, False, False, False),
> +    ('dsi_b_d0_n',	       'csi',         None,      'none', False, False, False, False),
> +    ('dsi_b_d0_p',	       'csi',         None,      'none', False, False, False, False),
> +    ('dsi_b_d1_n',	       'csi',         None,      'none', False, False, False, False),
> +    ('dsi_b_d1_p',	       'csi',         None,      'none', False, False, False, False),
> +    ('dsi_b_d2_n',	       'csi',         None,      'none', False, False, False, False),
> +    ('dsi_b_d2_p',	       'csi',         None,      'none', False, False, False, False),
> +    ('dsi_b_d3_n',	       'csi',         None,      'none', False, False, False, False),
> +    ('dsi_b_d3_p',	       'csi',         None,      'none', False, False, False, False),

Mux functions get selected on pin groups, not individual pins (it's just 
that in Tegra30+, most pin groups contain just a single pin of the same 
name). So, I would expect only a single "dsi_b" entry in the *.board files.

Do all the "False" properties here cause a DT property to be emitted to 
set those values (e.g. nvidia,tristate=<0>)? tegra124.soc's pin array 
only has Booleans for some of the properties to avoid this. A special 
case (or extra per-pin properties) to avoid that might be nice. I wonder 
if we need a separate array for the mipi padctrl, like we have separate 
arrays for pins and drive_groups?

> diff --git a/configs/tegra124.soc b/configs/tegra124.soc

> @@ -523,4 +533,16 @@ drive_group_pins = {
>       'ao4': (
>           'jtag_rtck',
>       ),
> +    'apb_dsi_b': (
> +	'dsi_b_clk_p',
> +	'dsi_b_clk_n',

Indentation here looks like a mix of TABs and spaces. The rest of the 
file just uses spaces.
