From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/4] ARM: tegra: avoid section mismatch warning
Date: Tue, 11 Dec 2018 11:05:50 +0100
Message-ID: <20181211100550.GD14426@ulmo>
References: <20181210215856.2238253-1-arnd@arndb.de>
 <20181210215856.2238253-2-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181210215856.2238253-2-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm@kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--8w3uRX/HFJGApMzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2018 at 10:58:37PM +0100, Arnd Bergmann wrote:
> WARNING: vmlinux.o(.text+0x39ecc): Section mismatch in reference from the=
 function tegra114_gic_cpu_pm_registration() to the (unknown reference) .in=
it.rodata:(unknown)
> The function tegra114_gic_cpu_pm_registration() references
> the (unknown reference) __initconst (unknown).
> This is often because tegra114_gic_cpu_pm_registration lacks a __initconst
> annotation or the annotation of (unknown) is wrong.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-tegra/irq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I'm not seeing these. Do I need to enable any special options to trigger
these? Or are these just so new that I haven't run into them yet?

In either case, I see that this is called by tegra_init_irq() and that
does have an __init annotation, so this looks good to me:

Acked-by: Thierry Reding <treding@nvidia.com>

--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwPi/4ACgkQ3SOs138+
s6FLVQ/+NM4HKqTPuyuEUc0S1R5ieZZ6+FH1S1uUzhJVbjr3yp6GsVL8fkXR6dMv
4A0o92B1GuH8D/JKFi+Wy5U1JIRBokNkg+o2B358cTOHUUhKc4OQ2Q7/3gyNXJX6
0xCI6IBrG7nrsYrgGYuyl4/h0kuyffG2Ot0bxIBxkrfx/YHebKRUKebL6ociI7Q6
ZPYYhmbs7GM1XENuOSRhLvyfADDDHeYmevM3oOPaBHcaYZ5AxrkUlcQ4mhAdL7yh
k+TxI575WuGxSzs4lgRCA9qAjsKjR+BoLeaYA9b1PEW9PNxgoLq6w1EdK+p62ay+
EncuT4kzZmsa5BlY9ADbEIDel6t7PKF+dFljssnmutrB7V1WVav2mjXvbeBIRcl5
t0y7OJtG2+BMCMANxDvIvNZ2mNwI0awHGIzf9j9Dk8M6WsdLXB1og/i9VOFjL6fW
mRoJQRCw15a6xdxwAlOVBN81/+aocrNmF2c1u5kDcSgsjQqhMbGFR2Kq6ZBDQVeF
604EDZyQ/KX7+cn3RnojlCzTPo/ahhrb5kGO0ypJPEXoV8MuuUSXULAFblHmHF5S
Klrv3iPlnxB1xfZ1UubentR8gqZZeArXPJAdYPLZ2V4VA9U/2k6xAM6Mob+Y+dbK
1S7UktZGm9/20Yfq14rZ+DpNoPpjmg/Q/Kkd1VFCrKp5lMospsw=
=QpbD
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--
