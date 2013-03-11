From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Mon, 11 Mar 2013 08:59:03 +0200
Message-ID: <20130311065903.GE12860@arwen.pp.htv.fi>
References: <1362671126-24571-1-git-send-email-balbi@ti.com>
 <5138FA7D.3040104@wwwdotorg.org>
 <20130308070836.GB21589@arwen.pp.htv.fi>
 <513A1F55.1000800@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RpqchZ26BWispMcB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <513A1F55.1000800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--RpqchZ26BWispMcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 08, 2013 at 10:26:45AM -0700, Stephen Warren wrote:
> On 03/08/2013 12:08 AM, Felipe Balbi wrote:
> > On Thu, Mar 07, 2013 at 01:37:17PM -0700, Stephen Warren wrote:
> >> On 03/07/2013 08:45 AM, Felipe Balbi wrote:
> >>> this will make sure that we have sensible names for all phy
> >>> drivers. Current situation was already quite bad with too
> >>> generic names being used.
> >>=20
> >> Is phy-$name specific enough? There are other types of PHY such
> >> as Ethernet, etc. What about phy-usb-$name?
> >=20
> > we will be creating a generic (kernel-wide) phy layer, so I guess
> > that matters very little. Specially since we don't want to be
> > differentiating PHYs by their subsystem and rather by the IP name
> > (which means phy-tegra, phy-samsung, phy-omap, are all 'wrong', but
> > there were no better names).
> >=20
> >> Venu, please comment on what conflicts, if any, this will cause
> >> with the patches you'll be sending to clean up the Tegra USB/PHY
> >> drivers. Thanks.
> >=20
> > BTW, let's stop with the whole dependency between PHY driver
> > cleanup and arch/arm/mach-tegra/, too many patches have gone
> > upstream bypassing my tree. What we should be doing is figuring out
> > how to remove arch/ dependencies so that patches can go upstream
> > and not cause conflicts.
>=20
> Unfortunately, there's no way to actually avoid the dependencies
> themselves. The DT bindings and EHCI/PHY controller split are wrong,
> and need work on both the DT and drivers to fix.

but those changes don't need to come together, right ? I mean, for the
DT part you could add the bindings to driver A without removing from
driver B and span the changes accross 2 merge windows.

> I guess I could apply all the initial DT changes to a topic branch in
> the Tegra tree (item 1 below), and have you merge that branch into
> yours, and then you could take all the USB-related patches (item 2
> below) through your tree. Would that work better?

I'm not merging, taking everything as patches, sorry.

--=20
balbi

--RpqchZ26BWispMcB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRPYC2AAoJEIaOsuA1yqRE0SQP/3CMytswLC71ZL7DHj95liWq
DwVLVODoKWn1vn5SyumQSLwDMrKjcGO7en6fYGNk8t7I/BaKwmk7T4Uoi5TsXOXJ
M95526XywstOXpCdeFysg0u5GI+Iqf1cx6SwXk8STn3WusIQwtiLSCn/kkupDIra
teADg6CTSWpA9lyhNLb3MPMFv/YoAlK3Aoh2TvjttpGuhxCV4osTKsRRk006Xv47
34+L/7RUUy6BfMy1UrL8Igxr/fKHhnrsRExYm1eGL91jD+CbsIs5Vv/ztA3rGKba
kA0uOzPwbJSNU37VoY0lufMZ5yWtMN6NPiGQeT4/6tgclL6pbM60jNISF4+nBPL7
SpK6R7doVZclc8FNCLOb9/zO8lvbzg0tNAaS5TbJgmg+jRGK91NohX1xqMfAEZ1G
6MYIPJbNa2E004EDeEnhxtquC04q3P4iKXI1y6WKiw7oTVfbkmrgv6+MKZZOEwbQ
4wpC+iPL9wj+CvenzZjLqN4/Pv+EqYnSD2IlO9emJrbep48a+6A0xbUKU+4l2PEk
1/h+A7rGcUrfsItBy94PhXmflNhQN19CiMH3pTfrPSrlPEbxWTJcSBgTKIo9bdl+
brx8hV0GnYtiPWFaGK4mZCNOGq61PU9cXZhtpmzpJQRe9WHWtsdzAdDpflb8vone
mkmFzrNJ8q6zt/GkyLEg
=P/zy
-----END PGP SIGNATURE-----

--RpqchZ26BWispMcB--
