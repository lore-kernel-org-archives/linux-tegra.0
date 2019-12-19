From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
Date: Thu, 19 Dec 2019 15:53:41 +0100
Message-ID: <20191219145341.GL1440537@ulmo>
References: <20191215183047.9414-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yQDbd2FCF2Yhw41T"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191215183047.9414-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--yQDbd2FCF2Yhw41T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 09:30:44PM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> I was investigating why CPU hangs during of GPIO driver suspend and in
> the end it turned out that it is a Broadcom WiFi driver problem because
> it keeps OOB wake-interrupt enabled while WLAN interface is DOWN and this
> may cause a bit weird CPU hang on writing to INT_ENB register during of
> GPIO driver suspend. Meanwhile I also noticed that a few things could be
> improved in the driver, that's what this small series addresses.
>=20
> Dmitry Osipenko (3):
>   gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
>   gpio: tegra: Properly handle irq_set_irq_wake() error
>   gpio: tegra: Use NOIRQ phase for suspend/resume
>=20
>  drivers/gpio/gpio-tegra.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)

Patches look good:

Reviewed-by: Thierry Reding <treding@nvidia.com>

I also applied this series on top of v5.5-rc1 and ran it through our
test system:

    Test results:
        13 builds:  13 pass, 0 fail
        22 boots:   22 pass, 0 fail
        34 tests:   34 pass, 0 fail

    Linux version:  5.5.0-rc1-g3d0b4fced39e
    Boards tested:  tegra124-jetson-tk1, tegra186-p2771-0000,
                    tegra194-p2972-0000, tegra20-ventana,
                    tegra210-p2371-2180, tegra30-cardhu-a04

All tests passing, so:

Tested-by: Thierry Reding <treding@nvidia.com>

--yQDbd2FCF2Yhw41T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl37jvMACgkQ3SOs138+
s6HZYA/+KkwZWvDrOQ/xInN24cWeziIx62H3vJwfR9+Tjbdww4+9yMeMtj5ZWqMy
fXJZ5t/UokIk+x9MoUYHUIOB6Iv0JhobZ9vWW9IikMfPKbHUPsQI8PrDG5Irnqxg
AehGhD5Z11O3CSR/N1AEP5iv5udWFuhcb23FJMBNYhNxx7+DfU0iDJ54BmRKoaTG
xWH5wBIJIXR06J80bJUaJezl5yocm6I7LgC/rzbiM1R+8hNz/nkyLoon5MEJOvUy
dfNNn+2upmavuoG+EMcZgKCHPHb8CILSciNrcDmSp2EP1/OOYgm9urytQRrnHwWn
0a/P//Zasnmb7kUYqcSNa9b8xD7aZ/lMS2zvLmtWHeF9uQigJtxmeFcFEU/DofeV
LMfxE+ePRof2N7EztSgOxpVqS6V0OMzr5TquUq9d0CxDVkfzq1LHZO+9XY4MCTzi
xD+Ncn/te+xJmLoiXMMVOnlpa4e3BzO583aBMAR6cLwzNHRhKOAhCws1pxieH9aR
Bg2vGbwkrDK4c2AouHoNROlu/DN2n+GVhlH+b93P0xRJJAvgvwOhuUnwYj4Nt4Hf
oTWbSN9AVBRSBQQdnH4R3N6idMPj4SInVWWF2jgvl5IJGGWOtKQCHYI/TmFmu69i
LKcAZPJjK+eOdWMaoCrhnv0QMN7Of+4Rhx1OLSRm9MX9QF40E6I=
=CltG
-----END PGP SIGNATURE-----

--yQDbd2FCF2Yhw41T--
