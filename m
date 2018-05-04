From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 4/5] ARM: dts: tegra30: Add IOMMU nodes to Host1x and
 its clients
Date: Fri, 4 May 2018 17:22:07 +0200
Message-ID: <20180504152207.GE31229@ulmo>
References: <20180503234723.4368-1-digetx@gmail.com>
 <20180503234723.4368-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2006528570=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180503234723.4368-5-digetx@gmail.com>
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


--===============2006528570==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SNIs70sCzqvszXB4"
Content-Disposition: inline


--SNIs70sCzqvszXB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 02:47:22AM +0300, Dmitry Osipenko wrote:
> Enable IOMMU support for Host1x and its clients.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra30.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Applied, thanks.

Thierry

--SNIs70sCzqvszXB4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsep8ACgkQ3SOs138+
s6FsPA/7BWtQv2bOp5sC7SAl2Tf89MwXJ5tvcaM9sW49qsuF3vLs+ByXtI2O6p/i
/E7kO1GS2suYJlffo9fu8I2ehqPPWjj2AdlxLU7siRhCQWnHdMX4LOe9IGKCSSQs
A/6tipdyvN4qW5puD3zpunnWeVPeKfnjSP1tPOlHNkjDpo3ZUNzn7K3awu0X4NHG
3cc5vP+D0aXddZBPvk/mD4RgVVtN98jastN4lg6+1vo6FaSEgoFzra/VOxi+7Lvl
ZamGK/qHzL40dQTUhokhrjdPkWCiBXGnQw5Je7nLWpKIBrLC/CjlfbGnJ77JEoL2
rwK+l+lPVZBaGau/suu1RwSYjTO0Y/1d8QopFRKP4Em3VF4LPMKSJGJ6B/r8M6Xj
KODVPwfOSvJEfyFYFEYx9kIHKWdMKKls/HnMpyDg65VkIgZmgqT2Jmgh0cXCw2Ij
bGa0sN09CVtZMtANK1pN13VSxHYIEDSC8eCjiqep6VBATtYvBKC5ZlkF7ntMSya2
R0qtQ4Tcl/LiANRN7UuOVFFofSB7WiEj9Lm5W+u/JhaLWU0EDLmV+8O3G3686LEj
kaOuYG+3ZLxie3UvnL98T/r2euQm2A7dHyiIPVVHD6fdHjQLNkgpZ9naibNn2UQp
OYzB7isdvAxb+TVX54NgkORzEhdnoemyDql5/T+ML0AjYCL9+mQ=
=nu25
-----END PGP SIGNATURE-----

--SNIs70sCzqvszXB4--

--===============2006528570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2006528570==--
