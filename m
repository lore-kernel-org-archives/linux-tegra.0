From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/3] ARM: dts: tegra: add clock source for PMC
Date: Wed, 20 Mar 2013 18:12:05 +0800
Message-ID: <1363774325.5697.19.camel@jlo-ubuntu-64.nvidia.com>
References: <1363594199-10974-1-git-send-email-josephl@nvidia.com>
	 <1363594199-10974-2-git-send-email-josephl@nvidia.com>
	 <51489586.9090605@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51489586.9090605-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-03-20 at 00:42 +0800, Stephen Warren wrote:
> On 03/18/2013 02:09 AM, Joseph Lo wrote:
> > The clock source of PMC is PCLK. Adding it into DTS for Tegra20 and Tegra30.
> 
> > diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> 
> >  	pmc {
> >  		compatible = "nvidia,tegra20-pmc";
> >  		reg = <0x7000e400 0x400>;
> > +		clocks = <&tegra_car 110>;
> >  	};
> 
> The DT binding documentation needs to list the set of clocks that must
> be present.
> 
> Doesn't the PMC also receive a "clk32k_in" from the PMIC, or is that
> routed into the CAR, and then into the PMC? Either way, the PMC module
> receives that clock somehow. Since there are multiple clocks, that also
> means that a clock-names property is required.

Do you mean the DTS below and add it into binding document?

/ SoC dts including file
pmc {
	compatible = "nvidia,tegra20-pmc";
	reg = <0x7000e400 0x400>;
	clocks = <&tegra_car 110>, <&clk32k_in>;
	clock-names= "pclk", "clk32k_in";
};

/ Tegra board dts file

pmic {
	...
	clocks {
		compatible = "simple-bus";
		#address-cells = <1>;
		#size-cells = <0>;

		clk32k_in: clock@0 {
			compatible = "fixed-clock";
			reg=<0>;
			#clock-cells = <0>;
			clock-frequency = <32768>;
		};
	};
};
