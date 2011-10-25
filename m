From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Adding board support
Date: Tue, 25 Oct 2011 07:57:37 +0200
Message-ID: <20111025055737.GB30358@avionic-0098.mockup.avionic-design.de>
References: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A290@HQMAIL01.nvidia.com>
 <20111014185847.GA916@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A33E@HQMAIL01.nvidia.com>
 <20111014232404.GB916@avionic-0098.mockup.avionic-design.de>
 <20111017102658.GA12373@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A4C4@HQMAIL01.nvidia.com>
 <20111020080808.GA5450@avionic-0098.adnet.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173D51C14B@HQMAIL01.nvidia.com>
 <20111020190827.GA31480@avionic-0098.adnet.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173D51C577@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173D51C577-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Thursday, October 20, 2011 1:08 PM:
> > * Stephen Warren wrote:
> > > Thierry Reding wrote at Thursday, October 20, 2011 2:08 AM:
> > > ...
> > > > I've been working some on getting our boards to boot from a device =
tree.
> > > > Unfortunately, the U-Boot issue seems to be more of a problem than I
> > > > anticipated. Since the mainline U-Boot doesn't run properly,
> > >
> > > What issues are you having? I assume you're referring to something mo=
re
> > > than just getting stuff flashed with nvflash.
> >=20
> > Flashing U-Boot is not the problem, but when booting the device, there'=
s no
> > output whatsoever on the debug port. That's what I meant in one of the
> > previous mails. nvflash says it's loading fastboot.bin at address 0x001=
08000,
> > and quickboot seems to use the same load address. However, U-Boot is bu=
ilt
> > with CONFIG_SYS_TEXT_BASE set to 0x00E08000. If it is loaded to the same
> > address as fastboot/quickboot it obviously cannot run. So I went ahead =
and
> > built U-Boot (both mainline and the one from the Chromium repo) with a =
load
> > address of 0x00108000 - to no avail.
>=20
> OK, I built U-Boot with load address 0x00108000 and also see nothing at b=
oot.
> So, I've reproduced at least one of your problems.
>=20
> (This is with an Android-style nvflash that configures the BCT to tell th=
e CPU
> to load/boot the bootloader at address 0x00108000, so this should work.)
>=20
> So, I've added this observation into the bug I filed. I'll let you know o=
nce
> we've had a chance to investigate and/or solve this.
>=20
> Sorry this isn't working yet; it's pretty early days for U-Boot on Tegra
> outside of ChromeOS, which uses the modified nvflash and hence doesn't hit
> these issues.

I was able to get my hands on the nvflash source code, so I may be able to
get this to work myself. Any hints as to what exactly was changed? Was it
only the load/entry address. You mention that nvflash configures the BCT; in
what way. A quick glimpse at the source code doesn't show any modifications
being done to the loaded BCT file.

On the other hand, since obviously the paperwork is okay to get the nvflash
sources, perhaps I could ask my NVIDIA contacts to provide the ChromeOS
variant of nvflash. Does it have a special name internally that I should
refer to?

Thierry

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk6mT9EACgkQZ+BJyKLjJp80oACfWjXzGYEL6KgSdVACCZWJ5oxq
VA8An3yVHUolY2veWWeFrITcGuarlBws
=i81N
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
