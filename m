From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 6/8] clk: tegra20: Turn EMC clock gate into divider
Date: Thu, 25 Oct 2018 16:30:58 +0200
Message-ID: <20181025143058.GJ21521@ulmo>
References: <20181021183052.32023-1-digetx@gmail.com>
 <20181021183052.32023-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KjX7LgAomYr70Ka9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181021183052.32023-7-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--KjX7LgAomYr70Ka9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 21, 2018 at 09:30:50PM +0300, Dmitry Osipenko wrote:
> Kernel should never gate the EMC clock as it causes immediate lockup, so
> removing clk-gate functionality doesn't affect anything. Turning EMC clk
> gate into divider allows to implement glitch-less EMC scaling, avoiding
> reparenting to a backup clock.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 36 ++++++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 10 deletions(-)

Applied to for-4.21/clk, thanks.

Thierry

--KjX7LgAomYr70Ka9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvR06IACgkQ3SOs138+
s6Hduw/+KPDbRWcItPpfx2++bu7qjw3SiY5WGVhUWskHLChqi8McqinAdCJKyNnF
xmVLc4St8pDZlJ46ygQA0nhgRmhP/rYhu2hI8n364/gIfUHXKG7FnSv9dqYRb+8T
NTAnn32YvtW0A0murNKx/ajmE5ZKyEN7mCOMwDaP7o7DJ/R5x2YyldUossHh2KCV
5tAGQ1AoNMlu1J7gpiMTwxJmdRNIHTjFuqDpZt8y/J/TFLvpq5gTnbYDr0DCn8Nf
c4cKZ/FV26dcvL0Y4pxyfsda/JgOesi9spF4XYOeKRCSiJkbrPrcgVVnCFzi5LxL
XQDit677vdaJIBKp64h+Uc0IR+qsUE3Zww4LRfcPZi5AsANYZtWqF0CWHveDZrj1
A+IW6XUzzTDTROfSzTzbUN3k/TpSQIAgdQrKv4J4Bc+J1fURMKiV5uMpy2atDIoK
T1R8VQoenDFQ7mwm8wu3/AQ7cSAn11foINt51irSNu8IWT46wlJHqctNez/AMI+G
9zMQULVbVty6Pm8bQ5KE7TWrpxUrd7zzaF+1oJ/r1OtMjrZgIcmTrl4hhP9ytnzi
k7xh3hd/eehxYYjP2hWKrrdJkua+JP0swXIgd4MmnKbsDrta4KnZIscluo2xZam3
u1ee2NvDAG5kCF9nObr5Cnni2nmxC+Uz/67yDGwdo2MWdUM526Q=
=Q3jp
-----END PGP SIGNATURE-----

--KjX7LgAomYr70Ka9--
