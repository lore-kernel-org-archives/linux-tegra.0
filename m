From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: handle the correct # of syncpt regs
Date: Fri, 4 Apr 2014 11:03:25 +0200
Message-ID: <20140404090324.GC474@ulmo>
References: <1396383037-5891-1-git-send-email-swarren@wwwdotorg.org>
 <533D1732.9040704@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0072253039=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <533D1732.9040704@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--===============0072253039==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Content-Disposition: inline


--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2014 at 11:09:22AM +0300, Terje Bergstr=C3=B6m wrote:
> On 01.04.2014 23:10, Stephen Warren wrote:
> > diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/in=
tr_hw.c
> > index db9017adfe2b..17407b2de2bf 100644
> > --- a/drivers/gpu/host1x/hw/intr_hw.c
> > +++ b/drivers/gpu/host1x/hw/intr_hw.c
> > @@ -47,7 +47,7 @@ static irqreturn_t syncpt_thresh_isr(int irq, void *d=
ev_id)
> >  	unsigned long reg;
> >  	int i, id;
> > =20
> > -	for (i =3D 0; i <=3D BIT_WORD(host->info->nb_pts); i++) {
> > +	for (i =3D 0; i < BITS_TO_LONGS(host->info->nb_pts); i++) {
> >  		reg =3D host1x_sync_readl(host,
> >  			HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS(i));
> >  		for_each_set_bit(id, &reg, BITS_PER_LONG) {
> > @@ -64,7 +64,7 @@ static void _host1x_intr_disable_all_syncpt_intrs(str=
uct host1x *host)
> >  {
> >  	u32 i;
> > =20
> > -	for (i =3D 0; i <=3D BIT_WORD(host->info->nb_pts); ++i) {
> > +	for (i =3D 0; i < BITS_TO_LONGS(host->info->nb_pts); ++i) {
> >  		host1x_sync_writel(host, 0xffffffffu,
> >  			HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(i));
> >  		host1x_sync_writel(host, 0xffffffffu,
> >=20
>=20
> Wouldn't this break in architectures with 64-bit longs?

Well, BIT_WORD() relies on BITS_PER_LONG too, so the current code is
broken for 64-bit architectures too.

> Probably the safest way would be to use DIV_ROUND_UP(host->info->nb_pts, =
32),
> because we know there are 32 bits in each host1x register.

I agree. I hope there aren't any plans on making the registers 64 bits
wide in the future. Although they'd probably still be accessible as 32
bit values even then.

Thierry

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTPnVbAAoJEN0jrNd/PrOhA3gP/1sN/JhXbVK7dtnzvojhh0Ul
bnTejOMz20lkzHxeSuF2a/o77BWvPSyz0RyYlu2PLbYO1HkzlZmXe+PAoVeXQRvg
9OyGtQw1Z8bwHh+xhd3+vX/eWq2TyNNvmM+MnG/0Kx7y/0RSUlVViBEKji4V7GK7
c2TUTlc/pA/huxpUbXoxaFx7SAXttQ3Pd0KNjDW9bJfXC2kTb6i6TE30Zdlt9gD9
DsxOvwu9Y/byBrKF/2pBDMPHAFXpQJQJeKMSt6zn55XRQWT04ZdzLWTXYLmCr+Og
ive3riezdK0dgrOf2Djd4QMz/WQxkESvniStTAf8hH3CkW4bvdLv83I3VO6bz77q
Mnt3PgWIGnZclEa6ww9ML1k0qAxdoQKl1OG8S/97xtp06IYqcsgSH0GB7m6QB5R7
tt5SCX5uxImfNufoYUX2iDT5m1cXMctqgKA6Ed/cM1X8bGHTl7N2XtRZf2GRxoD+
3fBNgaZi5ZgIZFBnHEUgdBgLwkV/nblVXC8r7oQcTiTEzfKJLUjhhsnRWtLSn54u
43uURmNXUdGMeaFq193vFK84nXptBfZEy9Kd/Cnq7QI+N0YJyaI3P1lIvI3ZpRwT
c4ak9GUn5XLPeGuUrCpI7tZCIYNX+ptz52odVMyyt6oa4+PO/LErTdee65n/k501
e1uXf4cWDucMvspGRZv8
=xLDd
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--

--===============0072253039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0072253039==--
