From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/4] ARM: tegra: Move SoC drivers to drivers/soc/tegra
Date: Mon, 30 Jun 2014 12:49:50 +0200
Message-ID: <20140630104949.GB1495@ulmo>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <53ADAA1C.70407@ti.com>
 <20140627232757.GB26184@ulmo>
 <20140630102512.GE28951@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140630102512.GE28951-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 11:25:12AM +0100, Catalin Marinas wrote:
> On Sat, Jun 28, 2014 at 12:27:58AM +0100, Thierry Reding wrote:
> > On Fri, Jun 27, 2014 at 01:30:04PM -0400, Santosh Shilimkar wrote:
> > > On Friday 27 June 2014 12:58 PM, Thierry Reding wrote:
> > > >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle-tegra1=
14.c (100%)
> > > >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle-tegra2=
0.c (100%)
> > > >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle-tegra3=
0.c (100%)
> > > >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle.c (100=
%)
> > > >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/cpuidle.h (91%)
> > > This should go into drivers/idle/*. if you have dependencies, please =
sort
> > > them out.
> >=20
> > What exactly is the difference between drivers/idle and drivers/cpuidle?
> > There's an intel_idle driver in drivers/idle that includes cpuidle.h and
> > registers with that subsystem. But there's also an i7300_idle driver
> > that doesn't.
> >=20
> > drivers/cpuidle seems like a better fit. I'll look into moving the code
> > there.
>=20
> Actually, please look at Lorenzo's generic cpuidle series. Basically
> most cpuidle drivers simply define some C states and call the
> corresponding platform back-end. On arm64, we aim to separate the
> back-end in the cpu_operations structure and just have a generic cpuidle
> driver with states defined in the DT (and passed to the back-end).
>=20
> As for the back-end, what about using PSCI?
>=20
> > > >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/reset-handler.=
S (100%)
> > > >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/reset.c (100%)
> > > >  rename {arch/arm/mach-tegra =3D> drivers/soc/tegra}/reset.h (97%)
> > > subsystem: drivers/power/reset/
> >=20
> > drivers/power/reset seems to be for drivers that register functions to
> > reset a board. The above code for Tegra doesn't do that. Rather it sets
> > up the reset handlers for secondary CPUs and for suspend/resume.
>=20
> PSCI again?

I have yet to look at what exactly needs to be done on 64-bit Tegra to
get CPUs up. So I'll revisit this part of the patches when that's
happened. It may yet turn out that most of this doesn't need to be
shared after all.

Thierry

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTsUDNAAoJEN0jrNd/PrOh6pcQAIR0CTdMLXADTKD77aO8MZ+H
NafHWOx0GSGt9GoTgCF3VqTd7RbzgO1v0ofaP6Hmd4ycTNrXSlTm02nhz7nlRyQQ
zWY4Jic9q5RyQ2muaeQu06d7Cof6Nl3x6RFED51YSl51S2M2nyceEzxSnZR5GnWL
YgwXo17EsH5qaNU5O+NZopEdVEiu6mWwoU45iUFJYxhYr+vRU3lnYN0Do9tWKiqd
Odk5Ja1Sl7pQg9zVuzj8BUZAQ7Hlub1/Z/4xQNXvJmdtFHdeKpclNC73lgCpSIeK
k+yhI8xyaavbY5zscsC80kOGm6kagGAdZu10dyomh0AIABk+RR5av5U22P3j5lSa
DmXfwrkoUN6GA9uL4SKC1vUuV/GnItK07R8ko85JgkGDyv/W2A9KmtsG6MfF3e1v
Hu+waw34eaNjfXKnjcdSkETquGoicn6gSVJyWFhjv3nl1NCBCWs6x9qy49agXpke
JPPCiYQbeggZlCn4pB9JEhgWFSqn/VmIQTIEWomcBqp/M3Q91nKnI4Li+TV6WZ17
INWD+9HcRJtZ24+FNmsSx6+PLBUODTusWFqYCAd6EnBlmnir4Nvdr+6e/mbLYYnI
a+KKFdkCTfzM6KnvVNaD0FDWgSujYoaDES8XRuPuPJCJdKLA+Na7WYFbpPHsXJZu
zLiuYV+oxYJY6cLLNOMM
=q2rw
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
