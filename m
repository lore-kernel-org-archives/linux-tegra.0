From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V5 12/16] arm64: tegra: Add P2U and PCIe controller nodes
 to Tegra194 DT
Date: Fri, 3 May 2019 13:26:37 +0200
Message-ID: <20190503112637.GF32400@ulmo>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-13-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jkO+KyKz7TfD21mV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424052004.6270-13-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--jkO+KyKz7TfD21mV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 10:50:00AM +0530, Vidya Sagar wrote:
> Add P2U (PIPE to UPHY) and PCIe controller nodes to device tree.
> The Tegra194 SoC contains six PCIe controllers and twenty P2U instances
> grouped into two different PHY bricks namely High-Speed IO (HSIO-12 P2Us)
> and NVIDIA High Speed (NVHS-8 P2Us) respectively.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * None
>=20
> Changes since [v2]:
> * Included 'hsio' or 'nvhs' in P2U node's label names to reflect which br=
ick
>   they belong to
> * Removed leading zeros in unit address
>=20
> Changes since [v1]:
> * Flattened all P2U nodes by removing 'hsio-p2u' and 'nvhs-p2u' super nod=
es
> * Changed P2U nodes compatible string from 'nvidia,tegra194-phy-p2u' to '=
nvidia,tegra194-p2u'
> * Changed reg-name from 'base' to 'ctl'
> * Updated all PCIe nodes according to the changes made to DT documentatio=
n file
>=20
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 449 +++++++++++++++++++++++
>  1 file changed, 449 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index c77ca211fa8f..dc433b446ff5 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
[...]
> +	pcie@14180000 {
[...]
> +		ranges =3D <0x81000000 0x0 0x38100000 0x0 0x38100000 0x0 0x00100000   =
 /* downstream I/O (1MB) */
> +			  0xc2000000 0x18 0x00000000 0x18 0x00000000 0x3 0x40000000  /* prefe=
tchable memory (13GB) */
> +			  0x82000000 0x0 0x40000000 0x1B 0x40000000 0x0 0xC0000000>; /* non-p=
refetchable memory (3GB) */

Please be consistent in the capitalization of hexadecimal numbers. You
use lowercase hexdigits in one place and upprecase in others. Just stick
to one (preferably lowercase since that's already used elsewhere in this
file).

> +	};
> +
> +	pcie@14100000 {

Also, entries should be sorted by unit-address, so controller 0 above
needs to go further down.

Thierry

--jkO+KyKz7TfD21mV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzMJW0ACgkQ3SOs138+
s6E+CxAAl1IP5hPwNub+ynrfDHIlvS8wnANVpXA+TBShMg1rBrA2c7ErQwRKFKrH
nt0A/GAU1JPp+Ugy6Rvesx1f+mNpHl3ueZY9DnlY7FRjfgv39qKvFuCRAPHR2YDk
CCgNJjCBroY3+OvmMxtK0b46pB7xtAwDXVBp0DbUGibGU+6wQ5XplqmwqQONu9YU
tmMCy2vpr1PNzwgLGfhC7owYfz4vQVzJDWeSfUVbuf0uuhaYg9Lak5cfPJqEPPEF
husujx86GqI+xk4zhAN/mvoMN9OoJplO7icUXCJRrB9lHOycZOA3SZwDFZm/rRmA
q7AwE+bXW0FIX6Zel+6wAxBdpwvqc/RJmsRAe1efSh88NuTFn3AWW8Fc4K+4mOn/
royxYh3z7Z/91PmfgoF9Ku6xtpeZVmD63lDQ+LHbTgrDb2lEjZ66Wcque1mYn4pt
N6ko8YOVjwSEu0kVTk36j7Qyrk7VMTzuloelaaplcXY8iX0ClplKPTYH8+FbzXgQ
W3itYlLXLNJQpfEceRZwuqWCcerLyURykmeVOih1n8PLuK0yEK8fr8GvyGP2JMvG
hoF0m1QDdjnm1G7LvfLCBrngb6Bze4wQ+wLqn2u3ydi0m1gU5vJ0ac1oKIhMm6Si
ntXZJ7cuJbnw4M3fkL8zHz+2HPyVZ+ZmZV/1GNX6KMKocNI8A6o=
=IZEE
-----END PGP SIGNATURE-----

--jkO+KyKz7TfD21mV--
