From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/9] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Tue, 26 Aug 2014 13:45:39 +0200
Message-ID: <20140826114537.GA641@ulmo>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
 <5184912.mY2hCPH20k@wuerfel>
 <20140826102011.GA31124@ulmo>
 <14224406.FU8QFA3vsD@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <14224406.FU8QFA3vsD@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Koichi Yasutake <yasutake.koichi-NAum8xwdG0+S7A1Ibl2khg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2014 at 01:35:34PM +0200, Arnd Bergmann wrote:
> On Tuesday 26 August 2014 12:20:13 Thierry Reding wrote:
> > On Tue, Aug 26, 2014 at 11:54:43AM +0200, Arnd Bergmann wrote: >=20
> > > I'm not sure if it's really worth it. One thing we might do is just
> > > remove all definitions of ioremap_nocache and add a wrapper to
> > > include/linux/io.h, to make it more obvious what is going on.
> >=20
> > Yes, I suppose that would work too. I still think there's an advantage
> > in being explicit and avoid aliases like this. Perhaps a __deprecated
> > annotation would help with that?
>=20
> I fear adding __deprecated would be too controversial, because that
> would add hundreds of new warnings to code that is not actually wrong.

Right. __deprecated is enabled via Kconfig, though, so people could turn
that off if they don't want to see the warnings. I don't mind very much
either way.

Thierry

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT/HNhAAoJEN0jrNd/PrOhhM8P/Rr+x6dsQRCcRUKorXb6j3dw
YF2K830WVytEP9/GTNb1ZD77BzFrGhW8Wt+z9dfwip43SYxAxArMytiHkthht8Vz
+TnBgsNlAG53MxVdyxWN/snFN5Apjykk1L47M7+BSOwlwtOIMeIDzhTLU1fYiEsJ
q/WGNqsxF5plvDF7vp4pCPBAbVg/rqXYz0abvyHI/xOFWcK1YPoGH8BX6ZhlhyBT
PUg55X+yUk25qiq+lMxAE0CBYqF+te//pAF/7LzZ1xL8XTYGGQ8A5mFzfoxh+iTn
61dmMFF7qeZ3CdP+xl7OxT5UPQyKuv8+yD5Rnx7guy0Se0qAdale1wRGkyZEyj0C
nlogJFOh7qGi9WeG8wJE9GPP4HYwigdDneWWUScg8SCJTG6bPCCCKisPnhU2luqz
OXEEXOK+l38SpanrO1nZIzc0bz3Qt7e4q0G05+0GbVphXT5YYNOJhl64NDwmofnA
pd9Z3KNilkkggAP4tCnF+yFu6swDuiZwvBoIe1O/d7dvUu0FXzlfldEDQS4mdqP9
/6QNyrsznqRptPZkUWIahvNyP80nffzFqNlR5QebQpZD4+VU/9MDwovx1aAyliUH
ryk1vlnshLgsnyqVT0+5P/MbPtZJgxzvozS0zMIRH729xNVblgyadExyWqdRHGAM
ypl5zk2EgIlkjpD4l+Wy
=xbXr
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
