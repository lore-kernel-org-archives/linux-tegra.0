From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 07/13] dt-bindings: i2c: Add support for 'i2c-bus'
 subnode
Date: Fri, 17 Jun 2016 18:23:24 +0200
Message-ID: <20160617162324.GF27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-8-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1542311797=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1466165027-17917-8-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1542311797==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AH+kv8CCoFf6qPuz"
Content-Disposition: inline


--AH+kv8CCoFf6qPuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 01:03:41PM +0100, Jon Hunter wrote:
> The I2C driver core for boards using device-tree assumes any subnode of
> an I2C adapter in the device-tree blob as being a I2C slave device.
> Although this makes complete sense, some I2C adapters may have subnodes
> which are not I2C slaves but subnodes presenting other features. For
> example some Tegra devices have an I2C interface which may share its
> pins with other devices and to share these pins subnodes for
> representing these pins so they have be shared via the pinctrl framework
> are needed.
>=20
> To allow I2C adapters to have non-I2C specific subnodes in device-tree
> that are not parsed by the I2C driver core by adding support for a
> 'i2c-bus' subnode where I2C slaves can be placed. If the 'i2c-bus'
> subnode is present then all I2C slaves must be placed under this subnode.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)

I think this makes a lot of sense, so:

Acked-by: Thierry Reding <treding@nvidia.com>

One minor inconsistency below...

> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentatio=
n/devicetree/bindings/i2c/i2c.txt
> index f31b2ad1552b..ed56b08c7e6e 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -32,6 +32,14 @@ wants to support one of the below features, it should =
adapt the bindings below.
>  - clock-frequency
>  	frequency of bus clock in Hz.
> =20
> +- i2c-bus
> +	For I2C adapters that have child nodes that are a mixture of both I2C
> +	devices and non-I2C devices (such as a pin controller), the 'i2c-bus'
> +	subnode can be used for populating I2C devices to prevent the I2C core
> +	from attempting to add any non-i2c nodes as I2C devices. If 'i2c-bus'

"non-I2C"

Thierry

--AH+kv8CCoFf6qPuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCP7AAoJEN0jrNd/PrOh5GQP/j1RAg4xj0cnLPnh7R+kYUp8
dhEm7LU5ryn21pH06NJqAlvevGeLhvobLqiL386/EoTK8rD8L6VLzzufz+7b6fwL
QQXf2/7lfEBxR6KFTPft2bCT1tP9DfNResNMpUYY51rtTIcY0HGEjlkiq7+UF6mA
05MPfDQAKP0F5t3yq4VTVv9KXaAK9ZAGbcO+GqSk+WOyWT1Rdj0GSdCR33yQ0Of3
+Y4Nu15PnlVNDdgf6nANFWZiEc7VuCaGXweBDTyew0yH8kdzBYzrJnXuHF6wUn1J
TX8ewSnU66c2M44R+xHwkeEscYrbeFL3GC60VwoeIvF8eyoCX5Bnen0WUM4rcczH
eoSk+NpJEO7grbL4SscPb3rk8JQ7T3js9gS6fe9UhWe+PjHmg6Q1YV5xol2zXUq/
Ke6C56XtzxEIp0ZI+bRoPt59YJtbwF/8h/J+uRwBuOvw9swwGfwy6Ocr5ZXfZWi8
iwW1l3r6z39KOAJtoHqTQ0R2/K2gmwtpiy8KiLhLeooAxkhAds1APatfj2YATcB0
SSAZwCQOdHLb25d0VbV5Jsx2Fac1xoUwovSX4sIyOv5b4qHdrkGde8ZUCy/Ewrhy
7Obi4f0+LV2WbfBh8ELr3JzZZghPoBAP3TNzADQfGruo2RPkU4QmjPrmn7ubgMmj
Ny0+QV8hH8SiWljHfEWL
=CLvV
-----END PGP SIGNATURE-----

--AH+kv8CCoFf6qPuz--

--===============1542311797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1542311797==--
