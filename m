From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] dt-binding: usb: add "super-speed-plus"
Date: Thu, 12 Mar 2020 11:22:44 +0100
Message-ID: <20200312102244.GC1199023@ulmo>
References: <20200113060046.14448-1-jckuo@nvidia.com>
 <20200210185821.GA1057764@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200210185821.GA1057764-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 10:58:21AM -0800, Greg KH wrote:
> On Mon, Jan 13, 2020 at 02:00:46PM +0800, JC Kuo wrote:
> > This commit adds "super-speed-plus" to valid argument list of
> > "maximum-speed" property.
> >=20
> > Signed-off-by: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/generic.txt | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> What ever happened to this?  Did the DT developers see it?
>=20
> I suggest resending please so it gets into their queue to review.

It's been a while and you probably noticed by now, but in case you
haven't: Rob picked this up into the devicetree tree a few weeks ago, so
no need to worry about this any longer.

Thierry

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5qDWgACgkQ3SOs138+
s6FY5xAAwR85ce936jWef2QohmCJ3TQFWmFhJT5xrR4lenXt/X/5CRqHrY/UhFp6
JDh8UTQytoqUiFBx6qEP6zb7uj1VsrA/dD8vw03/a8mJwSWw7P2sXZc0eSRrSC35
G2AAq6JLGMDMcXvIGB8mwGrcrbp717KTYD8umwiBUc7qK5U1STNbMS75FzO6bRtN
7xVk57ED6K9qA76oNVZ2EidzVPTC7l0w/5jBkNwBc3bFwPlxNL/ULtgBYjJAz041
0s069xWv+OGZyxkG10CaRPCi2erXwYiX2WHivnQJQReY1YHVVqmOOJPTeR11YhTc
K01Yc+bbKIpyjAPywPDV0oQrOpMb4QPPCjRFzYVJKK66UfNc/ihmlCdXFlN/51/V
lrV/1/onTP0VKho5LJWfL7S0gJLusbhCBe0TnSnBKpF/R1PW65e6oHqvLUX+Rh/V
dZMF90Z2JzKzMBSeh4y66GXYzyikFqqAGDt7nEPLTarIyBQD4bbggg0nF7ADVzj7
HhfSGyCjLVlz8V4G3FN2JHguA1Htjl4We/D5BjghRWQJFBxAvVphJTFi9PDrc/yw
CH7P4dL1INI4BqJQhxQwpXjJDs4KwS5P4axnBXx9iqXQFTYEWVxOHaX9pKOsI+ix
cEjOltNEzaPJNS13Zm9Z+aWSdG/3BGLbFOwX7Jfuv1ISOcmBNYc=
=k0XA
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
