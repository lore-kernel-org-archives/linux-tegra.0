From: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [arm-tegra:for-3.9/arm-timer-rework 11/12]
 arch/arm/mach-imx/imx31-dt.c:36:2: warning: initialization from incompatible
 pointer type
Date: Wed, 30 Jan 2013 09:35:24 +0800
Message-ID: <20130130013524.GA11967@localhost>
References: <51081b3d.Rfc8JxYDG0uLRpnk%fengguang.wu@intel.com>
 <51081F64.8040604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51081F64.8040604-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 29, 2013 at 12:13:40PM -0700, Stephen Warren wrote:
> On 01/29/2013 11:55 AM, kbuild test robot wrote:
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-3.9/arm-timer-rework
> > head:   ae278a935f086775e8ae31a8ec9f7224ea25ea3c
> > commit: 6bb27d7349db51b50c40534710fe164ca0d58902 [11/12] ARM: delete struct sys_timer
> > config: make ARCH=arm imx_v6_v7_defconfig
> > 
> > All warnings:
> > 
> >>> arch/arm/mach-imx/imx31-dt.c:36:2: warning: initialization from incompatible pointer type [enabled by default]
> >>> arch/arm/mach-imx/imx31-dt.c:36:2: warning: (near initialization for '__mach_desc_IMX31_DT.init_time') [enabled by default]
> 
> I don't see this warning with gcc-4.5.3, and the warning above doesn't
> seem to match the code below at line 36 either. Was the source tree
> corrupt somehow?

Stephen, I can reproduce the problem with gcc-4.6.3, but at a
different line number (weird):

/c/wfg/sound/arch/arm/mach-imx/imx31-dt.c:51:2: warning: initialization from incompatible pointer type [enabled by default]
/c/wfg/sound/arch/arm/mach-imx/imx31-dt.c:51:2: warning: (near initialization for '__mach_desc_IMX31_DT.init_time') [enabled by
default]

 45 
 46 DT_MACHINE_START(IMX31_DT, "Freescale i.MX31 (Device Tree Support)")
 47         .map_io         = mx31_map_io,
 48         .init_early     = imx31_init_early,
 49         .init_irq       = mx31_init_irq,
 50         .handle_irq     = imx31_handle_irq,
 51         .init_time      = mx31_clocks_init_dt,
 52         .init_machine   = imx31_dt_init,
 53         .dt_compat      = imx31_dt_board_compat,
 54         .restart        = mxc_restart,
 55 MACHINE_END

Thanks,
Fengguang
