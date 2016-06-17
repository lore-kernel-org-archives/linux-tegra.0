From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 11/13] arm64: tegra: Add SOR power-domain node
Date: Fri, 17 Jun 2016 18:42:02 +0200
Message-ID: <20160617164202.GJ27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-12-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HcccYpVZDxQ8hzPO"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466165027-17917-12-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--HcccYpVZDxQ8hzPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 01:03:45PM +0100, Jon Hunter wrote:
> Add node for SOR power-domain for Tegra210 and populate the SOR
> power-domain phandle for SOR and DPAUX nodes that are dependent
> on this power-domain.
>=20
> Please note that although neither the SOR or DPAUX drivers currently
> support runtime power-management, by populating the power-domain node
> the SOR power-domain will be turned on before probing SOR or DPAUX
> devices and kept on while the devices are bound.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

I've got patches queued in my drm-tegra tree to add support for runtime
PM for the SOR driver. Will that in some way clash with this work if
merged in parallel?

Thierry

--HcccYpVZDxQ8hzPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZChaAAoJEN0jrNd/PrOhlDgP/2Q7shmXSdCM1gr237rbLzy2
+w01Uc0h98GKJ7NgwasyC7d7hwqxgO/Te+PGxXcEenr1Fg1NkTPjDQGR+LCJsUqX
MbL0lYiwo2rGEJXNLcclzBadlvTs/rrxFksBHfObxRqhq1pmTXlxULmw/EsY1JfL
9QBaKOIevGqqUIRH25SXORgUDoGjPlofv+Cz7BoOmoelL5VsemKd+beLb1TBtOGX
Ca/rqXIyb6GYfKwrlyoq0oGa0OngoZI2imLUziZenhca4oQnwvFYu7Jl2Ij5/t/N
M/VDOpKQmyzODycaayLswDf/sOn/4UtAaKJuxjhPbu1Awn1knzMkh78sppPDA/fy
z3X5VtywVtodLiinDUQ3Rrr4d/dzOSRgUr5Zv8S7fR85ATW+RoBtr8PWNfcDzXST
G8y4PIMH+rtOjt9rOFIHNo9vwlRSDv6ei5YPoqI+7z1tG/XCUbfviNx9Hip0PJC3
Aw8IS/K0K8PfR1V1uEDDZKrvscfqsUN+pHRm67OP2hzVl/jQt/ODXX3lVw3UD13P
SG+C55BfMi7cKSfHGtGdDHjpArFJvJ2GawklB/WWgQCB9lED+HUTj/5XJJCWEJ/u
kJUmWAkFHjrekAtYh5jEWbNvv4qhE9aMzWGN7CwTCo2SF7SejbipmkDLCjCducvx
G1faXWzZcLR+FuRLE/O5
=HyVL
-----END PGP SIGNATURE-----

--HcccYpVZDxQ8hzPO--
