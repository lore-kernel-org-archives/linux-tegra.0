From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Adding board support
Date: Thu, 20 Oct 2011 10:08:09 +0200
Message-ID: <20111020080808.GA5450@avionic-0098.adnet.avionic-design.de>
References: <20111014054945.GA32399@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A290@HQMAIL01.nvidia.com>
 <20111014185847.GA916@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A33E@HQMAIL01.nvidia.com>
 <20111014232404.GB916@avionic-0098.mockup.avionic-design.de>
 <20111017102658.GA12373@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A4C4@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A4C4-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Monday, October 17, 2011 4:27 AM:
> > * Thierry Reding wrote:
> > > * Stephen Warren wrote:
> > > > ... [U-Boot patch/build instructions]
> > > > Then, run nvflash just like you would normally.
> > >
> > > Okay, I've been able to build U-Boot and setup some scripts that shou=
ld
> > > automate the nvflash procedure according to your instructions. I'll h=
ave to
> > > wait until I get back to work on Monday to see whether it actually wo=
rks,
> > > though.
> >=20
> > I'm unable to make this work. I've done as you said, branched from the =
commit
> > you mentioned and applied the patches you listed. Then ran:
> >=20
> > 	$ make CROSS_COMPILE=3D... O=3Dbuild/harmony harmony_config
> > 	$ make CROSS_COMPILE=3D... O=3Dbuild/harmony -j8
> >=20
> > And flashed the resulting u-boot.bin like you described, by replacing t=
he
> > fastboot.bin in the configuration with u-boot.bin. When rebooting the d=
evice
> > (I used a Harmony for this testing obviously) there's nothing. No outpu=
t on
> > the serial line. Flashing fastboot.bin I can at least see some debugging
> > output.
> >=20
> > I also tried to update the TEXT_BASE, which seems to be 0x00108000 for
> > fastboot, and 0x00E08000 for U-Boot, but that didn't make a difference.=
 Any
> > ideas on what could be the problem?
>=20
> Ah yes, sorry, I'd forgotten about that.
>=20
> The default load address for fastboot and U-Boot is different. I don't
> know why, but apparently U-Boot doesn't work when built with a load
> address that matches fastboot. I believe we have a bug filed to investiga=
te
> why, but I don't know any more details.
>=20
> > I'm not quite sure where these values come from. Are they hard-coded in=
 the
> > boot ROM? And how does it know from which NAND partition to load the
> > bootloader?
>=20
> These addresses exist in a couple places:
>=20
> * In the BCT, which tells the boot ROM the SDRAM address where the boot-
> loader should be copied to, and what the entry point is.
>=20
> * Hard-coded into nvflash, and the fastboot.bin used during the flashing
> process.
>=20
> Hence, internally, I believe we use nvflash/fastboot.bin that have been
> specifically recompiled to support U-Boot's load address.
>=20
> Thinking about this some more, I think we have shipped those rebuilt
> versions outside NVIDIA in a publically accessible place. I'll follow
> up internally and see if we have, or what we can do about it. Sorry for
> sending you on a wild goose chase.

I've been working some on getting our boards to boot from a device tree.
Unfortunately, the U-Boot issue seems to be more of a problem than I
anticipated. Since the mainline U-Boot doesn't run properly, I was going to
use the one shipped with Vibrante. As it turns out, that version is rather
old and doesn't have proper DT support for ARM yet. So I tried to switch to
the Chromium tree in the meantime but I cannot get it to work either. Not
standalone and not with quickboot as stage1.

So I'm running a little out of options. I'm reluctant to backport complete =
DT
support to the Vibrante version and I'm a short on time anyway, so figuring
out why the Chromium tree won't boot is not really an option either.

Are there any news on these rebuilt versions of nvflash that you mentioned?

Thierry

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk6f1ugACgkQZ+BJyKLjJp/udgCggcDyNROkFeljde5ag0rh7EZw
vdkAn0lOMpvHOGANL9MvXgf6dwsd/HEa
=Gwud
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
