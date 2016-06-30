From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 01/11] soc/tegra: pmc: Initialise resets associated
 with a power partition
Date: Thu, 30 Jun 2016 11:49:02 +0200
Message-ID: <20160630094902.GD1776@ulmo.ba.sec>
References: <1467191877-26017-1-git-send-email-jonathanh@nvidia.com>
 <1467191877-26017-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467191877-26017-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 10:17:47AM +0100, Jon Hunter wrote:
> When registering the Tegra power partitions with the generic PM domain
> framework, the current state of the each partition is checked and used
> as the default state for the partition. However, the state of each reset
> associated with the partition is not initialised and so it is possible
> that the state of the resets are not in the expected state. For example,
> if a partition is on, then the resets should be de-asserted and if the
> partition is off, the resets should be asserted.
>=20
> There have been cases where the bootloader has powered on a partition
> and only de-asserted some of the resets to some of the devices in the
> partition. This can cause accesses to these devices to hang the system
> when the kernel boots and attempts to probe these devices.
>=20
> Ideally, the driver for the device should ensure the reset has been
> de-asserted when probing, but the resets cannot be shared between the
> PMC driver (that needs to de-assert/assert the reset when turning the
> partition on or off) and another driver because we cannot ensure the
> reset is in the correct state.
>=20
> To ensure the resets are in the correct state, when using the generic
> PM domain framework, put each reset associated with the partition in
> the correct state (based upon the partition's current state) when
> obtaining the resets for a partition.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/pmc.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)

Applied to for-4.8/soc, thanks.

Thierry

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdOsMAAoJEN0jrNd/PrOh3wsP/0CPXQ6h5zGWg6i6jCJXgFmV
Ku/woQffcMkz8kgAFQ09rPjCscoP3t+xMI2TAPQECACvI7qv4w5GPDelTyuKOhW8
0OOl60CScXkd3mq1zUo8XpQkTjew1Ihyp3etgjYDuRFwFjwoeqlepLwlbXzmpMBM
Ar70betKgtn2TRxsofW3+HDnwdXGxf6RZuuMi2t0bDpnZWVJIDJ8KokkFV2wdvFK
vlk/D3SfWvzgzsvRoJ6NREi5d8ecpP+VWVODkNTOKsmLGEZBvS+fJeQTRibvMCCQ
x13FCKkh4L1lQw5xca+qUR7E4vI84hLPlRg8kP+1z21PWdW9cqz0Y15i+U97CDBx
D/b0uxd6775qSOqbY8W+qFHxKKY3AKEfQ3lThi/9ncIq1wlXXfWdb0h86XQ0wmDD
viExSwFws2uychb5xoXkc/Ioi6/tqMpjR/ivsNsrKmWH47wLNxoXuNXxfPGuZweI
uiBGX4Q+2txXCyppomGcukw1Zmwmj1HZUA1OYB94JtAbEWB7fAEhG4dOuZ9zS/xe
PvAwCPKZdgU2qTfHrKTIzf9qiBFtv10jO3UtqGtgQyjE2iDWaVLFS7zq5UXsj2rl
lRGtQ2EpV6Hi2CxhEI/ORBiwVT3A/seMKXU4jGKNGBdcLrqagVOBAIK3Lz7Vr/aZ
ZZpU/EoP6+djCv/1BBaD
=wt6P
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--
