From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: retain L2 content over CPU suspend/resume
Date: Mon, 12 Nov 2012 12:10:37 +0800
Message-ID: <1352693437.19251.9.camel@jlo-ubuntu-64.nvidia.com>
References: <1352194377-6209-1-git-send-email-josephl@nvidia.com>
	 <509D7BA1.506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <509D7BA1.506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, 2012-11-10 at 05:54 +0800, Stephen Warren wrote:
> On 11/06/2012 02:32 AM, Joseph Lo wrote:
> > The L2 RAM is in different power domain from the CPU cluster. So the
> > L2 content can be retained over CPU suspend/resume. To do that, we
> > need to disable L2 after the MMU is disabled, and enable L2 before
> > the MMU is enabled. But the L2 controller is in the same power domain
> > with the CPU cluster. We need to restore it's settings and re-enable
> > it after the power be resumed.
> 
> This doesn't compile:
> 
> arch/arm/mach-tegra/headsmp.S: Assembler messages:
> arch/arm/mach-tegra/headsmp.S:119: Error: undefined symbol L2X0_CTRL_EN
> used as an immediate value
> arch/arm/mach-tegra/headsmp.S:119: Error: undefined symbol L2X0_CTRL_EN
> used as an immediate value

Ah, sorry for mention that.
This patch was depended on "07bd005 ARM: 7547/1: cache-l2x0: add support
for Aurora L2 cache ctrl" and only showed up after "next-20121024". The
definition of "L2X0_CTRL_EN" was been introduced in that patch.

Should I re-send a patch that based on tegra "for-next" branch that will
change L2X0_CTRL_EN to 0x1? Sorry for inconvenience.

Thanks,
Joseph
