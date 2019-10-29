From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 0/3] Support regulators coupling on NVIDIA Tegra20/30
Date: Tue, 29 Oct 2019 14:02:22 +0100
Message-ID: <20191029130222.GA508460@ulmo>
References: <20190725151832.9802-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190725151832.9802-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 06:18:29PM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> The voltage regulators need to be coupled on NVIDIA Tegra20 and Tegra30
> SoCs in order to provide voltage scaling functionality in a generic way.
> All necessary regulator-core patches that added support for the regulators
> coupling are already have been merge into mainline kernel. This series
> adds customized voltage couplers for Tegra20/30 SoCs, paving the way for
> a refined CPUFreq driver that will utilize voltage scaling and other neat
> features. This is a resend of a leftover patches from a previous series
> [1] that was partially applied by Mark Brown. Please review, thanks in
> advance!
>=20
> [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D115626
>=20
> Changelog:
>=20
> v2: - Some days ago OPP framework got a change that makes CPU regulator
>       to be enabled at the time of CPUFreq's driver initializing OPPs.
>       In a result the CPU's voltage is dropped to a minimum value on
>       CPUFreq's setting up because there are no consumers at the time
>       of regulator's enabling, thus CPU is getting into a big trouble.
>       This problem is now resolved in the couplers code by assuming
>       that min_uV=3Dcurrent_uV for CPU's regulator if it doesn't have
>       any active consumers.
>=20
> Dmitry Osipenko (3):
>   dt-bindings: regulator: Document regulators coupling of NVIDIA
>     Tegra20/30 SoCs
>   soc/tegra: regulators: Add regulators coupler for Tegra20
>   soc/tegra: regulators: Add regulators coupler for Tegra30

All three patches applied, thanks.

Thierry

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24OFwACgkQ3SOs138+
s6EL6hAAmsRFT55RAhQ6AhkSpGk/FCoDTu+zuHf3m3lS91LuGmYCkvxyKiCgkTBf
ZzEgbaqOlM7FdaW++Au+vGooywMUwgsDyBw6rzSPTiz54Vt3YxEcs1HukLf9almB
IvmO9AoRf6ifH6wZLNbYLrzsdpOxjgKJMxmOn2XZh6hyPS03Olp/T+m3DhXNUAz6
B7LUK2DheI14aQ1OPs9RP6SnN+g/tXdO9k5tGuqqI/OXkUdTqNN1l/uIWcKhYoYK
0Wi3wdp50qsuAOxAWuqX7miWV/eewLO2XM+uB7Xe0ooqspCbK5iiQC+pp+EF08u0
7IuF5kb7arW5yeAbnMfvCiOWFY5bqk5VrRgeUWjOGfkh6ZcqzOT3PLaC/jlCMCvB
u47/l/XN2YQFjHooZT8GngezSDwBkTHBSbJr2xz8gxGnMWnIaKo2sVR+Xps0TT1W
UXFQLorJd608gPu4+5unZDJKf9EhgSDr4umndO6YgNQd2WH5A+I+OQPHdDbpYdML
baZC33pLnN/rjm9alKzOird/NUlLJ6boFc4p2nscQs4barX9geQqOol2i02PfETv
NxQvf+simgk5WazA7aogM9oKFckaYlXIQ8VRS2a7YyL0lW7bdAZEbD4Bdz982gDb
nGtTq+SYRfsFhZFxN504UGy8lbYcU+szGcys81vBHXpDYgDcYf8=
=F8yu
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
