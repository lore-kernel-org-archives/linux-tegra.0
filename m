From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 4/4] iommu/arm-smmu-nvidia: fix the warning reported
 by kbuild test robot
Date: Tue, 23 Jun 2020 10:33:48 +0200
Message-ID: <20200623083348.GA4098287@ulmo>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
 <20200604234414.21912-5-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200604234414.21912-5-vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2020 at 04:44:14PM -0700, Krishna Reddy wrote:
> >> drivers/iommu/arm-smmu-nvidia.c:151:33: sparse: sparse: cast removes
> >> address space '<asn:2>' of expression
>=20
> Reported-by: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/iommu/arm-smmu-nvidia.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This should be folded into the patch that introduced this error.

Thierry

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7xvmoACgkQ3SOs138+
s6H5OhAAnUJxO+okbp2kcAzUIo+/gCFpLxt2IUml3mizRRO5emehRyjmdq/5zbng
wee1t+qSJyX65D2aRq1WUi0ENusf6T+5mO+s3Qao6d8cu35H4l3j56kX3gO9mew3
eCvMH5ZmczMiqS5Tlyk+BxmsBBcP8c6FpygcLrsiMtXX6NkaUScSSOB74tkamv1g
KOslg0uZNaANq6jCKOaJ4uhkHjAUDLFigq4CNcPG1dqyAIYipHZy1tHgK7IORCic
SPsMCaOYh7OXKaLdrZn6+TqX1JdlJpRjwecViTdR30CxbPvAJjata1suxbVOK6c/
sh0bKzeOyeb7iza2nQltD7YkeCF7Y9o69NFyzdl0KKkObCOxuWNn3BwS2iu6rm9r
ZMBwxo35jzHh/KWtaRaPlQaGwYqYpCTCezyFAo4kvsbD+mjIMvcFtJ786zgsdNcV
ZplpSnKvt6NwxjxzSZwUI1a25xUYA7WKrxVLi9yEAcfGEZYyQxFkiJDKK0JsmHiU
NILvdgXpTNZODuLwQ2vItfbrLVK+Uil/frAPNHfNjYlPG24CC7D2FCIgDLhBlhfD
aU90sf7sbWBIFzFGci5RjTQGkAd0h6akiHuVJkOQBRHM58G5V4Y85H9dpm6C0GmP
hUcrPhSv+SGL4BLUTu8zBcq0Jyp0kDhbBypUSVotnQdJW5LJrFI=
=M0sQ
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
