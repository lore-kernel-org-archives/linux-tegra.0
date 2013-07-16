From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: fix compile warning in AC'97 driver
Date: Tue, 16 Jul 2013 18:35:44 +0100
Message-ID: <20130716173544.GV22506@sirena.org.uk>
References: <1373994044-15068-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rsp728Nwk8twChKq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1373994044-15068-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Rsp728Nwk8twChKq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2013 at 11:00:44AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This fixes the following by deleting dead code:
>=20
> sound/soc/tegra/tegra20_ac97.c: In function =E2=80=98tegra20_ac97_platfor=
m_probe=E2=80=99:
> sound/soc/tegra/tegra20_ac97.c:435:1: warning: label =E2=80=98err_unregis=
ter_pcm=E2=80=99 defined but not used [-Wunused-label]

Applied, thanks.

--Rsp728Nwk8twChKq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5YRsAAoJELSic+t+oim9fV4P/3pYp1ozeoQ34r35zb6225cT
L0w+iNEbFUKGZnq5cGbUznivsUZpfg4HJPnbTP9eNum8HY4UjpZGN/rMPTMWaC+I
Ct1d2xeadKZnTeFsWq71iqU+OsLR63byvngB5NC7ZFqH3TCLevNBlVaLa0fF/uhE
QkLLMOF0SWnqBjMIQSkzcSWXirTmOi1WSGqNcJPU3C0A0cBti3OUyJbXa/DHizR+
J8hHVYsH+Rmpu0sl26+dUu1Cl0ckdgR6Kz8kJ5P2rTNS1JoKS0ehG+i5dLNaYJaA
4rSD07rxc0aexx4AihlnFcL7Qzhi4O3s3CHf+pkxdr+odFhlss/OlEUluyBrYkar
G+k/O3F4/v+Ag85hFp7TigxgI3IWBlpPzfhuFzjDhUD76Uz5+hYi29HMeaaZwGrc
Glo7n7hXLfr//t0ZjkY0BaxQTPXgSuzOA3JB6TtExzlxez8+7NxpZR/XGEkTEIZz
pKNujls0gGmvyXLasq6x+anFd00gCNR5bzVqkrszClzT84tKkgpa5S40tpkVWYvs
zMkZSA5XeDiED/CmeVhEXjnmBBiWz9tM1JQ3oY3sEdUhWSmyZxx1IQYJU92hrF0j
eNbaW/d8CX9SLhAjIx70U2AaV4pYFRUFFhbtgYNXueW2t0MSuXCnqNI05UD/X26x
rherHcpIViTXazVJxOAG
=DkIp
-----END PGP SIGNATURE-----

--Rsp728Nwk8twChKq--
