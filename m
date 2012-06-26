From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 12:10:42 -0600
Message-ID: <4FE9FB22.1090902@wwwdotorg.org>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120626105513.GA9552-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/26/2012 04:55 AM, Thierry Reding wrote:
> Hi,
> 
> while I haven't got much time to work on the actual code right now, I
> think it might still be useful if we could get the device tree binding
> to a point where everybody is happy with it. That'll also save me some
> time once I get to writing the code because I won't have to redo it over
> again. =)
> 
> So here's the current proposal:
> 
> 	host1x {
> 		compatible = "nvidia,tegra20-host1x", "simple-bus";
> 		reg = <0x50000000 0x00024000>;
> 		interrupts = <0 64 0x04   /* cop syncpt */
> 			      0 65 0x04   /* mpcore syncpt */
> 			      0 66 0x04   /* cop general */
> 			      0 67 0x04>; /* mpcore general */
> 
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 
> 		ranges = <0x54000000 0x54000000 0x04000000>;
> 
> 		status = "disabled";

The idea behind status="disabled" is that some HW only makes sense to
use on particular boards. This concept really only applies to HW modules
that drive external interfaces on the SoC, which in turn the board can
choose whether to connect anything to (or whether to even connect to any
external pins using the pinmux, or not).

As such, I don't think it makes sense to set status="disabled" on
host1x, nor many other internal-only engines such as say mpe, epp, i2sp,
gr2d, gr3d, dc1, dc2.

However it does make sense for the output resources rgb, hdmi, tvo, dsi.

> 		/* outputs */
> 		rgb {
> 			compatible = "nvidia,tegra20-rgb";
> 			status = "disabled";
> 		};
...
> The rgb node is something that I don't quite know how to handle yet.
> Since it is really part of the display controller and uses its register
> space, it isn't quite correct to represent it as a separate device. But
> we will need a separate node to make it available as a connector, which
> will become more obvious below.

Are you referring to the DC_COM_PIN_OUTPUT* registers? Sorry, I'm not at
all familiar with our display HW yet.

Some possible solutions spring to mind:

a) The output nodes don't have to be direct children of host1x. Instead,
each DC could have an rgb child node that represents its own individual
output capability.

b) If the RGB-related registers in DC are completely independent of any
other DC registers and grouped together well enough, we can just carve a
chunk out of the DC register space and give that to the RGB node instead:

i.e. not:

> 		dc1: dc@54200000 {
> 			compatible = "nvidia,tegra20-dc";
> 			reg = <0x54200000 0x00040000>;
> 			interrupts = <0 73 0x04>;
> 			status = "disabled";
> 		};


but something more like (the completely made up example):

    dc1: dc@54200000 {
        compatible = "nvidia,tegra20-dc";
        reg = <0x54200000 0x00020000 0x54203000 0x10000>;
        interrupts = <0 73 0x04>;
        status = "disabled";
    };

    rgb {
        compatible = "nvidia,tegra20-rgb";
        reg = <0x54220000 0x00010000>;
        status = "disabled";
    };

c) The rgb node could simply reference the dc nodes using a phandle, and
call into the dc driver to obtain RGB configuration services from it:

    rgb {
        compatible = "nvidia,tegra20-rgb";
        status = "disabled";
        nvidia,dcs = <&dc1 &dc2>;
    };

By the way, if the RGB registers are in the DC, aren't there two
separate RGB outputs. Certainly the TRM implies that both DCs can be
driving LCDs, by reducing the width of the LCD signals that each DC uses
(lower bits-per-pixel, or perhaps DDR encoding on the data lines).

> Board DTS files could then extend this with board-specific requirements
> and connectors. The following describes the Medcom Wide:

> 	connectors {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 	};

The connector seems to be a property of the individual output resources.
I'd expect to see the connector configuration be a child of the outputs
that a particular board had enabled; something more like:

    host1x {
        rgb {
            status = "okay";

            connector@0 {
                nvidia,edid = /incbin/("tegra-medcom.edid");
            };
        };
        hdmi {
            status = "okay";

            connector@0 {
                nvidia,ddc-i2c-bus = <&tegra_i2c1>;
            };
        };
    };

Perhaps even completely omit the connector node, and put the properties
directly within the rgb/hdmi node itself. After all the HDMI output
really is the connector as far as Tegra goes.
