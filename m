From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 01/16] PCI: Add #defines for PCIe spec r4.0 features
Date: Thu, 11 Apr 2019 12:13:53 +0200
Message-ID: <20190411101353.GE4633@ulmo>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
 <1554407683-31580-2-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8497433865196727629=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1554407683-31580-2-git-send-email-vidyas@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, mperttunen@nvidia.com, mmaddireddy@nvidia.com, linux-pci@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, kthota@nvidia.com, kishon@ti.com, linux-tegra@vger.kernel.org, robh+dt@kernel.org, gustavo.pimentel@synopsys.com, jingoohan1@gmail.com, bhelgaas@google.com, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--===============8497433865196727629==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Content-Disposition: inline


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2019 at 01:24:28AM +0530, Vidya Sagar wrote:
> Add #defines for the Data Link Feature and Physical Layer 16.0 GT/s
> features.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes from [v1]:
> * None
>=20
>  include/uapi/linux/pci_regs.h | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index 5c98133f2c94..3e01b55d548d 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -705,7 +705,9 @@
>  #define PCI_EXT_CAP_ID_DPC	0x1D	/* Downstream Port Containment */
>  #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
>  #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
> -#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PTM
> +#define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
> +#define PCI_EXT_CAP_ID_PL	0x26	/* Physical Layer 16.0 GT/s */
> +#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL
> =20
>  #define PCI_EXT_CAP_DSN_SIZEOF	12
>  #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
> @@ -1045,4 +1047,22 @@
>  #define  PCI_L1SS_CTL1_LTR_L12_TH_SCALE	0xe0000000  /* LTR_L1.2_THRESHOL=
D_Scale */
>  #define PCI_L1SS_CTL2		0x0c	/* Control 2 Register */
> =20
> +/* Data Link Feature */
> +#define PCI_DLF_CAP		0x04	/* Capabilities Register */
> +#define  PCI_DLF_LOCAL_DLF_SUP_MASK	0x007fffff  /* Local Data Link Featu=
re Supported */
> +#define  PCI_DLF_EXCHANGE_ENABLE	0x80000000  /* Data Link Feature Exchan=
ge Enable */
> +#define PCI_DLF_STS		0x08	/* Status Register */
> +#define  PCI_DLF_REMOTE_DLF_SUP_MASK	0x007fffff  /* Remote Data Link Fea=
ture Supported */
> +#define  PCI_DLF_REMOTE_DLF_SUP_VALID	0x80000000  /* Remote Data Link Fe=
ature Support Valid */
> +
> +/* Physical Layer 16.0 GT/s */
> +#define PCI_PL_16GT_CAP		0x04	/* Capabilities Register */
> +#define PCI_PL_16GT_CTRL	0x08	/* Control Register */
> +#define PCI_PL_16GT_STS		0x0c	/* Status Register */
> +#define PCI_PL_16GT_LDPM_STS	0x10	/* Local Data Parity Mismatch Status R=
egister */
> +#define PCI_PL_16GT_FRDPM_STS	0x14	/* First Retimer Data Parity Mismatch=
 Status Register */
> +#define PCI_PL_16GT_SRDPM_STS	0x18	/* Second Retimer Data Parity Mismatc=
h Status Register */
> +#define PCI_PL_16GT_RSVD	0x1C	/* Reserved */
> +#define PCI_PL_16GT_LE_CTRL	0x20	/* Lane Equalization Control Register */

This looks correct comparing to the specification. However, this leaves
out some definitions, so I'm wondering if perhaps this should include
all field definitions. There are also extended capabilities between the
current maximum 0x1F and 0x25. Perhaps those should be added as well. I
guess this could always be done as a follow-up.

Perhaps it'd be better to change the subject to more accurately reflect
that you're only adding a couple of PCIe 4.0 features.

Other than that:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyvE14ACgkQ3SOs138+
s6Ggng/+LPX1tyWJWnSyBg/qhlXoB8rVsvcfYiZxFfoQUU9ypVHSw3HF57mMi1hp
mDEp6vuvrpBKQEl2BCLP4lAUsL0KapZQPW9Ox+94aKa+Y9V8Z3w7xOqQmWIC47To
lhh3sH9dY0Bwc3Oi9frJx/mBDV5OgDTMxA5a5oo5jizm/gJsWXiJnB8CqIYWcAhs
J5RsXBVT4Y5frrTW9M2zOFKW4b56hW8jieWjKZrbNfAh88CABo4VZMfGV95oJN0P
ADPAS3Bz9UsUleL/WN+kslx9I6stKOMN8dZTFio+sGSTnOEZXy72mBcyRMwjCOxc
G3JUtQE77u6I0h3h6Xomt/NBbAcfDxbJoQpUkt5MlfGZRXVaAixIS4UDjmJ895Vd
UwmhagN2T1eoukMk5Fz+hJ3yHcIWIMKeFAybQn8v3TBZQJCaCm6xuuDcfYqlLSP+
5TX2a+r5Z7hbRWo28pqgb0I3V2DZwLPwbTslm1ZJQO7nhbiaXAhZcWwsgGzwDX15
hiu6uQquNVkE2DjuPoXxQhhF+fRlwpFRdTMpK4OLH2GM8eZ4Z3djOif4Bfgd6Qzd
52ITNFL99A058QQ8Z1d8OaHe6fDOxufZhC7eR5kqrWl8/oWyzHsNgeqmYOVmm7lz
axjfiVTvpjdtFjrYCIzba2USCqyzQjZWS96YmuQHgA4WLwBOAzc=
=Wz/A
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--


--===============8497433865196727629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8497433865196727629==--
