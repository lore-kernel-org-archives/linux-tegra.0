From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 8/8] clocksource/drivers/tegra: Set up maximum-ticks
 limit properly
Date: Wed, 19 Jun 2019 10:19:20 +0200
Message-ID: <20190619081920.GI3187@ulmo>
References: <20190618140358.13148-1-digetx@gmail.com>
 <20190618140358.13148-9-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nEsDIrWrg+hrB7l1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190618140358.13148-9-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--nEsDIrWrg+hrB7l1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:03:58PM +0300, Dmitry Osipenko wrote:
> Tegra's timer has 29 bits for the counter and for the "load" register
> which sets counter to a load-value. The counter's value is lower than
> the actual value by 1 because it starts to decrement after one tick,
> hence the maximum number of ticks that hardware can handle equals to
> 29 bits + 1.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--nEsDIrWrg+hrB7l1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J8AgACgkQ3SOs138+
s6EPEBAAn10gbUkVsBHDIrBFkwk3KyI/V6bofbaJQUM7laLFxcPxtchlHGg815Mf
fPIMSvscd6p0ASJwpG7FuIwHT0Wn16ZlwmKt+txnr96lne/hGy4TCG2U4ajG7uho
Oz4aRFpahRRB7yW9jBb4kfr7AKNAMFDeGEAcT8L+e1f7tfgpqT9+ZOImh6t9yfWs
xfeH0EYBDCwz4by5qz4TLJ575rgbFycX8GADCjA0VL2FIbnU3G9c34UsLIO6OMPn
EV5O+MGIjzfadAD0IdVkX1nURSYya1SvgCp167/dnzM6IBaBzQTfSJ8tMtEBCJJN
JockM2EqDiw8EytGKfWABIgCyKDwFT5gA2Ci4JTfr865Cufl5EwKJNpxQ52jyJoF
ZX3vnvsDx7pkiusralho+1HsP4J6D9fqULD6NmNNN7yzGHvMNt3o48B2MpHh3J5k
ygnXuxYMRKNP4kvBMhgXMDso+lWlt3iMfUysOvI0+RR7hQUCYujEJCDkNp19awf/
OtV5+xplrPqCqknrJ6t5hsSPqaX6Z2IJ7FCesK6XY9K0YywqzVwe/+HH0ktsRN6I
9O7r2P5yyBDtz0TGn8XkQoZ7BbtqUY629/xyF4vfYdpiUtMX3hmrh2Zbz+HEM7rY
ONbzVV/EJj40JmRJi4glPLIC2T2yEe3QqD1PqiQxREm4kBIpwEU=
=4r44
-----END PGP SIGNATURE-----

--nEsDIrWrg+hrB7l1--
