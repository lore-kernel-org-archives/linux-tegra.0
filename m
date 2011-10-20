From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Adding board support
Date: Thu, 20 Oct 2011 21:08:28 +0200
Message-ID: <20111020190827.GA31480@avionic-0098.adnet.avionic-design.de>
References: <20111014054945.GA32399@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A290@HQMAIL01.nvidia.com>
 <20111014185847.GA916@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A33E@HQMAIL01.nvidia.com>
 <20111014232404.GB916@avionic-0098.mockup.avionic-design.de>
 <20111017102658.GA12373@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A4C4@HQMAIL01.nvidia.com>
 <20111020080808.GA5450@avionic-0098.adnet.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173D51C14B@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173D51C14B-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Thursday, October 20, 2011 2:08 AM:
> ...
> > I've been working some on getting our boards to boot from a device tree.
> > Unfortunately, the U-Boot issue seems to be more of a problem than I
> > anticipated. Since the mainline U-Boot doesn't run properly,
>=20
> ----------=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D----------=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D----------=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D----------=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> What issues are you having? I assume you're referring to something more
> than just getting stuff flashed with nvflash.

Flashing U-Boot is not the problem, but when booting the device, there's no
output whatsoever on the debug port. That's what I meant in one of the
previous mails. nvflash says it's loading fastboot.bin at address 0x0010800=
0,
and quickboot seems to use the same load address. However, U-Boot is built
with CONFIG_SYS_TEXT_BASE set to 0x00E08000. If it is loaded to the same
address as fastboot/quickboot it obviously cannot run. So I went ahead and
built U-Boot (both mainline and the one from the Chromium repo) with a load
address of 0x00108000 - to no avail.

I'm starting to think that perhaps I'm completely overlooking something
obvious. When I use the Vibrante U-Boot, I get normal U-Boot output on the
debug port when I flash it as stage 2 for quickboot. The other versions of
U-Boot don't work in that setup. None of the three versions boot when flash=
ed
standalone (substituting u-boot.bin for fastboot.bin in the nvflash
configuration file). I would guess that at least with quickboot as stage 1 I
should be able to get serial output from the mainline U-Boot.

Would it be helpful to move the discussion to the U-Boot mailing list
instead? It's sort of off-topic here.

Thierry

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk6gcasACgkQZ+BJyKLjJp8ucwCeMlgRaxPF7NSv5ooXNA5JaOlG
lREAn16NPni1zJgpEgXzSX+98AdB7Amj
=Ftp3
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
