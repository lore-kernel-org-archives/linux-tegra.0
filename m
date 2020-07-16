From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pci: tegra: Remove PLL power supplies
Date: Thu, 16 Jul 2020 14:59:45 +0200
Message-ID: <20200716125945.GD535268@ulmo>
References: <20200623145528.1658337-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200623145528.1658337-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 04:55:27PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The XUSB pad controller, which provides access to various USB, PCI and
> SATA pads (or PHYs), needs to bring up the PLLs associated with these
> pads. In order to properly do so, it needs to control the power supplied
> to these PLLs.
>=20
> Remove the PLL power supplies from the PCIe controller because it does
> not need direct access to them. Instead it will only use the configured
> pads provided by the XUSB pad controller.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Hi Rob,
>=20
> I already made this change as part of the conversion series, but wanted
> to send this out as part of this subseries since it addresses a fairly
> long-standing issue that I'd like to clean up irrespective of the DT
> binding conversion. Since it looks like the conversion series will take
> a bit longer, I think it makes sense to send this out separately.
>=20
> Thierry
>=20
>  .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt  | 12 ------------
>  1 file changed, 12 deletions(-)

Hi Rob, any feedback on this?

Thanks,
Thierry

> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.tx=
t b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> index 7939bca47861..d099f3476ccc 100644
> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> @@ -112,28 +112,16 @@ Power supplies for Tegra124:
>  - Required:
>    - avddio-pex-supply: Power supply for analog PCIe logic. Must supply 1=
=2E05 V.
>    - dvddio-pex-supply: Power supply for digital PCIe I/O. Must supply 1.=
05 V.
> -  - avdd-pex-pll-supply: Power supply for dedicated (internal) PCIe PLL.=
 Must
> -    supply 1.05 V.
>    - hvdd-pex-supply: High-voltage supply for PCIe I/O and PCIe output cl=
ocks.
>      Must supply 3.3 V.
> -  - hvdd-pex-pll-e-supply: High-voltage supply for PLLE (shared with USB=
3).
> -    Must supply 3.3 V.
>    - vddio-pex-ctl-supply: Power supply for PCIe control I/O partition. M=
ust
>      supply 2.8-3.3 V.
> -  - avdd-pll-erefe-supply: Power supply for PLLE (shared with USB3). Must
> -    supply 1.05 V.
> =20
>  Power supplies for Tegra210:
>  - Required:
> -  - avdd-pll-uerefe-supply: Power supply for PLLE (shared with USB3). Mu=
st
> -    supply 1.05 V.
>    - hvddio-pex-supply: High-voltage supply for PCIe I/O and PCIe output
>      clocks. Must supply 1.8 V.
>    - dvddio-pex-supply: Power supply for digital PCIe I/O. Must supply 1.=
05 V.
> -  - dvdd-pex-pll-supply: Power supply for dedicated (internal) PCIe PLL.=
 Must
> -    supply 1.05 V.
> -  - hvdd-pex-pll-e-supply: High-voltage supply for PLLE (shared with USB=
3).
> -    Must supply 3.3 V.
>    - vddio-pex-ctl-supply: Power supply for PCIe control I/O partition. M=
ust
>      supply 1.8 V.
> =20
> --=20
> 2.27.0
>=20

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QTz4ACgkQ3SOs138+
s6FeQg/8CaFK3+6Kkic0c11leZZI9E0xjgiAmN+q72Hw95NEPMk8ylPzMpsmm772
MFJF0I7jtjlRt4mU0tt68B6xZT9itW7XiaHmvOxXZBaHp7MZsRVYHShaHMt1NM8Z
FIN6RCgVOHxKiKKf04oj03kGwcQY/7HIimM3Jwf2xp75Nd2pfloJV1vj7m70t52A
hUbazU4yJkliasOVz8i1zMbI2sgfOvHYVszO9OBme/hMH6mvPPrAoI3v6LZ90T+H
n34YptT8gR5ZC/9RsxClClLgchqycHVKoB+WG17Au9B6ezbOHlwSyMQSJDDJG5N5
z1lwVrTaM2ccPhc1FOHd6TFRWiImwg4CobXN1jeo+h6akSUwCC7K5n3mNnl5c3pq
jiMy4CgWi8byYeCXkEA5SgZptpdQ36vhpTpU8pTnM2m4hEMjTSOcb/te7l0EDa2K
voN+XuapYTAKjALdspqU6SVOiTtJsRNl6jpSn96K1888CZfnZsT3/JPMHgttNrF4
6i6TwNPCytFkG81IwuOMYVFyUjyaYtJpBsiBGDkFiMVngf1pIDZ3q44Pm1Ehs9wi
DpIKYQNyKZNKLHa13zCSHNel9mG5Mnb5pJVo/KC+NdC0gBoKZ/BAi0pCfHYmVhqA
3EEe5p4eSIBeh8dC2hrXXQSfjHSm/WAxtf+hgO9rORcIlf8MgPE=
=j1RD
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
