From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 2/7] clocksource: tegra: add Tegra210 timer support
Date: Thu, 31 Jan 2019 12:23:44 +0100
Message-ID: <20190131112344.GB23438@ulmo>
References: <20190131092410.28222-1-josephl@nvidia.com>
 <20190131092410.28222-3-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190131092410.28222-3-josephl@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joseph Lo <josephl@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2019 at 05:24:05PM +0800, Joseph Lo wrote:
> Add support for the Tegra210 timer that runs at oscillator clock
> (TMR10-TMR13). We need these timers to work as clock event device and to
> replace the ARMv8 architected timer due to it can't survive across the
> power cycle of the CPU core or CPUPORESET signal. So it can't be a wake-up
> source when CPU suspends in power down state.
>=20
> Also convert the original driver to use timer-of API.
>=20
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v4:
>  * merge timer-tegra210.c in previous version into timer-tegra20.c
> v3:
>  * use timer-of API
> v2:
>  * add error clean-up code
> ---
>  drivers/clocksource/Kconfig         |   2 +-
>  drivers/clocksource/timer-tegra20.c | 369 ++++++++++++++++++++--------
>  include/linux/cpuhotplug.h          |   1 +
>  3 files changed, 272 insertions(+), 100 deletions(-)

Looks good to me:

Acked-by: Thierry Reding <treding@nvidia.com>

Thierry

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxS2r4ACgkQ3SOs138+
s6E4kw/+KIr1/qDOYKPC0vig58FLCc8MiVQkfgBHJc6+1ItsalgY5BQsUbedis6k
hHROsupsiqkLH4u7KWL/kxeJeG/bxkyqjSw3QKE7ql+UOa/h0HVTaKBqtRFAoq3b
Dvrve2WDgczk1+4XXaqbwh3s6pprOsH+T85vUDR2OT7yVeiWuXyvIS/mwoxFpOLN
w8kGBcW6Lo0QDMND50ZJ2gJJyk3CHQhqeUVqQMtVGG/+qG+dbKvwiR9BLA3gekqG
KUoTSJnpmc02jYxIct8WHBBD6SckJtcBvLi5bBG5Zg/16SLOFxSLVVWPKEXaMnzP
/Bd6GYCbVu/8CVFH8lLU377YK4Ca14MWS2lXhCgWGenvXPa+DEP5Pq5Hedxauanl
HQ6Gzc6QHtNQeaLrHasJ8QLDYyUhw2sL2Vwjs+Xn4gWcsy1/T7i+l08bmjEXWLvU
cvQwO9KP3vg0BWXqB63JhvZZTkfKsPWgdQppon9GMxKwQEmI4smM8d3PGLoY9xl5
i+GBTffLp45DXlDyXTi2AE+9OMxCh6NGqnUVgysOEi6OLHz+VmsG0IE+yNHRuII3
BzLnzE2R0eeptzEBy7qaQo6v1CmOhb6Vk3Cez7TUzBVen9hmnazkSfx3t1+1Li2f
oggvSwpAqz6rlGNd6byY5MuLpQXB97R3WjGbzjZSxOnPNDs/y+I=
=JPuk
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
