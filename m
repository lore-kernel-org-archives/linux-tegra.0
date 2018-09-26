From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Remove redundant of_dma_configure() call
Date: Wed, 26 Sep 2018 16:13:40 +0200
Message-ID: <20180926141340.GB12980@ulmo>
References: <ce9767cab33346772f76735933dd7896e346b477.1536770777.git.robin.murphy@arm.com>
 <20180926141054.GA12980@ulmo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1238504685=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180926141054.GA12980@ulmo>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1238504685==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2018 at 04:10:54PM +0200, Thierry Reding wrote:
> On Wed, Sep 12, 2018 at 05:47:54PM +0100, Robin Murphy wrote:
> > Now that the Host1x bus_type implements a .dma_configure callback,
> > subdevices should automatically get configured for DMA as their drivers
> > bind, so there's no need to also force it at device creation time.
> >=20
> > CC: Thierry Reding <thierry.reding@gmail.com>
> > CC: Mikko Perttunen <cyndis@kapsi.fi>
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > ---
> >=20
> > I *believe* my reasoning is correct here, but please shout if it's not.
> >=20
> >  drivers/gpu/host1x/bus.c | 2 --
> >  1 file changed, 2 deletions(-)
>=20
> Applied, thanks.

Actually I was a little too quick on the trigger there. I don't think we
can remove this here because the of_dma_configure() in this call
configures the logical "compound" child device, whereas the
=2Edma_configure callback configures the physical device.

Thierry

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlurlBQACgkQ3SOs138+
s6Gt0hAAlWKj1ZlwPN2ZmYyr3IbXUhkhFkMB8bUTu9nMp0jXj6LAvrFk4NvPto38
O+6pMUyN/t6agRYOx6G/hUydd83t9V/8SKkobZnQzVb5Nh/jjrluTLl6VfSqNnN/
LAHezbi0M3q3te2m+zF0NLJPsvtnJF/4D8u5l9X/gzeT8IUHF0Wxm+vTZOJc1NDM
XuNlrfL6KtVzXtpYlq9a5r6QcLLATpbGAQidcjg49zIAgSqBtAnZsca+GFFdoefK
VUdTdIbuYl/0seBMpYfnJqVZtJVSLOmoPr9K7UUmuHW2cQH2axSR/JFWzofvOfMd
NjVhgIfurFyzN8iU7IyvoJUj0WwQHcfhTpZ04DVEiPZr8hWMVo+ZdM00nxSVquxs
nwmSnfHC8ftWHQfDHrpXPutq4zRL8cMZZr/MnN8IaLG9/cwV/f/aheO69HDjDBJM
XsO/z5rhxIbi6JE5veONSDythzUqtP0/Jlud/zywZ6fjigeRXYGQyqmhghsApd48
GZyDwL8cFSTQHWZH3UuzzsFUWCARy8YiHrZXBv3rkLP7nvRzjn1z6hoyXiUokDGo
05UgA5+bKS52mRZLs/BB3qj/UbgU4ApggQW6afUgL0Js+gDgatmm6GOyLXq4TrWO
IlVi1DQ2/zVN7w+7Wlntn34TdAriwz8m+Rlt0TO4/gM0i5X2hTk=
=f8/Z
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--

--===============1238504685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1238504685==--
