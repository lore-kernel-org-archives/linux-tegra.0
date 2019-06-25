From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 03/18] gpio: tegra: use resume_noirq for tegra gpio
 resume
Date: Tue, 25 Jun 2019 15:40:31 +0200
Message-ID: <20190625134031.GA22491@ulmo>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-4-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561345379-2429-4-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:02:44PM -0700, Sowjanya Komatineni wrote:
> During SC7 resume, PARKED bit clear from the pinmux registers may
> cause a glitch on the GPIO lines.
>=20
> So, Tegra GPIOs restore should happen prior to restoring Tegra pinmux
> to keep the GPIO lines in a known good state prior to clearing PARKED
> bit.
>=20
> This patch has fix for this by moving Tegra GPIOs restore to happen
> very early than pinctrl resume.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0SJEsACgkQ3SOs138+
s6Gc4RAAuL9MGdkEhgzl61Ta2oBYD0aZWJ66SqDoCR4N4IOJUbUigecf27fp/Aq2
hSdNG1GPkruQ9M2Dr/R7aQAVgYnZZRbxTTtGvylvkSa8nPDRWVESZSBGlKERb1oE
tbBTktBKqYuZNv5tfxAoUnG7elNy/6LLbw942vtoblJdLPDGnuIiJw0wWhUj6bMM
iaskxrSUg5K8ekrAqc5XTkZm92lxCGKHDYucMxyUF/nZCW8iczUGo+d2hzd3JFvj
ruyTZuaYf6Pw2VhNJbsMpK+hqi3ou8RdVUjhc2DmUT/f5CTcjp0bO5UqjSH0U2LZ
7v4aqh12UFukfwgb3UGq5Zj/qJoCXJKcIYeD4mZa/kKJUjgA0P6mCmrv+Qq6lEbB
2+n2dMn1GmJdr9wTYATGeCIY794k2bWBOwYKiKx3AcOwBa4yp6rtLDbdPefKZsp7
id8JXupBhHFiWbF4G7vLg9lmnPwTBHnJ1gD5oqBrtoryZMJyTD1XQNHMudiOyGL/
ENdep/ewpV3jK7zVVpOomS8CDNa/0joXlyvGjHBtK341eCEyIxGD9nFytIPzqvFP
+zdfiN5ioTRBBNpEaKcP5JRZiLMpUC00uT32vJlTKJb51V5q0MP1YxO8BGQ6EV8m
dceqZShedBlFvgND7IuZ3JhX2Kgo6YtoGpdy0jzsSlDVi7xTU/Y=
=Xgxt
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
