From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 2/3] usb: xhci: tegra: Add runtime PM support
Date: Fri, 27 Apr 2018 12:10:16 +0200
Message-ID: <20180427101016.GQ30388@ulmo>
References: <1524754750-3633-1-git-send-email-jonathanh@nvidia.com>
 <1524754750-3633-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Mh8CTEa8Ax54aLHp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524754750-3633-2-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Mh8CTEa8Ax54aLHp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 26, 2018 at 03:59:09PM +0100, Jon Hunter wrote:
> Add runtime PM support to the Tegra XHCI driver and move the function
> calls to enable/disable the clocks, regulators and PHY into the runtime
> PM callbacks.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>=20
> Changes since V1:
> - Re-worked change to handle case where runtime PM is disabled.
>=20
>  drivers/usb/host/xhci-tegra.c | 89 ++++++++++++++++++++++++++++++-------=
------
>  1 file changed, 63 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 02b0b24faa58..85f2381883ad 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -18,6 +18,7 @@
>  #include <linux/phy/tegra/xusb.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> @@ -761,6 +762,50 @@ static void tegra_xusb_phy_disable(struct tegra_xusb=
 *tegra)
>  	}
>  }
> =20
> +static int tegra_xusb_runtime_suspend(struct device *dev)
> +{
> +	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
> +
> +	tegra_xusb_phy_disable(tegra);
> +	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
> +	tegra_xusb_clk_disable(tegra);
> +
> +	return 0;
> +}
> +
> +static int tegra_xusb_runtime_resume(struct device *dev)
> +{
> +	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
> +	int err;
> +
> +	err =3D tegra_xusb_clk_enable(tegra);
> +	if (err) {
> +		dev_err(dev, "failed to enable clocks: %d\n", err);
> +		return err;
> +	}
> +
> +	err =3D regulator_bulk_enable(tegra->soc->num_supplies, tegra->supplies=
);
> +	if (err) {
> +		dev_err(dev, "failed to enable regulators: %d\n", err);
> +		goto disable_clk;
> +	}
> +
> +	err =3D tegra_xusb_phy_enable(tegra);
> +	if (err < 0) {
> +		dev_err(dev, "failed to enable PHYs: %d\n", err);
> +		goto disable_regulator;
> +	}
> +
> +	return 0;
> +
> +disable_regulator:
> +	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
> +disable_clk:
> +	tegra_xusb_clk_disable(tegra);
> +	return err;
> +}
> +
> +

There's an extra blank line here. Other than that, this looks very nice.

Reviewed-by: Thierry Reding <treding@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

--Mh8CTEa8Ax54aLHp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlri9wgACgkQ3SOs138+
s6FCfA/+NIIPUPLO3LD+ESfrgxl8t2zBE2yH/a8k3Kp5eiW4oJ69Jt1ZAeHjjqPq
9F3BisdjSWQjYqML2ap8eQFP+b6F7qPjFQN6e3u2V782762UJ4Xq1uJjBC2Z5inw
StepwEfvw1c9FmfXx6DXPghGcwrAyYY1aGztLI/5JeoEl2J/fyMcPTX5KKjvTDSw
SLAQvlh2LEaMhaym20JZWMTREyuzdRkhNpJGc0d61jk+hDr97tmaNF+Ad3WsX4o2
Hk3Y0clnwqnoN9+DZ0dGj7thIMGsxoLfhs+1Yl1m77/IYXXfRtXfeoEvqLbdvN6c
EH6AgJUpQ+hrcYhmd6q9mGROmp8OHEwruhlHNA9cfDwl6ZQlCNdhUJVUM8msBHBl
cEnRI0qdSUHhQtjuEXCn//YOmeEX6iBtwsvZJBeqdhNUEQc2RFrKVRYfUlRzX2QC
I58WFQYKP+n7q+b3qsWccXDXVsx5Xgb9ffxIzbbq6NLj9qgygL1La0BFnZxrfi8r
iNtYW6ZYwHDHbjPHuSxWg/ilGR56WGQ41uEl81def3fEIe/W0ta6YLxN8OrB8r6W
Eop3MFWG6HqqNbuROdLkPXq18seQUaB9je9O/n0lQADwMMXY278hLA2HVXGla9qO
lCqkwTPCQC2Jx5RKq5lr8jVR8nBElriEmq4X+d7LRFZrMJjlZcI=
=m7h4
-----END PGP SIGNATURE-----

--Mh8CTEa8Ax54aLHp--
