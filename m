From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 3/8] regulator: core: Expose some of core functions
Date: Mon, 17 Jun 2019 16:32:59 +0100
Message-ID: <20190617153259.GZ5316@sirena.org.uk>
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GjiSaFH9IIUbbImY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190603235904.19097-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--GjiSaFH9IIUbbImY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2019 at 02:58:59AM +0300, Dmitry Osipenko wrote:
> Expose some of internal functions that are required for implementation of
> customized regulator couplers.

>  include/linux/regulator/driver.h | 11 ++++++

I'm a bit dubious about exposing any of this but there's no way we
should be exposing it directly to random drivers, this needs a new
header so it's more obvious that normal code shouldn't be using these
interfaces.

--GjiSaFH9IIUbbImY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HsqoACgkQJNaLcl1U
h9A0Jwf+IR3w3BeDt0vdH+/tUjf9Ma255H7SF8BeBA+QxDBtM2j5UeC3xo7WVFBM
J8RwyLm3u2q84WMZ4G2VD+jQD1BFEdyFOcD0Qa3JMCg07qJty29rwxrlR3H7TwtA
B56FIFL4l3buz2un6cybfGKXNDmSRi8G37g41EnTry7TwtdIJJmK4zGeawbMNBzg
2O2b34F1+V9+Oq8Jv/Ysl+Tl9gDIo0M4fqlLBtV6I5D7vA73OyamjvcRlBNqnXys
X8uXAO0/BI+Ghb5OPb9P7ljHLvlI0lwv/gd7Qhfc0otz+wAqReoJl5kMz3KhAmtt
Vkf2MxU0jPJupMmknxRUVwkCNqg3hw==
=Wtow
-----END PGP SIGNATURE-----

--GjiSaFH9IIUbbImY--
