From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] ARM: tegra: cpuidle: Handle tick broadcasting within
 cpuidle core on Tegra20/30
Date: Thu, 18 Apr 2019 11:34:31 +0200
Message-ID: <20190418093431.GA26909@ulmo>
References: <20190224152114.6161-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190224152114.6161-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 24, 2019 at 06:21:14PM +0300, Dmitry Osipenko wrote:
> Tegra20/30 drivers do not handle the tick_broadcast_enter() error which
> potentially could happen when CPU timer isn't permitted to be stopped.
> Let's just move out the broadcasting to the CPUIDLE core by setting the
> respective flag in the Tegra20/30 drivers. This patch doesn't fix any
> problem because currently tick_broadcast_enter() could fail only on
> ARM64, so consider this change as a minor cleanup.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/mach-tegra/cpuidle-tegra20.c | 11 ++---------
>  arch/arm/mach-tegra/cpuidle-tegra30.c |  9 +--------
>  2 files changed, 3 insertions(+), 17 deletions(-)

Applied to for-5.2/arm/soc, thanks.

Thierry

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly4RKMACgkQ3SOs138+
s6EKeRAAtsGYzZqPjid4skeUt7zmCvp5nBwtyRRn0aN1t9IxqxYQE8RczF1LgHm3
QS3vbw3DLK0QiOrdwnZwQ+WZt/xCPVqp4itoZGxxM0JuYoxebrAzjjJNKO8cdsDR
fw8ERefyVav+ZFNGq87AK/gwNC8Oreyt4SeouN18zi/5pNfqVxMAhLhefsVID+9k
xFxg0wm+QNdvGXurwztCAAiVsesDdFTJGC062dqYTWmQDFaNOkkp1L5xEJJ2/OPr
m6rINNeh11zzol77+S7Lft/WuA0ZuPnG7wtlELSqI8Ic0ekx/IXpLr8coxko8xA3
UEbBGd78ISGxFKZJM/SfvFKIyLwbytbI79WGc4ikbDXBbrTXIvF8083OFRb3iqiq
wOgdDGfppKPY9+EDsREyoPdyyLZZVWZpgjMgcezfX60A+V9AiOfBR7yOMlXx+Wzi
z5wn2dNPe2+9ne06OiEn0oPZzDXA3MnQ1z7wJAPhKvEHz/h6RPSnEDrw8ZfTLEl0
xdREBaIWxc/gouVSlzHvYUG69ZOPeh+BLFLu9a7qo6z2TZL83tvGNOBylVDLyGxl
a3Myi6GGHuVeEgooCcwdrch6oMhJdIJmRtAlp6ks1CqK3ZeN04OJaDpZ36R4WrkP
R/1cAYtx6gbf0aFRhzqc5psHfvwZ4ClWyUKHMu3h5gHCBDYazms=
=PxYd
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
