From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 5/6] ARM: tegra: Add Tegra20 GMI support
Date: Mon, 7 Nov 2016 13:56:32 +0100
Message-ID: <20161107125632.GB12559@ulmo.ba.sec>
References: <1478507405-13204-1-git-send-email-mirza.krak@gmail.com>
 <1478507405-13204-6-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478507405-13204-6-git-send-email-mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 09:30:04AM +0100, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Add a device node for the GMI controller found on Tegra20.
>=20
> Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board
> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> Changes in v2:
> - added address-cells, size-cells and ranges properties
>=20
> Changes in v3:
> - fixed range address which is not the same as Tegra30.
>=20
> Changes in v4:
> - removed extra newline and a initial space in resets property.
>=20
>  arch/arm/boot/dts/tegra20.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Applied, thanks.

Thierry

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIHoAAAoJEN0jrNd/PrOhc8QQAK6tFzXNyqCxyRMID3n3cb3f
8YZ9iFsW7XWxIdf/sbdNbSOi9og9SblhnUsBCfofjVEbKdUZsNty+fDV6Pr+oUGO
EPDt32ON6VqApoWR0WoBlN2CTe3KO+PQ4ovUHqeg0wPcYf7+W6slUalhZofiZUDf
i6+lXxWAiiikdHjhUAUoQ5dJAN3H+UUrNRv5nx/p4scIUVJfzXY9kF+I6jmNjILG
hhjqEHNygsTA3g5u+2sgZgUJCmUttZsjJ/cOOd7Vzf2G/T2Z5P9TFjL9Nzz7OXo7
vF6Rm1dQKeKIttsOUMhc3CgNTtm28uVdlT7Sn3TYCoYsUH2bLJWq239JFhKO7GVg
VR4AyinQvKdYJyerS+73UJcMQHPxvFVWUfNW0AmriTVIRncTvJ3JZPfAPk/0YZH7
wwQ9K6U8zuUUCjNaSTR6rzA2xP05LViazv9jpUOF1IG1MPqPcFDqseCZQNEn9/BP
VfRZWdB+IJ+0Vw6wIxZ/Z4UQYwAJqnJHTgYLf8B3cg05Wam9owbVy33EnSCy/uan
QhzQQ4JDgi0QRPTYi6vNZUGkm1rVh7ETBNRec/pkYBkwxoq1oaCtclISAjrfYHFO
QMC/X0aRZTnfiHbyjPWElDo0Z4Oduan7DVtWzQYk/u5U7X2X2IfUcsGVR1N3mfO4
ZCDPZMHYM9r5YSZuKsxD
=14qE
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
