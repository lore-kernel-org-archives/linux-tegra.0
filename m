From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] gpu: drm: tegra: Adjust dsi phy timing
Date: Mon, 8 Dec 2014 11:24:19 +0100
Message-ID: <20141208102413.GA19060@ulmo.nvidia.com>
References: <1417570823-19977-1-git-send-email-davidu@nvidia.com>
 <CAOw6vbJmq1QtPPeWeE=mjgD1RjCeYGO=zdKR3vMn9AZaTOOc_w@mail.gmail.com>
 <20141205221748.GA21777@mithrandir>
 <CAOw6vb+B_AkA6NLuaRhFLrLuTEW0m02ptrkL0sOp6Ov=eJ34XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOw6vb+B_AkA6NLuaRhFLrLuTEW0m02ptrkL0sOp6Ov=eJ34XA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: multipart/mixed; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 05, 2014 at 02:28:18PM -0800, Sean Paul wrote:
> On Fri, Dec 5, 2014 at 2:17 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
>=20
> > On Fri, Dec 05, 2014 at 01:48:42PM -0800, Sean Paul wrote:
> > > On Tue, Dec 2, 2014 at 5:40 PM, David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > >
> > > > Fix DSI PHY HS Trail setting on Tegra.
> > > > It is found that HS Trail is off -12% during compliance testing
> > > >
> > > >
> > > [this time from the correct email address]
> > >
> > > Our timing tests pass now.
> > >
> > > Tested-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >
> > Can describe what kinds of timing tests these are? I obviously lack the
> > kind of equipment for this, but I'd still like to know how you get these
> > results.
> >
> >
> Hi Thierry,
> The test that was failing was the THS-TRAIL test. You can find the details
> at [1], test is 8.1.13. The time was 7.7ns too short (or 12%, as David
> stated).
>=20
> I'm not sure how David arrived at the value he did to extend HS-TRAIL, but
> that particular test is now passing.

=46rom reading the document that you linked to and comparing to the D-PHY
specification (version 1.2, Table 14, Page 40), the proper formula for
the HSTrail parameter would be:

	max(n * 8 * period, 60 + n * 4 * period)

I suspect that the additional 3 * period * 8 in this patch is derived
=66rom the note about "n", which is 1 for forward-direction high-speed
mode and 4 for reverse-direction high-speed mode. Translating this to
the code, the correct line would really be:

	timing->hstrail =3D max(4 * 8 * period, 60 + 4 * 4 * period);

Since the "n" parameter appears in the second term, too. Also this is
not Tegra-specific after all, so mipi_dphy_timing_get_default() indeed
is the right place for it.

How about the attached patch?

Thierry

--X1bOJ3K7DJ5YkBrT
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: inline; filename="0001-drm-tegra-dsi-Adjust-D-PHY-timing.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 3399b7247fdc9609daea9919c444326fb9ddbdac Mon Sep 17 00:00:00 2001
=46rom: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Fri, 5 Dec 2014 15:30:05 -0800
Subject: [PATCH] drm/tegra: dsi: Adjust D-PHY timing

Compliance testing shows that HS Trail is off by -12%. Increase the HS
Trail time to make this test pass.

Signed-off-by: David Ung <davidu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org: update specification references, add comment]
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/mipi-phy.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/mipi-phy.c b/drivers/gpu/drm/tegra/mipi-=
phy.c
index 486d19d589c8..ba2ae6511957 100644
--- a/drivers/gpu/drm/tegra/mipi-phy.c
+++ b/drivers/gpu/drm/tegra/mipi-phy.c
@@ -12,9 +12,9 @@
 #include "mipi-phy.h"
=20
 /*
- * Default D-PHY timings based on MIPI D-PHY specification. Derived from
- * the valid ranges specified in Section 5.9 of the D-PHY specification
- * with minor adjustments.
+ * Default D-PHY timings based on MIPI D-PHY specification. Derived from t=
he
+ * valid ranges specified in Section 6.9, Table 14, Page 40 of the D-PHY
+ * specification (v1.2) with minor adjustments.
  */
 int mipi_dphy_timing_get_default(struct mipi_dphy_timing *timing,
 				 unsigned long period)
@@ -34,7 +34,20 @@ int mipi_dphy_timing_get_default(struct mipi_dphy_timing=
 *timing,
 	timing->hszero =3D 145 + 5 * period;
 	timing->hssettle =3D 85 + 6 * period;
 	timing->hsskip =3D 40;
-	timing->hstrail =3D max(8 * period, 60 + 4 * period);
+
+	/*
+	 * The MIPI D-PHY specification (Section 6.9, v1.2, Table 14, Page 40)
+	 * contains this formula as:
+	 *
+	 *     T_HS-TRAIL =3D max(n * 8 * period, 60 + n * 4 * period)
+	 *
+	 * where n =3D 1 for forward-direction HS mode and n =3D 4 for reverse-
+	 * direction HS mode. There's only one setting and this function does
+	 * not parameterize on anything other that period, so this code will
+	 * assumes that reverse-direction HS mode is supported and uses n =3D 4.
+	 */
+	timing->hstrail =3D max(4 * 8 * period, 60 + 4 * 4 * period);
+
 	timing->init =3D 100000;
 	timing->lpx =3D 60;
 	timing->taget =3D 5 * timing->lpx;
@@ -46,8 +59,8 @@ int mipi_dphy_timing_get_default(struct mipi_dphy_timing =
*timing,
 }
=20
 /*
- * Validate D-PHY timing according to MIPI Alliance Specification for D-PH=
Y,
- * Section 5.9 "Global Operation Timing Parameters".
+ * Validate D-PHY timing according to MIPI D-PHY specification (v1.2, Sect=
ion
+ * Section 6.9 "Global Operation Timing Parameters").
  */
 int mipi_dphy_timing_validate(struct mipi_dphy_timing *timing,
 			      unsigned long period)
--=20
2.1.3


--X1bOJ3K7DJ5YkBrT--

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUhXxNAAoJEN0jrNd/PrOhYeoP/0rv3iR/p6xa1M7gsUotUQc2
1yWYMV/MAI5hF3dcPJwWojebyC/QlVT1LZBaniR/eap5LlUs8yYK67o08+7zoUIu
fwOkDW9jThLSn0/vzUSXCFPD/1RwLRArJMVgyw7Stzu2RKwBeGITF+zBQy41XXbG
gYKq09ibpWVC8TOl+j5h/hGCKJTCznD/r4D9AAZeG6OvMx/ULiWXeSdBUt8OMz9B
Gc+y/2nUGUz7x4V9OxFKZYKSPsmdlaxai15qUjIObv5XX0EXA4Du3m8u1p+qeZzz
PXlZwq4295cdBuONgy1ZoHLsht3CfsmJDfDp++WuwEniuI9TfhD2ZcyUdrrdar/B
Ig5jk/iufR9NGmvHYUuX1cyiUKJ7+Ud/ZXP5yB5aGYLc47fETEJuSxPwqB/zYFwp
Y6zTI++2d+FILY6hPivL63UBC8DBIYR3cDipy6mYQ2imOhWmK11BFP3jv8z/BhdE
Hg/cZi5/FL+QZSLGUGkvjTNaGedzBJpR92l/WAEXrokIQio6bVQEqYhfku9ewUwU
4ZrqnRJ8AfZWZypYUiUkagmTwM7lDtOJMH6G29WPZWImfqsmhE7HxiIXrcVXLrV/
/NDxeC7HqRrx7BrZD4mz53kkRXpUyRnd4FAHKPGr6m1R+Gz6Isw3RQynWmbjQZL8
ZZGwrDnrIPXoEBjZOmEe
=23Nq
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
