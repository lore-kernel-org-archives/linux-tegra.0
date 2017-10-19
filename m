From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/6] arm64: tegra: Add VIC on Tegra186
Date: Thu, 19 Oct 2017 12:50:17 +0200
Message-ID: <20171019105017.GN9005@ulmo>
References: <20170905084306.19318-1-mperttunen@nvidia.com>
 <20170905084306.19318-4-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l3ej7W/Jb2pB3qL2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170905084306.19318-4-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dnibade-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sgurrappadi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--l3ej7W/Jb2pB3qL2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2017 at 11:43:03AM +0300, Mikko Perttunen wrote:
> Add a node for the Video Image Compositor on the Tegra186.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2:
> - Fixed reg property in accordance with changed parent cells.
>=20
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Applied, thanks.

Thierry

--l3ej7W/Jb2pB3qL2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnog2kACgkQ3SOs138+
s6HNchAAojlBx9+nXNAecura6zG+2ocQuFUwcXyIOi64m/GnFqbGtU8O8ht7FD9w
0e1ca8Wj6Ge7e5dTn2TVuw8ZYutcqM0gP3Ixz98MIit3ReYF34PyxZutkgHgvRBf
dYUWOD8JQBZC5oZaRS6F+4Ocw/YUSymMgnGXqTDI2VnjRjquvytrcsHpHQ0ZKk0G
xydu3h4/RcBGtHRdzO2ka5Zw4PUACh3yqtOjBUr4wuAf35yOZbKNloVwhbxqgB8H
GnfuzUQRjgyRweVPGyukv+e9crkoQ3zIzoO7NhYAHULc4eZB2KjQgudF8QR8WYO3
LG0gcJ7aBgIvc+vXmPnfvFDiSrz9txxPBwf0xjWfJYz57RwdArPkPVY9knCfyJhJ
jYSXt25uJXkwx5wRzwQQL9qItzj+MuDwPfwzOu02Iu3NaP3Oj9g1I6shzv5d6ioK
Bv7CJXfBW0x9faGt+Ot00fkeyXpO//20HPXj2uxhbCTsx9j2oJMsWOmn7diEuGGD
1iOm+Ur5i1nRIzfOvTCk3mPhYAEziOoOqq24stUCg/JfQGvjy08YJTDuEjM5amug
0AxF0rsk0NC0BO7oSGRq6NSxm6ignxpLX7mK5G7bYGosOXar/c7/0HTgPgRi2sn2
zTjMgvvl5G0+s2IuDeWhekKb23ETddaAEmuwuxNJnZjUs4/7RBA=
=0Ilh
-----END PGP SIGNATURE-----

--l3ej7W/Jb2pB3qL2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
