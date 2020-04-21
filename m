From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH v8 6/9] media: tegra: Add Tegra210 Video input driver
Date: Tue, 21 Apr 2020 22:47:05 +0200
Message-ID: <20200421204705.GB3233341@ulmo>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
 <1587427874-3291-7-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1587427874-3291-7-git-send-email-skomatineni@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 05:11:11PM -0700, Sowjanya Komatineni wrote:
> Tegra210 contains a powerful Video Input (VI) hardware controller
> which can support up to 6 MIPI CSI camera sensors.
>=20
> Each Tegra CSI port can be one-to-one mapped to VI channel and can
> capture from an external camera sensor connected to CSI or from
> built-in test pattern generator.
>=20
> Tegra210 supports built-in test pattern generator from CSI to VI.
>=20
> This patch adds a v4l2 capture driver with media interface for
> Tegra210 built-in CSI to VI test pattern generator.
>=20
> This patch includes TPG support only and all the video pipeline
> configuration happens through the video device node.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/Kconfig          |    2 +
>  drivers/staging/media/Makefile         |    1 +
>  drivers/staging/media/tegra/Kconfig    |   13 +
>  drivers/staging/media/tegra/Makefile   |    8 +
>  drivers/staging/media/tegra/TODO       |   10 +
>  drivers/staging/media/tegra/common.h   |  262 ++++++++
>  drivers/staging/media/tegra/csi.c      |  605 +++++++++++++++++
>  drivers/staging/media/tegra/csi.h      |  149 +++++
>  drivers/staging/media/tegra/tegra210.c |  709 ++++++++++++++++++++
>  drivers/staging/media/tegra/tegra210.h |  190 ++++++
>  drivers/staging/media/tegra/vi.c       | 1123 ++++++++++++++++++++++++++=
++++++
>  drivers/staging/media/tegra/vi.h       |   85 +++
>  drivers/staging/media/tegra/video.c    |  151 +++++
>  drivers/staging/media/tegra/video.h    |   31 +
>  14 files changed, 3339 insertions(+)
>  create mode 100644 drivers/staging/media/tegra/Kconfig
>  create mode 100644 drivers/staging/media/tegra/Makefile
>  create mode 100644 drivers/staging/media/tegra/TODO
>  create mode 100644 drivers/staging/media/tegra/common.h
>  create mode 100644 drivers/staging/media/tegra/csi.c
>  create mode 100644 drivers/staging/media/tegra/csi.h
>  create mode 100644 drivers/staging/media/tegra/tegra210.c
>  create mode 100644 drivers/staging/media/tegra/tegra210.h
>  create mode 100644 drivers/staging/media/tegra/vi.c
>  create mode 100644 drivers/staging/media/tegra/vi.h
>  create mode 100644 drivers/staging/media/tegra/video.c
>  create mode 100644 drivers/staging/media/tegra/video.h

Acked-by: Thierry Reding <treding@nvidia.com>

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fW8gACgkQ3SOs138+
s6FelRAAs4R2//XI/InkuB2gn+oXihgPqbXskXdym+k+JEyLU97w8L64/i25yIQf
/eCEE/fTZfGjTJy60PYVYMcai5sq2Kd9uT6iosuX6Z651yZOEAuQ52bRvS7oo9Pn
hTN2jCa6U9NQFrGXLyhLU5gAyN8lyuDAsOO8VB6ZU3BXcVlcfgPD2QX+CT15fW3r
UvpFWvyvwJDfZK8ndognGlxQ4ALBuUJOlRGWgcTPHqX1puxQC4aj8U7Edjxvy87D
3zC9vbhSKshhMKC3DPatFGzfVkX/mKsXSHIcbIeGbaAECWLBuEHe9GZBb5IcZR14
o6OE+o5vY3iLbbgpKsUvDH3uWy9W7KANO5LsiE3gzE9c49wzZ09ckwmY/oStFTEf
1wHXoKEnemDvXtQ4GsMWcjuI3c/uxU8nWSSNvQW2cSFdAy3R4O+i2anjaVqsGYnb
X0MfrmXZoLZg/cEVb9OCw0c3PGbQkvtxOCIWqqMKL8pKZMN5Hy6pAqnIvsmY4rEO
Q58bftmMOLaF0LS3YTRbnZR2wHIpWCrb+zOM77otioRSlt1xGfUKjlqtrogckuMU
3UwlCmOjns1TsWCIaDQuv32UxKfL02Megzr4vB4qRnBVdY4sJRZUavDeeF1UjhM7
Ll1Rl/+jeTjZIwUeLk0HV/PEBhKmNvspHZvb62Bz5nLSAAAaiqs=
=WO+F
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
