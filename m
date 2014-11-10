From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] set: check seek success
Date: Mon, 10 Nov 2014 09:51:03 +0100
Message-ID: <20141110085102.GA12126@ulmo>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de>
 <545E95B1.5030703@georgi-clan.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <545E95B1.5030703-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 08, 2014 at 11:14:09PM +0100, Patrick Georgi wrote:
> This could silently fail which leads to surprising behaviour.
>=20
> Found-by: Coverity Scan
> Signed-off-by: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
> ---
>  src/set.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/src/set.c b/src/set.c
> index ff32b53..907d640 100644
> --- a/src/set.c
> +++ b/src/set.c
> @@ -59,7 +59,11 @@ read_from_image(char	*filename,
>  		return result;
>  	}
> =20
> -	fseek(fp, offset, SEEK_SET);
> +	if (fseek(fp, offset, SEEK_SET) =3D=3D -1) {
> +		printf("Error: Couldn't seek to %s(%d)\n", filename, offset);

offset is unsigned, so the format specifier should be %u. I also wonder
whether it would be good to output errno along with the message (or the
string representation thereof) to increase the information content. But
given that none of the other error messages have that it could be a
separate patch.

With the %d -> %u for the format specifier, this is:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUYHx2AAoJEN0jrNd/PrOhuKsQAIcYhC10SJ0nw6tXIGUIH4h4
soo7VOTcA0vEDJIN5d6AQoJftmnuBN3yA7h0Skd82NHgD8XvsKZZ5A/4URVJ/WN2
NHNhbcj1qJ+LxdPeqkKucRwdW2Jqb37TSGv2ZBydKt6kW2RjUr9wb825l3/gNWCv
leKih5MRcn7FfAz69vsqat1DUpdhGIwL+LAc3M+lyMbtkhSAR1PmeTBWLI9oApkf
8KZlA5r64RbkLWBOiNc8W/T3iOFIx0VZ+4aP3RgFIMOJo3ITBCB4P7/CNtATate9
N4irSlRMyRmn2oYDUejMjqn0xXTwBg+z8l34BOQIc/gsYYwnwTJzeuUiAdLDpBZi
PCHzZEO/SzGjPiVlYHvdTnJi//WVwGOsGarXKKFPSdHLxaqWtrJz+9iLitKW1gC7
Bi/R3Bs0VszNDYTwlAekp9PyyYHhjsl4BYuMJ5hLbnTURKXGfDm9dngGfhKcnCRV
Vpw6UMqRi1Bpyf6VY14klWYrrg1XtST1U4XGqjp9tzLNXnVtG8AAkOUC09K70KWW
HAx1xS0u36Jz5pvKDb3lqxUlWlITy/9WqSqcMqERLLpdxcTqKYCCBQopfskYDrey
OpKnsJdWq/AYbZr3IM/Cx6raFCDw0P3CKH5ivnIfwKIZLxBALzkhkrz60edlnKGC
OCH4e++1lNFGdu7yf8Vm
=JhCz
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
