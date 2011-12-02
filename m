From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: PCIe MSI support
Date: Fri, 2 Dec 2011 08:43:42 +0100
Message-ID: <20111202074342.GB10768@avionic-0098.adnet.avionic-design.de>
References: <20111124195704.GA15417@avionic-0098.adnet.avionic-design.de>
 <CAOesGMjDFsAvvUg8tMt+MbwODVoz3SmW0gqcRsCdD_Zhcz5p4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMjDFsAvvUg8tMt+MbwODVoz3SmW0gqcRsCdD_Zhcz5p4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Olof Johansson wrote:
> Hi,
>=20
> On Thu, Nov 24, 2011 at 11:57 AM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > Hi,
> >
> > I was wondering whether anyone had gotten MSI to work with Tegra2? The =
code
> > in arch/arm/mach-tegra/pcie.c has some comments saying that it currently
> > isn't supported.
> >
> > Looking through the Tegra2 TRM didn't show much related to MSI. In part=
icular
> > there doesn't seem to be any mention of the AFI controller or any of it=
's
> > registers (except of how to enable/disable the AFI clock or reset the
> > controller).
> >
> > Furthermore I wasn't able to get PCIe to work on Harmony with a mainline
> > kernel. Is something missing or am I just doing something wrong?
>=20
> I think there might be an issue with regulator setup for pci-e, I got
> a vague bug report off-list from someone about it but I'm normally not
> using devices with pci-e on them myself.

I've verified with a hardware engineer that the voltages indeed seem correc=
t.
Even the PCIe reference clock can be measured at the mini-PCIe connectors. =
So
something must be going right.

> Note that trimslice does enable pci-e, so you can use that for comparison.

Trimslice doesn't seem to do much regarding PCIe initialization. It basical=
ly
just calls the tegra_pcie_init() and has the pinmuxing set up via the pinmux
table as opposed to Harmony.

I'm thinking about ordering a Trimslice to use for comparison. Has anyone
else verified that mainline has working PCIe for Trimslice? I think Mike
Rapoport is no longer a regular on this list. His last commits seem to
indicate that PCIe was working on Harmony as well at the time, so I'm a
little confused about what might have happened since then.

> > I can make
> > it work with the Vibrante kernel, but that doesn't have MSI support eit=
her.
> > Since we're looking at designing an evaluation board with PCIe support =
I'm
> > very interested in seeing this supported in mainline. If there's anythi=
ng I
> > can do to help, please let me know. Also if anyone can provide more ins=
ight
> > than the TRM, that would be great.
>=20
> I have no idea if MSI is supported or not. You are aware of the errata
> list for PCI-e on Tegra though, right? You might want to consider the
> implications of said problems before you decide to use PCI-e on a
> product.

Yes, I am aware of it. The problems shouldn't be show-stoppers, though.

> On more MSI details; I suggest you try to get access to internal
> information through your Nvidia FAE -- I don't have any more
> information on it than you do but if I wanted to find out that is the
> route I would take myself.

I did that and our FAE is now trying to make documentation available
regarding the AFI controller and MSI initialization.

Thanks,
Thierry

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7Yga4ACgkQZ+BJyKLjJp/9IACgnSrxxZoEZ5xn1U+prSnYW55g
IsgAn3Ob7EvN3A6XCtRPdcemjiosUdC5
=5Uss
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
