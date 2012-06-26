From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 16:48:14 -0600
Message-ID: <4FEA3C2E.3030109@wwwdotorg.org>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de> <4FE9FB22.1090902@wwwdotorg.org> <20120626195108.GB5308@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120626195108.GB5308-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/26/2012 01:51 PM, Thierry Reding wrote:
> On Tue, Jun 26, 2012 at 12:10:42PM -0600, Stephen Warren wrote:
>> On 06/26/2012 04:55 AM, Thierry Reding wrote:
>>> Hi,
>>> 
>>> while I haven't got much time to work on the actual code right
>>> now, I think it might still be useful if we could get the
>>> device tree binding to a point where everybody is happy with
>>> it. That'll also save me some time once I get to writing the
>>> code because I won't have to redo it over again. =)
>>> 
>>> So here's the current proposal:
>>> 
>>> host1x { compatible = "nvidia,tegra20-host1x", "simple-bus"; 
>>> reg = <0x50000000 0x00024000>; interrupts = <0 64 0x04   /* cop
>>> syncpt */ 0 65 0x04   /* mpcore syncpt */ 0 66 0x04   /* cop
>>> general */ 0 67 0x04>; /* mpcore general */
>>> 
>>> #address-cells = <1>; #size-cells = <1>;
>>> 
>>> ranges = <0x54000000 0x54000000 0x04000000>;
>>> 
>>> status = "disabled";
>> 
>> The idea behind status="disabled" is that some HW only makes
>> sense to use on particular boards. This concept really only
>> applies to HW modules that drive external interfaces on the SoC,
>> which in turn the board can choose whether to connect anything to
>> (or whether to even connect to any external pins using the
>> pinmux, or not).
>> 
>> As such, I don't think it makes sense to set status="disabled"
>> on host1x, nor many other internal-only engines such as say mpe,
>> epp, i2sp, gr2d, gr3d, dc1, dc2.
> 
> What about power management and resource usage? If a board for
> instance doesn't need gr3d at all it could just leave it at status
> = "disabled" to not have the corresponding driver loaded and not
> waste the power and resources.

The driver should be turning off all the clocks and power if the
devices aren't actually used (or not turning it on in the first
place). I guess there will be some slight overhead for the
device/driver instantiation.

However, in all likelihood, all/most boards will enable this feature
once it's in place. For very resource-constrained scenarios without
display, presumably one would be building a custom kernel without the
display driver enabled, so the DT content for display wouldn't ever
come into play.

>>> Board DTS files could then extend this with board-specific
>>> requirements and connectors. The following describes the Medcom
>>> Wide:
>> 
>>> connectors { #address-cells = <1>; #size-cells = <0>;
>>> 
>>> };
>> 
>> The connector seems to be a property of the individual output
>> resources. I'd expect to see the connector configuration be a
>> child of the outputs that a particular board had enabled;
>> something more like:
>> 
>> host1x { rgb { status = "okay";
>> 
>> connector@0 { nvidia,edid = /incbin/("tegra-medcom.edid"); }; }; 
>> hdmi { status = "okay";
>> 
>> connector@0 { nvidia,ddc-i2c-bus = <&tegra_i2c1>; }; }; };
>> 
>> Perhaps even completely omit the connector node, and put the
>> properties directly within the rgb/hdmi node itself. After all
>> the HDMI output really is the connector as far as Tegra goes.
> 
> Heh. I seem to remember you objecting to this in a previous
> series[0] which is actually the reason that I moved them to the
> top-level in the first place. =)
> 
> Thierry
> 
> [0]: http://www.spinics.net/lists/linux-tegra/msg05298.html

I don't think I was objecting to exactly what I wrote above; in that
email, there were already separate connector nodes, but they were
placed directly inside the host1x node (at that time called graphics),
so still rather disconnected from the HW they represent.

The argument for sharing e.g. an HDMI port between both video and
audio still exists though. That said, I think now I'd still be
inclined to put all the connector information for video into the
hdmi/rgb/tvo nodes. If DT does grow to represent the user-connectors
at the top-level perhaps in conjunction with drivers/extcon, perhaps
the hdmi node can point at the extcon node with a phandle, or
vice-versa, to set up the link between the components of the
user-visible port.

Still, the decision here is possibly a little arbitrary; many schemes
would work. I think at this point I don't care /too/ strongly about
which is used, so the separate-connectors-at-top-level concept in your
email is probably OK. I wonder if the hdmi node doesn't need a phandle
pointing at the connector node though, so they can both "find" each-other?
