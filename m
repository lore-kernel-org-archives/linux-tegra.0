From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: retain L2 content over CPU suspend/resume
Date: Fri, 09 Nov 2012 14:54:41 -0700
Message-ID: <509D7BA1.506@wwwdotorg.org>
References: <1352194377-6209-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352194377-6209-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/06/2012 02:32 AM, Joseph Lo wrote:
> The L2 RAM is in different power domain from the CPU cluster. So the
> L2 content can be retained over CPU suspend/resume. To do that, we
> need to disable L2 after the MMU is disabled, and enable L2 before
> the MMU is enabled. But the L2 controller is in the same power domain
> with the CPU cluster. We need to restore it's settings and re-enable
> it after the power be resumed.

This doesn't compile:

arch/arm/mach-tegra/headsmp.S: Assembler messages:
arch/arm/mach-tegra/headsmp.S:119: Error: undefined symbol L2X0_CTRL_EN
used as an immediate value
arch/arm/mach-tegra/headsmp.S:119: Error: undefined symbol L2X0_CTRL_EN
used as an immediate value
