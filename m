From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] drm: Add NVIDIA Tegra20 support
Date: Tue, 13 Nov 2012 09:03:23 +0100
Message-ID: <20121113080323.GA15983@avionic-0098.mockup.avionic-design.de>
References: <1352469579-3337-1-git-send-email-thierry.reding@avionic-design.de>
 <1352469579-3337-2-git-send-email-thierry.reding@avionic-design.de>
 <50A1FE01.5090808@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A1FE01.5090808-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 10:00:01AM +0200, Terje Bergstr=C3=B6m wrote:
> On 09.11.2012 15:59, Thierry Reding wrote:
> > This commit adds a KMS driver for the Tegra20 SoC. This includes basic
> > support for host1x and the two display controllers found on the Tegra20
> > SoC. Each display controller can drive a separate RGB/LVDS output.
>=20
> Thanks Thierry for the hard work. I noticed the same thing Stephen
> noticed earlier - I couldn't compile the driver.

That should be fixed with v2 I posted a few hours ago.

> Other than that, there were a couple of differences to the tree we've
> worked with and tested earlier: Tegra30 support was dropped and as a
> consequence so was IOMMU support.

Yes, Tegra30 support will follow in a separate patch. As for IOMMU
support it should eventually be made completely transparent, but I'm not
opposed to adding a patch with explicit IOMMU support back in if it
turns out that it can't be done transparently.

Thierry

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQof7LAAoJEN0jrNd/PrOh+o0QAI4CvF/E1oupG1YU04DopqIN
LmZJZqGzCFIwFM24mmYhoVYlGXwUnyJ6Rfycy76XXkkgSmtaICGCUD5vadIC+k1Z
TNb8RPPf7OoZ/E5i+YKQAoaSt62Ao9XXVJ8tAyi1WAN61O2U1S9utdCnbaQQRRrc
Bh7PRsoM1PeC/o04FH1v90Xs3hLz+TVsC8BXxTQsTK/IrH3pLPoPlAZSOIc86d1d
qKxpTwe53uZezPymsQ1BAF4NkqYzLpjga3pgAo+o/EwwZ5qGs4SXe1aC97cYFEj4
4ULjBoOaXvViVTrp4Q/6VfVcrD505LegRYdXZ7J2AaW3IDVl31ep2eVTjLeb6KWA
iTu23Exe7ADDebhEIVCBfexwZwD/LcssKs7KqRbswEgMtZ9ncIpN6Z037NkfNHJz
cRi3FCkfQF5JY3mcLXixB9+3QHo2t8ngZqelKKj6WCIGREdgKRKxW//eB3cdAvYC
GJzVFqUOeObP+pKVqBg8Bgc6oU6icfAKREIvUb1oIa2ncNCpUvPc+1zZBnBgrFD9
TH5f+31jMj5ASViRix2VuT9WNwtTDt9u2o+Ko7hhHde8UQYXBO6U0OXyTkI/xeqs
pS06l8MlBln5uHEdKRQBOKtgs5FElJ4BnbShd2XWEtHq/VCN+FyhIOeP8WrlKWAu
6bCcWdEepG45ScA/1GFl
=0OEH
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
