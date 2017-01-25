From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: tegra: =?utf-8?Q?Fix?=
 =?utf-8?Q?_missing_card_detection_in_Trimslice_=C2=B5SD?= card slot
Date: Wed, 25 Jan 2017 10:31:45 +0100
Message-ID: <20170125093145.GF13025@ulmo.ba.sec>
References: <20170122211747.exirq4nvb2xj6dk6@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IvGM3kKqwtniy32b"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170122211747.exirq4nvb2xj6dk6@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--IvGM3kKqwtniy32b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 22, 2017 at 10:17:48PM +0100, Rask Ingemann Lambertsen wrote:
> Card insertion and removal currently goes undetected. AFAIK there's no
> way to generate interrupts on card changes in this slot, so use polling.
>=20
> Signed-off-by: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-trimslice.dts | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--IvGM3kKqwtniy32b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIcH4ACgkQ3SOs138+
s6GDxg/9G3A8dYUIN4fpS8OemYkfLeQbJlqPKQ9mkqFyqR6SWcho5wOcJNS5hZ7m
2jGTXBFYgJlvJr/3qW6pT8pccbFY4gAVRAmqmshpb25bsRkzxALbkboZgtK4Izua
1znc0BKhLG168wx1J4lJL0g2xoXYNuGVsPRqmx4xMwE15/Ru6U2lTmWxTYj18sIE
tmNT1DQk+hOTTNTcN69pJuFxMwCjsOXK8VfkBl37Hd+PNxnxWfK2x4kN66WgMvx1
dpM+7bU6nkvuwKs3SzIBO9o2ftiB2rBPAHDFLZWjqv1n5F5VMbfVRiqaehMc1Omb
sWKaabrOfi0VUjWqTIhI64Jy0DYd948Am+oGuU6x6uJ8UHz6de5YK7BfMbOcLNA9
H5H+8O+Ujzu6+4tq0OcY5lVykezM4hdH6+GA/oI6bSzkrQbC1Hmk2qiNMNhKI1ez
zipLWaI6EB6Rzsr28pJRKB0QAi0pnjZX1wRiMdHcIZzmNDjRmTf03nSIxcyc2RHw
ta/pFmG2oAgoNCMEf0I+kyeJe/YQhFGpVBfd/iBOeCdbgSdDxwxX8kmyDtS/lHzA
A170IjTdP0slZTelOZ21YSZXizNUJ6oR8YX3MDszkjeBASv9UvHRXQHgEXNm9UKs
JgOqpx/tTN8usZy4y6JkGBDYU3Nggewi8eWWFpoOPFruKD1EbF4=
=eetJ
-----END PGP SIGNATURE-----

--IvGM3kKqwtniy32b--
