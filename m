From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: fix link errors with PMC disabled
Date: Mon, 20 Mar 2017 12:10:46 +0100
Message-ID: <20170320111046.GA20431@ulmo.ba.sec>
References: <20170320091405.1041129-1-arnd@arndb.de>
 <e17797ae-35db-8254-ed38-c90b9d29ff0d@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e17797ae-35db-8254-ed38-c90b9d29ff0d@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Laxman Dewangan <ldewangan@nvidia.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2017 at 09:47:39AM +0000, Jon Hunter wrote:
> Hi Arnd,
>=20
> On 20/03/17 09:13, Arnd Bergmann wrote:
> > With the new Tegra186 PMC driver merged, anything that relies on the pr=
evious
> > PMC driver fails to link when that is disabled:
> >=20
> > arch/arm/mach-tegra/pm.o: In function `tegra_pm_set':
> > pm.c:(.text.tegra_pm_set+0x3c): undefined reference to `tegra_pmc_enter=
_suspend_mode'
> > arch/arm/mach-tegra/pm.o: In function `tegra_suspend_enter':
> > pm.c:(.text.tegra_suspend_enter+0x4): undefined reference to `tegra_pmc=
_get_suspend_mode'
> > arch/arm/mach-tegra/pm.o: In function `tegra_init_suspend':
> > pm.c:(.init.text+0x1c): undefined reference to `tegra_pmc_get_suspend_m=
ode'
> > pm.c:(.init.text+0x74): undefined reference to `tegra_pmc_set_suspend_m=
ode'
> >=20
> > ERROR: tegra_powergate_sequence_power_up [drivers/ata/ahci_tegra.ko] un=
defined!
> > ERROR: tegra_powergate_power_off [drivers/ata/ahci_tegra.ko] undefined!
> >=20
> > Making the definition depend on the presence of the driver makes it bui=
ld
> > again, though that might not be the correct fix.
> >=20
> > Fixes: 854014236290 ("soc/tegra: Implement Tegra186 PMC support")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> A fix was also submitted by Krzysztof [0].
>=20
> Thierry, what's your preference? Maybe Arnd's approach is better.

Yes, I prefer Arnd's patch because it is more consistent with how we
deal with this kind of dependency elsewhere.

Thierry

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljPuLIACgkQ3SOs138+
s6GsPxAAiuHDpt1vAIINt3n2tr3UrsPV/USj2ICZBNRkFNX4aKJ0gQKAb6VUQNei
YERCiYboudLlfGNVnGvOnYsX12iH0XsAS2iu1T+imutttl5SSX1wF2GFxYekBQ9J
hb4qs82bQpLe17rANmd3auLISNqQSYnwsP/V9p1Z63OKnzK1lDNL9XZURZjZhyiU
bCehz2YU/CMoU/6/xObPmsM4HYnw7zEyTXbsYBi9zx7v4B0bvFtHqWxMopL04aKG
9h8so9Y6oA+j5fVnf4mIT138QiA4zRJ8rxeQ7fz84j83CIgj4fOI3au1YRA4K4Jk
9SOBMFOecvpDLhntNalPfRmBSmBGQXScdNKi4e1JONWPOUdqIzuM1ymzpSOuMmvh
lkUJ80cq1IizGrH1naYjNGsMzFuXClS1xgIOyfYbqSD829JXkS3SVnqfhpreMz59
JxPXVP1iDaqOGYHn5e3gXJFLC+/T55oDBR12eEa7L2gyn5QNwIFwTcJMNrPKXYIK
JJQgjiEoPb6TWoV3opaRtXkUVNXRy2tiZR2iscK4GQdLMrHANSX2BIycm5fzP1wY
GbR2YHlYSevhsR6vV4EC+NEjSI2DHUMYjUWIf2t7ankCT3jtBKR+PmUI90W5zSp4
kRbSx+CJj9gk5PMUvM0YQV1Pi/wY9FsKOFZoZQUI9uaBWBCKvcA=
=15Rh
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
