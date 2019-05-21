From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 07/15] PCI: dwc: Add support to enable CDM register
 check
Date: Tue, 21 May 2019 12:38:24 +0200
Message-ID: <20190521103824.GG29166@ulmo>
References: <20190517123846.3708-1-vidyas@nvidia.com>
 <20190517123846.3708-8-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rV8arf8D5Dod9UkK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517123846.3708-8-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--rV8arf8D5Dod9UkK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2019 at 06:08:38PM +0530, Vidya Sagar wrote:
> Add support to enable CDM (Configuration Dependent Module) register check
> for any data corruption based on the device-tree flag 'snps,enable-cdm-ch=
eck'.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
> Changes since [v6]:
> * Changed "enable-cdm-check" to "snps,enable-cdm-check"
>=20
> Changes since [v5]:
> * None
>=20
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * None
>=20
> Changes since [v2]:
> * Changed code and commit description to reflect change in flag from
>   'cdm-check' to 'enable-cdm-check'
>=20
> Changes since [v1]:
> * This is a new patch in v2 series
>=20
>  drivers/pci/controller/dwc/pcie-designware.c | 7 +++++++
>  drivers/pci/controller/dwc/pcie-designware.h | 9 +++++++++
>  2 files changed, 16 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--rV8arf8D5Dod9UkK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzj1SAACgkQ3SOs138+
s6FzehAAj26+Vd/E7W30W6r5t7V5VvOWhcFf3Jmp59yLidN65C8DRR41Qhw7YEyK
/2glrrtwu+zYgwWKSDLqCrfiQ+DhsYH+XP6S8t/YVwRN6uMF9IcYK216kVu2vAS0
ielsNNQOzGWWOWZPzhNZMpApcyeD7X+MyNGpaEfE0ddLHTxmnhDj4V2jOH1d5Ax7
1hnpU64dNMX0eH0zjA746QXoAhtrwtGwSBMQMkxEhkGmt0UKJFKabWXgvk3zhZX3
8U6Beasycz9+hkm0GEpyXcb+S30lVxQWen+i5ZvyfhHQ7+RsREY/SQu1go997YEs
yLsYeRtsd3wNliiJu1l4PNhJY9bI1i1OthM+NuH08cbAHBm9s0+eTX/Ko4s0gf3n
ICptVCYsVN6o6QkKnj14uWpbZ0Z2vQ4VeP4bs6vqy7sGruFWGuA9iZ85MQe+bEjU
AcaosScNT/X3g7TRgVQTGuZixEpGJg2Llv4fbYdkA3JRDiJxw2ewSxoLGpZnlGM2
Toodt5B961wBAOfv3p2gXTPqliyDJwCYGYkt8uTuSMiwfn3GyQSamFQWuLz8uRrA
LFiU26ht43GDUFhwjXCYJ1uIZRoyzl7HuM+WxySx2hYevDz3L4EdGiJf6qe8SBHH
RYMmHHYHxRbwR3Mfpm+sBCQgIFKDokaptNjuxiMkwVlgtGuW8hc=
=GXch
-----END PGP SIGNATURE-----

--rV8arf8D5Dod9UkK--
