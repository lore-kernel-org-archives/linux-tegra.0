From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] soc/tegra: fuse: Add spare bit offset for Tegra114
Date: Mon, 4 May 2015 17:07:58 +0200
Message-ID: <20150504150756.GA26419@ulmo.nvidia.com>
References: <1430750923-23682-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430750923-23682-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2015 at 04:48:41PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The offset of the first spare bit register on Tegra114 is 0x280.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra30.c | 1 +
>  1 file changed, 1 insertion(+)

I just realized that all these offsets are offset by 0x100 because they
use the generic fuse access operation. Will update the series to reflect
that.

Thierry

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVR4tMAAoJEN0jrNd/PrOh8vsQAKVSmgC5GfAHTqgBRstz7GLb
iIoeMeXz6cf6AwMx2Z76P4Awdy2ib6ATfA7plc0j/gg+BS0e1Wwxnz6PMEQkxPZw
joHzf7fDteeMofVJ1GQ5UbfyXGFMy53gP5+2epmg6j7vVHxHomx5fbMBU2jEAwwO
sNoDk3B/8fVQbQjitWQymtXs1tTVNfN9fzeSd2MIX7bDz+U4EIPfQn6QgxVGcD3P
TP93pR3m1gwpLCZ7XJ0HpTzfQl7jHvUofy7017zV/XawZ7OBiVPC8aga+9ryumTT
SaZPBMx+QFkXMky6C/J4cxkY77x59uUcrdz1yFG9YJU2lBzpp7kUUpywT6nUJe5q
cPkigTbxfJQ6SntFiRSzCtZnSdgiITlzkyP06DrAMsdul8RPspbbjnHK/Cmjkn+8
HS5Tb0vs3IRWGlssqymnIJ48aSagGCxJcJTjRfzdKrtQnbX7+rZbh3pPIOUF603q
hR9tt6oYgvgKOnRHJS2lTTvzmBi4sS2j6jOdeqorlcTTJaydeU3Ytr+x68e4ATzk
4dY5epSlDDvHSV4t0w9DZQLrveXuhzP2XuKamoZAyqsLsaozjYkQafXGIKS2F+v4
NSvCuALdYBOwyg8HNXre2rirtkBH6mnLAH7TK67Vn4bRW/qowU+9ghLEokVwnIHb
bzRZmtIr2x+/m4B83tXL
=GpJl
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
