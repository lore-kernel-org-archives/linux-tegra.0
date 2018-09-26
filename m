From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drivers/thermal/tegra: Fix a double free on the
 device node
Date: Wed, 26 Sep 2018 17:24:59 +0200
Message-ID: <20180926152459.GL12980@ulmo>
References: <1535376738-14035-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1X+6QtwRodzgDPAC"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1535376738-14035-1-git-send-email-zhongjiang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zhong jiang <zhongjiang@huawei.com>
Cc: daniel.lezcano@linaro.org, rui.zhang@intel.com, edubezval@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ezequiel@collabora.com
List-Id: linux-tegra@vger.kernel.org


--1X+6QtwRodzgDPAC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 27, 2018 at 09:32:18PM +0800, zhong jiang wrote:
> The function 'for_each_child_of_node' iterates over the node list by
> dropping the of_node reference of the previous node.
>=20
> Calling of_node_put() on the iterator is pointless and leads to an
> inconsistent refcounting in addition to a double free. Remove it.
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
> ---
> v1->v2: According to Daniel's suggestion. I modify the subject and commit=
 log.
>=20
>  drivers/thermal/tegra/soctherm.c | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--1X+6QtwRodzgDPAC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlurpMsACgkQ3SOs138+
s6EP/A//QHaNYw7hhfwyhf5lt/U1Hy/GyDBw1Si537ox+QLGv14Dk2AiXSIR4tsp
z+pQ+mQHeJQoN5VYdQQ4DDLUUV9S+HC4Aavhh688ImwtD/EXw30oDta0GuxUAqJg
sPr+t8cdgqTXOt4ufTh3JsYtSGu3XpP8g0hoVHKSSiAnJTh3j1p9AHRyuAsBQrMX
LJXlveFToO49N+F3c7f88sfRyzZg0PjNDMXef2dQeVKbVatylu71WdH3P66M+2eD
K5RXj7oNqZQv2oPSGHJ00svPFZ18kaIu8Y3EErm6R1gDt877mUvxLKgFT36wv2JX
awP3a5FEw7ELkDKwADd80fZbejApU3Jja9H/fzwftiiYP9Edd4YBajn/hB7VPOSm
RxIIHgRL99IdjtTubQ2E5RKZ5xSdspfqvq6VXz7c+3K//pJ946bsBTKoj5LurSO2
dGNwaw0sLjI+9bl03i5Yt+V3oqeO2bAtH5ffN6JekPxjNsEB29gtUVMVsC4f2pXr
Kk8+wJ8pz92/3Wj3y6eaysDbve3NPZdwH/4fom/Hu8G8WDBWGV/gu2NvGldjB9z7
/XWI6Jhe7aXiTN6iwQS5Zrs2eRm73kG75Qk6yd9/cXqfU3q/ARbdLB42RW9NGr6K
jN+uXqGKfuvy2arGjamoM8YqK8EV+z2Ptk7GiS7Rz09oZgSLm6Y=
=dyqt
-----END PGP SIGNATURE-----

--1X+6QtwRodzgDPAC--
