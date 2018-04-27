From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 3/3] usb: xhci: tegra: Add support for managing
 powergates
Date: Fri, 27 Apr 2018 12:13:00 +0200
Message-ID: <20180427101300.GR30388@ulmo>
References: <1524754750-3633-1-git-send-email-jonathanh@nvidia.com>
 <1524754750-3633-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Kuk/n493crKO4rgR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524754750-3633-3-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Kuk/n493crKO4rgR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 26, 2018 at 03:59:10PM +0100, Jon Hunter wrote:
> The Tegra XHCI controller requires that the XUSBA (for superspeed) and
> XUSBC (for host) power-domains are enabled. Commit 8df127456f29
> ("soc/tegra: pmc: Enable XUSB partitions on boot") was added to force
> on these power-domains if the XHCI driver is enabled while proper
> power-domain support is added, to ensure the device did not hang on
> boot. However, rather than forcing on these power-domains in the PMC
> driver we can use the legacy Tegra powergate APIs to turn on these
> power-domains during the probe of the Tegra XHCI driver.
>=20
> In the near future we plan to move the Tegra XHCI driver to use the
> generic PM domain framework for power-domains and so to prepare for
> this only use the legacy Tegra powergate API if there is not PM
> domain associated with device (ie. dev.pm_domain is NULL). Please
> note that in the future the superspeed and host resets will be handled
> by the generic PM domain provider and so these are only these are only
> needed in the case where there is no generic PM domain.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>=20
> Changes since V1:
> - None
>=20
>  drivers/usb/host/xhci-tegra.c | 68 +++++++++++++++++++++++++++++++------=
------
>  1 file changed, 49 insertions(+), 19 deletions(-)

Seems fine to me:

Reviewed-by: Thierry Reding <treding@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

--Kuk/n493crKO4rgR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlri96sACgkQ3SOs138+
s6HZhw//egJEzwCSLViIX7vjQ8k/H9ZEACSjHStMmwnvl6iemM0c6UwIX9Zwpbc+
d3yKlTj1CLBgNus9hVGH2OoXCK1ve+XMisUKvQUAXxOCONqWXQ5RI20aWleQJx6g
rpwX3R/GFfRuNvSEUoQmWHUMZw6HcJGMMU5JvwqimWqlDStEn8APzxpBx/5x51Rt
XgmDgArgb248qotsu4sYz0dEeoQkKdvId4TL/SR9JV4c4XrxPmaglDh+eJo+sFFm
CG34Ro9rcHdzLu1rhYnnZuKxN9cR4A1vxWnrB/ETCBlIZpQ/zSQeqN/1lutm1B1r
np/zUcpZtxNyU1BU01/XUdnrgm5tonFQoO/UpFk4JAJ0eqmwhS6gL6e2vtJ0j2+/
GEoA+mllur7IBnsTsY16PGu5cfm+JQe+XCsU4pcqemF1594KlDiRxLXeqH3W/U+6
6Av+VXp0xQhF6Gqmzxfygkj8R7RD1ng+rpwZAResezH4GJZk3MZCMGdfxzw13PeL
UnCEdqukPqcTSZI+QcQJ3+yFnDzl65t7MnPSJT4LrVCzMiPxND7YUzx2oX230GIv
ZUvj9CIrc4r1IUSKK0hz43Rsie6O3gVvSPYPsexpy9v4pHdKu/RCh/QhIaERbx2F
5tn5qh+3s/DiHn+LnOxDJUbHCsZhrC70oh6XbKT0EfGOzivueNg=
=B7hL
-----END PGP SIGNATURE-----

--Kuk/n493crKO4rgR--
