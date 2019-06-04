From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 06/16] PM / devfreq: tegra: Drop primary interrupt
 handler
Date: Tue, 4 Jun 2019 13:02:27 +0200
Message-ID: <20190604110227.GF16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qftxBdZWiueWNAVY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-7-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--qftxBdZWiueWNAVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:05AM +0300, Dmitry Osipenko wrote:
> There is no real need in the primary interrupt handler, hence move
> everything to the secondary (threaded) handler. In a result locking
> is consistent now and there are no potential races with the interrupt
> handler because it is protected with the devfreq's mutex.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra-devfreq.c | 55 +++++++++++----------------------
>  1 file changed, 18 insertions(+), 37 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--qftxBdZWiueWNAVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2T8IACgkQ3SOs138+
s6HFSw/+PSPTGfTFdmBQev7SxVPURWATpky1fpNGU7AlQZU5IOYQj5VqUBTGklgu
PU0Z1Ym3UYX4iIoyxdUpaD0rjl73+HV5Zwng41FN/sDNSxQC8jbMJvoCD+fLmh2F
i/pEySvqoqY/hlkIWuJGHTxnNOEeOYqJVdVQ4sM3xonRaJuK+XEcIN/k31wj48fI
kZoVtkvGB2pDSV5HQw0FhT4u1vmmW1BsM1S9hHm5sx+yTD3GVS02KuxyERqItjir
IyYLDh7cxxaVjADMs79g6e/hWpQYIbqChhnT40kKLLJbnDePYONOHnJLUVP3RZ8O
ST7ItVYficG2gW5MO6rHyj7vG7oLatFg/QWbvhUFOmEAXOTmtKfz61WiuzIKVmrP
v5ZJ3sauUpiKbQX++Nk5RUMofjJx6mQkob9/AeUddERjOqiCqPx9ybc3BKaO0ocO
hGYLDCtG9vRpDZRcOycCaYcjMcVfss5e/wBRcGmcPqvnLEzj6M2dfWgFLJGiHexn
09basoJWtNU9a8hPhMd77ucS4+dUgH63JHsbizFNuB76va6lZjia7lfGx5GRw5O6
8QeiBr1WHqPYIXRdm3czTltXS8u8C/0bATgd9P8+TLTmfTC4V3AHcuwgVvCWrNUA
NgbRx7HUHpSh3Fy4KyyhadzlALW8hwQGZcaaN5K81v48WKdyrBQ=
=FeZ3
-----END PGP SIGNATURE-----

--qftxBdZWiueWNAVY--
