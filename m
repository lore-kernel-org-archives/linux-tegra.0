From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [arm-tegra:for-3.9/arm-timer-rework 11/12] arch/arm/mach-imx/imx31-dt.c:36:2:
 warning: initialization from incompatible pointer type
Date: Tue, 29 Jan 2013 20:47:28 -0700
Message-ID: <510897D0.2010001@wwwdotorg.org>
References: <51081b3d.Rfc8JxYDG0uLRpnk%fengguang.wu@intel.com> <51081F64.8040604@wwwdotorg.org> <20130130013524.GA11967@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130130013524.GA11967@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Sascha Hauer (s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org)" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/29/2013 06:35 PM, Fengguang Wu wrote:
> On Tue, Jan 29, 2013 at 12:13:40PM -0700, Stephen Warren wrote:
>> On 01/29/2013 11:55 AM, kbuild test robot wrote:
>>> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-3.9/arm-timer-rework
>>> head:   ae278a935f086775e8ae31a8ec9f7224ea25ea3c
>>> commit: 6bb27d7349db51b50c40534710fe164ca0d58902 [11/12] ARM: delete struct sys_timer
>>> config: make ARCH=arm imx_v6_v7_defconfig
>>>
>>> All warnings:
>>>
>>>>> arch/arm/mach-imx/imx31-dt.c:36:2: warning: initialization from incompatible pointer type [enabled by default]
>>>>> arch/arm/mach-imx/imx31-dt.c:36:2: warning: (near initialization for '__mach_desc_IMX31_DT.init_time') [enabled by default]
>>
>> I don't see this warning with gcc-4.5.3, and the warning above doesn't
>> seem to match the code below at line 36 either. Was the source tree
>> corrupt somehow?
> 
> Stephen, I can reproduce the problem with gcc-4.6.3, but at a
> different line number (weird):
> 
> /c/wfg/sound/arch/arm/mach-imx/imx31-dt.c:51:2: warning: initialization from incompatible pointer type [enabled by default]
> /c/wfg/sound/arch/arm/mach-imx/imx31-dt.c:51:2: warning: (near initialization for '__mach_desc_IMX31_DT.init_time') [enabled by
> default]

OK, I've reproduced the problem now, and is indeed real. I'll whip up a
patch.

The very very odd thing is that imx31-dt.c is only compiled if
CONFIG_MACH_IMX31_DT, and imx_v6_v7_defconfig doesn't specify a value
for that option, so it's disabled when I "make imx_v6_v7_defconfig". If
I manually enable the option via "make menuconfig", then I do see this
problem.
