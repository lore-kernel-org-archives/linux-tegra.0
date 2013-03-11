From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Mon, 11 Mar 2013 09:01:08 +0200
Message-ID: <20130311070108.GF12860@arwen.pp.htv.fi>
References: <1362671126-24571-1-git-send-email-balbi@ti.com>
 <5138FA7D.3040104@wwwdotorg.org>
 <20130308070836.GB21589@arwen.pp.htv.fi>
 <513A2F0C.8090201@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UBnjLfzoMQYIXCvq"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <513A2F0C.8090201-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--UBnjLfzoMQYIXCvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 08, 2013 at 11:33:48AM -0700, Stephen Warren wrote:
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
>=20
> On other thought here: The Tegra PHY in question here very
> specifically is a USB PHY. There's no way it could be used as e.g. a
> SATA PHY, either as a HW block or given the driver code that program
> is. Is sharing a PHY IP block or driver ever possible for any HW?

yes it is possible, and OMAP5 shares the same IP for USB3 and SATA. PHYs
don't know about USB, SATA, Ethernet and whatnot. PHYs know solely about
the physical layer. Their work is just to generate the proper electrical
signals.

> Hence, I don't think removing "USB" from the filename makes sense, nor
> even moving it into a generic PHY directory.

fair enough, I have now renamed tegra to phy-tegra-usb.c

--=20
balbi

--UBnjLfzoMQYIXCvq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRPYE0AAoJEIaOsuA1yqREWjIP/0nAARtwLQBXJBUT9FYyAbgN
sRG1nlhp8CW+3m0e1kzTbzSBz93cFUL+7CqK+yR7fj9TPksfFVYdnih8GYVAcVEr
ciEFQJX5KlMgyS6lgOtzDIf/gPmfYDu8AMIDbltSOB118dOAuntr+KE8wjIcJPQ3
I8th3GLI4ooQzbLeeXczpxDcS/UsfLI65hGl7b0t36nJjzw2Es9Y1rcqJa1W5+oD
j7UM9REkoM7GNUiXIS9Fdhd1F3fh+vkFGviVGy+FgWG/q/vOLxw16or+959KY41m
zqLEe42YmliU+Ai4tog9R2pPZEYjQXR/tBz6IJ7tu+ZzRrRbGLcQ8+uNp525N5Ai
Mfkt6egpimP0irgtdixCF0SoIz4kuNDAMiXzM4PCDWcyBR/Y8q7tLl9fn/GU+MjQ
hLwOWPOqZ9Mc89bWHI14fX429bT+1rEeZPQiab2TUzMLJHQyWTzbmcs5mzTBCS4w
ew0AU09jaEAxOFTBzQOx3WjGO/RF4gwpYf63UOgiPT8UTTc0wfeXNYaP5en156If
eSSaewHWeGhnvzC9YDwIMDBZAGruM3Zd3dGG+sIzzAneM1nV5pfD6hm/JDt8v1em
+VecO4+swdQcyWOv7IlLjljEEE4rZOvGCGLmrDeM8pwD5d5i/FveRqIqqkDVB6ti
kFZFEhfkAxPaNODN55+Q
=2T0N
-----END PGP SIGNATURE-----

--UBnjLfzoMQYIXCvq--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
