From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: What is a "phy"; lanes or a group?
Date: Mon, 19 Oct 2015 20:26:29 +0530
Message-ID: <5625049D.3040103@ti.com>
References: <56214D54.8030608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56214D54.8030608-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Saturday 17 October 2015 12:47 AM, Stephen Warren wrote:
> Kishon,
> 
> I wanted to confirm a few aspects about the PHY subsystem in Linux, and
> also the DT representation of PHYs. Mainly I'd like to understand
> whether an individual PHY represents a single "lane" of traffic, or the
> whole set of lanes related to a particular IO controller or "port" of an
> IO controller. This distinction isn't relevant for e.g. a USB2
> controller that only uses a single (differential) lane, but is for
> something like a x4 PCIe port.

right, that's generally the case where we represent a single lane as a
PHY and the IP that implements these multiple lanes as PHY provider.
> 
> I think it's simplest if I describe some scenarios and confirm the set
> of phys you'd expect to exist in each:
> 
> 1)
> 
> 1 single PCIe controller, with 1 x1 port.
> 
> I believe the PCIe driver would get 1 PHY.

right.
> 
> 2)
> 
> 1 single PCIe controller with 2 x1 root ports.
> 
> I believe the PCIe driver would get 2 separate PHYs; 1 PHY per root port.

yes.
> 
> 3)
> 
> 1 single PCIe controller with 1 x4 port.
> 
> Would you expect the PCIe driver to get a single PHY that represented
> the collection of 4 lanes, or to get 4 separate PHYs; one for each lane.

Ideally would like to have four separate PHY's if each of these lanes
can be configured independently.
> 
> == PHY count for multi-lane controllers:
> 
> Perhaps the answer depends on the SoC architecture; I could image some
> SoCs having an entirely independent PHY per lane thus requiring the PCIe
> driver to get 4 PHYs, whereas another SoC might have a single set of
> registers that control all 4 lanes as a single block, which in turn was
> exposed as a single PHY.

For IPs which implement multiple PHYs (in this case multi lane), there
can be a single phy provider and multiple PHYs, one PHY for each lane.
> 
> However, I'd hope that the PCIe driver wouldn't have to understand those
> details, so it was possible to transplant the PCIe IP between different
> SoCs that used different PHY architectures without needing to understand
> the differences. Has any thought been given to this?

The standard PCI dt binding already defines *num-lanes*, so the PCIe
driver can know the number of lanes that the controller can support.
> 
> We could isolate the PCIe driver by either:
> 
> a) Always making the PCIe driver get a single PHY for each port

here by port you mean each lane right?
> irrespective of lane count. If the HW doesn't work like this, we could
> provide some kind of "aggregate" PHY that "fans out" to all the
> individual PHYs.

Not sure I get this. Care to explain more?

> 
> b) Always making the PCIe driver get as many PHYs as there are lanes. In
> the case where the PHY provider only implements a single PHY, we could
> either provide the same PHY for each lane, or provide dummy PHYs for all
> but one lane.

If the HW IP is modeled in such a way that there is a single PHY control
for all the lanes, then the PCIe driver can just get and configure a
single PHY. But generally most of the IPs give independent control for
each of the PHYs.
> 
> == PHY brick provider count
> 
> On Tegra, we have some PHY "bricks" that contain multiple lanes. Each
> lane can be configured to connect to one of n IO controllers (USB3,
> PCIe, SATA). The exact set of "n" IO controllers associated with each
> lane varies lane to lane. There are some global register settings to
> enable the "brick" as a whole, and some per lane settings to enable (and
> configure muxing for) each lane. We currently have the muxing modelled
> via the pinctrl DT bindings and Linux driver subsystem.
> 
> How many PHY object would you expect to exist in such a setup. Options I
> can think of are:
> 
> a)
> 
> A single PHY, since there is some global register state associated with
> the "brick". Multiple IO controller drivers will get this same PHY, and
> we'll implement reference counting to determine when to actually
> enable/disable this PHY. The driver will look at the muxing information
> to determine the actual use for each lane, and enable/disable/configure
> the per-lane options the first time the PHY is "got".
> 
> The disadvantage here is that per-lane information isn't implied by the
> set of PHY objects in use, since there's only one. This information
> could perhaps be provided by various custom properties in the PHY
> provider's DT node(s) though.
> 
> As background, we currently have this option implemented for Tegra124's
> PCIe brick (which supports 5 lanes).
> 
> Concretely, the provider might use #phy-cells = <0> here if there's just
> one brick implemented in the PHY HW module.
> 
> b)
> 
> A PHY per IO controller (port) that may use (parts of) the PHY brick.
> For example, even with just a 7-lane PHY brick, we might expose a PHY
> for each of 4 USB2 single-port controllers, one for each of 4 ports in
> the USB3 controller, 1 for the SATA controller, and one for each of 2
> ports in the PCIe controller. (That's 11 PHY objects for 7 lanes).
> 
> The disadvantage here is that we potentially end up with (and certainly
> do on Tegra) with the PHY provider providing many more PHYs than lanes,
> if the number of IO controller (ports) that can be muxed into the PHY
> brick exceeds the number of lanes.
> 
> As background, I've seen a patch to extend Tegra124's PCIe PHY binding
> to essentially this model. However, the conversion looked like it
> supported a mix of model (a) and (b) for different cases, which feels
> inconsistent.
> 
> Concretely, the provider might use #phy-cells = <1>, with valid values
> being:
> 
> PHY_USB2_CONTROLLER0
> PHY_USB2_CONTROLLER1
> ...
> PHY_USB3_CONTROLLER0_PORT0
> PHY_USB3_CONTROLLER0_PORT1
> ...
> PHY_PCIE_CONTROLLER0_PORT0
> PHY_PCIE_CONTROLLER0_PORT1
> PHY_SATA
> 
> c)
> 
> A PHY per IO lane in the brick. In this case, the global PHY enabling
> would happen when the first PHY was enabled via reference counting, and
> all the per-lane registers would be controlled by each individual PHY
> object.

This looks like the best option where the PHY brick will be modeled as a
PHY provider and a separate PHY for each of the 7 lanes.
> 
> This option feels most generic, and gives the most lane-specific
> information to the PHY driver, I think?
> 
> The disadvantage here is that it's difficult for the PHY provider to
> know which lanes form part of the same logical connection, e.g. if we
> need to program each lane to enable it, then perform some link-level
> configuration across all lanes involved in that link.

Maybe we can use PHY TYPE to differentiate between the lanes. With that
#phy-cells should be 2, 1st cell should have PHY TYPE (PHY_TYPE_SATA,
PHY_TYPE_USB3, PHY_TYPE_PCIE, etc..) and the 2nd cell can be made
optional to be used only with PCIe to differentiate LANE0, LANE1 etc..
> 
> Concretely, the provider might use #phy-cells = <1>, with valid values
> being:
> 
> PHY_LANE0
> PHY_LANE1
> PHY_LANE2
> ...
> 
> Again perhaps the answer differs between SoCs? If so, do you have any
> thoughts/guidance which option is most appropriate when?

The 'c' option looks appropriate to me with some modifications.
> 
> Finally, do you have any generic thoughts re: structuring of PHY
> provider DT nodes? I've heard of a proposal for Tegra to have a
> top-level DT node for the HW module that implements the PHYs, but with a
> separate DT sub-node per PHY that's implemented in order to provide
> PHY-specific configuration. I see some of the Samsung bindings already
> do something like this. Do you have any general guidance on this, or do
> you think individual bindings are free to do whatever makes sense for
> the HW in question?

Looks like your PHY is similar to miphy365. I'd recommend you to look at
Documentation/devicetree/bindings/phy/phy-miphy365x.txt and see if it
makes sense to you.
> 
> Thanks for reading this long email, and any responses you give!

No problem.

Cheers
Kishon
