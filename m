From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V3 1/7] usb: phy: export ulpi_viewport_access_ops
Date: Wed, 12 Jun 2013 20:34:50 +0300
Message-ID: <20130612173450.GC22502@arwen.pp.htv.fi>
References: <1370462589-3090-1-git-send-email-swarren@wwwdotorg.org>
 <1370462589-3090-2-git-send-email-swarren@wwwdotorg.org>
 <20130612150603.GA15056@arwen.pp.htv.fi>
 <51B89DAF.4020703@wwwdotorg.org>
 <20130612163850.GB22120@arwen.pp.htv.fi>
 <51B8A6F9.1030400@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51B8A6F9.1030400-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 12, 2013 at 10:51:05AM -0600, Stephen Warren wrote:
> On 06/12/2013 10:38 AM, Felipe Balbi wrote:
> > On Wed, Jun 12, 2013 at 10:11:27AM -0600, Stephen Warren wrote:
> >> On 06/12/2013 09:06 AM, Felipe Balbi wrote:
> >>> On Wed, Jun 05, 2013 at 02:03:03PM -0600, Stephen Warren
> >>> wrote:
> >>>> From: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>>>=20
> >>>> In order to build a ULPI PHY driver as a module, this symbol=20
> >>>> needs to be exported.
> >>>>=20
> >>>> Signed-off-by: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>>>  [swarren, reworked Manjunath's patches to split them more=20
> >>>> logically] Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>  Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> >>>=20
> >>> This should go straight through Greg:
> >>=20
> >> All the patches in this series build on top of each-other, so I
> >> think need to be applied in the same branch. Applying this patch
> >> in branch A but the others in branch B will cause the build to
> >> fail in branch B if the driver is built as a module, since
> >> ulpi_viewport_access_ops isn't exported, right?
> >>=20
> >> And this series is also based on top of all the Tegra driver
> >> changes in your PHY branch, so I believe that is the correct
> >> place to apply this.
> >=20
> > Isn't it the same thing as Greg taking these patches after applying
> > my pull request ? There's way too much outside of my domain here
> > without proper Acks for me to pick it up anyway.
>=20
> Yes.
>=20
> I wasn't aware that you'd sent a pull request to Greg already though.
> If you have, then it's fine for Greg to apply this series after the
> PHY branch is pulled.
>=20
> (I think Alan did Ack all the EHCI patches though, so either way is
> probably fine...)

Indeed, just saw his replies to the two patches which were missing his
Acks. My bad

--=20
balbi

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRuLE6AAoJEIaOsuA1yqREDBkP/12vFWYK4c4LgTLx65abl6k/
K/EPN8xf4iSGqsBYwca0LQDPkedlEOtoNR+eFYv7imfIJpcHG0wHVcJY1t/hZBJH
b6OlFRoUw0xJemj7uyJ9LY6f4JDbC/yvaBFUO0kkt5YjTCC5m3C00w/1SGdY1qDC
DNyO8ui5RIeJ7pLwNIzKH60bjhrdsDXOCR7kI3SHRepzd76TNxXHNRb62hfarAu5
8o/j8tPSNrXPwpcAjWSqmsC9I6GC0xbtYDs/LscN0GebD7I4+88IgkxUr+jiJEyv
RfCNyfNDO+xADseJQ/naOKw5Lidqi1wCNBJl7Uco/3Zy7Kzqo9ZzKEsnm10KfNI+
LFiFIDUSiDhu0BBz9jefeX0Wgd+U/Y/LVfODR3dD7dMyaRz2HioWq/So2EsCCauS
c5Q/cRpu2VNLwBmGhPq+qdZduj5KmGChI7Ru4wQwmwD5wgdrLlW2iMU1fsiAK5kt
KweHNi2vDLDDdd1202/mULVhYj5z2MSu+EokKu3KtSHOQyh//35eDK/vniFZy/wj
0osw3NhQGI4mb991nL1dB5LtgOO4BiG+Co64PDgQrkamJzTBhy8kDFBcGKYQgzKK
jpMIxGfhf1b74g8J0FLPWzpcJCef8sGS8pnlsupFD+3+l3MoNkgRJVxVRsBeyCuP
iJDjH7QOiNur69ydA9yy
=Bgiz
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
