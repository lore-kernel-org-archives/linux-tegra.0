From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 02/21] pinctrl: tegra: Add write barrier after all
 pinctrl register writes
Date: Mon, 12 Aug 2019 11:20:56 +0200
Message-ID: <20190812092056.GD8903@ulmo>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565308020-31952-3-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 04:46:41PM -0700, Sowjanya Komatineni wrote:
> This patch adds write barrier after all pinctrl register writes
> during resume to make sure all pinctrl changes are complete.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1RL3gACgkQ3SOs138+
s6FnFhAAkgf/BiMUj/jlPfe6CGMU/2j+3heSekAmXhJfo1aq1v5F2JenrTTU3rdW
9lBsT0PnAgIGsSz/0eny9BCg2LksG19hn2zB94YlgA/j4eWgh+zEm0eXll4V1gXR
ZyADhb9TCC3Ez5OrMXwt/31F5qXK/npVjeTvXEAZEt2mHHYj4wniS1s76DXNBMxe
TZwHmDKVqVf8swjWnNzNthITXG79YNl4M1yBCeiKHiLPkAszrX0V6JVJv+Leq7cL
xAztBfPrZfXx5kX9rFYeqWwCPBx5oqQL+pMDyhqafcyIiB1wMvXPUGHIxcTitXHX
AHsdazSNFfK394leUuNQ/b8WEBCjw9h4rL4KQ05spl3J9WJSrMI9cf2eHhWx6O1R
g6MNZ+nZ1LbSmiIfhcqy0Uit364/vXqj3Luzu7FVa1ld15EkdhmWAaO3gWHWLbLP
VEPviaC+byT6g7Sd5Z3Hv/BflOC+McrY2oBASo1D8tQecmKJI6JPJ0A4MkHLOZJI
v2w6ohTCcdzy6zt7Z8IIBsFFwtAL5oGxJ3TdPaDKNh523mQSjyoyGjpnNNgHb0N6
sGoOGsdV4K+6Fx6i0TQOFeBPDkwmbWwnv6Jcy2ASqI44N2CiAUd2Vfg+9liX47BY
vRHKJTkliMrmxh+XfarOWRT5RfaGJSLVU4hUQcXi3aAORedVhm8=
=UfG9
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
