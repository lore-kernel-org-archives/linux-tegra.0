From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: tegra: Add CCPLEX_CLUSTER area in Tegra186
Date: Tue, 13 Jun 2017 14:45:52 +0200
Message-ID: <20170613124552.GD16758@ulmo.fritz.box>
References: <1496304245-24024-1-git-send-email-mperttunen@nvidia.com>
 <1496304245-24024-3-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1496304245-24024-3-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2017 at 11:04:05AM +0300, Mikko Perttunen wrote:
> The Tegra186 CCPLEX_CLUSTER area contains memory-mapped
> registers that initiate CPU frequency/voltage transitions.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

Thierry

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk/3oAACgkQ3SOs138+
s6GR5A/+Pcx4WxrAUF3Z8OLN/7NlEvc3ioOqXw8dMvGHLZ5Mr66Xy4rIcATcZF/Z
eOKgajWb8VHmVXb5oUnkxsMns3gCNUZT7diM+vb02+94UCUz7mMitPcMnsuHhhXE
jaMjF540c/6UefF+T7VW/MxpNVOSkFoKSStXMdF9qu6kk6hrJCLBkrojifV9HvCh
u/4Ylq73Tsg746ICAC5GG3YQeDDpFMf0UjGjMmnbuWwSLM7+Gj7RSC3BpLD6pEAI
VBrSVOUMnUZZgPpr+rNVrQXwNwADtoWCL8lHfk8UOTyCO3LM7t7EI7WxsXvDSJt0
UlVIvP79AQ+6+UTK1bSC71aVkEwACRciNvb9wcf1nrXvGm1ndgGRfcMKHRfkmT3z
71TFfbFvnLaMfpGZjp8qkWW1SaoXzL4NZQcwtH8eyRhRvP5pnl2n7aOQy4sW6GWy
VzmbMsOc5Wbs4uhPDJGxhANYrmFLxlCBnNX3cmphK+81SjqgtWQEcdvMCT3MXu5o
s33rkbky/I/IAyNtGuVicOAbkwJx6eejNPALM2lEeHvnVbUPoC6Xuidbsro0hdFz
ednoX83LFvCEscT1fzm5oDv1jvnRlUDZcIDuKdJuiUIw25LOAf+Wr0+bP/HJR3K7
CXgMFj5keaIlXBYr6MjQPirzisORUNvw872eZSno+Rqnd7DH8NA=
=ILxF
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
