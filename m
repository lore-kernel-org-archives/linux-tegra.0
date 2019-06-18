From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 09/17] clk: tegra: support for saving and restoring
 OSC clock context
Date: Tue, 18 Jun 2019 13:51:42 +0200
Message-ID: <20190618115142.GL28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-10-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GU3/x65mZ6MFE8p3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560843991-24123-10-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--GU3/x65mZ6MFE8p3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:23AM -0700, Sowjanya Komatineni wrote:
> This patch adds support for storing OSC clock frequency and the
> drive-strength during OSC clock init and creates an API to restore
> OSC control register value from the saved context.
>=20
> This API is invoked by Tegra210 clock driver during system resume
> to restore the  OSC clock settings.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra-fixed.c | 14 ++++++++++++++
>  drivers/clk/tegra/clk.h             |  1 +
>  2 files changed, 15 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--GU3/x65mZ6MFE8p3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0I0E4ACgkQ3SOs138+
s6GxLw/+OxIXQLuP5OvaapQAKg6vVmpGZhVjAP62Q6c66ykv24Ph+jLXsJo+vpm9
jBeQhjpiEVGyPoc3ONfiOS0tvt4JvDNwChjxKw8YtVYShBYUDRi79JIgfrzhsZWX
vKSozb0EHtrjrjbZNUVIXYq64iblgqKk4KsYi4wDsfqMCiqNeV3I3d7IjDA4mNTt
qlGxvltMXgsrnUzJxGdLYW6GEag5eCuiF19nv/9+uq8Sb90Z1+CBo7NaAlO59545
m1RBSLnRMQ/TVrnX6PyfygZlXNFwfXAVr1Oxp2JIgtdKQcNombhVFitTJwF5eKMe
gf8silIq8AQrFxeZ9ojdh+A99GADYTg8WN81y6uFn1ZYyB557X9DGLRl4aYDeO6V
mJUTrOc/O5E9W+fZLUYDTNkiZ9MVUi1AK+H+xEitePlC0zKxcf4WdT7uAm36qWnv
EXhMxxebLGZGSbkS+iKGQ3PIT3ofPoQrn9We0Fu8vySuD+NOqP+MtfdsrbQ/PyYq
Qs85AGlkg5tYbxW3HVy4oTTFu/mB/pJW184oNDeHqf6kRzLFcVnoGdUF1qCvnEru
27OzodaP6Nv+af801lC6x7MaB2+RajmP4Ic5N83AtBEu+RVxyzd9zahR+uiCDPnC
tdstFpewSTYtgufqZiHqJIUSodRppqaJzigx6XqCwoylsyTVsIc=
=KKeu
-----END PGP SIGNATURE-----

--GU3/x65mZ6MFE8p3--
