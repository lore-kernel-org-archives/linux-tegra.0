From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 4/6] PCI: tegra: Add support to enable slot regulators
Date: Mon, 2 Sep 2019 13:40:00 +0200
Message-ID: <20190902114000.GG19263@ulmo>
References: <20190828172850.19871-1-vidyas@nvidia.com>
 <20190828172850.19871-5-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9/eUdp+dLtKXvemk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828172850.19871-5-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--9/eUdp+dLtKXvemk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 10:58:48PM +0530, Vidya Sagar wrote:
> Add support to get regulator information of 3.3V and 12V supplies of a PC=
Ie
> slot from the respective controller's device-tree node and enable those
> supplies. This is required in platforms like p2972-0000 where the supplies
> to x16 slot owned by C5 controller need to be enabled before attempting to
> enumerate the devices.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> V3:
> * Added a dev_err() print for failure case of tegra_pcie_get_slot_regulat=
ors() API
> * Modified to make 100ms sleep valid only if at least one of the regulato=
r handles exist
>=20
> V2:
> * Addressed review comments from Thierry Reding and Andrew Murray
> * Handled failure case of devm_regulator_get_optional() for -ENODEV clean=
ly
>=20
>  drivers/pci/controller/dwc/pcie-tegra194.c | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--9/eUdp+dLtKXvemk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1s/5AACgkQ3SOs138+
s6GrjA/+MtsbQCfp8LKNLtXIAB9YZZ4egzdAnTHcT5Q8avyAv+spu6XTF4QUYTXr
ddGsqMuqZb6GFzPuALVW538dPpZJNbxKj2SAYXX8R+peSTCLi7q2iYbVRLXy87LX
bfa1a2ZvUB6QCbUyjtrVrGxJ7qMznfRH8GRaIkRPzvYhs9vceoSdUMstxfwdV+lo
5BO0x3mbWxm1EclBwHt+6DG0DYSLn7jmXYKJMc2Vly9Kuw3tApOyM2iHuiAs8zTO
9BmHFzKa88QsF/7Uk11rpFc2AnCbsn8nSTXbyRwebGhOMbosBVLgGhlt43trzHiM
uuYjh7UNfeHKQ2I9qmbaze/TaDC8kJcbCsNyxZkFBpiGmtFYyt8t59sEDVlm8gtl
bq0UQGhV5hn77I8KY5j0nQoRAlcZUrfg959QvIvTq3wq7YXnPXxmbniSEJceAzuL
aU2PJ2hbygWQgjmeuvB8lTXxEMhv/RfzIUVS1NnPSq02vjOGihf7prSN8F6VAoom
HoUXgjQVEAdU/lo3nBuJt977fv5zVH7cOEgG6aJMpqPbFNvk4rm+QuYB5ED8+mDY
Dvssm1YWsZe64dSgdY8XpD7/Vvbe0RTHu1dSXsC5KjhfTKkHlfjJm3xia/HyjDwD
OYJPDbss7TA8RH64Wgczu1N7WQVfvDv2q5wdqHmA/f9EasuG4j8=
=UhQc
-----END PGP SIGNATURE-----

--9/eUdp+dLtKXvemk--
