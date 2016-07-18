From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [U-Boot] PCIe bridges on Jetson TK1
Date: Mon, 18 Jul 2016 08:27:18 +0200
Message-ID: <20160718062718.GC10785@ulmo.ba.sec>
References: <3a41e071-f7a2-f995-8c3d-ef211df6aa3a@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3a41e071-f7a2-f995-8c3d-ef211df6aa3a-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 02:27:25AM +0200, Andreas F=C3=A4rber wrote:
> Hi,
>=20
> When I boot my Jetson TK1, by default I get this from lspci:
>=20
> 00:02.0 PCI bridge: NVIDIA Corporation TegraK1 PCIe x1 Bridge (rev a1)
> 01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
> RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 0c)
>=20
> If however I plug some mini PCIe card, I get this instead:
>=20
> 00:01.0 PCI bridge: NVIDIA Corporation TegraK1 PCIe x4 Bridge (rev a1)
> 00:02.0 PCI bridge: NVIDIA Corporation TegraK1 PCIe x1 Bridge (rev a1)
> 01:00.0 Network controller: MEDIATEK Corp. Device 7612
> 02:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
> RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 0c)
>=20
> I.e., there is a new Tegra PCIe x4 bridge and the number of the previous
> x1 bridge changed.
>=20
> That is ugly because it changes the ID of the on-board PCI NIC from
> 01:00.0 to 02:00.0, which on openSUSE renames the network interface from
> enp1s0 to enp2s0, so that my /etc/sysconfig/network/ifcfg-enp1s0 does
> not take effect and the network interface doesn't come up.
>=20
> Tested with U-Boot v2016.05 and v2016.07 and kernel 4.6.2 and 4.7-rc6.
>=20
> Shouldn't U-Boot or the kernel driver always configure the PCIe ports
> the same way (both bridges available) since the slot is always there on
> this board?

I don't think that's going to ensure stable naming of devices. Linux
uses depth-first sorting when enumerating devices, so if you attach any
kind of bridge device to the first port, anything downstream of the
second port still won't get a stable B/D/F.

That said, I see how what you're proposing could help at least minimize
the potential for instability in numbering. Could you try to uncomment
the tegra_pcie_port_free() line in tegra_pcie_enable() of the Tegra PCI
host controller driver (drivers/pci/host/pci-tegra.c) and see if that
improves things in your use-case? It's slightly hackish because it does
allow access to the root port even if it's disabled, so I'm not sure it
will work (might give you an external abort or something like that) but
it might be worth a quick try.

Thierry

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXjHbDAAoJEN0jrNd/PrOh/p4QAJ2D5ZZm1tcVO02/EB/b83M3
llR/rrL0oEo33Qr/MWiLNyDDTYnv7g1eSj7bjZnkhySNM4hKJB8iAs6SK79xp/rv
xfmkY1/7eo5nNS05qHKRe9Ix+JCLTiGjw8AMh3Epyx5yk16n1DSP4/Ebv5b0Y40i
Lo/dkozrRtFz84nIU55+FtloQSRxAc8WxMZ9SesSWBnwnmhvSfCImJefiAWhlg7w
yxIxwP+aMcuBmfgr4wVJ3cWU8mxAwc/6qYOm2hpMF6GQGRNEuJ+3sApnyx1Vq8Xj
uVcDTN0kvnGerdVSgrOKZrngZ+p7mYEAnP5M556fDHHtD4KqKxtQRQQxlMhxqjVm
P3Lbfh/Fh9n4dJayQaiz1bmJCzxAFQ9FAvaWX19BcBO915V8iCGpMJSdMaj9DIpJ
MJQEErrUFyB3mv0lnRRMCkeHijt16DyXvaSAnM6qwUBKaieVGAQ00Pkx8BP/QX43
ekPWTBMYG5pI5zwDNEDo+s6RhsbHxDu3Gmoef/2zl/R5DCZ1I/c0lvW85r9kUB2Y
ZPxCrvLIcxADiexs/e9x7bq0qL4BCcp7RypTgTHiH79kH+F4V3KEYDsXJdaIJa2h
2+XyqpJxWcFP168WAMu6LzmYz2NoavRkHFj+rNZgh0QGK3UMtxZ1LB7s1orZBWFK
EFiih8HF7ovnWv9HjQhq
=OOkI
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
