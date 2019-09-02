From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 2/6] dt-bindings: PCI: tegra: Add PCIe slot supplies
 regulator entries
Date: Mon, 2 Sep 2019 13:38:35 +0200
Message-ID: <20190902113835.GE19263@ulmo>
References: <20190828172850.19871-1-vidyas@nvidia.com>
 <20190828172850.19871-3-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6e7ZaeXHKrTJCxdu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828172850.19871-3-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--6e7ZaeXHKrTJCxdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 10:58:46PM +0530, Vidya Sagar wrote:
> Add optional bindings "vpcie3v3-supply" and "vpcie12v-supply" to describe
> regulators of a PCIe slot's supplies 3.3V and 12V provided the platform
> is designed to have regulator controlled slot supplies.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> V3:
> * None
>=20
> V2:
> * None
>=20
>  .../devicetree/bindings/pci/nvidia,tegra194-pcie.txt      | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--6e7ZaeXHKrTJCxdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1s/zsACgkQ3SOs138+
s6FOWA/+L0+vUUclgoY9YfwR5cI+nK0iPHLC/9XLC8xZsVkBaeLEZPWXWlem7QsU
CpdhO7J9sCK8TEW1h8MVKzIhn88paNynYuOLRhjBVJM7hoGCsRNS2/laeeulEvy0
bgf7qphguM9m/sXkCcoj/wHfEyNcTrl71ZyYybG5OGxKMgawwLhdAh9iqNEHRHZX
iR1TfnjIZSANuXcQsEnfHNkFwozF+NDdv7gr11mJm0BrHBmT8XwSZm3xVdPPCXeT
m7rNkB+jtW3jCuxdfXSeUP1qptQT/ZtOdJuN+NudSaJOnV9KZ8CwNRoqWvWH3BFa
1NbR4A1FxlOPLZg9SK2ya8HJQ4xpqXmQBwoPTgDFyypCyouBIC9XK/zLBvhrEfkc
SRWS0nufk/ciXkMAJspPFmFpafr1TuMKlgLfQEQDoiaFBWozVSu3csBsg3917ejc
GimoR1APSzLYU0L85BLekUF+nth7RpGz+VY+eKMSfCUS18mcmUTjpiPw1klrbzex
UFQFCbbf6Sua5Ct5U5nL/uZmZFxj960SQo2d9I/HYbRSuS91D6t7SJvOtyeR1eRz
HVFc6AIBV1J64ogQ6oZsa73b1mvkY+vOuMaqdcEdUn2xrilg3x+LGCpj7Ph6drXU
wFBgvboTaI8RRMp1yZNvsv4HIX62CYDf3fLPVpYxuPr3ipMy6yU=
=3vWd
-----END PGP SIGNATURE-----

--6e7ZaeXHKrTJCxdu--
