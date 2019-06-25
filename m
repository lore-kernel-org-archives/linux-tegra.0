From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 2/5] regulator: core: Expose some of core functions
 needed by couplers
Date: Tue, 25 Jun 2019 12:19:47 +0100
Message-ID: <20190625111946.GP5316@sirena.org.uk>
References: <20190623210835.26281-1-digetx@gmail.com>
 <20190623210835.26281-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pSb/ns2SnWJqkKHb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623210835.26281-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--pSb/ns2SnWJqkKHb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2019 at 12:08:32AM +0300, Dmitry Osipenko wrote:
> Expose some of internal functions that are required for implementation of
> customized regulator couplers.

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-couple-api

for you to fetch changes up to d22b85a1b97d12a4940ef9d778f6122546736f78:

  regulator: core: Expose some of core functions needed by couplers (2019-06-25 12:15:35 +0100)

----------------------------------------------------------------
regulator: Coupling API

This series introduces a way of specifying a customized regulators coupler
which is necessary for cases like a non-trivial DVFS implementation.

----------------------------------------------------------------
Dmitry Osipenko (2):
      regulator: core: Introduce API for regulators coupling customization
      regulator: core: Expose some of core functions needed by couplers

 drivers/regulator/core.c          | 194 ++++++++++++++++++++++++++++----------
 drivers/regulator/of_regulator.c  |  63 +++++++++----
 include/linux/regulator/coupler.h |  97 +++++++++++++++++++
 include/linux/regulator/driver.h  |   6 +-
 include/linux/regulator/machine.h |   2 +-
 5 files changed, 287 insertions(+), 75 deletions(-)
 create mode 100644 include/linux/regulator/coupler.h

--pSb/ns2SnWJqkKHb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0SA1IACgkQJNaLcl1U
h9B/agf/ZN1FfEH/kisPsw/QpppR+haTC2xYUvHQmelY29bbY2yXwjPYBpXl8Ztk
/rE6ZjD3gCdXzuBBSCyd8P+RTnkb/18NynDJAVv9WLe6AOZ/e1UYB4d7mh0O/IAB
bjE+IiBMcwzgaMBnBTyF+EJ8JmhWkkEl9Z/FE0RcXT4oiTAU6oHSQ8Xs96H9/374
Hqf9QfEge+nvqAdVwsmhJ2cbb+BXbGDfmcMRJjWv0swcRfJqDrLTFn6ATq/i5o7j
ni2sOaGeQj0x5dhMUUT8oq4+ElSHJaJft2jpwb3xRdCehu+UYdLWeP13jwiS0afJ
NIcKyExMiyb/PEYmhAN57EljvVIoGA==
=6Ntz
-----END PGP SIGNATURE-----

--pSb/ns2SnWJqkKHb--
