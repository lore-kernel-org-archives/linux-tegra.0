From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regmap: add bulk_write() for non-volatile register set
Date: Thu, 9 Feb 2012 12:55:06 +0000
Message-ID: <20120209125505.GI3058@opensource.wolfsonmicro.com>
References: <1328789531-10067-1-git-send-email-ldewangan@nvidia.com>
 <20120209121704.GF3058@opensource.wolfsonmicro.com>
 <4F33BFDE.7020006@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VaKJWhUROU/xPxjb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F33BFDE.7020006-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "gregkh-l3A5Bk7waGM@public.gmane.org" <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--VaKJWhUROU/xPxjb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2012 at 06:15:18PM +0530, Laxman Dewangan wrote:
> On Thursday 09 February 2012 05:47 PM, Mark Brown wrote:
> >On Thu, Feb 09, 2012 at 05:42:11PM +0530, Laxman Dewangan wrote:

> >>+	if (vol || map->cache_type =3D=3D REGCACHE_NONE) {
> >>+		ret =3D _regmap_raw_write(map, reg, val, val_bytes * val_count);

> >You still need to do the byte swap here.

> I saw the regmap_raw_write() and it is using the same way without
> byte swapping.

That's the whole point with the difference between the bulk and raw APIs
though, the raw API skips the byte swapping and the bulk does it.

> Want to use the same function as it is.. I am not sure why do we
> require byte-swapping in this case. Required things will be done by
> _regmap_raw_write only.

The byte swapping is important for any device which has more than 8 bit
register values, it's only not an issue for you because you have 8 bit
registers.

> This api just break the transfer in register-wise if any of the
> register is cached..

Well, there's no fundamental reason why we can't support cache on raw
operations too.  It's not implemented because there's no need for it
with any current users rather than because it's impossible.


>=20
> >>+	} else {
> >>+		for (i =3D 0; i<  val_count; i++) {
> >>+			memcpy(map->work_buf, val + (i * val_bytes), val_bytes);
> >>+			ival =3D map->format.parse_val(map->work_buf);
> >They're currently symmetric but really this should use format_val().
> >
> The format_val is require integer argument and issue is that I dont
> have this otherwise I need not to parse, can use directly.
>=20
> Am I missing something here?
>=20
>=20
> >* Unknown Key
> >* 0x6E30FDDD
>=20

--VaKJWhUROU/xPxjb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPM8IUAAoJEBus8iNuMP3dHu8P/3wctLcaFOeQ2iekw4gd2+Lg
xn1IqQ0gL274HgnCLeN5HMgteeTgksvAonH7/jMWYZWJazCD7WrYuy3qWpqs0Y6N
6lcnRjL3KdkojhBo7+axyEGdboSMtDIrEEEgAT0Te3BSr0pSMnmaW8wBltpZXLy8
OR1P/Ld8PkpO2vEiDRSTjZJRylZemYMQCjGF1/4rdTSm1p4IHaRBYXRrV02aArkG
Itarp/1vAA83H8yTOOoZvo+7PbLEBbpkZAAc+bOMxnTOVLa3jDCF15uaAUecEcP+
2UurB7zD3bsNZMHoqe5bq460pqIeuVQYOpEvU299kh0TKi3KhVvsFU8E1HEvL9Qq
f19rz7aaxnn5c/SZ8J3045cAe8m4aBPpv3eJKgJ/CzBP4/zQPOvjiCEv7/q9Nslo
Rf8OdzY7gEbxgMzOgABm7ZMNIfWshqW/scOzMe+0scunnuPHSFsZDsjj+KE7wMwP
TG3HDuM7ark0PRKIMZM27k+HI2i404USCDogr8GWTvvku5+gkrqHlY4ZbWWIYJTp
ZYpVmrgqDindfFfOJHaq4OxIG/p0f/HggFfzb/lNue1K7CaSC9wXHU4GNBDOlQ6K
/jE1UXK5GEvAcsk3U6fZFkEcGAw6uWXvc6U1TcXydp+5WbKgLzOzOZaXagh/UCfK
pNirdr1wBSkrTKIQIQpk
=a5ov
-----END PGP SIGNATURE-----

--VaKJWhUROU/xPxjb--
