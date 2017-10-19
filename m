From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 4/4] arm64: tegra: Enable PCIe on Jetson TX2
Date: Thu, 19 Oct 2017 12:49:21 +0200
Message-ID: <20171019104921.GK9005@ulmo>
References: <1506513517-25870-1-git-send-email-mmaddireddy@nvidia.com>
 <1506513517-25870-5-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yr6OvWOSyJed8q4v"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1506513517-25870-5-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--yr6OvWOSyJed8q4v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2017 at 05:28:37PM +0530, Manikanta Maddireddy wrote:
> Enable x4 PCIe slot on Jetson TX2.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2: No change in this patch
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 24 ++++++++++++++++++++=
++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra186-p3310.dtsi
> index cf84d7046ad5..a4d96b2a23b4 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> @@ -378,4 +378,28 @@
>  			vin-supply =3D <&vdd_1v8>;
>  		};
>  	};
> +
> +	pcie@10003000 {
> +		status =3D "okay";
> +
> +		dvdd-pex-supply =3D <&vdd_pex>;
> +		hvdd-pex-pll-supply =3D <&vdd_1v8>;
> +		hvdd-pex-supply =3D <&vdd_1v8>;
> +		vddio-pexctl-aud-supply =3D <&vdd_1v8>;
> +
> +		pci@1,0 {
> +			nvidia,num-lanes =3D <4>;
> +			status =3D "okay";
> +		};
> +
> +		pci@2,0 {
> +			nvidia,num-lanes =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		pci@3,0 {
> +			nvidia,num-lanes =3D <1>;
> +			status =3D "disabled";
> +		};
> +	};

I moved this to tegra186-p2771-0000.dts because it exposes connectors
that are on the carrier board rather than the processor module.

Applied to for-4.15/arm64/dt, thanks.

Thierry

--yr6OvWOSyJed8q4v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnogzEACgkQ3SOs138+
s6F5sQ//aZJGwodFjaaoLKTd/tAxbiMAbAk87kl0ueseEXBcMPN1Vm8RP5n+3Kjv
j0dDSvTHhenAdZFm3LK3ExpF7XYbsbOnKGA6wvXmJjbTiiL4X8WbkoyAt3uFnXoS
Ks0HCwIGBTKr6uAT7Lth/jYy6EGGaQ2dnTGzTS1ja3CVKKytqqhK7/5RZRD3+bNS
rKgq56MhCvLmM/Jg7M1bzs/+EMhCMBg2l8lH2Kb44roQRa09/Sd8r6VeDE20cOVB
s7cm02d/AkywzPcnv+yK+H0JUz6KCQm8O9PCofZD1tYv5LGN8cZxPr0/mA5PvcrJ
aJ+I65c/sKPGrDjXirk07exwqHs83NIywJgWaHxlbcWbwZU761m46EmWVyEDA1AP
vrMOrph0tuSWHfdvLpekk/7JY3+KrB7BkRewAWs3qoxaSC3bS05VcDrtXevk4eEw
fnY7HRv1KpxX7STREv6JHrIdVlb+cJqrvE/XtpPdjXgZ1vcpcl1dUguBI7PE57i1
V5CQGEO6adevW8AF0HSurL3en8X5uwsPN2mA+TNYI8yWXISzez2f4wcEh5jQzd1j
uJkjLMfDQxw8t2x/+V5OL+E1gU0llSpbEwQnBI9L7uljGbxCeWu9K7/7ysG2WXUl
Nhxduq/NW1xsBSgKYFtgWCCBMniPbLHQbPR6NOwLevuxaSbNsfg=
=YZao
-----END PGP SIGNATURE-----

--yr6OvWOSyJed8q4v--
