From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH V6 02/15] PCI/PME: Export pcie_pme_disable_msi() &
 pcie_pme_no_msi() APIs
Date: Thu, 16 May 2019 08:34:26 -0500
Message-ID: <20190516133426.GC101793@google.com>
References: <20190513050626.14991-1-vidyas@nvidia.com>
 <20190513050626.14991-3-vidyas@nvidia.com>
 <20190513072539.GA27708@infradead.org>
 <3a8cea93-2aeb-e5e2-4d56-f0c6449073c3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3a8cea93-2aeb-e5e2-4d56-f0c6449073c3@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: Christoph Hellwig <hch@infradead.org>, lorenzo.pieralisi@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Tue, May 14, 2019 at 09:00:19AM +0530, Vidya Sagar wrote:
> On 5/13/2019 12:55 PM, Christoph Hellwig wrote:
> > On Mon, May 13, 2019 at 10:36:13AM +0530, Vidya Sagar wrote:
> > > Export pcie_pme_disable_msi() & pcie_pme_no_msi() APIs to enable drivers
> > > using these APIs be able to build as loadable modules.
> > 
> > But this is a global setting.  If you root port is broken you need
> > a per-rootport quirk instead.
> > 
> There is nothing broken in Tegra194 root port as such, rather, this
> is more of software configuration choice and we are going with
> legacy interrupts than MSI interrupts (as Tegra194 doesn't support
> raising PME interrupts through MSI and please note that this doesn't
> mean root port is broken).

I think the port *is* broken.  PCIe r4.0, sec 6.1.6, says

  If the Root Port is enabled for edge-triggered interrupt signaling
  using MSI or MSI-X, an interrupt message must be sent every time the
  logical AND of the following conditions transitions from FALSE to
  TRUE:

    * The associated vector is unmasked (not applicable if MSI does
      not support PVM).

    * The PME Interrupt Enable bit in the Root Control register is set
      to 1b.

    * The PME Status bit in the Root Status register is set.

The Tegra194 root port advertises MSI support, so the above should
apply.

> Since Tegra194 has only Synopsys DesignWare core based host
> controllers and not any other hosts, I think it is fine to call this
> API in driver.

It's fine to add a per-device quirk to set pdev->no_msi or something
similar.

Bjorn
