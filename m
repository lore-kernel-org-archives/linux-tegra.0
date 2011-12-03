From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: PCIe MSI support
Date: Sat, 3 Dec 2011 12:55:08 +0100
Message-ID: <20111203115507.GA2887@avionic-0098.mockup.avionic-design.de>
References: <20111124195704.GA15417@avionic-0098.adnet.avionic-design.de>
 <CAOesGMjDFsAvvUg8tMt+MbwODVoz3SmW0gqcRsCdD_Zhcz5p4Q@mail.gmail.com>
 <20111202074342.GB10768@avionic-0098.adnet.avionic-design.de>
 <CAOesGMgoYKnv+ATSx9dnShqXJyjW1X1MoVB=bydBoCcH-rDb2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMgoYKnv+ATSx9dnShqXJyjW1X1MoVB=bydBoCcH-rDb2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Olof Johansson wrote:
> Hi,
>=20
> On Thu, Dec 1, 2011 at 11:43 PM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
[...]
> > I've verified with a hardware engineer that the voltages indeed seem co=
rrect.
> > Even the PCIe reference clock can be measured at the mini-PCIe connecto=
rs. So
> > something must be going right.
>=20
> Ok, that's interesting. I haven't had a chance to give my harmony a
> spin with a pci-e card here lately, I'll try to give it a go as soon
> as I can but it'll be a few more days.

That'd be great. Perhaps it works fine for you and I'm just doing something
wrong.

[...]
> > I'm thinking about ordering a Trimslice to use for comparison. Has anyo=
ne
> > else verified that mainline has working PCIe for Trimslice? I think Mike
> > Rapoport is no longer a regular on this list. His last commits seem to
> > indicate that PCIe was working on Harmony as well at the time, so I'm a
> > little confused about what might have happened since then.
>=20
> PCI-e works on mainline on trimslice, I have verified that myself. It
> has ethernet on pci-e, and both u-boot and the kernel can use it.

I've ordered a Trim-Slice and should have it late next week or beginning of
the week after. I can also try an older version of mainline from around the
time that Mike mainlined the Harmony support. I assume that at the time it
must have worked. Perhaps the issue can be bisected.

Unfortunately I'm rather busy with other things as well, so I won't be able
to work on this fulltime.

Thierry

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7aDhsACgkQZ+BJyKLjJp+adwCePYFgHLgd592vglKZ1lvPNCm2
zvwAn1X6p9wApnTEo/4nvTq/wX5LBERi
=PVFi
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
