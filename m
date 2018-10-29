From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] mfd: tps6586x: Handle interrupts on suspend
Date: Mon, 29 Oct 2018 10:53:31 +0100
Message-ID: <20181029095331.GA26118@ulmo>
References: <1539955373-13735-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1539955373-13735-1-git-send-email-jonathanh@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2018 at 02:22:53PM +0100, Jon Hunter wrote:
> From: Jonathan Hunter <jonathanh@nvidia.com>
>=20
> The tps6586x driver creates an irqchip that is used by its various child
> devices for managing interrupts. The tps6586x-rtc device is one of its
> children that uses the tps6586x irqchip. When using the tps6586x-rtc as
> a wake-up device from suspend, the following is seen:
>=20
>  PM: Syncing filesystems ... done.
>  Freezing user space processes ... (elapsed 0.001 seconds) done.
>  OOM killer disabled.
>  Freezing remaining freezable tasks ... (elapsed 0.000 seconds) done.
>  Disabling non-boot CPUs ...
>  Entering suspend state LP1
>  Enabling non-boot CPUs ...
>  CPU1 is up
>  tps6586x 3-0034: failed to read interrupt status
>  tps6586x 3-0034: failed to read interrupt status
>=20
> The reason why the tps6586x interrupt status cannot be read is because
> the tps6586x interrupt is not masked during suspend and when the
> tps6586x-rtc interrupt occurs, to wake-up the device, the interrupt is
> seen before the i2c controller has been resumed in order to read the
> tps6586x interrupt status.
>=20
> The tps6586x-rtc driver sets it's interrupt as a wake-up source during
> suspend, which gets propagated to the parent tps6586x interrupt.
> However, the tps6586x-rtc driver cannot disable it's interrupt during
> suspend otherwise we would never be woken up and so the tps6586x must
> disable it's interrupt instead.
>=20
> Prevent the tps6586x interrupt handler from executing on exiting suspend
> before the i2c controller has been resumed by disabling the tps6586x
> interrupt on entering suspend and re-enabling it on resuming from
> suspend.
>=20
> Cc: stable@vger.kernel.org
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/mfd/tps6586x.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvW2JcACgkQ3SOs138+
s6Fcfg/9EKHW8lkLK3mjMz9SH44+nGJILn73hgwVxaklN7YndT/AYOcMgFNiW3Og
PUqWzkj3SKdMiyBzym3Yupe2J9O3qOJZt/a+wd3hW6FHBmNcXwxqF6bdxX16+BD6
84B/mNRgBxczH+7R1MALY+SWXPtd+IQfNvmMKszUKtR10z1lFXdcCsbtJzJ843+l
4N8Tl0j3qvK2hdhSPnK/0Z3y/ZYwV7ghnulSovkKZQ24aJpcWiJKYjLlXKuEsc6n
T3H3Eztryix5MyiSlIGHtaHuKjHdIEUIlJ+Sit72cHfjm+wXFVXelPQfruAA6ivN
mRKbA6W4CSrmTOG2q78hwxQx0dwZwUtgy1SofUQaHH3M90kOkEokEOwR2wQ2cL5T
1RfAk/BLMYqp9fhlWTxxQ9x/r7VZOyvE0PplFuLcE32d66RNquhGV52d3FY/B8ir
eIROIfFGtJtYx16tCzc1Sg+xjPxPX5Nau6wcomrJXstFpLj1Lzh6Uyi7KQH+KTKs
sn3a5b0HijoZ5EfM1l6gN7KL1CKXltOlx1JIWbFLeyhZh370XL7laGagoCc4ap0+
+0Epku2l4Pphi/DIPKQKN3oUGWkU+tNHWOHwtypmHGq9S3TdtJdA/jy+vcV6Hx2g
CmZFo+RkJi1CJhGmBRRBEImLsvm9Za7Cap1Mp2sFpxFVmJWSXgY=
=A/iL
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
