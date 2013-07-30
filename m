From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/8] ARM: tegra: support LP1 suspend mode
Date: Tue, 30 Jul 2013 17:49:15 +0800
Message-ID: <1375177755.1239.19.camel@jlo-ubuntu-64.nvidia.com>
References: <1374830110-30685-1-git-send-email-josephl@nvidia.com>
	 <2389689.JgQlW00RdN@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2389689.JgQlW00RdN@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, 2013-07-28 at 00:12 +0800, Marc Dietrich wrote:
> On Friday 26 July 2013 17:15:02 Joseph Lo wrote:
> > This series adds the support of LP1 suspend mode for Tegra.
> > 
> > Verified on Seaboard, Cardhu and Dalmore.
> 
> tested on AC100 and worked fine, except
> 
[unbalanced wake_enable/disable of rtc-6586x]
> 
> and sdcard being offline after resume (fixed by CONFIG_MMC_UNSAFE_RESUME=y). 
> Anyway, thanks for your great work!
> 
> Tested-By: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> 

Marc,

Thanks for your testing.
