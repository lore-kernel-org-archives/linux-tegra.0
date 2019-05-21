From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 08/15] dt-bindings: Add PCIe supports-clkreq property
Date: Tue, 21 May 2019 12:39:27 +0200
Message-ID: <20190521103927.GH29166@ulmo>
References: <20190517123846.3708-1-vidyas@nvidia.com>
 <20190517123846.3708-9-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tT3UgwmDxwvOMqfu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517123846.3708-9-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--tT3UgwmDxwvOMqfu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2019 at 06:08:39PM +0530, Vidya Sagar wrote:
> Some host controllers need to know the existence of clkreq signal routing=
 to
> downstream devices to be able to advertise low power features like ASPM L1
> substates. Without clkreq signal routing being present, enabling ASPM L1 =
sub
> states might lead to downstream devices falling off the bus. Hence a new =
device
> tree property 'supports-clkreq' is added to make such host controllers
> aware of clkreq signal routing to downstream devices.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since [v6]:
> * None
>=20
> Changes since [v5]:
> * s/Documentation\/devicetree/dt-bindings/ in the subject
>=20
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * Rebased on top of linux-next top of the tree
>=20
> Changes since [v2]:
> * None
>=20
> Changes since [v1]:
> * This is a new patch in v2 series
>=20
>  Documentation/devicetree/bindings/pci/pci.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--tT3UgwmDxwvOMqfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzj1V8ACgkQ3SOs138+
s6GxMA/+NpI6ZwlnTMAsJ8ruKfvjYGpc3OE5nyJWsBE+w/rPCtvydx/UNDb4nMh8
gdNQ08uHKoRG7fx7mW8u8nuExzY8euEy3GPdIDycVfEtIzu68wTOL0Fma9cjAOxe
cc+QaowCdUqRpEgs6ofUrcOUfPAV821c/wJ3O77MjlO99apfproJWw4iupCmUsot
b5M7jiptwqfi5OJklcQG2szxmbu23vBr1x+BuPDq6D+zF/K7LVuA1BSuMDywdvnc
24PpnWha4OV8zo1Ql5mUr0+F3VO+QP/lQO2YWvXx/mHO/zVp3IzKKu8vmymJBUhm
OC5EeWj1+OBVmO6NXG8K3INzzsR6T21AssIkfsdeavGHZh+JE54IHIJnwiAnq1nZ
bWmwR1aD4sQ3f81ObETw2KYoiAbyCFo0pxAiiQKgHa/c5XGCk8XzCdxWWoTNMdZA
lntfi3itDEl1X7BjArF/z5j2WRHu8lG6wBdV9PySN6bUlzkvxk4phTFMDPzgJKBW
mC95CXIvTR6uLPfNchE7HuMd/ylsM/V/EbLUgmf2s3uiU+jMoDVs3o5Nvh5aQLHZ
vLMH4hozBmHGvyENFaXeBSMuExVnx2vwWfDpCxr/8M/VYMQsqkCsKyINzAtLmCQ3
lbzIKQRGlFmaPKwX7V39yTk1CPE5pkWYEM6Z9/cJXzEot37EH3g=
=KEQ8
-----END PGP SIGNATURE-----

--tT3UgwmDxwvOMqfu--
