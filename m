From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pci: tegra: Remove PLL power supplies
Date: Fri, 17 Jul 2020 11:48:41 +0100
Message-ID: <20200717104841.GB4353@e121166-lin.cambridge.arm.com>
References: <20200623145528.1658337-1-thierry.reding@gmail.com>
 <20200716125945.GD535268@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200716125945.GD535268@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 16, 2020 at 02:59:45PM +0200, Thierry Reding wrote:
> On Tue, Jun 23, 2020 at 04:55:27PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > The XUSB pad controller, which provides access to various USB, PCI and
> > SATA pads (or PHYs), needs to bring up the PLLs associated with these
> > pads. In order to properly do so, it needs to control the power supplied
> > to these PLLs.
> > 
> > Remove the PLL power supplies from the PCIe controller because it does
> > not need direct access to them. Instead it will only use the configured
> > pads provided by the XUSB pad controller.
> > 
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Hi Rob,
> > 
> > I already made this change as part of the conversion series, but wanted
> > to send this out as part of this subseries since it addresses a fairly
> > long-standing issue that I'd like to clean up irrespective of the DT
> > binding conversion. Since it looks like the conversion series will take
> > a bit longer, I think it makes sense to send this out separately.
> > 
> > Thierry
> > 
> >  .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt  | 12 ------------
> >  1 file changed, 12 deletions(-)
> 
> Hi Rob, any feedback on this?

Hi Rob,

I'd like to queue both patches, please let me know if that's OK with
you.

Thank you very much.

Lorenzo

> > index 7939bca47861..d099f3476ccc 100644
> > --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> > +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> > @@ -112,28 +112,16 @@ Power supplies for Tegra124:
> >  - Required:
> >    - avddio-pex-supply: Power supply for analog PCIe logic. Must supply 1.05 V.
> >    - dvddio-pex-supply: Power supply for digital PCIe I/O. Must supply 1.05 V.
> > -  - avdd-pex-pll-supply: Power supply for dedicated (internal) PCIe PLL. Must
> > -    supply 1.05 V.
> >    - hvdd-pex-supply: High-voltage supply for PCIe I/O and PCIe output clocks.
> >      Must supply 3.3 V.
> > -  - hvdd-pex-pll-e-supply: High-voltage supply for PLLE (shared with USB3).
> > -    Must supply 3.3 V.
> >    - vddio-pex-ctl-supply: Power supply for PCIe control I/O partition. Must
> >      supply 2.8-3.3 V.
> > -  - avdd-pll-erefe-supply: Power supply for PLLE (shared with USB3). Must
> > -    supply 1.05 V.
> >  
> >  Power supplies for Tegra210:
> >  - Required:
> > -  - avdd-pll-uerefe-supply: Power supply for PLLE (shared with USB3). Must
> > -    supply 1.05 V.
> >    - hvddio-pex-supply: High-voltage supply for PCIe I/O and PCIe output
> >      clocks. Must supply 1.8 V.
> >    - dvddio-pex-supply: Power supply for digital PCIe I/O. Must supply 1.05 V.
> > -  - dvdd-pex-pll-supply: Power supply for dedicated (internal) PCIe PLL. Must
> > -    supply 1.05 V.
> > -  - hvdd-pex-pll-e-supply: High-voltage supply for PLLE (shared with USB3).
> > -    Must supply 3.3 V.
> >    - vddio-pex-ctl-supply: Power supply for PCIe control I/O partition. Must
> >      supply 1.8 V.
> >  
> > -- 
> > 2.27.0
> > 
