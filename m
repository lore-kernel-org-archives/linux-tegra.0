From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 0/4] memory: tegra: Fix memory arbitration programming
Date: Thu, 18 Apr 2019 11:37:04 +0200
Message-ID: <20190418093704.GB26909@ulmo>
References: <20190411221250.23233-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190411221250.23233-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2019 at 01:12:46AM +0300, Dmitry Osipenko wrote:
> Hello, this series properly addresses the bugged memory arbitration
> programming and in result the previous suspend-resume workaround change
> is reverted as it was not entirely correct.
>=20
> Dmitry Osipenko (4):
>   memory: tegra: Fix missed registers values latching
>   memory: tegra: Fix integer overflow on tick value calculation
>   memory: tegra: Replace readl-writel with mc_readl-mc_writel
>   Revert "ARM: tegra: Restore memory arbitration on resume from LP1 on
>     Tegra30+"
>=20
>  arch/arm/mach-tegra/iomap.h         |  9 ---------
>  arch/arm/mach-tegra/sleep-tegra30.S | 21 ---------------------
>  drivers/memory/tegra/mc.c           | 16 +++++++++++-----
>  3 files changed, 11 insertions(+), 35 deletions(-)

Applied to for-5.2/memory, thanks.

Thierry

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly4RUAACgkQ3SOs138+
s6HFZxAAv1SMNkMMV10CUV/I1oKABugaKaYp/1uUuCYsUcUkFT/E7xHgOdpWCX8r
PPnT9v8MDwkmHqcoTtQs4e/D956pDRVE7BnVp/F1dgtCgksLUAwrsqjGPEUUd8C/
9HbmhmvHA8NxasQhbXXOno+7N/gHGXxjWDEo+slcfVe15qX8jm479qJKS6sTPUBz
eLYnSqfj7A38kLc+vx6aergOexRjMXkJR3SlqVG02PkeRzDnWjgoS0dNRgBojP0P
L3lZd18LadDPwCe0/tGpXoAA7xSw4XCKJ5v/BgwjFdpxddU52xJGXiWBIBrXXCa6
vlRJdZ1FbMJgJRYRAWgr/xe+zG80dplK0laTNcMtA+owiDOFAv3yshY/Xtp3xzVs
a86AczPAJIb/YdY5XBfVYGJvvgYm0M0ucLnoaK5lucMrdCcse4FLnRbyig4mwB/Z
1XfgyMrxtsjK0BxwkB4plNfd6dZuFY9U64VoVLXGlYatw2/0jnBFLMnld9Y/Ucnm
eWGe4DnZmfowY6fF05bhAee43Q9FoF32oyLRuzsgUl/C5JXBaVvTmNXK1phngrLm
DFin7iYow8kFEuwVh4ArMxQS/igAcscDgTBAOWZvCbx5TvA8HUCsRZezfZiTxn+R
kSHf8C0y6EDiUVU2NiTcrX1x5Fs82UePh/cFoyRxvgivgBvVO3M=
=lgmQ
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
