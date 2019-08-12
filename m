From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V15 00/13] PCI: tegra: Add Tegra194 PCIe support
Date: Mon, 12 Aug 2019 12:34:10 +0200
Message-ID: <20190812103410.GO8903@ulmo>
References: <20190809044609.20401-1-vidyas@nvidia.com>
 <20190812102519.GN8903@ulmo>
 <aa666d78-43b3-dbea-dac6-386deaca3e12@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mvuFargmsA+C2jC8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <aa666d78-43b3-dbea-dac6-386deaca3e12@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--mvuFargmsA+C2jC8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2019 at 03:59:39PM +0530, Vidya Sagar wrote:
> On 8/12/2019 3:55 PM, Thierry Reding wrote:
> > On Fri, Aug 09, 2019 at 10:15:56AM +0530, Vidya Sagar wrote:
> > > Tegra194 has six PCIe controllers based on Synopsys DesignWare core.
> > > There are two Universal PHY (UPHY) blocks with each supporting 12(HSI=
O:
> > > Hisg Speed IO) and 8(NVHS: NVIDIA High Speed) lanes respectively.
> > > Controllers:0~4 use UPHY lanes from HSIO brick whereas Controller:5 u=
ses
> > > UPHY lanes from NVHS brick. Lane mapping in HSIO UPHY brick to each P=
CIe
> > > controller (0~4) is controlled in XBAR module by BPMP-FW. Since PCIe
> > > core has PIPE interface, a glue module called PIPE-to-UPHY (P2U) is u=
sed
> > > to connect each UPHY lane (applicable to both HSIO and NVHS UPHY bric=
ks)
> > > to PCIe controller
> > > This patch series
> > > - Adds support for P2U PHY driver
> > > - Adds support for PCIe host controller
> > > - Adds device tree nodes each PCIe controllers
> > > - Enables nodes applicable to p2972-0000 platform
> > > - Adds helper APIs in Designware core driver to get capability regs o=
ffset
> > > - Adds defines for new feature registers of PCIe spec revision 4
> > > - Makes changes in DesignWare core driver to get Tegra194 PCIe working
> > >=20
> > > Testing done on P2972-0000 platform
> > > - Able to get PCIe link up with on-board Marvel eSATA controller
> > > - Able to get PCIe link up with NVMe cards connected to M.2 Key-M slot
> > > - Able to do data transfers with both SATA drives and NVMe cards
> > > - Able to perform suspend-resume sequence
> >=20
> > Do you happen to have a patch for P2972-0000 PCI support? I don't see it
> > in this series.
> It is already merged.
> V10 link @ http://patchwork.ozlabs.org/patch/1114445/

D'oh! Indeed.

Thierry

--mvuFargmsA+C2jC8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1RQKIACgkQ3SOs138+
s6GLXg/8DOJVJ0fFXPAXXeHi86AGgUkBYnQUYPlOJXETCmROhZoJ5epgGbfRhQX9
QjEAXF7CNF6/FlU/0myVBYhGu+y2W5SkY+4dhOn1LLhTOS66MxNzuEvt7jMC7X6P
n8aOuS1nWlIjrTFRHRzwEQqLRIhhoInAo0Vyj+eOTUs3fk8eqDQ3pRLKx9BIJEwc
nhtoo5Dc15R7fHvBvwkP1349UHm6eodDr2Wo3tSa4IHj4QVpaaYhWpvujT7MvISU
dBznNBWqoLq7QAi3LFM/Wc0jgKZGriDnxQ2wKNbedDwmvF+FJsiBGlu+++Xg+enp
g/KKv9ZLMAWO0U8RD+j64NL6/325aBbaGZ+L1CFEscZPFuk7ivMspDAsMAjTqYOK
6X3QBqyHRUnHIHxKtYvnsI5U6e0y8lnjQCdnL6tNsq7qLdtHvC9o1xcMUeS/KOeM
TEPTztARXSzibsU5ebgDNX0Q/ioonwY5484gRPfNAmyOb+Vk0i8iCcZXlC6PpeZ5
GkF3LH8XAKBJ5QEoexe+o5qvZemQubl+hwrWViq1ySA8+3nHV0gEhkjt8dChfh/f
6NA0RMm3PyUtINdLP7kGOuZEc4ScNqszbsngqZuE/IgPj/2M5cWSzxnnad0OXG7R
0TnzLQG2M3PRP4bmxEb5jzTk+apORKyFOw6PKg+VkKACFN6P0F8=
=ZcJU
-----END PGP SIGNATURE-----

--mvuFargmsA+C2jC8--
