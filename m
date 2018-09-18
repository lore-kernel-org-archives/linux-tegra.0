From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Convert drm_atomic_helper_suspend/resume()
Date: Tue, 18 Sep 2018 16:53:31 +0200
Message-ID: <20180918145331.GB30386@ulmo>
References: <20180731200705.GA21510@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0013757948=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180731200705.GA21510@jordon-HP-15-Notebook-PC>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: ajitn.linux@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0013757948==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2018 at 01:37:05AM +0530, Souptick Joarder wrote:
> convert drm_atomic_helper_suspend/resume() to use
> drm_mode_config_helper_suspend/resume().
>=20
> With this conversion, tegra_drm_fb_suspend() and
> tegra_drm_fb_resume() wil not be used anymore.
> Both of these functions can be removed.
>=20
> Also, in tegra_drm struct's member state will not be
> used anymore. So this can be removed forever.
>=20
> Fixed one sparse warning.
>=20
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Signed-off-by: Ajit Negi <ajitn.linux@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 20 ++------------------
>  drivers/gpu/drm/tegra/drm.h |  4 ----
>  drivers/gpu/drm/tegra/fb.c  | 24 +-----------------------
>  3 files changed, 3 insertions(+), 45 deletions(-)

Applied, thanks.

Thierry

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluhEWsACgkQ3SOs138+
s6EA8A/6AmB4OarNe5zAtfb8ic1nBpHWwywo/0/2jJ2LQQAI5OZNJCbna/9ib8CQ
1CC7uKaInsLTF9Kqn+dsK/8Nn76lWPUfo9G7vKg8Y1+H+2uneWIEcQd33btG7CG3
SEQ1VWekdXlwPJLGsih1zoshZxlWoRIb+3bvgiHjMcq/D1wktMSMxEkb0LA/ej+3
4zfHEToH8LfQojEemsL/2lbnJVMNSeeedvS71rE42/kZchbPHi8upSQ32UbIOQel
uVKjGJmndm/5/hIlHZB6eyDKTlimTgwLBoQdvqveXlG/vSrXb2Pc3qPmcqX6CSPe
FcAOedcaU+f7FPH32j2RsKUxhkKaD92CPigknMeDRG3fcbFKoI6oIlDALzCLKplB
raGxVvXm4U/0/RMl1sRYvwuNYPW9TDaZblVarlDubW4uw1ctys850nukqKn0H+QU
ALaiBP7M3sCvyRY9vEtataNWmL2bCN3gY22GhGKv55yPYsn3mPBWE7Mbj0mg9+JO
IWfdA71R299TO2ZkQzTivDBYhKlS6Or35IHVWJS1XmqSDJhrRoT4o0lGnAxxCpTV
Zqpc4mPe6AgyddipdhBaHknBamPjwQjR3/eyF0MD4Wf8pC6qpQ6QN3+vwt12rMUg
yvgpJQJzOTsxIYQOW83jUxracihfkryAa8YETCgUUskM7Oi5nrY=
=P7mw
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--

--===============0013757948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0013757948==--
