From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: PCIe device tree support
Date: Wed, 22 Feb 2012 09:24:52 +0100
Message-ID: <20120222082449.GA15157@avionic-0098.adnet.avionic-design.de>
References: <20120220191804.GA14499@avionic-0098.adnet.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BD8BC302@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BD8BC302-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Olof Johansson (olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org)" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Adding Jesse Barnes and the linux-pci mailing list to CC.]

* Stephen Warren wrote:
> Thierry Reding wrote at Monday, February 20, 2012 12:18 PM:
> > I would like to add device tree support for the Tegra2 PCIe controller.=
 From
> > what I understand this will require the PCIe code to be rewritten as a =
proper
> > platform driver in order to be able to instantiate it via the device tr=
ee. Is
> > that correct?
>=20
> That's probably the cleanest way, yes.
>=20
> Is there a drivers/ directory for PCI/PCIe host controllers? Moving the
> code there might be nice if so, although IIRC when I asked Olof about
> that a number of months back, he said quite a few host controllers were
> in arch/...

Most PCI/PCIe host controller drivers seem to currently be in arch/. Is the=
re
a specific reason for this? Would it be acceptable to put any new drivers
below drivers/pci/?

Thierry

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9EplEACgkQZ+BJyKLjJp+jrQCePAIVtOgbog1DJ66IXJ4SVyBB
k0EAn1oXCyiApNbVtaTiXs7Bx6tMW6IS
=PICf
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
