From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Fri, 8 Mar 2013 09:38:22 +0200
Message-ID: <20130308073821.GG21589@arwen.pp.htv.fi>
References: <1362671126-24571-1-git-send-email-balbi@ti.com>
 <5138FA7D.3040104@wwwdotorg.org>
 <D958900912E20642BCBC71664EFECE3E6E50310DD2@BGMAIL02.nvidia.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WkfBGePaEyrk4zXB"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <D958900912E20642BCBC71664EFECE3E6E50310DD2-QZ+emBqkIFBDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org" <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org" <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org" <yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--WkfBGePaEyrk4zXB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2013 at 12:51:13PM +0530, Venu Byravarasu wrote:
> > -----Original Message-----
> > From: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-tegra-
> > owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Stephen Warren
> > Sent: Friday, March 08, 2013 2:07 AM
> > To: Felipe Balbi; Venu Byravarasu
> > Cc: Linux USB Mailing List; Greg KH; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org;
> > gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org;
> > p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org; tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org;
> > yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
> > Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
> >=20
> > On 03/07/2013 08:45 AM, Felipe Balbi wrote:
> > > this will make sure that we have sensible names
> > > for all phy drivers. Current situation was already
> > > quite bad with too generic names being used.
> >=20
> > Is phy-$name specific enough? There are other types of PHY such as
> > Ethernet, etc. What about phy-usb-$name?
> >=20
> > Venu, please comment on what conflicts, if any, this will cause with the
> > patches you'll be sending to clean up the Tegra USB/PHY drivers. Thanks.
>=20
> As this is just a name change, it should not cause any big issues, other =
than porting
> all changes on top of this new file. =20
>=20
> Felipe,
> When can we expect these changes getting merged into linux-next?

After -rc2 is tagged, I will have everything I need to start my -next
branch. From that point on it should be in linux-next ;-)

--=20
balbi

--WkfBGePaEyrk4zXB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJROZVtAAoJEIaOsuA1yqRE2b8P/2ZAuMIT2+zC1UUlYOhQ6MZ2
SpyyzXeoENZ8ZkbnJwl2YUdCYvd1fWccrLaP94u3Y01fDCnljghPurCLlAy4uHPM
AoUwpDNN83qUGUbBllRDYDoSMBigCgir86pfrK1CyvoQ8roPbgv535ypPlzNd5TH
+mwK9HsL4/kASSZjloulxh9j7lkwVabKXbDsLEH4zcBKCzrfGoB36vVtCBMGwDlG
XRnQTT0O2zNXF8aOiCbhigwBO4R7Ps6DDvZr6AkJy4ZqIRVTSqpxuhp4eY9m1nd2
4xLdwAOyHLxMtroGiiMgIDaBGHvZHn3uNNGgx7ALsK8Hot/xF+ye/jzDKhs3p/Cq
L1lU81Zeulb+5UVsPV3os+o5CpmEjsoCRlu4BMSY+ya7dYKUyohBAcqEfM50YX42
Q3KrXZlZ+ktF56ix4Ws0wLxJjsrboghSdPBCTbNckRYOo/+KrWNwlG9KsOkLzpSO
NyiOou7et9xpAVrO02UHsKWgRd0KWGNLf4n83FSiGtIXT0K2A2ARh8eD1WaetwyX
bPyleiB+2IRmuWW0NL+yFE5LFgGdFGV0AnS73M+UNk+wLz/NR/U3mb51FSnqc7Rn
xDtBrYF1DCIbva5+knmZfKuY3HgmS2YaC3Svb+P5DvSRBL/gICw6jkyyKxY7zXmA
IMwI+dP2VG+n3Pi9WB1d
=EtXZ
-----END PGP SIGNATURE-----

--WkfBGePaEyrk4zXB--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
