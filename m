From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Wed, 13 Mar 2013 14:34:17 +0200
Message-ID: <20130313123417.GK6270@arwen.pp.htv.fi>
References: <1362671126-24571-1-git-send-email-balbi@ti.com>
 <5138FA7D.3040104@wwwdotorg.org>
 <D958900912E20642BCBC71664EFECE3E6E50310DD2@BGMAIL02.nvidia.com>
 <20130308073821.GG21589@arwen.pp.htv.fi>
 <D958900912E20642BCBC71664EFECE3E6E50311432@BGMAIL02.nvidia.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OX2aLCKeO1apYW07"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <D958900912E20642BCBC71664EFECE3E6E50311432-QZ+emBqkIFBDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org" <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org" <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org" <yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--OX2aLCKeO1apYW07
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2013 at 06:01:13PM +0530, Venu Byravarasu wrote:
> > -----Original Message-----
> > From: Felipe Balbi [mailto:balbi-l0cyMroinI0@public.gmane.org]
> > Sent: Friday, March 08, 2013 1:08 PM
> > To: Venu Byravarasu
> > Cc: Stephen Warren; Felipe Balbi; Linux USB Mailing List; Greg KH; linu=
x-
> > tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org;
> > aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org;
> > kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org; p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org;
> > stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org; tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org; yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
> > Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
> >=20
> > * PGP Signed by an unknown key
> >=20
> > On Fri, Mar 08, 2013 at 12:51:13PM +0530, Venu Byravarasu wrote:
> > > > -----Original Message-----
> > > > From: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-tegra-
> > > > owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Stephen Warren
> > > > Sent: Friday, March 08, 2013 2:07 AM
> > > > To: Felipe Balbi; Venu Byravarasu
> > > > Cc: Linux USB Mailing List; Greg KH; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > > > s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org;
> > aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org;
> > > > gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org;
> > > > p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org; tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org;
> > > > yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
> > > > Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
> > > >
> > > > On 03/07/2013 08:45 AM, Felipe Balbi wrote:
> > > > > this will make sure that we have sensible names
> > > > > for all phy drivers. Current situation was already
> > > > > quite bad with too generic names being used.
> > > >
> > > > Is phy-$name specific enough? There are other types of PHY such as
> > > > Ethernet, etc. What about phy-usb-$name?
> > > >
> > > > Venu, please comment on what conflicts, if any, this will cause wit=
h the
> > > > patches you'll be sending to clean up the Tegra USB/PHY drivers. Th=
anks.
> > >
> > > As this is just a name change, it should not cause any big issues, ot=
her than
> > porting
> > > all changes on top of this new file.
> > >
> > > Felipe,
> > > When can we expect these changes getting merged into linux-next?
> >=20
> > After -rc2 is tagged, I will have everything I need to start my -next
> > branch. From that point on it should be in linux-next ;-)
>=20
> As your change is not yet merged, can you plz exclude Tegra USB PHY
> driver renaming alone from your patch, as my patches are almost ready
> on top of current linux-next code base?
> If you are OK, I can push the renaming patch as part of my last patch,
> so that manual merge on top of new file can be avoided and your target
> of changing file names also will be served.=20

git can handle the rename just fine. Besides the merge conflicts will be
easy to solve. I don't think it's necessary to drop the patch from my
tree.

--=20
balbi

--OX2aLCKeO1apYW07
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRQHJJAAoJEIaOsuA1yqRExhsP/0chZhprMI0IGB9xHODxKs2k
ZV3npqG/5UTJ54OQXg3p+XOJQRYgmAbUQ9yYR9M6wWNikrRlYo9du3FTXcaM7N2H
UO+H7GtgTPwjckMwSiAkGX4fJ5TabeNg3nIS9zJxbkYtFlm+1xAXZs009nbT1N6N
+mM7HqlQF6Ux/5ZfqnjnyCWLp7vK0aF1xtbvnY35rrVtK7RJhVQTUjhDd1hm0f2o
C7ciacfFfINu2+xS3KkuTc59/bWftmceWrfNjgruZbQuU1akSQu1eJ5OdEzb4tZy
sGWpm3UNNtlygRBH8qDGrmzjRC3ig6ZNqe62ag0P8F6h0A7eEnU2iFJ+WsmBnxOQ
lIkHj/4FaBEUXjIM9rzlJltBoN57UdTpg2hagOn4i4hpZ1fysrQ+obP6OwV1Vkkp
3/XUYjQyaMgxfDkho4863GODo5Hg1ffKO3rS80s/1pMvu0Y56b+NOAGUS/uPXtKt
RtGw+tm2KWTux8A2IhkeIU1Jy6lq71DyandWGkxPkWBJ93wOT7kyiGiKD/BoS/cL
+2K4FvJE+2tyf8rlpvdYdCEOs35EMbc6eWWWiHwuvspit0SiPr3WtGaBuL3Uik65
Q7Nf2Dapp94gn2W/Pfm0/s0njBBo2E+IbTbIyO1paXDFq7kEXYewE2Uxksa3W9gz
LCx+xiLNms7fjkAyAP6e
=pwJe
-----END PGP SIGNATURE-----

--OX2aLCKeO1apYW07--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
