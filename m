From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Mon, 11 Mar 2013 20:05:16 +0200
Message-ID: <20130311180516.GB6945@arwen.pp.htv.fi>
References: <1362671126-24571-1-git-send-email-balbi@ti.com>
 <5138FA7D.3040104@wwwdotorg.org>
 <20130308070836.GB21589@arwen.pp.htv.fi>
 <513A2F0C.8090201@wwwdotorg.org>
 <20130311070108.GF12860@arwen.pp.htv.fi>
 <513E0ECB.5030205@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <513E0ECB.5030205-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 11, 2013 at 11:05:15AM -0600, Stephen Warren wrote:
> >> On 03/08/2013 12:08 AM, Felipe Balbi wrote:
> >>> On Thu, Mar 07, 2013 at 01:37:17PM -0700, Stephen Warren
> >>> wrote:
> >>>> On 03/07/2013 08:45 AM, Felipe Balbi wrote:
> >>>>> this will make sure that we have sensible names for all
> >>>>> phy drivers. Current situation was already quite bad with
> >>>>> too generic names being used.
> >>>>=20
> >>>> Is phy-$name specific enough? There are other types of PHY
> >>>> such as Ethernet, etc. What about phy-usb-$name?
> >>>=20
> >>> we will be creating a generic (kernel-wide) phy layer, so I
> >>> guess that matters very little. Specially since we don't want
> >>> to be differentiating PHYs by their subsystem and rather by the
> >>> IP name (which means phy-tegra, phy-samsung, phy-omap, are all
> >>> 'wrong', but there were no better names).
> >>=20
> >> On other thought here: The Tegra PHY in question here very=20
> >> specifically is a USB PHY. There's no way it could be used as
> >> e.g. a SATA PHY, either as a HW block or given the driver code
> >> that program is. Is sharing a PHY IP block or driver ever
> >> possible for any HW?
> >=20
> > yes it is possible, and OMAP5 shares the same IP for USB3 and SATA.
> > PHYs don't know about USB, SATA, Ethernet and whatnot. PHYs know
> > solely about the physical layer. Their work is just to generate the
> > proper electrical signals.
>=20
> Hmm. Is the current code in drivers/usb/phy/tegra_usb_phy.c not really
> a PHY driver, then? Tegra's USB PHY HW module definitely does know
> that it's specifically a USB PHY. It has direct knowledge of

knowledge of UTMI/ULPI doesn't mean it knows it's a USB PHY. SATA and
USB3 use the PIPE3 interface, which was designed, originally, for PCIe.

It's just that UTMI/ULPI only got used in USB scenario.

> UTMI/ULPI/... Instead, should the code be part of the EHCI driver,

no way, no. EHCI-core should be taught about PHYs instead.

> since the concept of a PHY known to drivers/usb/phy doesn't seem
> related to what the Tegra PHY HW actually is?

I disagree a PHY is a PHY, no matter if it's attached to a Host IP,
Device IP or DRD IP.

--=20
balbi

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRPhzcAAoJEIaOsuA1yqREWBcP+wXq/Ag0I2SUfj3Kie4mUx1k
xwHcRn/GxaPXyOIWbFwZLnWul2OAYnuywdWv2dSw1xVq5VnjxajdrIwuCFuPg0m+
zfgtL5K4sAPQlvoiCnd0lX3+R2byiWUYeIqpGCC3Cc1amjoUR3qYGbEhPTva4oH4
5soLN0GkxlZQB45lVUzAn5H89Cq2L0izPwO1wgV4lDg1Jg5yoGWi6et8z40oRKv9
A5NUj43VlS2dHmrYm4OJPq0/w0xROQK3wPGyD21LEsnZ1XqtQyqRO4vhJ9UjZ/gE
AoWeyJ3tc/JBheCLGaFQsY2fxMR4fVsS/RX5YAnHL47sBQ1jTRqNDWq4dPa+aPaT
4DeoMxcRzZQnr0IETY/SRXsUz53zJrC2VwGWeELANIyr0E059r32UlZ5JLC7vvmN
Xx8Nvi6PA04Gs9TbldYuBamXatZxt2lr6QkxBHohCFRc52QoTzbrNIvNIgQh/3eC
UALxKmeY2VaKCuMxeRLj5lFRSvHwakHQCgs2OTxMUxhO9sBTiav323w8FRtGQ6Z9
B883XcKCqh3GcpVLiqlBhYxkm+USBoEFKdMZOkRj/pwVmWy3+/nnBJMxI0SmLO7A
TKhBDn9OjROPDe91tyNsl6IoJeeB6sOQtgl2Bamxj/QbT33+sHk7S0WgdDlOxX/a
Bapir2E9VEuFQvmI9GjJ
=zv7F
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
