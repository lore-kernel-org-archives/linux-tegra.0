From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 06/12] PCI: tegra: Enable opportunistic update FC and
 ACK
Date: Thu, 14 Dec 2017 16:30:22 +0100
Message-ID: <20171214153022.GG13733@ulmo>
References: <1509371843-22931-1-git-send-email-mmaddireddy@nvidia.com>
 <1509371843-22931-7-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KIzF6Cje4W/osXrF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1509371843-22931-7-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--KIzF6Cje4W/osXrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2017 at 07:27:17PM +0530, Manikanta Maddireddy wrote:
> This patch ensures that DL sends pending ACKs and update FC packets when
> link is idle instead of waiting for timers to expire which improves PCIe
> bandwidth.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V3:
> * no change in this patch
> V2:
> * no change in this patch
>=20
>  drivers/pci/host/pci-tegra.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index c862facfd6e9..4562b0c113a8 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -211,7 +211,9 @@
>  #define  RP_ECTL_6_R2_RX_EQ_CTRL_H_1C_MASK	0xffffffff
> =20
>  #define RP_VEND_XP	0x00000f00
> -#define  RP_VEND_XP_DL_UP	(1 << 30)
> +#define  RP_VEND_XP_DL_UP			(1 << 30)
> +#define  RP_VEND_XP_OPPORTUNISTIC_ACK		(1 << 27)
> +#define  RP_VEND_XP_OPPORTUNISTIC_UPDATEFC	(1 << 28)
> =20
>  #define RP_VEND_CTL1	0xf48
>  #define  RP_VEND_CTL1_ERPT	(1 << 13)
> @@ -2149,6 +2151,16 @@ static void tegra_pcie_enable_rp_features(struct t=
egra_pcie_port *port)
>  	writel(value, port->base + RP_VEND_CTL1);
>  }
> =20
> +static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)

Why not make the name reflect what the function does?

Thierry

--KIzF6Cje4W/osXrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloymQ0ACgkQ3SOs138+
s6GIGxAAkCXkJFnCEXzX+3rgTUCbMMjHh6WBgqt+kBM1HoQ+7LIpmxV22WEt9wwG
ixv7DSnat9/HGqqAXqo0cQ2poKu6X/s/6vzRh40Mx6yLROmZGsm/OMOtAXlD6jv/
cV0W1uGufgclQU7JIij1FikND8rQ847FVwZpPddtb62cVll3UFRYq5ypTCFlzju0
qgu75ElwVTq04/2PFZIrX/Z/h6aqWofCYHYCffSiYK+bJTIvR2OYFd6gwBoRFO6B
xuTA8PmZsdX5kd1taqjy1Av4F4cFZe39g5/GFseG0CdZm8SBbpYfOz8jWfL2buVA
HBNsbVkAly224oP4Zc/a//OZEV3+fONDS4gOYJ3tvgUvb4r/KGn3u6vO9ALHl1bq
hITEcHQWjSHCMcHM4ZJP32Qw5zxTmHu8eynIfK27VPTJEpXL/1XOIU0f94LUQjle
P24UGqtgjXh2zsnzy3Z1aBKtMbMfiNyET0SU5emW35sB/b8hwlPCRxDR7uJ/21TC
+lmgihXRZONhYaSrVOix1IIZ6Ja33cKH+bnqwMLzm3/OnZW8zYL3kvqhIOsgOkLh
RDdV7srfb6XIBni7ZCjYqL8+FYolpRMgOn2xWOBsyi5ha6wBd2IwF6UmJdfTNlPq
Lk+OHI5jRSbkS12CnN4WPsN2vbVJ3Y8nC2MGrmjBNel4WvEUj7o=
=mHWE
-----END PGP SIGNATURE-----

--KIzF6Cje4W/osXrF--
