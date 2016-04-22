From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix naming in GPIO DT binding header
Date: Fri, 22 Apr 2016 13:24:06 +0200
Message-ID: <20160422112406.GB9047@ulmo.ba.sec>
References: <1459884307-24043-1-git-send-email-swarren@wwwdotorg.org>
 <20160406172845.GC28843@ulmo.ba.sec>
 <5705481D.3030700@wwwdotorg.org>
 <CACRpkdZxeV07_rb2xL+HRGp-ay1B-U=_tEbPCYqvM+ZYD-wpYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZxeV07_rb2xL+HRGp-ay1B-U=_tEbPCYqvM+ZYD-wpYQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2016 at 09:04:09AM +0200, Linus Walleij wrote:
> On Wed, Apr 6, 2016 at 7:32 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wr=
ote:
> > On 04/06/2016 11:28 AM, Thierry Reding wrote:
> >>
> >> On Tue, Apr 05, 2016 at 01:25:07PM -0600, Stephen Warren wrote:
> >>>
> >>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>
> >>> According to the Tegra TRM, GPIOs are aggregated into /ports/ of 8 GP=
IOs,
> >>> not into /banks/. Fix <dt-bindings/gpio/tegra-gpio.h> to correctly
> >>> reflect
> >>> this naming convention. While this seems like silly churn, it will be=
come
> >>> slightly more important once we introduce the GPIO binding for upcomi=
ng
> >>> Tegra chips.
> >>>
> >>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>> ---
> >>>   include/dt-bindings/gpio/tegra-gpio.h | 68
> >>> +++++++++++++++++------------------
> >>>   1 file changed, 34 insertions(+), 34 deletions(-)
> >>
> >>
> >> It's not clear to me where this should be applied. This is technically
> >> part of the GPIO controller bindings, in which case it'd need to go via
> >> the GPIO tree. I'm fine with taking it through the Tegra tree, too, but
> >> in case you agree that it should go through the GPIO tree:
> >>
> >> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > I typically consider bindings part of the SoC code-base they related to=
, so
> > I'd imagine this going through the Tegra tree. I didn't Cc LinusW on the
> > patch because of that thinking and oversight, but have done so now just=
 in
> > case he feels strongly.
>=20
> No strong opinion, only time I care is when we merge a new driver
> and it #includes <dt-bindings/...>.
>=20
> Take it through the tegra tree.
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks.

Thierry

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXGgnUAAoJEN0jrNd/PrOhm+wP/3uqH7t79yyewub5qGsyyNro
DvFnPvP7hMD2a2vQu6V7ezZin1VLFfmTqIM1PKE3g746HBd+GZuB9hlEqLGELUkn
sxdJVOoe+JUCT7mb8gOqnxLS2+ekF+BRhL9KX1q2dgkcRiY8UTBAmJHq6cN/KTP2
48c3qHqmwYzb1cMo2OaVR22SBXefkNprNIedx/ZbghxD1rIZlmeI6cN5BDBqucfi
sgiUok9RXJ/7uNka9pt6Q3yojLs/PzA6eRXt7+/VXOORjCkZkG7823KGxbGyZkPs
BOthOtflQT6191rY30CKjyy7zY625NwA9ChhC8LM+DgHXvPTSR4skcNjygQmLrxG
x8107S8IFdzKih2ujfAurka7Vj+hp4OutFnhL04AJp5oAQHDX5lFHkrcdu6I+Ufz
mMOD+alsrK39TEWf5qEdpY1RE/ZmIoAHOXoUEpiky3hBtFBIj/l49QtktkVhJzJJ
YbfI9kaKNNY5H2e0k+lnhqk83v9LEA0GrdmrZ8TfcZK610Ay6uIa63NFrrNRZs3Z
NXgg/oe/cx8ApW1JvjkiwCma5a9jh4wkrSXINJJUQIQjsTefbG3ukmGuBjdUToPR
zVv8ix2ut7Rcb37U5L81g4OGSFa+Te/JkEoRaSyPF3eSMbxV69hG2gYEkHe0ojBr
VlwIzX514pDIXQbWwV9A
=Qm2N
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
