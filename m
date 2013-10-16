From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 04/13] ARM: tegra: Add MIPI calibration DT entries
 for Tegra114
Date: Wed, 16 Oct 2013 10:56:30 -0600
Message-ID: <525EC53E.1050707@wwwdotorg.org>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com> <1381850883-12722-5-git-send-email-treding@nvidia.com> <525DA888.2060800@wwwdotorg.org> <20131016105743.GG21963@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131016105743.GG21963-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/16/2013 04:57 AM, Thierry Reding wrote:
> On Tue, Oct 15, 2013 at 02:41:44PM -0600, Stephen Warren wrote:
>> On 10/15/2013 09:27 AM, Thierry Reding wrote:
>>> Add a device node for the MIPI calibration block on Tegra114.
>>> There is no need to disable it by default because it only
>>> enables the clock while performing calibration and therefore
>>> shouldn't be consuming any power when unused.
>> 
>>> diff --git a/arch/arm/boot/dts/tegra114.dtsi
>>> b/arch/arm/boot/dts/tegra114.dtsi
>> 
>>> +	mipi: mipi { +		compatible = "nvidia,tegra114-mipi"; +		reg =
>>> <0x700e3000 0x100>; +		clocks = <&tegra_car
>>> TEGRA114_CLK_MIPI_CAL>; +		#calibrate-cells = <1>;

Oh, one thing I wonder about: #gpio-cells is a generic property that
applies to any GPIO user, and hence has a generic name.
#calibrate-cells here doesn't fall into the same class. Do we need a
more unique property name, such as #nvidia,mipi-calibrate-cells, and
equally for the consumer to use nvidia,mipi-calibrate as the property
that references the MIPI device, rather than the generic-sounding
"calibrate"?
