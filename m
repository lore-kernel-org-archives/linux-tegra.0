From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: tegra114: bring up secondary CPU for SMP
Date: Fri, 22 Feb 2013 14:43:51 +0200
Message-ID: <20130222124351.GU23234@tbergstrom-lnx.Nvidia.com>
References: <1361515491-16199-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1361515491-16199-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 22, 2013 at 07:44:47AM +0100, Joseph Lo wrote:
> This series bring up secondary CPU for Tegra114. Because we are going to
> support generic power domain later, the conventional powergate driver will
> be removed. So we add the CPU power on/off function in PMC driver first.
> 
> This series was dependent on the patches below.
> "ARM: tegra: Fix unchecked return value"
> "ARM: tegra30: fix the logical detection of power on sequence of warm boot CPUs"
> "ARM: tegra: refactor tegra{20,30}_boot_secondary"
> 

It also depends on 'ARM: tegra: don't unlock MMIO access to DBGLAR for working'
secondary core boot on Tegra114. Otherwise the secondary cores will hang at
bootup.

Cheers,

Peter.
