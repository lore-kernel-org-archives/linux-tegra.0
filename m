From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 7/8] soc/tegra: regulators: Add regulators coupler for
 Tegra20
Date: Mon, 17 Jun 2019 16:46:32 +0100
Message-ID: <20190617154632.GB5316@sirena.org.uk>
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-8-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="039oG8jMepJcyEBX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190603235904.19097-8-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--039oG8jMepJcyEBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2019 at 02:59:03AM +0300, Dmitry Osipenko wrote:

> +config SOC_TEGRA20_VOLTAGE_COUPLER
> +	bool "Voltage scaling support for Tegra20 SoC's"

SoCs

> +	depends on ARCH_TEGRA_2x_SOC

Can we have an || COMPILE_TEST here please?

> +++ b/drivers/soc/tegra/regulators-tegra20.c
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Voltage regulators coupling resolver for NVIDIA Tegra20
> + *
> + * Copyright (C) 2019 GRATE-DRIVER project

Please make the entire comment a C++ one so things look more
intentional.

--039oG8jMepJcyEBX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HtdcACgkQJNaLcl1U
h9B0cgf+PFAOtZrfNkd5ty3QOvOIs+A0kjwXoqrJYQMgIIObO7EI9+RipxKuoDae
UUlOrx4BRvIRGTDJWwvHFNF2ADWvfMPCtdqX67ZA3drCWiPgEGUIJHbIiEXPIt19
IYBhcnbKGPfpeRTtOWXGfwwOpA+tWgluz5bvmKPLDYkZ8m8MuSkxy4YIWuXEk5+x
Cgy9CvTfWlk2kZm+a0MocWRlKbTLy7Y499xLXDwBTvSC94Ci0Jp8BGmKR7oJwu45
cbgEnnXUvOURfP+vhjuh5id+SNXUqFz1tKI9aoXKef/t6EIkvlDiBcDZ+40MSbyD
SG+VI65FbmXV73iCH+VAQG0Jv+6wjA==
=eKZo
-----END PGP SIGNATURE-----

--039oG8jMepJcyEBX--
