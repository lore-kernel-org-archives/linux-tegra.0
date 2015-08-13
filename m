From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Have Tegra's GPIO chip depend explicitly on the
 pinctrl device
Date: Thu, 13 Aug 2015 16:33:33 +0200
Message-ID: <20150813143332.GC26559@ulmo>
References: <1436862596-27730-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1436862596-27730-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2015 at 10:29:53AM +0200, Tomeu Vizoso wrote:
> Hello,
>=20
> these three patches make sure that there's an explicit dependency from
> the GPIO chip in Tegra SoCs to the corresponding pinctrl device, without
> having duplicated gpio ranges.
>=20
> By having an explicit dependency, we can do things such as probing the
> pinctrl device before the GPIO chip device to avoid deferred probes.
>=20
> Thanks,
>=20
> Tomeu
>=20
> Changes in v2:
> - Don't defer probe if the pinctrl node is disabled
> - Remove outdated comment from the commit changelog
>=20
> Tomeu Vizoso (3):
>   gpio: defer probe if pinctrl cannot be found
>   pinctrl: tegra: Only set the gpio range if needed
>   ARM: tegra: Add gpio-ranges property

Patches 2 and 3 applied to the Tegra tree. Linus, I've applied the
pinctrl patch to a separate branch, so we could use that to resolve
conflicts, should there be any.

Thierry

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVzKq6AAoJEN0jrNd/PrOhUFwQAJ2bihWAy4JHtqNAB6R9c8cn
Rkp89WV4lYl0RjabA8ayFSJbMvmI02BEN5kv/XKsGlcDsl747bopfNE2cBWIgSum
vlaTXCD5gu1hey0otPYLo8Qvi9HHW/6mNdL8rjyGbI8lavmRwM61muCG6Y4JsUwW
3nhBF6Aen4oPW9vtKzaO6iJFOIg3lb0HL0Uq0OX45Qj12ztz/DJamKQ+sshuxz0v
a5/1nx1a7cIDBUyVRxaX8MHNsqeM9LvRHCbbWmKb/bKyLEzmvgPe0PDzygh+tDcT
sEl2hs7kVuaXralhrBsyGFvDP949DVV50+Ok6PaTm+6ihMJ+94SDR72F1CXjqalA
i0+h+MG2vQIEFV2uEqIgHRngFnGvstbX6Td/UU0dgqGcHtxdXDXlCoZKC3y6HURh
DDFNUY08Us+B+pHjvVjkp006VDVHyxbCiWBorILxOS88ZK5NT2X3f0hp2fBm2slo
34KDHeFf6z+dQ4gDWb1Rmd8Sw5AUkkOhL2m5gA36mOh9BYHc1N+mp4JeTkDwsI2s
aB0x+ccvXM/KmBZAU2SG8jJicqW8z7NIX9bFILjz1L2YMF815ylIZ7gBhX5ta6W4
hK/Ub9BFp6yV6Xp85gkjzWS2MRuW43WNgCvSRx22A44A9g1UJIig/Y770am5ucBA
8OjrDA+K/GB9S/Ftu9Om
=jjfI
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
