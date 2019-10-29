From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 00/17] NVIDIA Tegra20 CPUFreq driver major update
Date: Tue, 29 Oct 2019 15:09:59 +0100
Message-ID: <20191029140959.GL508460@ulmo>
References: <20191024221416.14197-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4oF+6Ged69J0+4/e"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191024221416.14197-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--4oF+6Ged69J0+4/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 01:13:59AM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> This series moves intermediate-clk handling from tegra20-cpufreq into
> tegra-clk driver, this allows us to switch to generic cpufreq-dt driver
> which brings voltage scaling, per-hardware OPPs and Tegra30 support out
> of the box. All boards need to adopt CPU OPPs in their device-trees in
> order to get cpufreq support. This series adds OPPs only to selective
> boards because there is assumption in a current device-trees that CPU
> voltage is set for 1GHz freq and this won't work for those CPUs that
> can go over 1GHz and thus require voltage regulators to be set up for
> voltage scaling support (CC'ed Marcel for Toradex boards). We could
> probably add delete-node for OPPs over 1GHz if there are not actively
> maintained boards.
>=20
> NOTE(!): the voltage scaling functionality depends on a reviewed and yet
> unapplied series [0], thus [0] needs to be applied first.
>=20
> [0] https://lkml.org/lkml/2019/7/25/892
>=20
> Changelog:
>=20
> v2: - Kept modularity of the tegra20-cpufreq as was requested by Viresh K=
umar
>       in a review comment to v1.
>=20
>     - Added acks from Viresh Kumar.
>=20
>     - Added tested-by from Nicolas Chauvet to the "trimslice" patch.
>       Nicolas told me on IRC that it works fine.
>=20
>     - Fixed compilation of the "Add custom CCLK implementation" patch. The
>       error happened because v1 was based on top of yet unreviewed/unappl=
ied
>       patch "clk: tegra: divider: Support enable-bit for Super clocks". T=
hanks
>       to Peter Geis for reporting the problem.
>=20
>     - Replaced Tegra30 "beaver" board with "cardhu-a04" because turned out
>       that's what NVIDIA uses in the testing farm.
>=20
> Dmitry Osipenko (17):
>   clk: tegra: Add custom CCLK implementation
>   clk: tegra: pll: Add pre/post rate-change hooks
>   clk: tegra: cclk: Add helpers for handling PLLX rate changes
>   clk: tegra20: Support custom CCLK implementation
>   clk: tegra30: Support custom CCLK implementation
>   dt-bindings: cpufreq: Add binding for NVIDIA Tegra20/30
>   cpufreq: tegra20: Use generic cpufreq-dt driver (Tegra30 supported
>     now)
>   ARM: tegra: Create tegra20-cpufreq platform device on Tegra30
>   ARM: dts: tegra20: Add CPU clock
>   ARM: dts: tegra30: Add CPU clock
>   ARM: dts: tegra20: Add CPU Operating Performance Points
>   ARM: dts: tegra30: Add CPU Operating Performance Points
>   ARM: dts: tegra20: paz00: Set up voltage regulators for DVFS
>   ARM: dts: tegra20: paz00: Add CPU Operating Performance Points
>   ARM: dts: tegra20: trimslice: Add CPU Operating Performance Points
>   ARM: dts: tegra30: cardhu-a04: Set up voltage regulators for DVFS
>   ARM: dts: tegra30: cardhu-a04: Add CPU Operating Performance Points

I've applied patches 9-17 (the DT bits) to for-5.5/arm/dt. I'll hold
back on applying the others until Peter is happy with them.

Thierry

--4oF+6Ged69J0+4/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24SDcACgkQ3SOs138+
s6H+1A//UuJp7rwtuS1TqAWqlcqxEWSFbHc23R+XqzupTAHwYqwc0WRPn2TLUaAt
TYy/iNWpi1tXao9ELGrHaYec9OHReAUq/hBQeMXbRD3Tv1AgJgr1q9/XdFgC+4Ac
0vt4gW5/cnA3yfxeCIcJVa/f5BL693/oXO5hc+xdNbju58k/2DHCDRGfIW6s7l9y
EZACxRMzoUD1sOwshnogtbGE1XqEMi6y/pxJsbpO5ggIjMBN1BdSBU01EIJs8/OT
gBpWHdqkqvFUK97KQFdIIV2Aof0Ye1BT15DmBVQLV+DTWrmUYQ/eEG5jp6EVrDn8
iwbKPwT/9o866AXFGJX80acjZjmEig6dJtKQ6O5EqseYyigGfEyE8zfu7l6gjHwZ
+KIhWCEW/ZXAQitosWkARoAftEd6EapByhEaQHlvzPjvUz+em3oHC7aHPiClIuIp
uSJM58BdBmm8s/lAynLWozmLQ1dUk9PLcScA1wxKcPPFaLiZrqrIDvfl799PmAtl
5BP0HWS1slmtFKdkyv9PU/rHDfdDP31HzsT9HqbK6btXqxx/epan36xSeBbUMGrX
4qDRIpcDrSrETJPTNHa+B3IVOh8+RT0rXb+OQ8M8a0MHZwX/vx5kGCdCcoXhLxHJ
/Idb1VVXr2CNnIeThDM/C5G0tgacDotwWQDBXOjSVze9kJ/JutI=
=kK1J
-----END PGP SIGNATURE-----

--4oF+6Ged69J0+4/e--
