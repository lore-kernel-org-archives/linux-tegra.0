From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/7] ARM: tegra: Add initial device tree for Tegra124
Date: Tue, 8 Oct 2013 09:21:22 +0800
Message-ID: <1381195282.10568.2.camel@jlo-ubuntu-64.nvidia.com>
References: <1381131085-26116-1-git-send-email-josephl@nvidia.com>
	 <1381131085-26116-5-git-send-email-josephl@nvidia.com>
	 <5252ECFF.404@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5252ECFF.404-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2013-10-08 at 01:18 +0800, Stephen Warren wrote:
> On 10/07/2013 01:31 AM, Joseph Lo wrote:
> > Initial support for Tegra 124 SoC. This is expected to be included in
> > the board DTS files.
> The pmc node should also be fixed.
> 
> > +	pmc {
> > +		compatible = "nvidia,tegra124-pmc", "nvidia,tegra114-pmc";
> > +		reg = <0x7000e400 0x400>;
> > +	};
> 
> Is the Tegra124 PMC really identical to the Tegra114 PMC in hardware?
> That would be a departure from history, where the PMC has changed
> significantly and incompatibly for each chip. Can you please investigate
> the details of the PMC changes; I suspect this should simply be:
> 
> 		compatible = "nvidia,tegra124-pmc";
> 

Thanks for reminding, it's not identical. Considering the power gate and
power domain function is not the same with Tegra114.
