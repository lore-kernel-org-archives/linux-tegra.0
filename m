From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: tegra114: bring up secondary CPU for SMP
Date: Sat, 23 Feb 2013 09:57:21 +0800
Message-ID: <1361584641.1804.5.camel@jlo-ubuntu-64.nvidia.com>
References: <1361515491-16199-1-git-send-email-josephl@nvidia.com>
	 <20130222124351.GU23234@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130222124351.GU23234-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 2013-02-22 at 20:43 +0800, Peter De Schrijver wrote:
> On Fri, Feb 22, 2013 at 07:44:47AM +0100, Joseph Lo wrote:
> > This series bring up secondary CPU for Tegra114. Because we are going to
> > support generic power domain later, the conventional powergate driver will
> > be removed. So we add the CPU power on/off function in PMC driver first.
> > 
> > This series was dependent on the patches below.
> > "ARM: tegra: Fix unchecked return value"
> > "ARM: tegra30: fix the logical detection of power on sequence of warm boot CPUs"
> > "ARM: tegra: refactor tegra{20,30}_boot_secondary"
> > 
> 
> It also depends on 'ARM: tegra: don't unlock MMIO access to DBGLAR for working'
> secondary core boot on Tegra114. Otherwise the secondary cores will hang at
> bootup.
> 
Thanks for reminder. This is definitely needed.

Joseph
