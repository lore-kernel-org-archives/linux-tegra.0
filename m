From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1 03/12] clk: tegra: save and restore PLLs state for
 system
Date: Wed, 22 May 2019 15:31:28 +0200
Message-ID: <20190522133128.GN30938@ulmo>
References: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
 <1558481483-22254-4-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Zl+NncWK+U5aSfTo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558481483-22254-4-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, jckuo@nvidia.com, talho@nvidia.com, josephl@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Zl+NncWK+U5aSfTo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 04:31:14PM -0700, Sowjanya Komatineni wrote:
> This patch has implementation of saving and restoring PLL's state to
> support system suspend and resume operations.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-divider.c |  19 ++++
>  drivers/clk/tegra/clk-pll-out.c |  25 +++++
>  drivers/clk/tegra/clk-pll.c     | 220 ++++++++++++++++++++++++++++++++++=
++----
>  drivers/clk/tegra/clk.h         |  14 +++
>  4 files changed, 258 insertions(+), 20 deletions(-)

When you resend the series, can you Cc Peter De Schrijver for the clock
patches. I'm slightly concerned about the size of these changes and I'm
not very familiar with the clock implementation so I'd like Peter to
have a look.

Thierry

--Zl+NncWK+U5aSfTo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlTzAACgkQ3SOs138+
s6HFTg//czVVMjqx7R0ccVr5szkBBSZtMFdt0+mg0S5Q9E7j0lAb2uWbw2lVQYFC
J55/4hi4gOcal5T94IbqwMNqVhfMn9QTZN7bezWBZm3nQ63IinacluOrwHQ/iRrZ
AhRiUczUKPmLh9SGpY6SdPVHH2R11w85PMmBT6PCUupVu6pIWgvJs/eEtxatCClc
n4lAFUQk8Xjln1KArNxPsmJzo6jeoqT5w9UxCocRcZoYYyfXh+xdfNvl/cuemKAe
O7+bkI6BYTXCLfxDojptl4xF6XZXNClWiYbZv2FVnd3MS6sTnKhMCnSox9XBrNPK
C3NFqKqtkiTuNyC18DVRAi6bcd7IZ78h1AvmdMK+E70KH8EITvdmeI+yrW6gNEmV
klvIEtEkmHr5eJg06w2bM0lV8BWoRW8xz0mlqs0ItYACC9Mo0Ea53ito5rGb7PjF
ZUrTAGQE7YfEJpDo/vzsa8m4NF9tzDo4ghplYpwdcC3k0RzLz5eOSVOD6QmTzlf6
CbUfxZx5yvfqX+Q+RVZkSlom97sjtsJ6K6wbNPc+NWqx73GTw2cU9KG0PbKWNl+i
MDgyU79e0mju+a8PEnJHzDTKO9cClkWwSR3FKXMHNF/kL2bL2ktv6Nvp0R6qEpYD
t4VvJ/VLJ0q2f5uEDBMfaAY29/nKDGnAwYApFzDqnDQpQ5XNs2c=
=NJoP
-----END PGP SIGNATURE-----

--Zl+NncWK+U5aSfTo--
