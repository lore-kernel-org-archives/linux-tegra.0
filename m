From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/4] soc/tegra: Turn on XUSB partitions
Date: Thu, 30 Jun 2016 15:24:18 +0200
Message-ID: <20160630132418.GC26758@ulmo.ba.sec>
References: <1467284187-13320-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467284187-13320-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2016 at 11:56:23AM +0100, Jon Hunter wrote:
> The Tegra XHCI driver currently assumes the XUSB power partitions have
> been enabled by the bootloader. This is not for the Tegra210 Smaug board
> and so cause the kernel to hang when enabling XHCI support. Although the
> XHCI driver itself needs to manage these partitions, for now enable the
> partitions if the XHCI driver is enabled.
>=20
> In order to do this I have made a fundamental change to the PMC driver
> to initialise the power partitions during early init. A benefit of this
> is that if CONFIG_PM_GENERIC_DOMAINS is not enabled, then we can simply
> turn on the partitions early before any devices are probed.
>=20
> This is based upon the PMC fixes series [0].
>=20
> Changes from initial RFC:
> - Added patch to add more detailed error messages when initialising
>   powergates.
>=20
> [0] http://marc.info/?l=3Dlinux-tegra&m=3D146711078013182&w=3D2
>=20
> Jon Hunter (4):
>   soc/tegra: pmc: Add specific error messages for initialising a
>     powergate
>   soc/tegra: pmc: Initialise power partitions early
>   soc/tegra: pmc: Enable XUSB partitions on boot
>   arm64: tegra210: Add XUSB powergates
>=20
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 +++++++++++++
>  drivers/soc/tegra/pmc.c                  | 60 +++++++++++++++++++++++---=
------
>  2 files changed, 67 insertions(+), 17 deletions(-)

Applied, thanks.

Thierry

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdR2CAAoJEN0jrNd/PrOhbMIP/RmuA9nDtk/vKZD8jdQWE0X9
w8XGAXq8t2IhSpGXJlXibu2FF0LTIUnvW7m7u9AbcMUwusT0W4zqqcfBxsWM0JDX
SYxC9drd0GGkU2QeLVtOfv8RbeYzMTRxmyOff47ngayXIrYsCVWqNhYbZqNXEVg7
7mwjE0OG49UQVhO3MGDYIchYtk7JLzcQTVH8eONklMgPbuDhbUR9QlbdrFXkiUSH
Du9Ta7F+oUmvZKcqLkjFjrjwiokPf9QUYTPwac3dAwpQU1SewL8RYC5i0SVqyP6U
A3oMa/8LXYZ3i09yHXZVHDwbalawnm8FslM+Po+7fctFOhvqetAubtAxoCQ+GW5j
nD9dHRIVbSWLKQoo082XfDT2ghXpOiIG5Ao7bXhw8Yp0Qmrs0p8H7SSn/+ILMg4B
rvdAxXTAgOn4BNaA1sQKAuc5cpo7LLEvMHdP4UluLNWYAupjXAgFkhbOX0VCvgob
GcyT7KRn0wS2XK+QherSoN6c/jT2KG6Vz3Qu1sxWOPhzoz1wZXVG6ggjaUBhv99p
R3EEQ6mmC4KhORuqZAqyz7Au7pG9KXYFusOq02O2tsELupNu2r2JWLM3DcE4UAsN
mmT9lREjDH6G3z3w61QpHq6rBvPEr5+XzhkuDbTqu7oseJmNaXTv2BDze514B3FK
Fdvnh8666maWoM7cttEO
=kY3C
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--
