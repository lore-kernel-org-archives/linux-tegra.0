From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [PATCH V3 04/16] PCI: dwc: Perform dbi regs write lock towards
 the end
Date: Mon, 22 Apr 2019 07:54:32 +0000
Message-ID: <20190422154608.6e6f8ae3@xhacker.debian>
References: <20190416192730.15681-1-vidyas@nvidia.com>
        <20190416192730.15681-5-vidyas@nvidia.com>
        <305100E33629484CBB767107E4246BBB0A22C127@de02wembxa.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <305100E33629484CBB767107E4246BBB0A22C127@de02wembxa.internal.synopsys.com>
Content-Language: en-US
Content-ID: <C182E1A434A58143A8B4545110B023F8@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Cc: Vidya Sagar <vidyas@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "kishon@ti.com" <kishon@ti.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mmaddireddy@nvidia.com" <mmaddireddy@nvidia.com>, "kthota@nvidia.com" <kthota@nvidia.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 17 Apr 2019 09:56:33 +0000 Gustavo Pimentel wrote:

>=20
> On Tue, Apr 16, 2019 at 20:27:18, Vidya Sagar <vidyas@nvidia.com> wrote:
>=20
> > Remove multiple write enable and disable sequences of dbi registers as
> > Tegra194 implements writes to BAR-0 register (offset: 0x10) controlled =
by
> > DBI write-lock enable bit thereby not allowing any further writes to BA=
R-0
> > register in config space to take place. Hence disabling write permissio=
n
> > only towards the end.
> >
> > Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> > ---
> > Changes since [v2]:
> > * None
> >
> > Changes since [v1]:
> > * None
> >
> >  drivers/pci/controller/dwc/pcie-designware-host.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/driver=
s/pci/controller/dwc/pcie-designware-host.c
> > index 2a5332e5ccfa..c0334c92c1a6 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -683,7 +683,6 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
> >       val &=3D 0xffff00ff;
> >       val |=3D 0x00000100;
> >       dw_pcie_writel_dbi(pci, PCI_INTERRUPT_LINE, val);
> > -     dw_pcie_dbi_ro_wr_dis(pci);
> >
> >       /* Setup bus numbers */
> >       val =3D dw_pcie_readl_dbi(pci, PCI_PRIMARY_BUS);
> > @@ -723,8 +722,6 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
> >
> >       dw_pcie_wr_own_conf(pp, PCI_BASE_ADDRESS_0, 4, 0);
> >
> > -     /* Enable write permission for the DBI read-only register */
> > -     dw_pcie_dbi_ro_wr_en(pci);
> >       /* Program correct class for RC */
> >       dw_pcie_wr_own_conf(pp, PCI_CLASS_DEVICE, 2, PCI_CLASS_BRIDGE_PCI=
);
> >       /* Better disable write permission right after the update */
> > --
> > 2.17.1 =20
>=20
> This setup sequence was written by Jingoo Han, let's check if he did this
> by some particular reason.
> Jingoo do you remember why you wrote the code like this?

FWICT, enabling RO writeable in the setup sequence is introduced in
commit d91dfe5054d4 ("PCI: dwc: Enable write permission for Class Code,=20
Interrupt Pin updates"). The Reason why not towards the end maybe
only enable the RO writeable when necessary.

thanks
