From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 8/8] memory: tegra: Introduce Tegra20 EMC driver
Date: Thu, 25 Oct 2018 16:38:53 +0200
Message-ID: <20181025143853.GL21521@ulmo>
References: <20181021183052.32023-1-digetx@gmail.com>
 <20181021183052.32023-9-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GeDkoc8jIzHasOdk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181021183052.32023-9-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--GeDkoc8jIzHasOdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 21, 2018 at 09:30:52PM +0300, Dmitry Osipenko wrote:
> Introduce driver for the External Memory Controller (EMC) found on Tegra20
> chips, which controls the external DRAM on the board. The purpose of this
> driver is to program memory timing for external memory on the EMC clock
> rate change.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/memory/tegra/Kconfig       |  10 +
>  drivers/memory/tegra/Makefile      |   1 +
>  drivers/memory/tegra/tegra20-emc.c | 591 +++++++++++++++++++++++++++++
>  3 files changed, 602 insertions(+)
>  create mode 100644 drivers/memory/tegra/tegra20-emc.c

Applied to for-4.21/memory, thanks.

Though I did notice that there's quite a bit of code that's very similar
between this and the existing Tegra124 driver, so I wonder if we can do
a pass over them and refactor some of it as a follow-up.

Thierry

--GeDkoc8jIzHasOdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvR1X0ACgkQ3SOs138+
s6HOfxAAma4aYV31RRx2/qD14Jn6MGfN3bEIReLqe6IlcvnonSeDMPjw20xowj/K
03+GR3gN4dVlJ+LzsAaS1Mjv1OGd62is5DPKDtkbHt4r7y913RntQq8bS2aAqRlT
TbI9vPggHv+Cvc+jim2Gsy0W4fK5RQcFuoqyq/4rjmRNvVIjKU4TzuRh6xryGJms
zjsUrZASxqVAvf1mfsfNAVh7hr7TNT8DvquAoki9Qy4I6oCFLTMCGJRsRzpKx3Vz
YeM73On6rRNpJEPERi5xUid+jDR8nFfJIc8Cp3N/3G2J04Kg37L64J13Fbg4n8pf
8nPLbBRDhcZ7Za0Os4c7nRdb7RrgdrvLFrr/t01dTryy1gG5Xr6UWgM0oHLbYzPx
gaBV+mXiZz8kzdA1+7sAzgU6NhGoxkpY7JEG3CRzvWYabCjAg4CaMYpF8QQ24KoU
fct464VbB4jl/Kiq+X+MgmD4G7fuj2a7u++EWEMxaBg5otNuQEnJGflxYmLLzudY
Ogsd3II2gDXt8x3FspWm3pODNXKGJdOZZhM6lOLx+nueXyYxreQBAhEAJr6k4HLy
I9I5Mq7pttlp9VcIkhYMB8w+D/ueT7qrQY/SBp+O9yT/GFLOZ5z2HUQ5PObW4Yt3
4WECZkBJr8XLcOmftZHmTTcCzmbF5MWj8ZYzfLCJAFvUotIc1lU=
=t1vV
-----END PGP SIGNATURE-----

--GeDkoc8jIzHasOdk--
