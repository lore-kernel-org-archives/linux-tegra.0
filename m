From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [arm-tegra:for-3.9/arm-timer-rework 11/12] arch/arm/mach-imx/imx31-dt.c:36:2:
 warning: initialization from incompatible pointer type
Date: Tue, 29 Jan 2013 12:13:40 -0700
Message-ID: <51081F64.8040604@wwwdotorg.org>
References: <51081b3d.Rfc8JxYDG0uLRpnk%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51081b3d.Rfc8JxYDG0uLRpnk%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/29/2013 11:55 AM, kbuild test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-3.9/arm-timer-rework
> head:   ae278a935f086775e8ae31a8ec9f7224ea25ea3c
> commit: 6bb27d7349db51b50c40534710fe164ca0d58902 [11/12] ARM: delete struct sys_timer
> config: make ARCH=arm imx_v6_v7_defconfig
> 
> All warnings:
> 
>>> arch/arm/mach-imx/imx31-dt.c:36:2: warning: initialization from incompatible pointer type [enabled by default]
>>> arch/arm/mach-imx/imx31-dt.c:36:2: warning: (near initialization for '__mach_desc_IMX31_DT.init_time') [enabled by default]

I don't see this warning with gcc-4.5.3, and the warning above doesn't
seem to match the code below at line 36 either. Was the source tree
corrupt somehow?

> vim +36 arch/arm/mach-imx/imx31-dt.c
...
>     35	static void __init imx31_dt_init(void)
>   > 36	{
>     37		of_platform_populate(NULL, of_default_bus_match_table,
>     38				     imx31_auxdata_lookup, NULL);
>     39	}
