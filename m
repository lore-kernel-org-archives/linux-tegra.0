From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/9] Documentation: DT bindings: fix hda2codec_2x clock
 name for tegra30-hda
Date: Tue, 5 May 2015 14:02:50 +0200
Message-ID: <20150505120249.GC30501@ulmo.nvidia.com>
References: <cover.1428700856.git.marcel.ziswiler@toradex.com>
 <ee8e9952dfdfd87da52f817fca0a6ad94a137742.1428700856.git.marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ee8e9952dfdfd87da52f817fca0a6ad94a137742.1428700856.git.marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marcel Ziswiler <marc>
List-Id: linux-tegra@vger.kernel.org


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 11:35:58PM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
>=20
> Fix hda2codec_2x clock name in Tegra30 HDA controller device tree node
> documentation.
> While at it also fix coma vs. semicolon issue.
>=20
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt | 8 ++++-=
---
>  1 file changed, 4 insertions(+), 4 deletions(-)

Takashi,

This series contains a couple of patches to the Tegra HDA driver and I
have a couple of outstanding patches myself. Would you be okay with me
collecting the patches in a branch and send them to you as a pull
request?

Thierry

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.t=
xt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
> index 13e2ef4..5032efa 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
> @@ -8,10 +8,10 @@ Required properties:
>  - interrupts : The interrupt from the HDA controller.
>  - clocks : Must contain an entry for each required entry in clock-names.
>    See ../clocks/clock-bindings.txt for details.
> -- clock-names : Must include the following entries: hda, hdacodec_2x, hd=
a2hdmi
> +- clock-names : Must include the following entries: hda, hda2codec_2x, h=
da2hdmi
>  - resets : Must contain an entry for each entry in reset-names.
>    See ../reset/reset.txt for details.
> -- reset-names : Must include the following entries: hda, hdacodec_2x, hd=
a2hdmi
> +- reset-names : Must include the following entries: hda, hda2codec_2x, h=
da2hdmi
> =20
>  Example:
> =20
> @@ -24,7 +24,7 @@ hda@0,70030000 {
>  		 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
>  	clock-names =3D "hda", "hda2hdmi", "hda2codec_2x";
>  	resets =3D <&tegra_car 125>, /* hda */
> -		 <&tegra_car 128>; /* hda2hdmi */
> -		 <&tegra_car 111>, /* hda2codec_2x */
> +		 <&tegra_car 128>, /* hda2hdmi */
> +		 <&tegra_car 111>; /* hda2codec_2x */
>  	reset-names =3D "hda", "hda2hdmi", "hda2codec_2x";
>  };
> --=20
> 1.9.3
>=20

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSLFoAAoJEN0jrNd/PrOhB+UP/2t2zMfWzexznOsW8pNg++re
Y3TsKZD41484gnLGDIJaSt9t4yePN0ouh/g2hsNPyTk2FXBKAEg5VO7Y2CENWf53
3/yV/o9GfdZosSPFykYvAinP2Tp/ecHWiW5HjnTLTI38dwkZGJhg6vEMi7jfcGyj
gvO0n9bl41b8itUhGmhu2/AeTNweqcJqRWceOApzGBYHjspsBv1PknoLIEtBbImo
xoHXFtFZ5BaSl2EAjQiZ5CGd812Hyni9uaN6Di1X4TQSaqT/iUgnH9NJOND/cl5A
cvW9t6wezTvut1cIeLUltrN3byrEwa0EPl/JXCiZG0Jd31AUawjnJgFmEwQco+WB
8OiAL7mfLARl8QLFkrYyduSvp+GmA418HjDcFpqpHZGSORO7WUoBYQOcu7dRG63P
6V5Qo8zG+/Xs5ju7yiaxhT8BOknorjZNiH8GAjTirwn5VR0p/nzSIjKzHDkkkbIs
gm4CLbgoO54GGZGwpXC6FLzUtzEITuPJqiEgArrNxmQsOM52jN186J+3efZL2Qky
7oLSjiVA9Rm6NfEzFkfrqBJHbhRZpK1ofouZISV5mfxsc6Kxc6noSQBHYRzsEJEo
6X8nuGpcRZ4P/vwgDNRw/4WoAGeadtGTxMYi5w0nijalj7S66eg6iTj5+JlF6tea
u2TsITPHw8nsdmOjvDLo
=5r0g
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
