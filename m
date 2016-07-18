From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [U-Boot] PCIe bridges on Jetson TK1
Date: Mon, 18 Jul 2016 12:19:32 +0200
Message-ID: <20160718101932.GC422@ulmo.ba.sec>
References: <3a41e071-f7a2-f995-8c3d-ef211df6aa3a@suse.de>
 <20160718062718.GC10785@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160718062718.GC10785-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2016 at 08:27:18AM +0200, Thierry Reding wrote:
> On Sun, Jul 17, 2016 at 02:27:25AM +0200, Andreas F=C3=A4rber wrote:
> > Hi,
> >=20
> > When I boot my Jetson TK1, by default I get this from lspci:
> >=20
> > 00:02.0 PCI bridge: NVIDIA Corporation TegraK1 PCIe x1 Bridge (rev a1)
> > 01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
> > RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 0c)
> >=20
> > If however I plug some mini PCIe card, I get this instead:
> >=20
> > 00:01.0 PCI bridge: NVIDIA Corporation TegraK1 PCIe x4 Bridge (rev a1)
> > 00:02.0 PCI bridge: NVIDIA Corporation TegraK1 PCIe x1 Bridge (rev a1)
> > 01:00.0 Network controller: MEDIATEK Corp. Device 7612
> > 02:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
> > RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 0c)
> >=20
> > I.e., there is a new Tegra PCIe x4 bridge and the number of the previous
> > x1 bridge changed.
> >=20
> > That is ugly because it changes the ID of the on-board PCI NIC from
> > 01:00.0 to 02:00.0, which on openSUSE renames the network interface from
> > enp1s0 to enp2s0, so that my /etc/sysconfig/network/ifcfg-enp1s0 does
> > not take effect and the network interface doesn't come up.
> >=20
> > Tested with U-Boot v2016.05 and v2016.07 and kernel 4.6.2 and 4.7-rc6.
> >=20
> > Shouldn't U-Boot or the kernel driver always configure the PCIe ports
> > the same way (both bridges available) since the slot is always there on
> > this board?
>=20
> I don't think that's going to ensure stable naming of devices. Linux
> uses depth-first sorting when enumerating devices, so if you attach any
> kind of bridge device to the first port, anything downstream of the
> second port still won't get a stable B/D/F.
>=20
> That said, I see how what you're proposing could help at least minimize
> the potential for instability in numbering. Could you try to uncomment
> the tegra_pcie_port_free() line in tegra_pcie_enable() of the Tegra PCI
> host controller driver (drivers/pci/host/pci-tegra.c) and see if that
> improves things in your use-case? It's slightly hackish because it does
> allow access to the root port even if it's disabled, so I'm not sure it
> will work (might give you an external abort or something like that) but
> it might be worth a quick try.

The below seems to work fine for me. Can you verify that this works for
you, too?

Thanks,
Thierry

--- >8 ---
diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index c388468c202a..0b8616e25d7b 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -587,17 +587,6 @@ static void tegra_pcie_port_disable(struct tegra_pcie_=
port *port)
 	afi_writel(port->pcie, value, ctrl);
 }
=20
-static void tegra_pcie_port_free(struct tegra_pcie_port *port)
-{
-	struct tegra_pcie *pcie =3D port->pcie;
-
-	devm_iounmap(pcie->dev, port->base);
-	devm_release_mem_region(pcie->dev, port->regs.start,
-				resource_size(&port->regs));
-	list_del(&port->list);
-	devm_kfree(pcie->dev, port);
-}
-
 /* Tegra PCIE root complex wrongly reports device class */
 static void tegra_pcie_fixup_class(struct pci_dev *dev)
 {
@@ -2053,7 +2042,6 @@ static int tegra_pcie_enable(struct tegra_pcie *pcie)
 		dev_info(pcie->dev, "link %u down, ignoring\n", port->index);
=20
 		tegra_pcie_port_disable(port);
-		tegra_pcie_port_free(port);
 	}
=20
 	memset(&hw, 0, sizeof(hw));

--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXjK00AAoJEN0jrNd/PrOhu+EP/3ur+RuRvU2Ka2ICWcFyMeGv
jbw9STVUEw3Q2qmWliEu2Kr7NDU5vbGqq4bsIBE3F7g0dsdhFUG3hPUYFZk/Fb8W
i33DEDCJD5Xy6pCZ4254iPxfe/lysFaApVTZkoDxCbuMyh+XmP/590xsbt5Ny5zg
qrvmhmJuCxxiPnLzZOBDRWPo21ZXrkt9ATSR49qD4P7oqiJENgysPeVFxd3id+Eh
EEQ+iJmvONH7TSReAdljxgUZj8Xs+FICHJlpgwIh0aeUJ9ghQ9nC2pyOug4JX1a5
vJZTO27UKJ6pPbI24iEdS0m0aGafpXw2gnu8atumjpAfCwh7PPV1gN8uJblbUAWC
1n6rxX7CJBfItTratcXOnybzIw7edtCfVM8Sd389XwnqwH8ti1FpVSFqw1LYmZ5K
HE/47lZ0MB/UyjPd52wxq8MT4OQUUGL3iWHeN4UuaqFYAJ0uzAahWib9SXyGmsfq
RAytNOzWgxxbgEx3H2jRlucRzTtyEV0Br8WuylogPE7GJITmzrk4PVpj2BjxzGkK
Mvt0I2NdvVYsay8WuD15qVZtub8aFMmbxsiKj6nwSQX6kNx4HQ3dOJpUBv0FNzie
GkF5f9kcVU6VLoH0NcH5ifMtqWY9qrato8r73c/+RWtyiCoI9/VOTjH6qzG/FH0B
FuSP5SxkBNkHhe1iTt/a
=dseM
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--
