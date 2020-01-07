From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH v1] pci: tegra: fix afi_pex2_ctrl reg offset for tegra30
Date: Tue, 07 Jan 2020 09:13:33 +0100
Message-ID: <f0251cbb5dbc1f95881f9b817376707d2564e972.camel@ziswiler.com>
References: <20191230005209.1546434-1-marcel@ziswiler.com>
         <20200102123822.GA1924669@ulmo>
         <20200103150129.GR42593@e119886-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200103150129.GR42593@e119886-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Murray <andrew.murray@arm.com>, Thierry Reding <treding@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Thierry Reding <thierry.reding@gmail.com>, linux-pci@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Andrew

On Fri, 2020-01-03 at 15:01 +0000, Andrew Murray wrote:
> On Thu, Jan 02, 2020 at 01:38:22PM +0100, Thierry Reding wrote:
> > On Mon, Dec 30, 2019 at 01:52:09AM +0100, Marcel Ziswiler wrote:
> > > Fix AFI_PEX2_CTRL reg offset for tegra30 by moving it from the
> > > tegra20
> > > SoC struct where it erroneously got added by commit adb2653b3d2e
> > > ("PCI: tegra: Add AFI_PEX2_CTRL reg offset as part of SoC
> > > struct").
> > > This fixes the AFI_PEX2_CTRL reg offset being uninitialised
> > > subsequently failing to bring up the third PCIe port.
> > > 
> > > Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
> > > 
> > > ---
> > > 
> > >  drivers/pci/controller/pci-tegra.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Hi Marcel,
> > 
> > the recipient list looks somewhat odd. Mailing lists typically go
> > into
> > the Cc: line and subsystem maintainers into the To: line. That way
> > you
> > increase chances of people's filters catching important emails.
> > 
> > You may also want to fix up the subject line to use the more
> > standard
> > "PCI: tegra: " prefix. Also, maybe capitalize "fix" -> "Fix" to
> > match
> > standard formatting rules for commit messages. In the subject and
> > the
> > commit message, also, please spell "tegra20" and "tegra30" as
> > "Tegra20"
> > and "Tegra30", which can help when searching logs.
> > 
> > With the above fixed, this looks good, so:
> > 
> > Acked-by: Thierry Reding <treding@nvidia.com>
> 
> Also can you please add the following tag:
> 
> Fixes: adb2653b3d2e ("PCI: tegra: Add AFI_PEX2_CTRL reg offset as
> part of SoC struct")

Yeah, sorry. I kinda knew there was a standard way to do this but I was
so happy when I finally found this sucker (;-p). Will adhere to this in
a v2.

> Thanks,
> 
> Andrew Murray

Thanks, Andrew.

Cheers

Marcel

> > > diff --git a/drivers/pci/controller/pci-tegra.c
> > > b/drivers/pci/controller/pci-tegra.c
> > > index 090b632965e2..ac93f5a0398e 100644
> > > --- a/drivers/pci/controller/pci-tegra.c
> > > +++ b/drivers/pci/controller/pci-tegra.c
> > > @@ -2499,7 +2499,6 @@ static const struct tegra_pcie_soc
> > > tegra20_pcie = {
> > >  	.num_ports = 2,
> > >  	.ports = tegra20_pcie_ports,
> > >  	.msi_base_shift = 0,
> > > -	.afi_pex2_ctrl = 0x128,
> > >  	.pads_pll_ctl = PADS_PLL_CTL_TEGRA20,
> > >  	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_DIV10,
> > >  	.pads_refclk_cfg0 = 0xfa5cfa5c,
> > > @@ -2528,6 +2527,7 @@ static const struct tegra_pcie_soc
> > > tegra30_pcie = {
> > >  	.num_ports = 3,
> > >  	.ports = tegra30_pcie_ports,
> > >  	.msi_base_shift = 8,
> > > +	.afi_pex2_ctrl = 0x128,
> > >  	.pads_pll_ctl = PADS_PLL_CTL_TEGRA30,
> > >  	.tx_ref_sel = PADS_PLL_CTL_TXCLKREF_BUF_EN,
> > >  	.pads_refclk_cfg0 = 0xfa5cfa5c,
> > > -- 
> > > 2.24.1
