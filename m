From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: fix compile w/ CONFIG_DYNAMIC_DEBUG
Date: Thu, 19 Dec 2013 09:32:41 +0100
Message-ID: <20131219083239.GA2494@ulmo.nvidia.com>
References: <1387400013-9237-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387400013-9237-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2013 at 01:53:33PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> With CONFIG_DYNAMIC_DEBUG=3Dy, the followin compile error occurs:
>=20
> drivers/gpu/drm/tegra/mipi-phy.c: In function =E2=80=98mipi_dphy_timing_v=
alidate=E2=80=99:
> drivers/gpu/drm/tegra/mipi-phy.c:69:11: error: =E2=80=98EINVAL=E2=80=99 u=
ndeclared (first use in this function)
> drivers/gpu/drm/tegra/mipi-phy.c:69:11: note: each undeclared identifier =
is reported only once for each function it appears in
>=20
> Fix this by directly including the header that defines EINVAL.
>=20
> Fixes: 39aa0a4f3be5 ("drm/tegra: Add DSI support")
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/mipi-phy.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks. I've fixed up the "Fixes:" tag since the commit hash
was no longer valid.

Thierry

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsq8nAAoJEN0jrNd/PrOhIF8P/2dWsvdQQjMCzscw8aVMGcjm
faekRqXvIelk5W7H648lxOUaHhqDwu7Kfamy6rUjTO5FRIMqvAOjhe31efjPgewS
mRycakFpFCl3Xd4eWqzI71cMQEI9WtfI/glwk39h7CN77uzwk606qjaNi+4REZzo
dD9EuUk+srDw/y1alocLHfdCaigrda9k9jTnoAmvf59HZphN9mIrp7QR6lcw9Nl2
pjvvOf1dSzv7/2aixJVtFLzeopZ9cl8JAonmiZHv06wVIlfKjYK0STh3UBqLCZT2
1tIAscW+bSvvw6DoNsXeM0/orOQLcILDN6r0qBcO03pemTEkKrIJwIAfWAEo/QW5
dbz+PArtMMX2k4AaU26mGH/ahrp5aseaeD+03lvXByo24fwn/I6ULgZ2A+rLcxBd
n8ZK2B12kSYtcU2AYYUq6Nr6Fdhqt23IieHnQb6gxykGc+gGN9vdAohngcOZJjXq
puv3S4n9todCreZBXThY9mE/R2/+bq63a38cMEWYM+0o9OdEe1uXS4jYMN7PwV30
EFA6AMzBqFs+sdtRtauuuvq1xz+1NoOtbaQVfH3fAZf7w+R8gjOzcuclETDRAc39
KPtd2w17YmdAtfqxH8LiG/XXOFAL/YahUqN8/WigjjgOt1q/6Ox9OxeNMQNGpLKT
kr3+OJVnPGD7d6dzxtam
=1GEA
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
