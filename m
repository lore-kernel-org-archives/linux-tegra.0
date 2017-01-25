From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH 0/6] apalis-tk1: updates for v1.1 hw
Date: Wed, 25 Jan 2017 07:56:27 +0100
Message-ID: <20170125065627.GA13025@ulmo.ba.sec>
References: <20161124010456.24604-1-marcel@ziswiler.com>
 <1483449646.2745.1.camel@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1483449646.2745.1.camel-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org" <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2017 at 01:20:48PM +0000, Marcel Ziswiler wrote:
> On Thu, 2016-11-24 at 02:04 +0100, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org wrote:
> > From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> >=20
> >=20
> > This series updates the device tree for the upcoming V1.1 HW samples.
> > All changes are purely opportunistic meaning they fix stuff which on
> > older HW was anyway broken so there should be no backwards
> > compatibility issues.
> >=20
> >=20
> > Marcel Ziswiler (6):
> > =C2=A0 apalis-tk1: remove spurious new lines
> > =C2=A0 apalis-tk1: temp alert pull-up
> > =C2=A0 apalis-tk1: optional displayport hot-plug detect
> > =C2=A0 apalis-tk1: adjust pin muxing for v1.1 hw
> > =C2=A0 apalis-tk1: working sd card detect on v1.1 hw
> > =C2=A0 apalis-tk1: update compatibility comment
> >=20
> > =C2=A0arch/arm/boot/dts/tegra124-apalis-eval.dts | 11 +----
> > =C2=A0arch/arm/boot/dts/tegra124-apalis.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0| 73 +++++++++++---------
> > ----------
> > =C2=A02 files changed, 29 insertions(+), 55 deletions(-)

Applied all but the first, thanks.

Thierry

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliITBoACgkQ3SOs138+
s6FKOxAApf++5tonKTnc/tvharVFMtxMUtLsgXNRbL9Yj+IalOuakiLwyZmxx+4p
YbWkMXDtguRQV1S9wwyv9ozyd8Lrc2QwcobpXl5BlLmKnPNkH+nIIHMdmFQQJVds
OmCihaT/QPCN9BYLYsZeDDyl+hHs3gWowpujV5SLuRV7XGcNneCPIK2ZvHKJlcX3
QjueoIPsrhmXAi/teo57JAbSkLyvMhSl1POMcbua9Asg1xGX4sWcCtbzIooQA0a1
wkgOiU90I1rwZr4nP8LNpb91Ytwhfly+3j1o8A4j/9WWqXlpuseP2j1vm4upES48
vbUhK3BDxaeUSmvc90gbf2A7fb5YlwNQs5Barrxwf1e/p9r12QYuEyPYKISl4fkq
RfLIg2fMYIY5iFANHliA7eyWtiitZTe+FGFq3tPUb5TyMSgLB0hZo89Emn3uUATv
0fcvJx79b2it6/q0lG7EWHm8IpCMEUW3u2UFUpYOS86w3u6e5hIOoSqpgkpKAqNr
Uw/EmQMdkBwGtZks45/82FpY1EzNhHgRGLQcwm/B5wEp7BwoSPFko0GSKmb9NS8w
cd7bAz11CqmVHEXsTiEh9uGnczdEqJv7LdewSZIjK04NtAcP8SNuBINnVJpJY6If
Ms8wNtsct4fMsNmKFcLjiFwuc4qZxuHX0fnfz2dLxOJE+d/t970=
=R1HQ
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
