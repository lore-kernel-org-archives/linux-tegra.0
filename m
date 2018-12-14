From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 3/4] thermal: tegra: parse sensor id before sensor
 register
Date: Fri, 14 Dec 2018 15:19:17 +0100
Message-ID: <20181214141917.GD23379@ulmo>
References: <1544780993-20744-1-git-send-email-wni@nvidia.com>
 <1544780993-20744-4-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9dgjiU4MmWPVapMU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544780993-20744-4-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2018 at 05:49:52PM +0800, Wei Ni wrote:
> Since different platforms may not support all 4
> sensors, so the sensor registration may be failed.
> Add codes to parse dt to find sensor id which
> need to be registered. So that the registration
> can be successful on all platform.
>=20
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/thermal/tegra/soctherm.c | 45 ++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 43 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--9dgjiU4MmWPVapMU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwTu+QACgkQ3SOs138+
s6GQ2g/9H5U7iEqhcsBZjiDTsgCdVZQSZ3qaCmsCrX5pZCoGkMWiPpEs+xMhznPo
QgFAjvBMMRLhqUw28EAM+bk48lR4ZIxiBrFa0MYjFj7CcQZID0AAy7kI72Ot+lGd
Fs5l/ifEiZhPodNFdraWxe8QVVeZY6OXgpaoGp8MoMHUHaTG9TaIbA71YgQExCTO
rBXADQcrIcRsj7zgoROnWrsR97IqufVzOItO54rDBZnb38mQrlLYllQ2pH/r9itf
b974c0NFKutOgjsy+vqGpEkhygz/O0+MRY+C6YTjPTKwP+Mh0bwhdXRSoDO6vcd5
KDE26XGT9tAdYaNYxoi4Y0OyewKN22bJqYk7obpE+QjvF0TYmnU/YzTljmUPf9ps
GFisy+/5NWh0TnD+nQ/QbymKjc9fiTniqoaks4MN6DUjUsS4UdeAiHR0c+9IolN5
gPJPoXqFVQ8c1zqL7731OwgWK2RBsdfypL64XngoGqekoHw1dew7ovWy5AR1ZTqW
14K07cc9aXNrYeyRIWLL4fJAVOJxwNld7AeR0VzLIgc7x2K9PehRQMkcIsPuO7t/
FAW9RekprXEdpz9v8xia1ASRszF7RlvdBz/AyulyX3Jwh6lNLdKeszPbKc+KyAV5
mr8eiym+nRkBWvvlZutxcsMKTap/SWxEHOPgQe3IzkFI+A/4yoY=
=vvyd
-----END PGP SIGNATURE-----

--9dgjiU4MmWPVapMU--
