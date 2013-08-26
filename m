From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [cbootimage PATCH 2/2] crypto: produce consistent hash for
 zero-length data
Date: Mon, 26 Aug 2013 10:01:17 +0200
Message-ID: <20130826080111.GC31726@ulmo>
References: <1377284162-7700-1-git-send-email-swarren@wwwdotorg.org>
 <1377284162-7700-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377284162-7700-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 12:56:02PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> In real-world use-cases, hashing zero-length data likely never happens.
> However, it is relevant when testing cbootimage with a dummy zero-length
> bootloader binary, e.g.:
>=20
> touch u-boot.bin
> cbootimage -t30 ../tamonten-ng/tegra30.img.cfg tegra30-tec-ng.img
>=20
> In this scenario, it's useful to create a consistent hash, so that one
> can compare the resultant images before and after applying patches, to
> check for regressions.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  src/crypto.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/src/crypto.c b/src/crypto.c
> index 88de357..9741785 100644
> --- a/src/crypto.c
> +++ b/src/crypto.c
> @@ -183,6 +183,9 @@ sign_objext(
>  	if (enable_debug_crypto)
>  		print_vector("K1", KEY_LENGTH, k1);
> =20
> +	if (!num_aes_blocks)
> +		memset(dst, 0, 4 * NVAES_STATECOLS);
> +

Perhaps it would be better to zero out the memory after allocating it in
sign_bct()? Or alternatively use:

	hash_buffer =3D calloc(1, hash_size);

That way you're sure to get the size right and don't have to hardcode
it. The above patch will only work as long as the hash size across SoCs
remains the same.

Thierry

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSGwtHAAoJEN0jrNd/PrOhkUgP/0KtSoat1AyKJ1KouuesTTA+
/mhJnKIICDy2Yf+BiLWlUI2UjGJE9yPHaUE5AjmjBWmZt4KdG6RusEduAbyNEqSp
jlodEyfFH/RBq3Ss9krwJIYDW3XFQjtsPdPwlARnxWbS9pEIifdgtkNbHOkOxYIp
ZwRj8D7pfFpcg15+B+t4bEPk9RZFWtuy5FyUobgKU9BsbGYeaZ8ZePVYk0bYkPdW
0CxZOf2mqLdagp+Fc+DgRqf6c9Z3J7H70NJWg4LRmGqzuG+KV4nsCjjjEm/90y+g
bx1KUKqGwxDwil7PZc61nU702ZcOCAvYFxvi4d1/JZWUynbR54NQCEErEzD+P27b
XMBzXbvf8j8kpi7x1V9LgfH0DhD1mkACybyK+jQ38pLpALK4lveGcpEzU38tRXAP
5bH9HPoU8ACzbLJ61eCIzy0536Of/3QNyvO03XAxtgn8qnt/PGI9I/22TYVaqDyR
KGvJSkribA14VaR+OHfa+mUwzF2cj8467hPdx9GSho+zAIgenhlraKPmVVV35GgW
pnvRhOWnCRJvsOQNjHZYXUSh+ZoVJ2ncWUv2OEPtugboLtc4Y07azMz7Fnt0+abH
mlhsXlaV1BMgQt1/tsT6tbYZuXEtMroc8LPnBmL9b2e3D4U3zz3sFLkE8rjxrrz1
7+Ph4ejNFCBx5QhF+BzL
=0LaI
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--
