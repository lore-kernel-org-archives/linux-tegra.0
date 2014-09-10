From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] Add MIPI pad control
Date: Wed, 10 Sep 2014 10:02:50 -0600
Message-ID: <5410762A.8070401@wwwdotorg.org>
References: <1410292799-5913-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410292799-5913-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/09/2014 01:59 PM, Sean Paul wrote:
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

>   board-to-kernel-dt.py     |  7 +++++++
>   configs/jetson-tk1.board  |  5 +++++
>   configs/norrin.board      |  5 +++++
>   configs/tegra124.soc      | 30 ++++++++++++++++++++++++++++++
>   configs/venice2.board     |  5 +++++
>   tegra_pmx_board_parser.py | 22 ++++++++++++++++++++++
>   tegra_pmx_soc_parser.py   | 19 +++++++++++++++++++

soc-to-kernel-pinctrl-driver.py should also be updated, so that it 
generates the same output as your patch "[PATCH v3 1/2] pinctrl: tegra: 
Add MIPI pad control".

Mostly, this simply means adding code to spit out all the additions 
you've made, in a similar fashion to your changes to 
board-to-kernel-dt.py. However, you'll also need to prevent the script 
from outputting per-pin pingroups for the new pins (since there is no 
per-pin configuration), e.g. dsi_b_clk_p_pins[] array and 
"PINGROUP(dsi_b_clk_p..." tegra124_groups[] entry.

soc-to-uboot-driver.py also needs to be updated, and the changes 
propagated to mainline U-Boot. For at least NVIDIA reference boards, 
U-Boot should be setting up the pinmux, and the kernel not touching it 
at all. So, we'd need the following:

- Update soc-to-uboot-driver.py to generate a U-Boot driver that can 
handle the MIPI config register.
- Get that patch into U-Boot.
- Update board-to-uboot.py to emit tables for the new MIPI configuration.
- Update at least the NVIDIA reference board ports to include those new 
tables, and call into the U-Boot pinmux driver with them.

The U-Boot changes (and changes to tegra-pinmux-scripts for them) could 
all happen as a separate patch though, since it's a new feature, so long 
as this patch doesn't cause any diff in the output of the existing 
soc-to-uboot-driver.py and board-to-uboot.py.

(As an aside, if you added a soc-to-coreboot-driver.py and 
board-to-coreboot.py, that would probably be quite useful, but that's 
certainly entirely separate from this change)

> diff --git a/configs/tegra124.soc b/configs/tegra124.soc
> @@ -203,6 +203,16 @@ pins = (
>       ('owr',          0x3334, 'owr',    'rsvd2', 'rsvd3', 'rsvd4',       False, False, True),
>       ('clk_32k_in',   0x3330, 'clk',    'rsvd2', 'rsvd3', 'rsvd4',       False, False, False),
>       ('jtag_rtck',    0x32b0, 'rtck',   'rsvd2', 'rsvd3', 'rsvd4',       False, False, False),
> +    ('dsi_b_clk_p',  0x820,  'csi',    'dsi_b', 'rsvd3', 'rsvd4',       False, False, False),

I think you need to flag these pins as "MIPI" pins somehow. Otherwise, 
when soc-to-*-driver.py run, a pin group definition will be emitted in 
addition to the desired pin definition for each of these. Probably the 
simplest is to set the reg field to None, since these pins don't have a 
dedicated register, but rather only the pin group has a register. Then, 
check for reg==None in the soc-to-*-driver.py scripts.

> diff --git a/tegra_pmx_board_parser.py b/tegra_pmx_board_parser.py

> @@ -52,6 +58,11 @@ class Board(TopLevelParsedObj):
>           # FIXME: fill this in...
>           self.drvcfg = []
>
> +        self._mpccfgs = []
> +        for num, mpcdata in enumerate(data['mipi_pad_ctrl']):
> +            mpccfg = MipiPadConfig(self.soc, mpcdata)
> +            self._mpccfgs.append(mpccfg)

That fails if the board doesn't have a mipi_pad_ctrl array. I think you 
want something like:

         self._mpccfgs = []
         if data.has_key('mipi_pad_ctrl'):
             for num, mpcdata in enumerate(data['mipi_pad_ctrl']):
...

> diff --git a/tegra_pmx_soc_parser.py b/tegra_pmx_soc_parser.py

> @@ -126,6 +134,14 @@ class Soc(TopLevelParsedObj):
>                   gpios_pins.append(gpios_pins_by_name[name])
>               self._drive_groups.append(DriveGroup(drive_group, gpios_pins, self.has_drvtype))
>
> +        self._mpc_groups = []
> +        for mpc_group in data['mipi_pad_ctrl_groups']:

Similarly, this needs to be conditional upon whether the data file 
actually contains a mipi_pad_ctrl_pins array.
