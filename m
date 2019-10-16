From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] PCI: tegra: Fix CLKREQ dependency programming
Date: Wed, 16 Oct 2019 18:19:20 +0200
Message-ID: <20191016161920.GA2526111@ulmo>
References: <20191005164212.3646-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5181985294041930356=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191005164212.3646-1-vidyas@nvidia.com>
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
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, robh+dt@kernel.org, bhelgaas@google.com, andrew.murray@arm.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--===============5181985294041930356==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 05, 2019 at 10:12:11PM +0530, Vidya Sagar wrote:
> Corrects the programming to provide REFCLK to the downstream device
> when there is no CLKREQ sideband signal routing present from root port
> to the endpont.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  drivers/pci/controller/dwc/pcie-tegra194.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/con=
troller/dwc/pcie-tegra194.c
> index f89f5acee72d..cbe95f0ea0ca 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -40,8 +40,6 @@
>  #define APPL_PINMUX_CLKREQ_OVERRIDE		BIT(3)
>  #define APPL_PINMUX_CLK_OUTPUT_IN_OVERRIDE_EN	BIT(4)
>  #define APPL_PINMUX_CLK_OUTPUT_IN_OVERRIDE	BIT(5)
> -#define APPL_PINMUX_CLKREQ_OUT_OVRD_EN		BIT(9)
> -#define APPL_PINMUX_CLKREQ_OUT_OVRD		BIT(10)
> =20
>  #define APPL_CTRL				0x4
>  #define APPL_CTRL_SYS_PRE_DET_STATE		BIT(6)
> @@ -1193,8 +1191,8 @@ static int tegra_pcie_config_controller(struct tegr=
a_pcie_dw *pcie,
> =20
>  	if (!pcie->supports_clkreq) {
>  		val =3D appl_readl(pcie, APPL_PINMUX);
> -		val |=3D APPL_PINMUX_CLKREQ_OUT_OVRD_EN;
> -		val |=3D APPL_PINMUX_CLKREQ_OUT_OVRD;
> +		val |=3D APPL_PINMUX_CLKREQ_OVERRIDE_EN;
> +		val &=3D ~APPL_PINMUX_CLKREQ_OVERRIDE;
>  		appl_writel(pcie, val, APPL_PINMUX);
>  	}

If we do support CLKREQ, do we have to explicitly set the OVERRIDE bit?
Or clear the OVERRIDE_EN bit? Is it always guaranteed that the defaults
(OVERRIDE_EN =3D 0) is applied at this point?

That's an issue that's orthogonal to this patch, though, so for this
one:

Acked-by: Thierry Reding <treding@nvidia.com>

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2nQwMACgkQ3SOs138+
s6E8BQ/9G0VANNqYdS++3CnPnN8WpRzZ5X80eDfGsloeyXEpgMYt6+9yOAtm0JTO
3LKUqhWTtoxqnN9FqF6rTVhrfI+m7Wm2clBufTkX9OfDuRkFN4OD9bXBvWcNm43T
esUpA3PPPPPcjN+b2vGG7iSc95ZkbJdf6+9RpehqEe308SFcftIwHgMww4AFVVv8
3zATGvVSqU9oOK8J5TTVvKjlJ6JatSniwIUWj6GM8JdKduvD3qcua5BHOmRqgYJh
J+OApeTRDjRdeSRyPQuiTN8ByBp01Z228OBGoRsdTqnypLq5lNV5WGT4P9bywFVV
4+D99VAgL1qtSNlaJqxLUBiNjTDIGrkK6Z/pc1sgUVQdotLPjD47Vfh8URTskzz4
u2k2IRuowNPRpKV/7zto23j7PS10tOKCfTi63/+RVj+rahp4ACGAJy1Mn9dU3Zai
3zorkVVE02mUOsj5VKB9JQIetrqoxt+LLf+cjOZDfr8H+ehtDWIsb9b4QWFXlm5Q
4xgpPD9Uuw6pSfEd+qCT7VkudCwqYFsvyGjHVSfaL0/nHadHy+8cLGDb0tWBXUTY
8pMI8klIWZ0OUn2j/KPTj+x+dWalfEmS/5Ez/fM8IZpxOzQSHgd1VJAwmZTuChUR
vJhRao5glT/alH6W+G/yhGIKVpWDL1ZTeF35/ibVHqKOxi1JxV0=
=schF
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--


--===============5181985294041930356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5181985294041930356==--
