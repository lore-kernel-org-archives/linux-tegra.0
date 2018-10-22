From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] mfd: tps6586x: Handle interrupts on suspend
Date: Mon, 22 Oct 2018 11:52:57 +0200
Message-ID: <20181022095257.GD4014@ulmo>
References: <1539955373-13735-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1539955373-13735-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--zbGR4y+acU1DwHSi
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

So does this mean that the SPI interrupt for the PMIC can still be a
wakeup source even if it is masked? This is slightly odd because now
you're saying that this does work while it doesn't work for the RTC
interrupt. So is this an implementation quirk of the LIC/GIC on Tegra
which doesn't extend to the TPS6586x? Or am I missing something?

Thierry

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvNnfkACgkQ3SOs138+
s6GlnA/+KbEp9RE2FAGyFfLfuTungMyuI62z7iZMDzNFgcKg9lCZKMjyKFpRVnP+
aavNDm4ZX/3qxqN/aqmbNjTy+PrZZv1+YXuIUHDJLJhVHtRdct/VjFBKH85z6F23
4bryvN4Z5NGJ63xkDu1IBxuJ6VGlMxo4wkK2SBhiA+FlVranLI5L2ujSYgo3NSPv
5gzpYzyppQxGosf+n/0tCc4wa8yDovaBailBU7gZLC84xwQVXaMf6eFhAey4LsbX
Hg2FK3Z3aV9bJpruRS9LsXayt/Ko0DxrP815+wXbtoAND6257Yx1ONPBMhX50cWT
dxL9u8WxzVgRt3qQ9ApX51qEIneA+TCYOIVBXnQVkR1M9Gg1u6/kekAalcxoLER9
lERbo1Snwrs+H24AWsM6xAnv8e01HYuWMODx8mWCl9ePf/Vy+xqrFcOsySfI/mny
x1rDpioj2+Kgj9kP8monFBlhm2NmaQJuyV9qy2lrzC9Ltt0+dLKK4W/Tr/J9tvTy
C1fj6eJrd3dGCwbrzIBNlAkf6niD6zUhm97eYfM87tlDN5VFcAg3k17sUxCuAFXF
H1ppMHoba/CJMDNXsrsXSM6SXjPuAQGJI3214Al6rqbIsGhzOJMDA7dw+x9Ho1px
MDgQx0Zoxl8KoNc/rZuQ0Uhldrk2IUcC2Y/2eKMxRRLjXQVf3P8=
=tOjs
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
