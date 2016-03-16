From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v10 1/9] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Wed, 16 Mar 2016 01:42:52 -0500
Message-ID: <20160316064252.GA16949@rob-hp-laptop>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <20160305043145.GL13525@rob-hp-laptop>
 <20160307112418.GA11152@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160307112418.GA11152@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 07, 2016 at 12:24:18PM +0100, Thierry Reding wrote:
> On Fri, Mar 04, 2016 at 10:31:45PM -0600, Rob Herring wrote:
> > On Fri, Mar 04, 2016 at 05:19:31PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > The NVIDIA Tegra XUSB pad controller provides a set of pads, each with a
> > > set of lanes that are used for PCIe, SATA and USB.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > Changes in v10:
> > > - clarify that the hardware documentation means something different when
> > >   referring to a "port" (intra-SoC connectivity)
> > > 
> > > Changes in v9:
> > > - rename UTMI -> USB2 to match hardware documentation
> > > - reword according to suggestions by Stephen Warren
> > > - make Tegra132 compatible string list consistent
> > > - remove mailbox support
> > > 
> > >  .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   | 376 +++++++++++++++++++++
> > >  .../pinctrl/nvidia,tegra124-xusb-padctl.txt        |   5 +
> > >  2 files changed, 381 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
> > 
> > Without really understanding the h/w here, looks okay to me.
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> > 
> > > +SoC include:
> > > +
> > > +	padctl@0,7009f000 {
> > 
> > Drop the comma. Commas should only be used if there are distinct fields.
> > 
> > If I get my dtc patch done, these are going to start warning, so you 
> > might want to go fix dts files (assuming that's where this is coming 
> > from).
> 
> I noticed that in today's next the updated DTC already complains about a
> lot of things in existing DTS files. For Tegra that's primarily the
> memory node, because it has a reg property but no unit name. Any hints
> as to how to solve that? I think I remember from way back that memory
> was supposed to be an exception, perhaps DTC needs to be taught that?

I remember something about the skeleton.dtsi files and needing to avoid 
having both memory and memory@x nodes, but we really should fix them and 
have a unit address.

Rob
