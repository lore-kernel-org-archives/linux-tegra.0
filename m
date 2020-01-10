From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] soc/tegra: fuse: Add APB DMA dependency for Tegra20
Date: Fri, 10 Jan 2020 15:33:36 +0100
Message-ID: <20200110143336.GD2233456@ulmo>
References: <20191229150121.1635-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20191229150121.1635-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2019 at 06:01:21PM +0300, Dmitry Osipenko wrote:
> Tegra20 FUSE driver depends on DMA channel presence, otherwise it fails to
> probe.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/soc/tegra/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-5.6/soc, thanks.

Thierry

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4YizwACgkQ3SOs138+
s6GXrBAAvR80pePuQVxKoF6mknFT8LeNOteuYXFRqyvhZCvVswsu/UNxU9wN1e0V
G1aqotq3X7Z2LOW1wIykHfayAOiBp/gefW1OQaXerOdFRQUl7+bLr5gqOCVhoaIQ
VUaES7yuQUORq0uQ2W5gqJyRvaK83QdWGiB6Am24Tnn3OqMeYynp8aWAEMrrd2ur
ZMcRZxx+fTFgHYHKutXlXRJg0RHAEBz3Bsdnp/it7raetKrr7fvZCFXQone2IecN
vrh2SlygYz41HCOUL4ge/JiZauteixtfmw7MQgGYL6buqyPpzWbIFn+1yr3jb3jl
wntVeN6iz+RhXf1GiHFxTUmq+NshT9NiAvSCKph8L5yp5usUxc1swZVGIXxc8afA
PCfL+coHn/OafbdUyO7yHWQ75pSt9Aqi4dHCUi98soiY/2yPOgYrh8DmKt+g4U5w
5QYEqEgqst6hEevS9fXuZx8wcmP74X/E6NelCt5g86G+vh3VUFor1DIV9kAwNrmj
3kkq9rgbyBkol09YoFGd0FZLjSm0vrH1AQO3adAjwxmBu7A/0GpSrty+PJle8gWY
++2YDIjbqXmgLV+VWY75B+b1toWdRBuA1j9eGHylHHnVEtI515khuNA+WDTFwU+G
HA4h0CtBAjFjT6a+r8FYq61Bl55LjJOWHWAeWZiD6Ig4CbpR43k=
=XBdC
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--
