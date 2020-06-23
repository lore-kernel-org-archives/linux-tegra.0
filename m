From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 2/4] dt-bindings: arm-smmu: Add binding for Tegra194
 SMMU
Date: Tue, 23 Jun 2020 10:38:27 +0200
Message-ID: <20200623083827.GC4098287@ulmo>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
 <20200604234414.21912-3-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200604234414.21912-3-vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2020 at 04:44:12PM -0700, Krishna Reddy wrote:
> Add binding for NVIDIA's Tegra194 Soc SMMU that is based
> on ARM MMU-500.
>=20
> Signed-off-by: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Docu=
mentation/devicetree/bindings/iommu/arm,smmu.yaml
> index e3ef1c69d1326..8f7ffd248f303 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -37,6 +37,11 @@ properties:
>                - qcom,sc7180-smmu-500
>                - qcom,sdm845-smmu-500
>            - const: arm,mmu-500
> +      - description: NVIDIA SoCs that use more than one "arm,mmu-500"
> +        items:
> +          - enum:
> +              - nvdia,tegra194-smmu-500

The -500 suffix here seems a bit redundant since there's no other type
of SMMU in Tegra194, correct?

Thierry

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7xv4MACgkQ3SOs138+
s6FMxg//ZuFzYh2293V3nX16k17CojdDjbyvYLsHgQcpJrsaFK2aAj0N7VRrvSee
E3d1/nAy1MfyeGet+xDtsdVqJliFDdV+I0IsClmxHLWxoGwjzIs1J/y0IwK8I9vo
Hk5U3Mr2bnUHf71mtLC90Axy0OMJXuNkVCSZ+Xri+0pGneI4ESkPJ8yg8h4L9bRM
m7+igCtqvn/pzT2CnzHNfhop+DC2VVgOcFgsF2yn0jRvjwcN3rLg8u4Xy1Y2dXmg
MWByT7aNi/BnfBQ4IBe5IBRoyw3jpNRof6g/6G0jZDQbUFA1qv5w5nvjlQ/m6Y1M
/mHGfPXtQMrz9LP+GTQHgHlzWNKgx78wUBbQTEs/Sc/QhCte4i+cyvHuFHSLjhQT
QVGJga23p9VOLoGsStBCUSz0m6dRlyt9e5/O2NedofW+9LEOFyzo+LhGA9TkOokw
kGfqwwVkGoc08ytVzxYR21sCNwLWa3TWalgbpFU4dVX0WTWFKKd052aK+eHoYjJr
TSBmX8+xF0RVPikYTtYqe3HrThqTjnERePhDuf9SWAerjLEDFeP/7RgbdC+xK3O/
20ijfFT82UADr+5pjdZpbkXd6YCRniccMw3iFb0NlCDVTJHcsAJOSvCa2p8InLei
XkuHU0wQAEPJ101mL8m6S7BP241bnGS8lmlV0a3tyvZ01M3+OOs=
=pSyW
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
