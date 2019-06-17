From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 6/8] regulator: core: Don't attach generic coupler to
 Tegra SoC regulators
Date: Mon, 17 Jun 2019 16:44:55 +0100
Message-ID: <20190617154455.GA5316@sirena.org.uk>
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="27E2kr7c9faIxYHh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190603235904.19097-7-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--27E2kr7c9faIxYHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2019 at 02:59:02AM +0300, Dmitry Osipenko wrote:

>  static int generic_coupler_attach(struct regulator_coupler *coupler,
>  				  struct regulator_dev *rdev)
>  {
> +	/*
> +	 * Generic coupler isn't suitable for NVIVIA Tegra SoC's, at least
> +	 * for now. Hence filter out the unwanted regulators as they shall be
> +	 * managed by a platform-specific coupler.
> +	 */
> +	if (of_property_read_bool(rdev->dev.of_node, "tegra-core-regulator") ||
> +	    of_property_read_bool(rdev->dev.of_node, "tegra-rtc-regulator") ||
> +	    of_property_read_bool(rdev->dev.of_node, "tegra-cpu-regulator"))
> +		return -EPERM;
> +

I'm having a hard time loving this as it requires explicit DT changes
for implementation.  I'm thinking that since the couplers are going to
need to be built in it'd be better to make sure that any custom ones get
registered first and then only bind the generic coupler to anything they
reject.

--27E2kr7c9faIxYHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HtXYACgkQJNaLcl1U
h9Cs2gf/S5a8DWJTtoEHbG3ws7VHQpSeAm4iqr2UgbzOBEkdCHLdjK0r2Iu3LU2l
KpNbc46t5ZXSQjLIuQ3apaG1mBvinvL5AAX93z4uxez5NAnREGp6NbbP2Ph0bfBe
BMNr3a8K1FBZdaqi2lUjFJS1ZWaUB2Npz32XrgD4Cmhlw+y1Rrl7NPT9HztYaCa5
Jc7shPryXFXmczy12EARskXg2bcLlQ/Ne92dHRXKZEn2hMwW/1ehTNHadMHHBLjT
bikjaqGSNIvd9LlxcbzpBvukrgCaaT8ENLHPCVmeB3gag3n55alTU5ZnUIhpAXyp
eaXOfvK5Zmo08r+D59q1tU61z1s0JA==
=ZHI+
-----END PGP SIGNATURE-----

--27E2kr7c9faIxYHh--
