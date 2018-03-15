From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: plane: Keep 'dependent' blending state of
 unaffected planes
Date: Thu, 15 Mar 2018 16:52:42 +0100
Message-ID: <20180315155242.GA12548@ulmo>
References: <ebc6aef3f5cd7b9b9bb25ceff9e86e742390cfca.1521121707.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0928990623=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <ebc6aef3f5cd7b9b9bb25ceff9e86e742390cfca.1521121707.git.digetx@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0928990623==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2018 at 05:24:31PM +0300, Dmitry Osipenko wrote:
> This way new state takes into account the current state of unaffected
> (by the atomic commit) planes.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> v2: Dropped unrelated 'cleanup' changes and fixed
>     s/state->dependent[i]/state->dependent[index]/ typo.
>=20
>  drivers/gpu/drm/tegra/plane.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

I've amended the commit in drm/tegra/fixes to match this v2.

Thanks,
Thierry

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqqlscACgkQ3SOs138+
s6H3dg/8DYbt0DnbCFtOHw571eklrOVaOmBT7DyZ/v/OUzpm5qjg01mEpRpP3U1F
Hdke00z0yPdy0CphcesqFLOYnzOdHXXPWoi2pskyII4aCQKCC2JcyK+FVzhJELc4
qBe34d/xabaGt+9oLwK8FSQgnXyYXi0HRiq8Yo6EXsv1Ouh5EagkE3TT+WTaOoku
AMCCkUzDEctw8yR7aQru7h0SEI2f0ipjJH7SPtBtLPdV3OMMBLny/7z7PYMyvkrB
ISRC1yNaGbp8HReWZmi+rcekMKPFgZk5Csp8LCe6l8To8APKhDR2G6ygcWbb7W2v
y0ToJ1BPtUZlUpQpLGMxtgUegP9RD0eSz47HfXAr+hVk5/X3EAPMkrb5b4/HHnqM
RMZ0BTC5pWUnSLuOBRzG/w/yge1vTArRt+JYS0aIbuCeuifzw4+m5iqtzT/+gylA
jv4gXbxCZYI9Eggt/LPY/7j9EQynNjJg5JmCP2J2DUlfeqzo9+frDiYpOCdvcvl8
v43Z+5CgJnDqb+5C1uaFv4V/2eOnFUawODnrlk9bRIqj1pjBeIaBMrgarCDS15kp
VTskgWQupJZq3o5XPPTbqUb31xZqyNyon9Vcvsl40acfXGuRThPVh04fvRx0izEJ
znbc6t7akh9p22ZGQDXTbkME0p/PDP7xcj903pFJCUzsjGGScNo=
=4tFC
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--

--===============0928990623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0928990623==--
