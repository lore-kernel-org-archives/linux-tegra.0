From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 12/12] soc/tegra: pmc: configure tegra deep sleep
 control settings
Date: Wed, 29 May 2019 16:05:33 +0200
Message-ID: <20190529140533.GC17679@ulmo>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-13-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559084936-4610-13-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 04:08:56PM -0700, Sowjanya Komatineni wrote:
> Tegra210 and prior Tegra chips have power request signal polarity,
> deep sleep entry and wake related timings which are platform specific
> that should be configured before entering into deep sleep.
>=20
> Below are the timings specific configurations for deep sleep and wake.
> - Core rail power-on stabilization timer
> - OSC clock stabilization timer after SOC rail power is stabilized.
> - Core power off time is the minimum wake delay to keep the system
> in deep sleep state irrespective of any quick wake event.
>=20
> These values depends on the discharge time of regulators and turn OFF
> time of the PMIC to allow the complete system to finish entering into
> deep sleep state.
>=20
> These values vary based on the platform design and are specified
> through the device tree.
>=20
> This patch has implementation to configure these configurations which
> are must to have for deep sleep state.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  7 +++++++
>  drivers/soc/tegra/pmc.c                        | 18 ++++++++++++++++++
>  2 files changed, 25 insertions(+)

Please split up the DT and driver changes into separate patches.

Thierry

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzuka0ACgkQ3SOs138+
s6FCsA//fh/p3ojaGOHMfFLR+qGf638G/KcNXtTMp68llwb1ViJHJc22xgK1KWD2
lpWXSemALJE5XOhe/8AzMk9JW8VBf01LyGTw8bD04Pd0w3rpmhQLQropO6kyPLwc
jFjYmIKk0cQUHb8DdpEHapIP3zTNyb9qmI2PVD0qQgu0VKChkP9K8DdOHM7ivMw7
iMNYTLvx+58br9bk7mwjafZhSUtyVxFmHLIB1QdG9tFsJ3gPoAZoDpno3ZqnxPEs
F8G3smiqAmTIC/GG3VX0wkjTGH7Jwydkl7b/jEMt9ahoLZd3+UB2IHkqkC0aOyAe
yg6cpE7y/KAtDkIL/zonFQ+vXcyq0Wpt5OvL/cTHrejkJYiOlfJjT08W48aF7w7g
gJ3GX/FinqeHj6RbL/wIUn2cUZjWoxFLZR/omEaKhRFWJH8btiUmNTUcyAvwqljF
KLuFUiFjPckzkLYYvBAJiZiFq79gplX6awktiZSV1i5JmGVl/pmlLDM01ptStFhO
stzU65AN8C4IOzZ/l5INhjq05I66bVL7vCiOfFy2UNL/BiGXIIogJ+f4RnqKEmB5
6YuUSFfUEyuApVIRzPCOPU/v8Km+NphHNGLyKryAj1Q8lhtnSYbEVX9GPX/6s/Wh
9DFpVpgVSP8hbLJK2YGx5jkO2FEYDnEG2y8GRCY+dUud5VAASAg=
=A2bx
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
