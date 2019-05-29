From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 01/12] irqchip: tegra: do not disable COP IRQ during
 suspend
Date: Wed, 29 May 2019 16:21:59 +0200
Message-ID: <20190529142159.GE17679@ulmo>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559084936-4610-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 04:08:45PM -0700, Sowjanya Komatineni wrote:
> Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 entry
> sequence and sc7 entry firmware is run from COP/BPMP-Lite.
>=20
> So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequence
> for Tegra210.
>=20
> This patch has fix for leaving the COP IRQ enabled for Tegra210 during
> interrupt controller suspend operation.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/irqchip/irq-tegra.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
> index 0abc0cd1c32e..deab3ba606e2 100644
> --- a/drivers/irqchip/irq-tegra.c
> +++ b/drivers/irqchip/irq-tegra.c
> @@ -53,18 +53,22 @@ static unsigned int num_ictlrs;
> =20
>  struct tegra_ictlr_soc {
>  	unsigned int num_ictlrs;
> +	bool has_bpmp_fw;

This seems slightly inaccurate to me. My understanding is that we need
the AVP/COP to enter/exit SC7 irrespective of whether it runs the BPMP
lite firmware. Perhaps something like "supports_sc7" would be a little
more accurate?

Other than that:

Acked-by: Thierry Reding <treding@nvidia.com>

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzulYcACgkQ3SOs138+
s6HEBw//Q+MADNzhRU304IXsiqDvLCwobymEQiOcOlGrqzB2r/Wbw2WGXy8gJM7v
A4HBsN6QVD7NQ4Ep1HdCV8LEUM2387snlUTC23wrt1rS6aW5d1vWrmpDi4o7ZM5I
rM5OxWYV/SJNwEXFrBByFdlS0YYfqE9ieW0ShnQV3tWgffxdHa7xE2+RBzkme2Mg
YWef8OTz/b5u7IvY/lGsu0+5g0JZwjLU2kf8WUwwr+5SzjxJwAJzgyV/pSUzu5Nu
tYXON2qpV+hqrNCQX/VYiRWa/UX85gZpIretuAYw68XMXGNRQR4WehPTHODO3Wx/
FV9o23TAJObsYYc7JDEJQXoPVOcm/kLE1fOdVXyWdlMoBUvOipQq73ZVFZQ06Rrv
3YjdQHpz7jZjPZgLcpJ4PFm1l4v9otPlgehF8/Iag+5t3Dhoq6XXMQAXRcjFI/et
v3+wcocAx0a7agqL0M9f2epLwttsGsTW0bfPM7sEJMooI8pl8WgMlNFwEpBdOsTv
0kvzZvMGePF8aTBhWXEjZ1YWFqEKNBWPweKO2o+HEMWkTgCN3UtnKa6dfTQNyF6Y
Cgd1vj8doMGZ7KTKev/kqHZTSmpnlsystOPScHyqvD92ULka+DJVphlmQLSbbdli
dO4AUVPasg/Mulxfv4j292ptk8bt+P6o2oHTOpLTSTGqu6DvLyw=
=J8le
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--
