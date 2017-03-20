From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: fix link errors with PMC disabled
Date: Mon, 20 Mar 2017 13:40:56 +0100
Message-ID: <20170320124056.GA22463@ulmo.ba.sec>
References: <20170320091405.1041129-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170320091405.1041129-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2017 at 10:13:06AM +0100, Arnd Bergmann wrote:
> With the new Tegra186 PMC driver merged, anything that relies on the prev=
ious
> PMC driver fails to link when that is disabled:
>=20
> arch/arm/mach-tegra/pm.o: In function `tegra_pm_set':
> pm.c:(.text.tegra_pm_set+0x3c): undefined reference to `tegra_pmc_enter_s=
uspend_mode'
> arch/arm/mach-tegra/pm.o: In function `tegra_suspend_enter':
> pm.c:(.text.tegra_suspend_enter+0x4): undefined reference to `tegra_pmc_g=
et_suspend_mode'
> arch/arm/mach-tegra/pm.o: In function `tegra_init_suspend':
> pm.c:(.init.text+0x1c): undefined reference to `tegra_pmc_get_suspend_mod=
e'
> pm.c:(.init.text+0x74): undefined reference to `tegra_pmc_set_suspend_mod=
e'
>=20
> ERROR: tegra_powergate_sequence_power_up [drivers/ata/ahci_tegra.ko] unde=
fined!
> ERROR: tegra_powergate_power_off [drivers/ata/ahci_tegra.ko] undefined!
>=20
> Making the definition depend on the presence of the driver makes it build
> again, though that might not be the correct fix.
>=20
> Fixes: 854014236290 ("soc/tegra: Implement Tegra186 PMC support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/soc/tegra/pmc.h | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)

Applied, thanks.

Thierry

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljPzdUACgkQ3SOs138+
s6EaqA//RJrs1Eetl7TJD4ByrVMkeAEjv910u6pti4P6v25SJrpRwvnd5sxQXs+U
RNxcqehBPDlJcipe22nTQp6iCSs7nH6BXT4Wl2cr3KgNaPdnOp72eRqjayE2HAam
eTUDo6dqyHwfWB2K7k9z2xqwateDdxp/fOmsH9BzCcLnkqLWpAp9frN3xs4Bwipv
RIXppW1/fq5fybXkAN5hcQlgMN5Z0xlyq5qwOSfuA5xwEA3YDV0MJAoDMDwqDGjo
zYmUHX4HJpXeDaKlrrtNdlP7wSVLUhsqHvL3WJvG2EjQIEWlZUzRzvXzKyQInQYB
dE/VyGQGH3eGzZm5jDX6CtN+d2tjarlNmeOsvixMVmgZ0Cstt3ZELw09bjxb5UJv
yh1op14e+HzuOYNkOOpO0GkymXkLEzvDrhDZpp6pJlhPrySDUejNtFEtreNX7KwI
XLEPYzQZyrFPG0yJpB0O7CTXqVdzLJeqGTZjOPW9tX2EgM3bKzUoKUCcKFAfHt3J
o0h/UAiOfVtREtsi4Y0QzPa7bF2yq3mH5m4yC1Boe8bHqGUqOfCITfUVhz5jfEt7
bcj4iox71kFxDxhWuQywDxWvIZb+zuloJ0+kpWc85qsL1mYpF2e8fy1n5FH+FA4R
3OV5tJBYExF7r1XOJGj50lMkldQXd7n1s0Y8KyPrA1MumJAhfpg=
=1bGc
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
