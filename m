From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 14/29] memory: tegra: Add interconnect nodes for
 Terga20 display controllers
Date: Tue, 19 Nov 2019 07:34:27 +0100
Message-ID: <20191119063427.GG2462695@ulmo>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-15-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="I3tAPq1Rm2pUxvsp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191118200247.3567-15-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--I3tAPq1Rm2pUxvsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:02:32PM +0300, Dmitry Osipenko wrote:
> Add initial interconnect nodes that allow display controller driver
> to perform memory bandwidth requests using interconnect API.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra2=
0.c
> index a8098bff91d9..dfcd9fdb7ce7 100644
> --- a/drivers/memory/tegra/tegra20.c
> +++ b/drivers/memory/tegra/tegra20.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
>   */
> =20
> +#include <dt-bindings/interconnect/tegra-icc.h>
>  #include <dt-bindings/memory/tegra20-mc.h>
> =20
>  #include "mc.h"
> @@ -280,6 +281,17 @@ static const struct tegra_mc_reset_ops tegra20_mc_re=
set_ops =3D {
>  	.reset_status =3D tegra20_mc_reset_status,
>  };
> =20
> +#define TEGRA20_MC_ICC(_name)				\
> +	{						\
> +		.name =3D #_name,				\
> +		.id =3D TEGRA_ICC_MC_##_name,		\
> +	}
> +
> +static const struct tegra_mc_icc_node tegra20_mc_icc_nodes[] =3D {
> +	TEGRA20_MC_ICC(DC),
> +	TEGRA20_MC_ICC(DCB),
> +};
> +
>  const struct tegra_mc_soc tegra20_mc_soc =3D {
>  	.clients =3D tegra20_mc_clients,
>  	.num_clients =3D ARRAY_SIZE(tegra20_mc_clients),
> @@ -290,4 +302,6 @@ const struct tegra_mc_soc tegra20_mc_soc =3D {
>  	.reset_ops =3D &tegra20_mc_reset_ops,
>  	.resets =3D tegra20_mc_resets,
>  	.num_resets =3D ARRAY_SIZE(tegra20_mc_resets),
> +	.icc_nodes =3D tegra20_mc_icc_nodes,
> +	.num_icc_nodes =3D ARRAY_SIZE(tegra20_mc_icc_nodes),
>  };

As I mentioned, we already have most (if not all) of the information
that we need for this in the various struct tegra_mc_client tables.
Those tables also contain some definitions for latency allowance
registers that we are eventually going to need to do more tweaking as
you suggested in your cover letter.

Thierry

--I3tAPq1Rm2pUxvsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3TjPIACgkQ3SOs138+
s6EdSBAAkJq6NUF8h85zOp4aN7BmEM9zr6aQU87PcpheYtxkxBSWJB3FL3ZbULKr
uWUELJntyp3KXLEuosHFkUZTpvhzDhhyVi5pZ9r45M45uGgZqO1pMPunN9Ha1Uku
8RzxboJvFEGLAok5/9XW9tsotQ/wjhRQKIQWgzGfxLz2jFEWF0nPc5akod1RHQTz
dcmDT9D9gDXJqiAHJINlHxfA6O+pkTI3s7K2qr0O9C4ao+xgSOqcjWqr0yCOggw2
GSerhri3lwwbEAQk8FMi10nIU0gD8DDOD3iVGNqnR6djOzkZMMEfG2i5RzWzHk7G
ijkE6CnihiZwbDIUKdE9XBQGOp+fdEGnaznERMG1GWyi68u+nSmkGDnCtivJkL8j
yur3Wdk2RoLyVii0RScej4aAndbyVNhRslgPEhu0hs1e6YNI44L1i6LcAZFck87N
q/KQl6aiOpVajQ+7eiHgHOeYQYGXcz/GGRWToOmo9RHAu1gMqVdG03wgpAKDYkkQ
ls3DMn/qSgfH6YeuKWPes9x4gQgXtAtx22hlXxXC3P5cSw4XWXpiQFv9YLN3I/zs
SLrm0uaV8jsjyI0fF8dWO2RWQMlkyKj/kGQIL44ZRiYgO4iop1Rc3dIUPpn/NtYe
bOPFW64ShM7Ex2qHSHhiHnv60kq1YqYAUo1mxFa7XE12ygIkn3s=
=85iP
-----END PGP SIGNATURE-----

--I3tAPq1Rm2pUxvsp--
