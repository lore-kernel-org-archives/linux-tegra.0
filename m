From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/8] soc: tegra: pmc: Various fixes
Date: Thu, 25 Feb 2016 17:56:17 +0100
Message-ID: <20160225165617.GB6720@ulmo.nvidia.com>
References: <1455213806-21871-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455213806-21871-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2016 at 06:03:18PM +0000, Jon Hunter wrote:
> This series contains a few fixes on the Tegra PMC driver. Some of these
> patches were original included as part of the series to add generic PM
> domain support for Tegra [0]. However, to keep these patch series a
> manageable size, I have separate them in to this series and I have added
> a couple more fixes as well.
>=20
> [0] http://marc.info/?l=3Dlinux-tegra&m=3D145399885003830&w=3D2
>=20
> Jon Hunter (8):
>   soc: tegra: pmc: Remove non-existing L2 partition for Tegra124
>   soc: tegra: pmc: Restore base address on probe failure
>   soc: tegra: pmc: Protect public functions from potential race
>     conditions
>   soc: tegra: pmc: Change powergate and rail IDs to be an unsigned type
>   soc: tegra: pmc: Fix testing of powergate state
>   soc: tegra: pmc: Fix verification of valid partitions
>   soc: tegra: pmc: Remove additional check for a valid partition
>   soc: tegra: pmc: Ensure GPU partition can be toggled on/off by PMC
>=20
>  drivers/gpu/drm/tegra/drm.h |   2 +-
>  drivers/soc/tegra/pmc.c     | 131 +++++++++++++++++++++++++++++---------=
------
>  include/soc/tegra/pmc.h     |  35 ++++++------
>  3 files changed, 105 insertions(+), 63 deletions(-)

Applied patches 1-7 and v2 of patch 8, all with Mathieu's Reviewed-by.

Thanks,
Thierry

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWzzIxAAoJEN0jrNd/PrOhi4YP/jdtAh6CNJY2xlyS1IvCOT+U
yUjiYXhwQh3gdpG+vDRFJ4PQGdOJIImTqFJDVhxmRsrCrrBNRYyNyC3BzxDrzz/X
wKCXav4J6189ovv//XIgV/Ri3rQuqsjvWL/kru6uStIx1xl9A0tVUiPmw6VZXZj7
HiHD1mw+TNcHa3ay78sqFbnEo+EPD9YgqecfrSDdA1hxyyMRTGLbMyU54FM0BETs
vQyWspHbh9CQnPzTIkgVnse04g2X3UiT0sgNqSjZJm4rH/z5JH1sRJgizCEveysR
xMOUJqTk7+vu9dubJ9fOZatnS1sE9IK4kkt4G3B/kAdP3HK4cfnqbvPgYCYxibWm
nS+B5UGgV7awI7cDkPYXIziH+/3B57pXHvcM0gqhyDCSo+iTb468kuLk26mLKHZS
hNBL8QtJVg6mXqwKtZmfg7FBSdnDz2J1wUmFpvbJHaNnsq7Y02zq3nra2ejIy4w8
9EKJ9UUVc7On9u32SaALGVxDMHBD7b4Yk1odSiTgQ7qAiLb88G6VuoedKAsQlf1+
lOOXrYirDHBEL5v9W7Q8EMNdPo7I2uTFRfEw5Ei2C6PH5FkmOj619lUnkiB2qRQL
pR0d1E99mwb9DzRs3GOzTeIP0iHniWygI1Dzj4GejlyM3NO88rR0uDIOIbAe+J07
7+qvntRtldLiTarXqGnW
=YSsM
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
