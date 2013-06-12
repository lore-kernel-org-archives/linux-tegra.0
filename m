From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V3 1/7] usb: phy: export ulpi_viewport_access_ops
Date: Wed, 12 Jun 2013 19:38:50 +0300
Message-ID: <20130612163850.GB22120@arwen.pp.htv.fi>
References: <1370462589-3090-1-git-send-email-swarren@wwwdotorg.org>
 <1370462589-3090-2-git-send-email-swarren@wwwdotorg.org>
 <20130612150603.GA15056@arwen.pp.htv.fi>
 <51B89DAF.4020703@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51B89DAF.4020703-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2013 at 10:11:27AM -0600, Stephen Warren wrote:
> On 06/12/2013 09:06 AM, Felipe Balbi wrote:
> > On Wed, Jun 05, 2013 at 02:03:03PM -0600, Stephen Warren wrote:
> >> From: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>=20
> >> In order to build a ULPI PHY driver as a module, this symbol
> >> needs to be exported.
> >>=20
> >> Signed-off-by: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>=20
> >> [swarren, reworked Manjunath's patches to split them more
> >> logically] Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=20
> >> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> >=20
> > This should go straight through Greg:
>=20
> All the patches in this series build on top of each-other, so I think
> need to be applied in the same branch. Applying this patch in branch A
> but the others in branch B will cause the build to fail in branch B if
> the driver is built as a module, since ulpi_viewport_access_ops isn't
> exported, right?
>=20
> And this series is also based on top of all the Tegra driver changes
> in your PHY branch, so I believe that is the correct place to apply this.

Isn't it the same thing as Greg taking these patches after applying my
pull request ? There's way too much outside of my domain here without
proper Acks for me to pick it up anyway.

--=20
balbi

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRuKQaAAoJEIaOsuA1yqREfx8P/3hiik6k5TKk/m/eYfykGgIl
wpHZpCwrEUie2E2fyB6U/ZmVxPdVNUfPAlETgC+fGVi0/0fttaawrHHl7jp9yw7P
zswaqByhZvIUIgpuafNN6LwP58qjKPegogHdyL+T2uLlbSbaBLzGorpFTOWItqvK
xt/nOIZ/chqDOZQ5MbQwKjlvvaiYPbcRSs+mSZD7A6CqBSAb+vfB5OHDRZFCMC7e
p9zVB5Ccru25YSN1VpBpQZDGxWMLpy0R62FxxOCNuDAA4r4DbOEgOZIzXIMJWBYl
EKiXG69cPXsKHxfuIl0W83zq3DzSjdqPJdb6yxCnoNpt7RdQEtD3IMnZL+kt3Tee
RiryC922hcS5BwOQD4KtgalhuN5rbajAyAaxSP7fbjPJgjkKsYRv/hRaA+FdDbRX
aHzisajUN+ohr0YhnfMlI+KojI6rrnTUg1zq4EMAm9GOfLydAoAtWBaSqOpxHj04
knJOWPB2bYGjlGzq0rSU0DL7Cigx7rp1rB4GS0aAS1ChS8HWkyGdD7VCGumC/2/D
uJyWv4Jmi9hd5yM3DR+XBWeQnBN/Le6MciOlPSmz50uRtQnOUXmffhKZVmYwTtHz
QlvaCjMWS5yulahkqkqfrt74OyNtU8LvDewLyRXlTKfeAofTmBEbpUPlBTKpz5Bj
BOPB9mMT78amKZ/kEDIw
=c4NG
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
