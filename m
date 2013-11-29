From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/31] ARM: tegra: pass reset to
 tegra_powergate_sequence_power_up()
Date: Fri, 29 Nov 2013 14:46:14 +0100
Message-ID: <20131129134613.GY22771@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-11-git-send-email-swarren@wwwdotorg.org>
 <20131129134532.GX22771@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XiX5sJQOWZsNRXst"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131129134532.GX22771-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XiX5sJQOWZsNRXst
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2013 at 02:45:33PM +0100, Thierry Reding wrote:
> On Fri, Nov 15, 2013 at 01:54:05PM -0700, Stephen Warren wrote:
> > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Tegra's clock driver now provides an implementation of the common
> > reset API (include/linux/reset.h). Use this instead of the old Tegra-
> > specific API; that will soon be removed.
>=20
> Ah, there it is!
>=20
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

And: Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--XiX5sJQOWZsNRXst
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmJqlAAoJEN0jrNd/PrOhwsgP/2blGx75GGw3LcYKlsNINveW
wUN0o3/SPORSBnhgCe1c+5nzEF+hHcmzgzvE50lWBufmhiTtUaTK6iyeWFVqWgX6
UDNX93V02AGeWKoDGHCOzzYLgmxg2sZ+WURJLD7FP8H1Onz1ftWH1BiP8wFQvdwY
7NyOxJZiADrVpi5Fyya79HILmDvbmZ0YWv+bo1t86oIsWXh6bdmhWIQHREx0APyd
dnF/G2xVuscatl+n4yLhXqZvbalUqfmfV2o7p4r0j814/AjneLP2diE32j7XmdIE
L2AqRvkUsO5XaAgfkGt30OXSZy4dm89T+2NAeHVlJSjJHvvTN2If22iz+XK9Wv8r
4igJb0fS3EhYlEtupIlnm4vPLInFKDmw+HcB9NCOk/eTeW6zbTV/rJEoXOL/MFSz
Z0F5jYRKVvEwLNY4El5n0XkNHaoyOOFhWJ7AYHiYBqV2eXQ2ERgfQdlrhNrQUDl/
IlyGnMvpAVkbtGGViViPdok+TLhSF5lHGHCzxLwx2Yv+uUYJDYSGWtvuNvNc6uMZ
FWp+2d/JAdNSVEgzx1+rO2Tj7oJlhBeN5EkTjaKkzGO5IBTLyUrp06zx86p/M5e2
y6IcGh8BoTXiQ0OWmGfiOLdUuWhqV0Dsa8IPsN/4C/yHWumyE+svlFG/LDAi5IK4
8GplPEfOqLOR8Tw+bS7X
=Paae
-----END PGP SIGNATURE-----

--XiX5sJQOWZsNRXst--
