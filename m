From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 7/8] ARM: tegra: Devicetree changes for v4.2-rc1
Date: Fri, 15 May 2015 12:43:34 +0200
Message-ID: <20150515104332.GB20474@ulmo.nvidia.com>
References: <1431524980-13599-1-git-send-email-thierry.reding@gmail.com>
 <1431524980-13599-8-git-send-email-thierry.reding@gmail.com>
 <3095273.etWfHSyyvC@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3095273.etWfHSyyvC@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2015 at 06:09:20PM +0200, Arnd Bergmann wrote:
> On Wednesday 13 May 2015 15:49:39 Thierry Reding wrote:
> > ARM: tegra: Devicetree changes for v4.2-rc1
> >=20
> > Contains a couple of fixes and additions to device tree files. The most
> > notable change is a fix for a misapplied patch that was only exposed by
> > a recent change in the regulator subsystem that caused USB to break on
> > Tegra124 recently.
>=20
> It sounds like I should merge commit a4b6916cb35 ("ARM: tegra: Correct
> which USB controller has the UTMI pad registers") into the 4.1 fixes
> branch as well. Please confirm.

I think you already did. I sent out a pull request for that not very
long ago and I must have forgotten to drop this patch from the Tegra
tree after it got applied to arm-soc. The merge commit for this in
the fixes branch is here:

	https://git.kernel.org/cgit/linux/kernel/git/arm/arm-soc.git/commit/?h=3Df=
ixes&id=3D155171274d1dd9d9e5a012bd912c592402aa31d2

Hopefully git will be able to merge these together without conflicts.
Sorry about the dupe.

Thierry

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVVc3RAAoJEN0jrNd/PrOhBEQQAJr5JC0vzUZdLRtRVj6sQyk1
4eYg+PpeVIJfkZIFF8jao+/2/qD9lT+rY7zZvpHsmUBhVcMO1jcatYL5lwnYhn6I
YMtBimbl5G7iy4ucNXZzrl2IFmeCY8VLPCVMiDTu8hvJG6KT4XANBHvzR6YN7/Xi
xTgu81zoDyzg6C72UYZ0fTKClHl3IeUB1QLR40h6dEZQfxIiEmvn+CDPHHks4CBr
Zlmk9rR6O/k24ebsUKMrsDazQLsGAR7cUXoAYejvBjA0L6+bH4/CpIDoLqIMmp24
7Gtf/3Jey55M1IsXlQFzv9U6K2QIyWd3oZO1MmlTCXwaNX0ZfYWyh1TL15LbwgZs
MentfiNacvCPNqpHEudCk7q5pJdwAYNkw5Ro9fetRcc8uCzkRO96T8ZxDCzYIPQH
7khNWFJ1wYMnCIWmBQqhT3o/AmQr/Q/6C9g3c7BTfxikD9CUfI2WhlFsnQTVfQgH
Zk/5JO7f2z1r0PrDrrpKbAyksQD6ZQWlIAZKZTZE3EDxwJIKZItSn0hr6KZSVjet
uk4nwfvMtbKER8DLhhdBh3/NtKZQcLvSE30URn4tP7+4K4pD/AsbLU2h0xhBasuu
T108rDeDM7uQvph1M6NwOOyMQsK494w6lvfL+S5+IsQaCvl4JJq1oVy46P3KpGFg
XOq2PNN9CRDWgEbeXRkV
=/Bcs
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
