From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 2/5] drm/tegra: gr2d: Add IOMMU support
Date: Fri, 4 May 2018 14:20:24 +0200
Message-ID: <20180504122024.GV13459@ulmo>
References: <20180503234723.4368-1-digetx@gmail.com>
 <20180503234723.4368-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1066163020=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180503234723.4368-3-digetx@gmail.com>
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


--===============1066163020==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/LSm8UPTCLHL4o89"
Content-Disposition: inline


--/LSm8UPTCLHL4o89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 02:47:20AM +0300, Dmitry Osipenko wrote:
> Attach GR2D to the display IOMMU group in order to provide GR2D access
> to BO's IOVA.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/gr2d.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--/LSm8UPTCLHL4o89
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsUAgACgkQ3SOs138+
s6HzGw//YGw66PoLeB08vm3K5BWO4wvzi3QDmlazgEY0iGpEF2AgeweJYldbPq1h
BBhjGuh+mJTl5QHuyfOiKIBETWZkv00bKpITC9bT2pCwkco/AYcGQ1Jtr3sWTmW4
JtneKt0CtbMIsaioSpYLgoIC2vHJQCc5/Bg3hYjKpNBGVe+xCnuJnTLZxEEVG/RZ
Yu+2Hv1TfILqhteTdE3+hQkbgYxV81Z6xcjSNROKjmrr5f9kmjn4A1xWbcOScf54
QXazH1kJo0YVDkq2/pPn5tHRfc8mH9RVeer9sNqma9tlsXzXAVPwYSAug8Kg/mbi
QdSFrlyupA95ivWBk2dmo1h9hNcUxWC/6HuTs4ttmOmpqMBiYJFSGl5n+JVTnWnz
tnJgvCGuYJ4BixOXwofaWB376Y9sUklckipLNSyYbpYLXv/8SUD6nieD4UtKAH6h
JGMo1KYZUaGSz5LHfNoPqNcyarpxSoVRnoN8yDWzqVVcOyNXyTKt3Ka0e4xgo84j
JUwfEUENyisUmowjXAOD1bmz57eK6604S3dA920MXJgWVWkBG9JZP0efB8OeRzlz
oShCqyx4e0vAjXQZmamdwBWyvX3HDT6a6YpHOvcL2v3Ee20ctaVAkcpfHEfag9Q7
KLPGULCQxkRdA3LATwhHzB1Wgs+lfYU15IkTmDni+E6tCc0+kXk=
=gVyr
-----END PGP SIGNATURE-----

--/LSm8UPTCLHL4o89--

--===============1066163020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1066163020==--
