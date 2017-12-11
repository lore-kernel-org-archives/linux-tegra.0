From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] usb: phy: tegra: Cleanup error messages
Date: Mon, 11 Dec 2017 10:37:44 +0100
Message-ID: <20171211093744.GB10671@ulmo>
References: <ddf583790b551999ef063107be12a2d85e7b6a86.1512946782.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ddf583790b551999ef063107be12a2d85e7b6a86.1512946782.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2017 at 02:07:37AM +0300, Dmitry Osipenko wrote:
> Tegra's PHY driver has a mix of pr_err() and dev_err(), let's switch to
> dev_err() and use common errors message formatting across the driver for
> consistency.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 72 +++++++++++++++++++++++++----------=
------
>  1 file changed, 44 insertions(+), 28 deletions(-)

Can we also get rid of all the function names in error messages? I see
that for some error messages you've removed them, but then for others
you added them, so you remove inconsistencies on one hand and add other
inconsistencies at the same time. =3D)

Other than that, I like this.

Thierry

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlouUeUACgkQ3SOs138+
s6GhUQ//XStPco0+7j9QNrv3r3O5C7PE4snO+i3NnG5jSEsItSmpzxSWV6A8jnsr
vPhLCGtjf0TAr2mEv/1fSNosJzN5cA4MZYgySQqLA9Iyeub9zTAk4eSWKgz8NVZj
VodUv1NqESR66u5qP22TMOOFRNmuRNGzjdGl6d9343UewpPoVOtevBocme4+zbo2
9cMHN1Js/jXm3hdLcBzGAvySz9mI2bp2a9IINiei0mMg78uzefOB16ybvwmP58T2
T9Pfem/zJEknt8yBjxFR9EgKMBy6tcwFsN61jpm5Gcaj+oq20omwQL2wuqYuCrfP
hRfrbdid4ZxO5wpiiM92nS1gYeKLwbopY0BtwF7bGbNGJpiaNiLiFeZ3yEaATeo/
6bynf6AC0kZ5J74ZXN49EF99ajODQs25vN8e7bp1k+L4i2S17Ln2drkrNj+WOQ2q
drsQiq0zzaiPIhzGAFvvOVreeIqubHSbC1KlkQ8nGcfgo++8gkBRAtcpFKXNFeeg
UOilC9L5eTWauFLisHjeJSWuQ4tA0+sCEzFqgziTFuI7wOpHq0WqovnS2+xmsFMY
u2mbPeB7xH0Gte9WhcYVHT4dkqUjs4d8EE0m3LTv1p1LFUokaYW77rpfG2q5J036
ROuvu95YcttBm8SqKjIEMj7I6Lv3pj0tEsNYrYqjl69REsKu8Qw=
=yQ0J
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
