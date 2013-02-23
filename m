From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: pmc: convert PMC driver to support DT
 only
Date: Sat, 23 Feb 2013 10:03:42 +0800
Message-ID: <1361585022.1804.11.camel@jlo-ubuntu-64.nvidia.com>
References: <1361515491-16199-1-git-send-email-josephl@nvidia.com>
	 <1361515491-16199-2-git-send-email-josephl@nvidia.com>
	 <20130222130516.GW23234@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130222130516.GW23234-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 2013-02-22 at 21:05 +0800, Peter De Schrijver wrote:
> On Fri, Feb 22, 2013 at 07:44:48AM +0100, Joseph Lo wrote:
> > The Tegra kernel only support boot from DT now. Clean up the PMC driver
> > to support DT only, that includes:
> > 
> > * remove the ifdef of CONFIG_OF
> > * replace the static mapping of PMC addr to map from DT
> > 
> > -#ifdef CONFIG_OF
> >  static const struct of_device_id matches[] __initconst = {
> >  	{ .compatible = "nvidia,tegra20-pmc" },
> >  	{ }
> 
> At least an extra entry for tegra114-pmc is necessary here. tegra114.dtsi only
> has:
> 
> pmc {
> 	compatible = "nvidia,tegra114-pmc", "nvidia,tegra30-pmc";
> 	reg = <0x7000e400 0x400>;
> };
> 
I think it should be something like below, isn't it?

compatible = "nvidia,tegra114-pmc", "nvidia,tegra30-pmc",
		"nvidia,tegra20-pmc";

or should we add tegra114 and tegra30 in the DT match table?

Thanks,
Joseph
