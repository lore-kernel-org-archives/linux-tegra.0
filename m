From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 12/16] PM / devfreq: tegra: Reconfigure hardware on
 governor's restart
Date: Tue, 4 Jun 2019 13:17:38 +0200
Message-ID: <20190604111738.GL16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-13-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tv2SIFopg1r47n4a"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-13-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--tv2SIFopg1r47n4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:11AM +0300, Dmitry Osipenko wrote:
> Move hardware configuration to governor's start/resume methods.
> This allows to re-initialize hardware counters and reconfigure
> cleanly if governor was stopped/paused. That is needed because we
> are not aware of all hardware changes that happened while governor
> was stopped and the paused state may get out of sync with reality,
> hence it's better to start with a clean slate after the pause. In
> a result there is no memory bandwidth starvation after resume from
> suspend-to-ram that results in display controller underflowing that
> happens on resume because of improper decision made by devfreq about
> the required memory frequency. This change also cleans up code a tad
> by moving hardware-configuration code into a single location.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra-devfreq.c | 98 ++++++++++++++-------------------
>  1 file changed, 40 insertions(+), 58 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--tv2SIFopg1r47n4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2U1IACgkQ3SOs138+
s6HpLhAAikOD/x71+zu1xYDAwoqpm21hVqJyJCw4SGxBPQyd9Qx8QkvqyYBWPtbC
R1pkG7PfUtNzB6BKufP5SWIdql+yHDw+R2ExTIWmMtlbcmrw6WLIh84kdHXQayGN
dqmYA+AgkN+xgav7Smk3/iVZPYVvf4HcnFkRq7FsQTjK3D1df0Z/1+ML1vkvrnvU
8FtGNvNiSjbGNPyreLNlKBg910dNFKrGfELPXaldE0pDQ1KRiHy9mOB7Xf+cONzU
nsN+4Zz9NDikD0fVE0f3Tmt0JN8o4XEvlXXe2KnkRG6NPTvynjzPopTS3yErpbt2
hW+2g33QaEn4rXToyiwcMUs6DkjSedDUp0u2Z0tT8nmnRkCnB2uUddLWDOHI5s+c
poqQkzcp+xW3Oqyw9yIOWa63VdCWpAAfbBHHg42PPSR5gtDYsG2JyDvSpqX3t47J
YF9ev0VsKMJydoDEuHW3Jw4Kf6q3f8jTCchhLr95jDgigXbgqHiVNyrS5KFuGaGk
zaIgF32lsIsGKcVH1QTBZlGw2i0ifZXhJaJYsFLQus2PU4CTkm1fKMbC2WCiJ0CR
YjaRHtT3kTZlz3nzfuL/xuRy2WAya2vQZ0sq3on0IXa2+7axyOpPBQxxDSNkt+DB
agqWkjcVO0nHq0YdTVqAJPD+z5nUUwzUoQJ5rpPe5TmKrLWgZow=
=2zu7
-----END PGP SIGNATURE-----

--tv2SIFopg1r47n4a--
