From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 3/4] arm64: tegra: Add PCIe node for Tegra186
Date: Thu, 19 Oct 2017 12:48:17 +0200
Message-ID: <20171019104817.GJ9005@ulmo>
References: <1506513517-25870-1-git-send-email-mmaddireddy@nvidia.com>
 <1506513517-25870-4-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CxDuMX1Cv2n9FQfo"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1506513517-25870-4-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--CxDuMX1Cv2n9FQfo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2017 at 05:28:36PM +0530, Manikanta Maddireddy wrote:
> Tegra186 has three PCIe controllers, which can be operated
> in 401, 211 or 111 lane combinations. Add DT support for
> PCIe controllers.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2: No change in this patch
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 82 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 82 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra186.dtsi
> index 0b0552c9f7dd..9edf2a839e5d 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> @@ -443,6 +443,7 @@
>  		shmem =3D <&cpu_bpmp_tx &cpu_bpmp_rx>;
>  		#clock-cells =3D <1>;
>  		#reset-cells =3D <1>;
> +		#power-domain-cells =3D <1>;
> =20
>  		bpmp_i2c: i2c {
>  			compatible =3D "nvidia,tegra186-bpmp-i2c";
> @@ -465,4 +466,85 @@
>  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>  		interrupt-parent =3D <&gic>;
>  	};
> +
> +	pcie@10003000 {

I sorted this in correctly. For the future, please sort nodes by unit
address. If a node doesn't have a unit address, sort it by name and
after those with a unit address.

Also removed a gratuituous blank line.

Applied to for-4.15/arm64/dt.

Thanks,
Thierry

--CxDuMX1Cv2n9FQfo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnogu4ACgkQ3SOs138+
s6EEHA/9HX5BFQWsto7n+cvvy0IF12DkPKCfDGgLDkwxfp+xFxD9CDysns/2Amt5
WBrl33uJjgay7F27QboTb510WflmDl5beUNby4PI7zg/gqJfBG5aVa4c3S7G4jZd
hkvJeMZvLhLCVCgTDzKj0kM7Bels/ODuKVjp9CPm5vKDP6j6XuK/se8w9HMt9QE5
NP6IKbu09Ya+ArPijHQO/sU8jRVIsJkOMv42axMVIFqaY8/6GWMzbSpcjz4QPT0h
y0gNm2n05FEbbewpV3S7OPKEIYAc1xHlbaEMln/trIEivToGlGZS40wdElOrJjSk
ydS4eFbZU18LMeJP9Y9Gif7yrDO6CJjjU457jkGHZvohOnzLTsb6V8gbDa65sYMp
gjKnvmtM1QUNW9+U/uF9gKWiJjwf1chjuxviu9lF0vM4B0xVYH5wmKi3KXflBpLj
F7eLxmlhb/aW8lUlRYVvwDS7XP3o88fOwVRoM5902RsKo+CONl56ck8vPVh+0nPX
aRMprgY19DDSatKkl3IgAzPU4VkIHazyKF/CLJ1ATmVuXsWszNE14wAKv1BR2X/+
L9AKu5EdFn0lh5WRAjKjcG4hGc7vddTI76qauisgiWlQI3JrONNHcEZUphJa9KbK
YTcdPrRMh8hTbgmmwW7TR8d/BU05OVs2jx5ut2gD7Chf3PpakoA=
=VU4/
-----END PGP SIGNATURE-----

--CxDuMX1Cv2n9FQfo--
