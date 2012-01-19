From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: tegra: Define Tegra20 CAR binding
Date: Thu, 19 Jan 2012 09:17:40 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB0CA@HQMAIL01.nvidia.com>
References: <1326342789-5781-12-git-send-email-sjg@chromium.org>
 <1326932212-30346-1-git-send-email-swarren@nvidia.com>
 <20120119053143.GA27447@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120119053143.GA27447-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Wednesday, January 18, 2012 10:32 PM:
> On Wed, Jan 18, 2012 at 05:16:52PM -0700, Stephen Warren wrote:
> > diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> > +* NVIDIA Tegra20 Clock And Reset Controller
> > +
> > +This binding uses the common clock binding:
> > +Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +
> > +The CAR (Clock And Reset) Controller on Tegra is the HW module responsible
> > +for muxing and gating Tegra's clocks, and setting their rates.
> > +
> > +Required properties :
> > +- compatible : Should be "nvidia,<chip>-car"
> > +- reg : Should contain CAR registers location and length
> > +- clocks : Should contain phandle and clock specifiers for two clocks:
> > +  the 32 KHz "32k_in", and the board-specific oscillator "osc".
> > +- clock-names : Should contain a list of strings, with values "32k_in",
> > +  and "osc".
> 
> Hmm. I'd prefer to just ditch the notion of "clock-names" in the cases
> where it isn't strictly necessary. Just because some vendors don't want
> to define an order between their clocks doesn't mean it's a good idea
> for everybody to use that model. In this case, just declaring that the
> two clocks refs have to be to those two clocks in that order should
> be sufficient.

OK, that seems reasonable. I'm happy using of_clk_get() rather than
of_clk_get_by_name(). I guess that means we should just avoid any
discussion of clock-output-names too.

> > +- #clock-cells : Should be 1.
> > +  In clock consumers, this cell represents the clock ID exposed by the CAR.
> > +  For a list of valid values, see the clock-output-names property.
> > +
> > +Optional properties :
> > +- clock-output-names : Should contain a list of strings defining the clocks
> > +  that the CAR provides. The list of names and clock IDs is below. The IDs
> > +  may be used in clock specifiers. The names should be listed in this clock-
> > +  output-names property, sorted in ID order, if this property is present.
> > +
> > +  The first 96 clocks are numbered to match the bits in the CAR's CLK_OUT_ENB
> > +  registers. Later, subsequent IDs will be assigned to all other clocks the
> > +  CAR controls.
> 
> Aren't these names hardcoded per SoC? If so, they can be derived from the
> compatible field + output number without having a table in the device tree.
>
> If anything, you might want to enumerate the allowed/expected values, but
> actually putting them in a property seems overkill.

Yes, the set of clocks is hard-coded per SoC, and the clock is uniquely
identified by compatible+id.

clock-output-names doesn't actually serve any functional purpose in
Grant's common clock bindings patches; it's more of a documentation
thing. As such, yes, I can remove the suggestion to actually put the
table into the device tree, and rework the binding to simply define
what the mapping is independently.

...
> > +Example:
> > +
> > +clocks {
> > +	clk_32k: oscillator@0 {
> 
> If it has a unit addres (@<x>) it needs a reg property with the same base
> address.

I thought everything needed a unit address period? Is the rule more like
the unit address is optional, but if present must match reg, so I can
simply remove @0 and @1 here? I guess that makes a lot more sense.

> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <32768>;
> > +	};
> > +
> > +	osc: oscillator@1 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <12000000>;
> > +	};
> > +};

-- 
nvpublic
