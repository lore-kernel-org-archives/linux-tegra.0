From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 3/4] thermal: tegra: fix memory allocation
Date: Thu, 8 Nov 2018 13:37:59 +0100
Message-ID: <20181108123759.GD1340@ulmo>
References: <1541410354-19090-1-git-send-email-wni@nvidia.com>
 <1541410354-19090-4-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541410354-19090-4-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 05, 2018 at 05:32:33PM +0800, Wei Ni wrote:
> Fix memory allocation to store the pointers to
> thermal_zone_device.
>=20
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/thermal/tegra/soctherm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvkLicACgkQ3SOs138+
s6Elsw/5Aas+YpgirvdZ9IdbdolpHjvFwEAU5+cQ2nOUQvXW0loVcY76EtIB/OJr
rktUB0oZQxBk8M6Lhnkv01QozK48scohs25UrWX3SjUqRe/rDXIA1a+Q6O38PllB
oeLReEiMMlL7qxkrRaLuvgHWsJm9cbnFiKvVPxxv46fmADRHEgORAleHqMwV0HuN
XiopKVT4VQpCvLVGwYhaT7RmvPQMQih99a62QDYRdqxZ7LkDA7SVu6YaAjfjfd8/
Q3MurcL1sJHimXNaApcUJYXkuo8Gc8LR5CQxDt7KFyBqcCBbBB4wnY8T+BP5J8Mj
DG9ktJkuFj6/tHae2C6XiHrLQRLhCqiCpa2R2TSdfEayiuayQeppRwCzjZA0YpXr
y0L8FJV9+kqP6lsmA+reaNyFIJpLro9sCUCHl2Tgq1XR4N8AsPo9t8QNMGYhBT51
Qv6XQ5uUoiRE1hYDprgYX8QGn310jbmfHMNftyCs00m5imq/HAa5YG0jRQfZZYuM
GTxn6/OQl3VMdJiUsnP8rUaWmPsTtk+aHe57DCPKIuo/fA1RtSIJrmXW5NWbGpl2
FMfJCGp2I8LRwXD6VWKqVCseho91c7vF9o4Aa3dVLyFz6yjCerk8G94PqClfd0y+
/ZvctjOnfpUm0TLA87YmUhR7ps7i50HnaZGm5m4zgVU09A1vEaY=
=rsVD
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--
