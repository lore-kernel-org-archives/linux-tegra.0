From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v4 0/8] NVIDIA Tegra I2C driver fixes and improvements
Date: Mon, 13 Jan 2020 22:53:41 +0100
Message-ID: <20200113215341.GA2689@ninjato>
References: <20200112171430.27219-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200112171430.27219-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2020 at 08:14:22PM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> This patchset adds support for atomic transfers which are required for
> shutting down machine properly. Secondly, a (not)suspending I2C and some
> other things are fixed/improved by this small series as well. Please revi=
ew
> and apply, thanks in advance!
>=20
> Changelog:
>=20
> v4: Removed the "clk: tegra: Fix double-free in tegra_clk_init()" patch
>     from this series, which was added by accident in v3.
>=20
>     Added Thierry's tested-by to the patches.

Looks good to me. I think all these patches should go to v5.6, let me
know if patches 1 and/or 2 should go to v5.5?


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4c5uEACgkQFA3kzBSg
KbaNOg/8Djo9bVYyGrlZcv32vzUo/Ey82Z5EzFt9OvJt3HJZjk9P0968XqubSUDM
avR6DhJR9xaVLfgqJRmQvxA3nnNm4N1k4ezckknwoDeiWdUNqt4MWWFxJuc7ropM
ehzoaGRgp+Q8ERRHdo/dJtJcrvl/IkanWZWik9VbhrtsTexKXwpGV0hx8KvkqOhP
HU3bO/WJR1s7bfrxPHvMmp0GYcqEsqiZ1R910oYka0QDo4cAc3HjLllN5IpnfKo7
azK1cd70TjVzYoFXHX+wrU0n+8XqoRLRjZxVEoLAMt+UpS+LBXNI+29xB0jkx2+m
/EFg2yaS65zltyvhnR/eMiFj2qrVZ+Rx8oz8ZJOYVlw5pZkWN1SbbBZg+s7G/NCq
TDFzkCtyprj9KDDdH9Vu+ahChiEm9X2+LkG0jKAo/c/GGXgyRjv6DqIJshPD+T7z
h1+IuakJCUd2HAVcL5hjKLfg4QpbKGn2DJhV3AnjbLTIhTrVujv/8KWtgNj+c7JQ
UoEPA1g5j6CXe5jxWNV7eO9hlkaZSekZ17kQ3y5/3hf0ZbqVU95ffiWHAv/KFMC+
zlLSXD6iZznJUX44mBoLaRltNJn6KFAhL1kU7q8lePCbRbSIcdaVkofJ16Kbr/tv
ExY+wXPXhu39HstjFveuKcC0L9zm5bTBBu3zw12zE9uxfXUHRjI=
=qKVs
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
