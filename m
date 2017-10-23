From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/6] PCI: tegra: refactor config space mapping code
Date: Mon, 23 Oct 2017 08:33:36 -0500
Message-ID: <20171023133336.GA9092@bhelgaas-glaptop.roam.corp.google.com>
References: <1507834211-24922-1-git-send-email-vidyas@nvidia.com>
 <1507834211-24922-2-git-send-email-vidyas@nvidia.com>
 <20171020190824.GN6332@bhelgaas-glaptop.roam.corp.google.com>
 <873cc043-d567-d648-1c6e-0ed962edd953@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <873cc043-d567-d648-1c6e-0ed962edd953-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

[+cc Rob, devicetree list]

On Mon, Oct 23, 2017 at 11:09:50AM +0530, Vidya Sagar wrote:
> On Saturday 21 October 2017 12:38 AM, Bjorn Helgaas wrote:
> >On Fri, Oct 13, 2017 at 12:20:06AM +0530, Vidya Sagar wrote:
> >>use only 4K space from available 1GB PCIe aperture to access
> >>end points configuration space by dynamically moving AFI_AXI_BAR
> >>base address and always making sure that the desired location
> >>to be accessed for generating required config space access falls
> >>in the 4K space reserved for this purpose. This would give more
> >>space for mapping end point device's BARs on some of Tegra platforms
> >
> >Do you now have a revlock issue between this driver change and the
> >corresponding DT changes?  I.e., what happens when you run this driver
> >change with an older DT that specifies a 256MB config aperture?  What
> >happens if you run the older driver with a new DT that only specifies
> >a 4KB config aperture?
>
> Yes. Both driver and DT changes must go together. New driver and old DT (or)
> Old driver and new DT would break config space access.

This revlock sounds like a pretty major issue.  I don't know if the DT
conventions even allow for this.  If they do, it definitely needs to
be mentioned in the changelog.

Looking for acks from Thierry and Rob.

> >>-		addr += tegra_pcie_conf_offset(devfn, where);
> >>+		addr = pcie->cfg_va_base;
> >>+		val = ((((u32)where & 0xf00) >> 8) << 24) |
> >>+		      (bus->number << 16) | (PCI_SLOT(devfn) << 11) |
> >>+		      (PCI_FUNC(devfn) << 8) | (where & 0xff);
> >I think it would be useful to keep tegra_pcie_conf_offset() (extending
> >it to take the bus number) near the comment describing the mapping.
> I'll take care of it in next patch.
> >
> >>+		addr = (val & (SZ_4K - 1)) + addr;
> >>+		val = val & ~(SZ_4K - 1);
> >   val &= ~(SZ_4K - 1);
> >
> >I *think* what you're doing is computing a config space offset and
> >mapping the 4KB window that contains it.
> >
> >"addr" is not used at all in the AFI_AXI_BAR0 programming, so this
> >would be clearer as:
> >
> >     val = ...
> >     afi_writel(...)
> >     afi_writel(...)
> >
> >     addr = pcie->cfg_va_base + (val & (SZ_4K - 1));
> but, addr is using the intermediate 'val' i.e. before 'val &=
> ~(SZ_4K - 1)' operation is performed on it.

Ah, right.  I think adding another temporary variable here would make
it clearer.

> >   }
> >
> >   return addr;
> >
> >>+		afi_writel(pcie, pcie->cs->start - val, AFI_AXI_BAR0_START);
> >>+		afi_writel(pcie, (val + SZ_4K) >> 12, AFI_AXI_BAR0_SZ);
> >>  	}
> >>  	return addr;
> >>-- 
> >>2.7.4
> >>
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
