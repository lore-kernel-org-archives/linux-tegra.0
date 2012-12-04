From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: tegra20: clocks: add CPU low-power function
 into tegra_cpu_car_ops
Date: Tue, 4 Dec 2012 12:28:47 +0800
Message-ID: <1354595327.30563.0.camel@jlo-ubuntu-64.nvidia.com>
References: <1354503607-13707-1-git-send-email-josephl@nvidia.com>
	 <1354503607-13707-3-git-send-email-josephl@nvidia.com>
	 <50BCED6A.7000702@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50BCED6A.7000702-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2012-12-04 at 02:20 +0800, Stephen Warren wrote:
> On 12/02/2012 08:00 PM, Joseph Lo wrote:
> > Add suspend, resume and rail_off_ready API into tegra_cpu_car_ops. These
> > functions were used for CPU powered-down state maintenance.
> 
> > diff --git a/arch/arm/mach-tegra/tegra20_clocks.c b/arch/arm/mach-tegra/tegra20_clocks.c
> 
> > +static bool tegra20_cpu_rail_off_ready(void)
> 
> > +	if ((cpu_rst_status & 0x2) != 0x2)
> > +		return false;
> > +
> > +	return true;
> > +}
> 
> Perhaps simplify that to:
> 
> return cpu_rst_status & 2;
> 
> or perhaps if that generates an int->bool performance warning:
> 
> return !!(cpu_rst_status & 2);

OK. Will do this.

Thanks,
Joseph
