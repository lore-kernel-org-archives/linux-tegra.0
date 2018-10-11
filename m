From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 1/5] dt-bindings: usb: xhci-tegra: Add power-domain
 details
Date: Thu, 11 Oct 2018 18:49:52 +0200
Message-ID: <20181011164952.GC7393@ulmo>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
 <1538143910-24400-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538143910-24400-2-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-tegra@vger.kernel.org


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2018 at 03:11:46PM +0100, Jon Hunter wrote:
> Add details for power-domains to the Tegra xHCI bindings so that
> generic power-domains can be used for inconjunction with the xHCI
> driver.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt | 8 +++++=
+++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.t=
xt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
> index 3eee9e505400..4156c3e181c5 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
> @@ -59,6 +59,14 @@ For Tegra210:
>  - avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1=
=2E05 V.
>  - dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
>  - hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8=
 V.
> +- power-domains: A list of PM domain specifiers that reference each powe=
r-domain
> +  used by the xHCI controller. This list must comprise of a specifier fo=
r the
> +  XUSBA and XUSBC power-domains. See ../power/power_domain.txt and
> +  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
> +- power-domain-names: A list of names that represent each of the specifi=
ers in
> +  the 'power-domains' property. Must include 'xusb_ss' and 'xusb_host' w=
hich

Total bike-shed comment: maybe call these "superspeed" and "host" or
something. The xusb_ prefix is kind of redundent because of the context.
On the other hand, those are the names by which the power partitions are
referred to, so either way:

Acked-by: Thierry Reding <treding@nvidia.com>

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlu/fzAACgkQ3SOs138+
s6E1Kg//WXm9D1vGvegOneAlxvdtj2qjj88BeB3Jlvl46mxINwhmlrWB52aZJMwz
WUekuHgpyEVBoINMlAxFqYCPurWMnFClFLkj/VeiE8qLqRSjnNmIbTNQoTahXzAm
sFsxLUX7RnEYCJAbAiY+8QjTqs3sPCObl5RAn/5/hJWgQIAtAtAcIo5OOG1TsZze
PJxRxAoLgB6RkJG1FvXEO6RhR63waxFd8OtIr6c4lqsix/v8f6UJohAyL0fCdQ7y
PJy3z9DYRLtf65njFH4mwH9VTrWBV7dtnFgpShjTkfeIk4tYb1z1KBxm+sAoNqTI
wHcWmUAZglrbCErqBH4lYSESLv9Xy46ArDbNtq4QnFRRMkZJGmyr/qux+cuUA9pX
KPTRMJRCzqJCoMFfm2MHcliB98mkII3naJj6TYdO+G0df3USMqjGsFPYiV83ry+5
WObcRjdgAAlUhl8w0gW9NAETuuzWIdkZ7uBkY7R8Emv/OQuWTXsud0zdDXsbubeQ
R6I+QGawaJrYxnFz/7EXT2EAn9uFj/YCiUwbRLJ70ePftEWorKHTP0Fbl52NJHEV
f2qKYLJ+BUW4vhkd+H/S4NQQ0t0VVrbgOFQyWGggSFkO3t3O7aOloiSF103i3mdZ
nu6X0RvONuK6nPo3QTvxw0mZa5imA914oTQ1n0j9p+HRA/a4O8E=
=TH2z
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
