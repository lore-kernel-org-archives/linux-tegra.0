From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 08/11] clk: tegra114: add suspend/resume function for
 tegar_cpu_car_ops
Date: Wed, 31 Jul 2013 10:27:17 +0800
Message-ID: <1375237637.1231.1.camel@jlo-ubuntu-64.nvidia.com>
References: <1372152475-18617-1-git-send-email-josephl@nvidia.com>
	 <1372152475-18617-9-git-send-email-josephl@nvidia.com>
	 <20130730212100.5270.53947@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130730212100.5270.53947@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-07-31 at 05:21 +0800, Mike Turquette wrote:
> Quoting Joseph Lo (2013-06-25 02:27:52)
> > Adding suspend/resume function for tegra_cpu_car_ops. We only save and
> > restore the setting of the clock of CoreSight. Other clocks still need
> > to be taken care by clock driver.
> > 
> > Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Change looks OK to me, besides Stephen's comments. I was waiting for a
> V2 to hit the list but I never saw it. Any plans?
> 
Hi Mike,

The V2 was sent on 2013/7/3.

Thanks,
Joseph
