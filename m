From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/3] arm64: tegra: Fix Jetson Nano GPU regulator
Date: Thu, 20 Jun 2019 11:19:05 +0200
Message-ID: <20190620091905.GH26689@ulmo>
References: <20190620081702.17209-1-jonathanh@nvidia.com>
 <20190620081702.17209-4-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7J16OGEJ/mt06A90"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190620081702.17209-4-jonathanh@nvidia.com>
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--7J16OGEJ/mt06A90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2019 at 09:17:02AM +0100, Jon Hunter wrote:
> There are a few issues with the GPU regulator defined for Jetson Nano
> which are:
>=20
> 1. The GPU regulator is a PWM based regulator and not a fixed voltage
>    regulator.
> 2. The output voltages for the GPU regulator are not correct.
> 3. The regulator enable ramp delay is too short for the regulator and
>    needs to be increased. 2ms should be sufficient.
> 4. This is the same regulator used on Jetson TX1 and so make the ramp
>    delay and settling time the same as Jetson TX1.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 21 +++++++++++--------
>  1 file changed, 12 insertions(+), 9 deletions(-)

Applied to for-5.3/arm64/dt and added the following Fixes: line:

Fixes: 6772cd0eacc8 ("arm64: tegra: Add NVIDIA Jetson Nano Developer Kit su=
pport")

Thanks,
Thierry

--7J16OGEJ/mt06A90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LT4kACgkQ3SOs138+
s6G8ww//fjfnWo4vBk0CeWznERPm2coOw07DTPZyJNzlg0LzA4XcvH6c1fDipZ4e
xjc2Qp60EzszmD8jM9N17is+GI9jGWl2+tJ/yAAWdpnV5NzEmimg4JIkvy0ZywcP
OZByfo+P4E5bTVLoZcb/6CVuQqyKrjnI4OWBgWQP8rUofaIeOgBmjO1ve34PzpAQ
alrQN/gZhGZqUVHewqKHMhGkmpODiblGzjgI4Q+e+msYmXw0PMNawDUnz2VqmCS+
wT30hLlHkeoj6p5EUo9R3aQaQdLa2iduYrnoR2QHnvDn3KP6kQBVVDeYNI+LaibJ
Hj+w5kK0RfUg7iUg2wzlXYAR4qfQKxXVZ/7M+UyZi6fO2fvD7lhooqw2F0osQMdB
cv9vh0xsllWUIH4TQVOh12rcDkQdSnYJQ1+DBnB9Qfupih/NIQFAZNWk0BOPjdRj
m1ca4e3Xx5DTPtz82XCICyglXeIpaiXQAa2eyQAqYgTUcaxhpB7kqKD/dPsFiXqB
Nj4HF1t0XD/ppVirkoh6AqBZY/bHomikCdcPU3sa3Xa6HATByI+2bPs4CXmLLTJz
DX9vJ9uf7+gZHUmhbvmkVcK37ruN9BAbjO9Gnf6yCfi8el6uaGxGN2A/Sj7EfIIk
4Jd+Q676PmwEXibG3VCQS//Yw2iuFcWd1F0HuoFQ+/XLNZhzFSw=
=NtW5
-----END PGP SIGNATURE-----

--7J16OGEJ/mt06A90--
