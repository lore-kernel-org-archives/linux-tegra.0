From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 04/13] ARM: tegra: Add MIPI calibration DT entries
 for Tegra114
Date: Wed, 16 Oct 2013 10:53:28 -0600
Message-ID: <525EC488.2070901@wwwdotorg.org>
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
>>> TEGRA114_CLK_MIPI_CAL>; +		#calibrate-cells = <1>; +	};
>> 
>> Do you have a link to the binding documentation for this? I'm
>> still in the dark re: why there's a need for #calibrate-cells at
>> all. It seems like this should be some internal implementation
>> detail of the Tegra DC/..., or implicit based on the compatible
>> value (if cell count changes, just rev the compatible value; it's
>> not like this is a generic service for loosely coupled drivers).
> 
> Here's the commit that adds the device tree binding:
> 
> https://gitorious.org/thierryreding/linux/commit/43b798a54063156692e0fde2a9022c0ae44b862e

OK.
> 
That apparently hasn't been reviewed/acked by any DT maintainers
though?

> I was under the impression that we needed the #*-cells properties
> so that the device tree code could verify that the content is
> actually correct and so that it knows how to parse the specifier. I
> mean why else do we have the #gpio-cells property for GPIO
> controller nodes?

For GPIOs, there's no relationship between the provider and consumer;
any chip can provide any other chip with a GPIO. Hence, the format of
the GPIO property needs to be fully generic and flexible.

I would argue here that the MIPI module and its consumers are
completely coupled together, so the number of cells is known and
static. I suppose if you mixed/matched DSI and MIPI-CAL modules in
SoCs, perhaps this isn't the case though.

That said, even though I'm not convinced this property is needed, I
suppose it doesn't hurt. It might allow some strange future chip that
has multiple MIPI-CAL blocks each having a different number of
channels and hence needing a different number of cells, with some
lanes from one DSI controller routed to different MIPI-CAL blocks. I
guess it is best to be future-safe.

> Also note that this driver isn't for something internal to the DRM 
> driver. It can (and will) also be used by the V4L2 camera driver
> that Bryan is working on, because the CSI pads need to be
> calibrated in the same way.
