From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/15] ARM: dts: tegra: fix PCI bus dtc warnings
Date: Tue, 13 Jun 2017 16:51:54 +0200
Message-ID: <20170613145154.GB20577@ulmo.fritz.box>
References: <20170322020313.24338-1-robh@kernel.org>
 <20170322020313.24338-8-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170322020313.24338-8-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2017 at 09:03:06PM -0500, Rob Herring wrote:
> dtc recently added PCI bus checks. Fix these warnings.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> Sub-arch maintainers, please apply to your trees unless arm-soc wants=20
> to take the whole lot.
>=20
>  arch/arm/boot/dts/tegra124-apalis-eval.dts | 2 +-
>  arch/arm/boot/dts/tegra124-apalis.dtsi     | 2 +-
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts  | 2 +-
>  arch/arm/boot/dts/tegra124.dtsi            | 4 +++-
>  arch/arm/boot/dts/tegra20-harmony.dts      | 2 +-
>  arch/arm/boot/dts/tegra20-tamonten.dtsi    | 2 +-
>  arch/arm/boot/dts/tegra20-tec.dts          | 2 +-
>  arch/arm/boot/dts/tegra20-trimslice.dts    | 2 +-
>  arch/arm/boot/dts/tegra20.dtsi             | 4 +++-
>  arch/arm/boot/dts/tegra30-apalis-eval.dts  | 2 +-
>  arch/arm/boot/dts/tegra30-apalis.dtsi      | 2 +-
>  arch/arm/boot/dts/tegra30-beaver.dts       | 2 +-
>  arch/arm/boot/dts/tegra30-cardhu.dtsi      | 2 +-
>  arch/arm/boot/dts/tegra30.dtsi             | 5 ++++-
>  14 files changed, 21 insertions(+), 14 deletions(-)

Doesn't look like ARM SoC took the lot, so I've applied this to the
Tegra tree for v4.13.

Thanks,
Thierry

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk//AkACgkQ3SOs138+
s6GiPQ/+PEkQJnQAHA9kGk/+E/q3BR66VEKXbDZoP3m8STZqUxfY2LHYwm7YGW9E
IHdTNejAoUaRIHr12kXQoMh4IfZBIw0KBOtUZd2lN7NwCWk6h9+tQdKr54Fn/0xP
dVpojNso1Rb9oWZdgTBH1IEH2Dl2M6cAEBEUeYbY6wr/FgQ1OHZuxv1t1PYSFs9A
ZPFpqpKty0awAexL933JFMSCRVTRxIbsFOm3pkSNWc/U92U60I86/px/YYAOqA3a
Bbd/AW4O/GTegrhFSpmtbmjoZEQZmOq/+zflG/DgE5/Fnh4x2KH0sHJdceCddwlc
spIfwGmIgTbIDvEcrUmX4O8nOvSoIORCONIwKT5n6st+fLhR1928Q3DHm/23yh3Z
hqufb0CKHYDqzh9C8C67JVrQxTbGoMvp/5Wq0ti8cGYUIMP6lPiOx2exdiWl1kBa
F4cX8WriTY2yX2WgVgQ9051C50biO9CdY5mvfg/PoyWgg1h7FpJ/cX7elP0/Y3QL
3KPRk23gadKcIVLkTKbj/bvARaZ9TUvMfI/6vcCUCPvUKwJKEzW49JiKsAIqulm7
ZL73523gKZRKgQWtf1L0QOpm3jGt8yCKq7ALJ4S9GwtSJ0zTFDYB8DQY+zCklqD7
oS1FpFT3RulWldtwhXl9tx93ocSFUdVrPOrEDdYagBpwHkmDUxc=
=+27o
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
