From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 2/7] soc/tegra: Add Tegra194 SoC configuration option
Date: Thu, 8 Mar 2018 14:45:45 +0100
Message-ID: <20180308134545.GF3529@ulmo>
References: <20180220115812.24108-1-mperttunen@nvidia.com>
 <20180220115812.24108-3-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ChQOR20MqfxkMJg9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180220115812.24108-3-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: jonathanh@nvidia.com, robh+dt@kernel.org, mark.rutland@arm.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pombredanne@nexb.com
List-Id: linux-tegra@vger.kernel.org


--ChQOR20MqfxkMJg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2018 at 01:58:07PM +0200, Mikko Perttunen wrote:
> Add the configuration option to enable support for the Tegra194
> system-on-chip, and enable it by default in the arm64 defconfig.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/configs/defconfig |  1 +
>  drivers/soc/tegra/Kconfig    | 10 ++++++++++
>  2 files changed, 11 insertions(+)

defconfig changes should be in a separate patch because they need to go
into different branches in the ARM SoC tree. I've fixed that up, but
maybe something to keep in mind for next time.

Thierry

--ChQOR20MqfxkMJg9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqhPogACgkQ3SOs138+
s6HWWQ//R3yF+Lj/Mohu5zTgSXdYRXk4XfP0c4PVOlc8MOJkWGdoo7nS+fHwfLmY
GAEjY3HkRpQ0iwlA6he4hwGDPJEMvaPiopmhOdYEgJXwpREpLkJHBZaE5ts6azxH
44MpdgAF2ls0jyqKM1rOw7Il/G7itDsREMkl70tNfwPJ1LSMpjapn74zYVtl9TVH
sksQvRb0cjho9s+9s/eemTbQctqFML9pjWP3AWbIvhyT3LHHCg5Q6BUsSuhsBgRb
Wa1iWD6t9pOKmqkZq/6dfgrVcK7E1JMG6k7E91R1OvQCNMFlARFLYnuU28T96UpE
HJSpNvNST++lqmGZ4hVaUusgobvSWwwiI4SQWqcuyx2bS3Dzrih2IUVuME6vrqkd
oINZCTOdL4qShJ9k0hBU9VaxnZhjkg+qZ40ZW0mM+F7rCPSWTp9vUUyV4MjAo2OB
p9twbBMcNyRLRFL7oTaA3ygsyqIgU7MbjM5u39MMwA3TMyQ5jt7pWcpTI4xP7sz5
BknWf4K8QEwY7PEdZiXJOW2gAYnKUv/ycrZfjCcd2CQvYTGAwwyUcc5Xaab4OW/j
H0zD6LOJMpFVYpB1LedLqmxVKMS6GExQZiH0qgHDuIx0rm6sR9NgNAKSpspPF4FA
04WRyLobbrND8CLyHGqzJFEl0mf33+BwG4Mx3bmu8fp0NBvnUow=
=gBJs
-----END PGP SIGNATURE-----

--ChQOR20MqfxkMJg9--
