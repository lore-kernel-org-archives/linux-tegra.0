From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm: Add NVIDIA Tegra20 support
Date: Tue, 13 Nov 2012 10:48:34 +0100
Message-ID: <20121113094834.GA23744@avionic-0098.mockup.avionic-design.de>
References: <1352757358-14001-1-git-send-email-thierry.reding@avionic-design.de>
 <1352757358-14001-2-git-send-email-thierry.reding@avionic-design.de>
 <50A216D3.1070604@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A216D3.1070604-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 11:45:55AM +0200, Terje Bergstr=C3=B6m wrote:
> On 12.11.2012 23:55, Thierry Reding wrote:
> > This commit adds a KMS driver for the Tegra20 SoC. This includes basic
> > support for host1x and the two display controllers found on the Tegra20
> > SoC. Each display controller can drive a separate RGB/LVDS output.
>=20
> I have tested this with further patches to enable display on my ventana
> board.

Thanks for testing!

> My only problem is that we don't force CMA on, but we can add
> that later.

As I've already explained to Mark, this is enabled in the Tegra default
configuration in a later patch.

Thierry

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQohdyAAoJEN0jrNd/PrOh9NgP/Au9TEWPHfGFebm/7aiviYAS
JJNM3GxCFBES8tH982vOSPYcOTwcAcIBoGjqspn9U1HQtExg3+kh6ynr9LQ/nv9d
XsTsdnVGXR++o/L+550azzyE21ylk4vLWXAfPJ1nknu4BbUxyGhds1C9d9n7r7ra
PznpU9FI6Bjq+5wwjemk7X6PR3ZmJofzh0hOdK6eUxTfNL3P2+upxJqrEGGrU+Q/
6zgWG2HRWZTAtM91ZYCmLTNrXhYDEUHCDVt2quDhis/RqIh89beoqYlW9RxwX5e5
txXcKZs5toBp5yCTMt1xksOvU2JuZq/7kb32f2N6hDpnIX5IjXMuU4HH+zPqX7wu
2bVuOtdUdQrvQTIFnquu8+sXopG1pVpSdnBTRlinNtF9Le+4mhd3h1nrKUa9m6Fn
Hyz+/tJRbWCMKTRn+yE6qKNFFuKSPPe3CdhOPdpLw4KsBf1kVrss/JSxhdClXWtG
kjRVByqGAFAgO/eWe8IPLMEtEjoVxlSgKPi5weOVZShh+C+OwNanZWgOsZs0EtI+
yFlhIZ56juVZl8C7OXiNaeWvw6Y7bbiXtzCk2hK75aIeWYTLBUDy5vI1bwaMB84L
mOcSFej3bIPs5+h40XTcQFEklUDb/q3PO6ngAJJSokgZsIpz2KLKg3rmpTjr71bS
yvMkJHY6tCDqv14E8EgF
=FF4s
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
