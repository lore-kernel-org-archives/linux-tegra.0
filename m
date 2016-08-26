From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH V2 0/9] Some Tegra I2C Updates
Date: Fri, 26 Aug 2016 17:56:28 +0200
Message-ID: <20160826155628.GD1608@katana>
References: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472216945-11818-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2016 at 02:08:56PM +0100, Jon Hunter wrote:
> Add runtime-pm and pinctrl support for Tegra I2C driver.
>=20
> The first 6 patches are trivial clean-up/simplification changes.
>=20
> Changes since V1:
> - Fixed cppcheck warning reported by Wolfram
> - Added 3 more clean-up patches to fix some checkpatch issues

Thanks looks good. Now we only need to find out which one to apply
first, this one or "[v8,1/3] i2c: tegra: use readx_poll_timeout after
config_load reg programmed" and following. I cced you on the other mail.


--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwGasAAoJEBQN5MwUoCm28yAQAKaCFgcZZvO/sSeWYF1KRamo
TKVnLZSGu/xl8bDpr2eXRLdf5H4+GhtmX8JLkE7qUksYFO1aBm10/jmDx8uyojTx
Vo2j3q32qlhzd6o3wKHi+5DeD38Qcl8Be5qK3AjSeBpLg4Koxtk5Pc0jh8XM76YV
1CMBmOiO3RUSJUrpQgHpZBceefizwMw7Ne2cktnr/H2ve/Dm454FLXpZeUBoNK4f
K24Dbav2PelL6ya5qLPzhG9OckfxWjbXqLP0IldTL5m7LR9MUGa4f1OXSYe7Go2M
qMVDwVDgB1Rwo8xwFTO4IQVvDdxGcZXQi2/HU41pUMkME6zzpO60gv+gSaYxHaCl
9g0mCMnbGcVMxrUCO/aveXKbBT+92wGgoxn8bEUtLK7V5nQ3Jvq29alh1DQZ1FGr
iZv5q0yEokxoNYI/6kj1a5hB9oibItzeBxTy+nxqOqEdWbU8Iy1ujpDfadneninT
nlXtgLwhEnH8D+5OIOiLgTuq9S0HGX8d47TsMJZfz5yUHJJxBp5Y62DZdONAvGjN
aX+p7WvGk5u58fwL7HaAySFQ2ff5VGqGEntrg3VBo3Z+D+En9uvxrVLN5JeveD0u
g3V6fyCY9rVOeSxxTTCbLQFpCGwXkPfzGtI7frgKSJWUaDFCXfnrXvEDYBOGD5Rd
vrnRbevlyBtGuwf4AyDo
=mmsy
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--
