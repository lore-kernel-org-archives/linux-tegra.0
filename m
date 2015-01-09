From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC V3 2/3] mxs: add driver for ocotp in i.MX23 and i.MX28
Date: Fri, 9 Jan 2015 11:02:07 +0100
Message-ID: <20150109100206.GE27845@ulmo>
References: <1413628372-2809-1-git-send-email-stefan.wahren@i2se.com>
 <2223659.OW08fe0cS1@wuerfel>
 <1003885907.22061.1415301932743.JavaMail.open-xchange@oxbsltgw00.schlund.de>
 <6087001.lBonPVHV5K@wuerfel>
 <54AE8D45.7050805@imgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54AE8D45.7050805-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 08, 2015 at 10:59:33AM -0300, Ezequiel Garcia wrote:
> Hi Stefan, Arnd,
>=20
> (I'm trimming the Cc list and adding Thierry and Maxime to the loop):
>=20
> On 11/06/2014 04:47 PM, Arnd Bergmann wrote:
> [..]
> >>
> >> i don't have a answer to this question, but how about changing fsl_oco=
tp driver
> >> to driver/soc/mxs/fuse with a similiar binary interface like the tegra=
 ones.
> >>
> >> Does it make sense to you?
> >=20
> > I haven't looked at the drivers, so I don't know if the tegra interface
> > is any better or worse than the others. Changing everyone to have the s=
ame
> > interface is definitely a good idea, but of course only if the unified
> > interface is a good one ;-)
> >=20
>=20
> I'm in the process of finding a suitable upstream path for a new eFuse dr=
iver
> for fuses used on Imagination Technologies SoCs.
>=20
> This was our last proposal, which follows Tegra's work:
>=20
> http://www.spinics.net/lists/devicetree/msg59246.html
>=20
> However, Arnd was reluctant to take yet another efuse driver under driver=
s/soc
> and proposed instead to try to find a unified API. We've had numerous fuse
> drivers (tegra, sunxi, imx and img) appearing, so his concern certainly m=
akes
> sense.
>=20
> I've talked to Arnd on IRC and we agreed to create a new directory
> drivers/efuse. As a first step we would just move the tegra driver,
> and add the new drivers (img on my side, and possibly mxs on Stefan's).
> Perhaps we would also pull the sunxi_sid driver as well.
>=20
> Having the drivers together would allow us to come up with a unified API
> as follow up work.
>=20
> How does this sound? If you have no objections to this, I can go ahead and
> try to prepare some RFCs.

No objections from me. Adding Peter and linux-tegra for visibility.

Thierry

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUr6ceAAoJEN0jrNd/PrOhjLUQAKwyQ/6g6FpUywRJX0Xyit+G
QDhofo8nDA5myoDOgw+o+19A5v05gXLaxKxe1cW7ge1mPLSD3kn+gHdKM2wC2Tam
ircaEVfRan3uE1wIWko5kB17Lx2NdpoBAgHTKlrgF18MmzlcWbnvxi+x6YVC+hdI
h42KB6STtHSvZvVZMoQHe+JcsoJIjOWiXQRTo645mf62AYMbZEiwvGxsq5WnJJSA
ej7XAVVBDqYhqF70D0RS4zUVOj34vA8tVhBksXj89Jx1FH+Sv2LZGfi7lY+megfl
w6PrX0Dh8CPJ8nmmjULGFG3zPKmAE8Zj9vQyDFO8mwTEWd2VOeK+Uv9u8tY8O2Y0
0QLBBBCy2P/s6X5DJxXZ1C763gzYp27yLevXegzjKORRFDPkcUzqWExU1x+wiKGS
d3nb0O7TwXT11zR2XKg42RMJjU9IoP2rwPH/pfuZYNN26zFltHo/TqHGoB7fAiKl
Nmvfba8Tdox3bZN2gEB7Y/lDnaLm5sIqhN3NnaxoMLFWduclXF5oXDZy0Vjc/P+d
Ab59nrWTVGLlrRoiZTjfWtJBlIhx+pc09+wQIAvJth4fUZKE4f8ufzRBKdBXWPtZ
YWW9+rb7HEkDkL13pNlXpFzw37UGwDv8MSycSbdJn0Q3W+ba4h7ndoI+XuEFQEAQ
oJztMSdrCSIcgJtIzwJt
=w2AH
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
