From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] usb: host: ehci-tegra: Grab the correct UTMI pads
 reset
Date: Wed, 4 May 2016 17:26:48 +0200
Message-ID: <20160504152648.GA31420@ulmo.ba.sec>
References: <1462372800-30900-1-git-send-email-thierry.reding@gmail.com>
 <20160504145710.GA14708@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160504145710.GA14708-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tuomas Tynkkynen <tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2016 at 07:57:10AM -0700, Greg Kroah-Hartman wrote:
> On Wed, May 04, 2016 at 04:39:59PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > There are three EHCI controllers on Tegra SoCs, each with its own reset
> > line. However, the first controller contains a set of UTMI configuration
> > registers that are shared with its siblings. These registers will only
> > be reset as part of the first controller's reset. For proper operation
> > it must be ensured that the UTMI configuration registers are reset
> > before any of the EHCI controllers are enabled, irrespective of the
> > probe order.
> >=20
> > Commit a47cc24cd1e5 ("USB: EHCI: tegra: Fix probe order issue leading to
> > broken USB") introduced code that ensures the first controller is always
> > reset before setting up any of the controllers, and is never again reset
> > afterwards.
> >=20
> > This code, however, grabs the wrong reset. Each EHCI controller has two
> > reset controls attached: 1) the USB controller reset and 2) the UTMI
> > pads reset (really the first controller's reset). In order to reset the
> > UTMI pads registers the code must grab the second reset, but instead it
> > grabbing the first.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Any reason you don't want this backported to stable kernels?

There's a brief note below the commit message that explains why I'm not
sure if there's a need to backport:

> Stephen, Alex, Jon, have you ever encountered cases where UTMI might not
> have worked correctly? It seems that this code was pulsing the wrong
> reset line and therefore the UTMI pads would never be reset unless the
> first USB controller was probed before all others. I've never seen any
> such problems myself, so I'm unsure about whether it's worth Cc'ing the
> patch to stable-u79uwXL29TaiAVqoAR/hOA@public.gmane.org

So the bottom line is that I have no evidence that this fixes any real
issue, hence I'm not sure if it's worth bothering the stable kernel
maintainers with it.

While at it, adding Tuomas who wrote the original probe order fix.
Tuomas, does this patch look correct to you? Here's the patch in full if
you don't have it in your inbox:

	http://patchwork.ozlabs.org/patch/618488/

Thanks,
Thierry

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKhS2AAoJEN0jrNd/PrOh1ogP/2yL+ccwki8GgvJXJX517+UV
8sElO4Qr4BuXOQkLst90gtr/W+HrpAlVo/jNTrw+tRbXNSPEsSpM7qi4efyXbtBI
VymOpGS6/NGXM4LZXdrpGldpR0IEnmglr++eEJHc5TDx8WfErcM+YSQ9MTaQVXEs
cih+G9XQ5mEbaQNgohhOLN+rjzdYwWNDFuTbJed3DTaYtNHoOEIPYz4/jWGZHky0
6xokxQpi7NctJKhWfTMNFq5TEGnA0sdtkOpFOATML9/XyxdeTM+aDxnpeA6T6XZU
nY+3/CZ52M4UmFLZBcXzCH77aXboqO+nfOBc6aNY/LSDoZpWptuJTQUoyCmPT410
i5HqCPwNAFi+dIgqrg08UgpKI2IFLFuuNaS5LRgkEz5TRnhxSwz2uOgXXuFC9DBP
TZNMvknfWi1dNlTioE2DBL7qEJmGcLPbdquRMzi/scCy9oE3ldvogWX1M3Aoa/iX
0IxVxEnU7jLWo4BI7MbpYsoSG0dez6QtXaCKtLqdMjAAco5e0OPW20uhZA7o/efg
7BQVRipeuyc0KHaHM3EbH0/SR0lyKFdJyigTB9ZIZtQ8ZmDnQrAztrlJSSwkoP46
N//pOvKBfOmRy8DwkHe7ASZ4S9o1z1LxQpzmHli34V8DX9aJXOEgTlL6y+p2TtvH
KRh8qM4g3aJLdnyhoTTS
=PLI6
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
