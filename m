From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] memory: tegra: tegra124-emc: Add missing
 of_node_put
Date: Tue, 14 Jun 2016 11:36:14 +0200
Message-ID: <20160614093614.GB22567@ulmo.ba.sec>
References: <20160125172748.GA26252@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160125172748.GA26252@amitoj-Inspiron-3542>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 10:57:48PM +0530, Amitoj Kaur Chawla wrote:
> for_each_child_of_node performs an of_node_get on each iteration, so
> to break out of the loop an of_node_put is required.
>=20
> Found using Coccinelle. The semantic patch used for this is as follows:
>=20
> // <smpl>
> @@
> expression e;
> local idexpression n;
> @@
>=20
>  for_each_child_of_node(..., n) {
>    ... when !=3D of_node_put(n)
>        when !=3D e =3D n
> (
>    return n;
> |
> +  of_node_put(n);
> ?  return ...;
> )
>    ...
>  }
> // </smpl
>=20
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes in v2:
>         -Modified the note underneath ---
>=20
> There is an extra of_node_put() before a continue in the same file on
> line 1001 which should be deleted too. Julia Lawall has already sent a pa=
tch=20
> to delete this but if preferred I can send one patch to do both the chang=
es.
>=20
>  drivers/memory/tegra/tegra124-emc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXX9AOAAoJEN0jrNd/PrOhOW0P/jkfQ37N5rtUkoOd6Z6+tCwg
Fdv9K/LI7b65NcPIull6Ps8dfDUpxYNfppUWPLVOJjq9ztxNHiTj86LqzDLDqWZ2
YQgvvfSxjUt44aRhnxkNVznCIX4DBBtJDl8fgRYTYbcxtNbBbhRxEhPhS0wXIbuG
/YlTf3gV7Lwsg0meWbVZqz+yIKtHsxTLfq7q4I+iMSoJiNpKcnxvLplQMKTxl5Nj
Ck5vpMBdRB2Esw3xeIodJOFEl290+tugiGMKaimaoM6KsEdrsmprU2SScJxp+l3u
kpeZXnXF0oSO2mEyTTevkH7YrLdkheSaeroFmkdH7xjslZ+9NdTnG67TxiVihzto
7CX0fWNz2FxZ3Cs9hcopj/ah9O4mcIPv4063QeQ0bsfjZAP3R5psoxQD6QeKJwAH
A5zg+1hMaOOzg93nZAHB/Enf/Jol3X3DiYLSrMy1NqB2ylg95JE1Ox/xKJWuoYDO
OrWpLYmFdIbcuHO7xs6TOtVkGXMm21TVVaw5Ea7DR2Ez7se9rQyj37DbvOMm2Wmq
l/fEhpwwwlbxz1VUE++7mHDE69IWAOQ0Z8svCh+XXrDKCZ4nykWDUcozcZLtlHxg
hx4Vmhcp1NilPF0zROjk8SlgKy+tXIkXAMDZY2vY/tnCdGGTXEvcn0pdbOyXITpu
FAY2SNbbZv0FePQAD5Jg
=1dFB
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
