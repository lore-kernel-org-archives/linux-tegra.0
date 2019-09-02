From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 3/6] PCI: tegra: Add support to configure sideband pins
Date: Mon, 2 Sep 2019 13:38:59 +0200
Message-ID: <20190902113859.GF19263@ulmo>
References: <20190828172850.19871-1-vidyas@nvidia.com>
 <20190828172850.19871-4-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="924gEkU1VlJlwnwX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828172850.19871-4-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--924gEkU1VlJlwnwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 10:58:47PM +0530, Vidya Sagar wrote:
> Add support to configure sideband signal pins when information is present
> in respective controller's device-tree node.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> V3:
> * Used 'dev' instead of 'pcie->dev'
>=20
> V2:
> * Addressed review comment from Andrew Murray
> * Handled failure case of pinctrl_pm_select_default_state() cleanly
>=20
>  drivers/pci/controller/dwc/pcie-tegra194.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--924gEkU1VlJlwnwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1s/1MACgkQ3SOs138+
s6GwEQ/8DQfqPImwI/sN8KkGlUTrymHeb5p1LcJjyObL3s5FzC1VNuPP6ztRPNMj
XUJ3C0LOyCBrPharGw9CyUpDmhzkhQaMqVmCekuocA6xMEQmG3ggIHaEW3wPwGwt
3evIIRgTAwoYT84m/q2cy/zOvLq8omwFGwuknOWcQCy6upDCKJt1hQAcnfg4+GQN
E/iGl21g1hfsZUlyGd9NAYZ2F9ZWbKaymoV+LmKRnB2R6U+D0dJb30w5oLnC+Gp/
2vtjAAa4c7re7ZG4j3/rzdOqzPjpJFa5KLHDV1I05lZi7rmyxmclmrhbrT0Fvwht
8l8lkb9WWcvAdpCv4aVPEqp/ocDN40uIPhqIwzjpbRmc28Z8/6Nc26Ps7xzn9WX1
yj7nQSQWkczWQPbNADrAlPCDpDBke/tzpNpjEX3IY7ltLvdCbV9p1LP3BU+aqCiV
nKcZIG1DMv70fmQ5ZZ9ln0ylERYt4c/69nGXiowdUNfwZ7/zD8tEhsmU332JHEOP
SGdAkxiz3K5m2MZ3DzyECyBcASTwZTWWzHsYmgqM2yFEOa1k1Ih7joY+nmd3xrAe
DnvcfZKW8dug/2zwdraLt/Dkju2bczWXHLVLhJpISEh8he9H1jsuZho7u+2wacQJ
2LZA7HIIANTX/M06bh+sbv6UG+WL7AImXDhDVpUqpuqmqDk3uaI=
=eL6G
-----END PGP SIGNATURE-----

--924gEkU1VlJlwnwX--
