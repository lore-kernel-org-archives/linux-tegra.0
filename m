From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/3] thermal: tegra: remove unnecessary warnings
Date: Wed, 28 Nov 2018 11:12:27 +0100
Message-ID: <20181128101227.GB20723@ulmo>
References: <1543383877-20555-1-git-send-email-wni@nvidia.com>
 <1543383877-20555-2-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543383877-20555-2-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2018 at 01:44:35PM +0800, Wei Ni wrote:
> Convert warnings to info as not all platforms may
> have all the thresholds and sensors enabled.
>=20
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/thermal/tegra/soctherm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

If these are all optional anyway, why even keep the informational
messages? While those may not show up as warnings in the log, they will
still be unconditional noise in the kernel log. Do we really want that,
or should we just trust that the DT is correct and shut up if optional
thresholds and sensors are not present?

Thierry

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv+agsACgkQ3SOs138+
s6ESDQ//Ze1+ZFdOHnDlT9nhm9ABrC0HbFBZsMso1CGMvjVW0QrDgKweNRZ7/i91
yV4tnx7tZO+uVUAxq7aNbkc5F4iKqw7YRZmspoGeLLa3JW2QSirupUQAFZ+8vavJ
K8hH3xJli0ratf1G6D9tamiVeCAT0bt7m5+3vEakb9oP/VW5szFeNBWWsOKeW44o
oritFGI3aenXRZzcD8dSduZlNz5mu7/iDamvcydw+s0haGbP5UzDKEcciym+tVH0
w1WQzKLBlPnLG9K23pMU9sv01nHIXM8wpsg3S6Um9k4AtDZslH2pMgKAiXdL8hpf
HL8u2HUFTgou/fKPSaLElU7/TNYtCczLvN+QyqSsfUOOBakj7vfJ1LbirReYUxiH
fHF2Bb04MwBAs2brFAQUlXRA8eIGISZS0Tyuk5Se6rmNcpt1/TRE3i7ckquTuBpU
R5++c34lzGYBUi9U9TWVhN2rHvw/g0/u6XJB+6h9wB4EnkS5C8a9FuvBFd08zeYo
vutg113fNbAeBKGzYAeQYQIZqLR/XRzgfKVoTXk1nafJP9sFhf98qeorlSN4NBS2
aC8dJpDWmu+JYZ6rkM3WvSXcp64VJd/UBj/njVkbI3QT+y3I6ZcTE1JYJONRh0UW
gkOZQl3Vs0XvCHazbbVUhqadWO2aaQRYM2FW5wrl5x9/TjpJZkc=
=mRFi
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
