From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: allow child nodes inside the Tegra BPMP
Date: Fri, 29 Jul 2016 15:48:31 +0200
Message-ID: <20160729134831.GA3864@ulmo.ba.sec>
References: <20160719191442.15439-1-swarren@wwwdotorg.org>
 <20160719191442.15439-2-swarren@wwwdotorg.org>
 <20160726100302.GE2433@ulmo.ba.sec>
 <f1ca284a-5332-3323-80b9-7cf61e7c97ac@wwwdotorg.org>
 <CAL_JsqLfs5jnO9DkP5io5qbuCfhojfspkHQbHBttgWfTeokYkQ@mail.gmail.com>
 <6db4ff47-974b-94ac-3739-e630b6d38c0e@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6db4ff47-974b-94ac-3739-e630b6d38c0e-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2016 at 03:24:22PM -0600, Stephen Warren wrote:
> On 07/28/2016 01:07 PM, Rob Herring wrote:
> > On Tue, Jul 26, 2016 at 11:21 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org=
> wrote:
> > > On 07/26/2016 04:03 AM, Thierry Reding wrote:
> > > >=20
> > > > On Tue, Jul 19, 2016 at 01:14:41PM -0600, Stephen Warren wrote:
> > > > >=20
> > > > > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > >=20
> > > > > The BPMP implements some services which must be represented by se=
parate
> > > > > nodes. For example, it can provide access to certain I2C controll=
ers, and
> > > > > the I2C bindings represent each I2C controller as a device tree n=
ode.
> > > > > Update the binding to describe how the BPMP supports this.
> > > > >=20
> > > > > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > > ---
> > > > >  .../bindings/firmware/nvidia,tegra186-bpmp.txt     | 23
> > > > > ++++++++++++++++++++++
> > > > >  1 file changed, 23 insertions(+)
> > > > >=20
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp=
=2Etxt
> > > > > b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp=
=2Etxt
> > > > > index 9a3864f56955..142d363406f6 100644
> > > > > --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-=
bpmp.txt
> > > > > +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-=
bpmp.txt
> > > > > @@ -38,6 +38,24 @@ implemented by this node:
> > > > >  - .../reset/reset.txt
> > > > >  - <dt-bindings/reset/tegra186-reset.h>
> > > > >=20
> > > > > +The BPMP implements some services which must be represented by s=
eparate
> > > > > nodes.
> > > > > +For example, it can provide access to certain I2C controllers, a=
nd the
> > > > > I2C
> > > > > +bindings represent each I2C controller as a device tree node. Su=
ch nodes
> > > > > should
> > > > > +be nested directly inside the main BPMP node.
> > > > > +
> > > > > +Software can determine whether a child node of the BPMP node rep=
resents
> > > > > a device
> > > > > +by checking for a compatible property. Any node with a compatible
> > > > > property
> > > > > +represents a device that can be instantiated. Nodes without a co=
mpatible
> > > > > +property may be used to provide configuration information regard=
ing the
> > > > > BPMP
> > > > > +itself, although no such configuration nodes are currently defin=
ed by
> > > > > this
> > > > > +binding.
> > > > > +
> > > > > +The BPMP firmware defines no single global name-/numbering-space=
 for
> > > > > such
> > > > > +services. Put another way, the numbering scheme for I2C buses is
> > > > > distinct from
> > > > > +the numbering scheme for any other service the BPMP may provide =
(e.g. a
> > > > > future
> > > > > +hypothetical SPI bus service). As such, child device nodes will =
have no
> > > > > reg
> > > > > +property, and the BPMP node will have no #address-cells or #size=
-cells
> > > > > property.
> > > >=20
> > > >=20
> > > > My understanding is that the I2C bus number is passed as part of the
> > > > request to the BPMP firmware. Does that not count as addressing? Co=
uld
> > > > we not represent that generically using a device tree hierarchy? I'm
> > > > thinking something along these lines:
> > > >=20
> > > >         bpmp {
> > > >                 ...
> > > >=20
> > > >                 services {
> > > >                         i2c {
> > > >                                 i2c@0 {
> > > >                                         reg =3D <0>;
> > >=20
> > >=20
> > > Technically, that is possible. However, Rob Herring rejected the idea=
 of
> > > multiple levels of sub-nodes.
> >=20
> > I think I questioned the need, not rejected. What about the above, but
> > remove serivces level:
> >=20
> >          bpmp {
> >                  ...
> >=20
> >                  i2c {
> >                          i2c@0 {
> >                                  reg =3D <0>;
>=20
> Sigh. Can you please talk to Thierry and work out what the binding would =
be
> (perhaps on IRC to expedite things?) and I'll just implement whatever you
> two agree upon. I don't really care much what the binding looks like any
> more; I just need something that will pass review. Thanks.

Like I said, I'm fine going with what you proposed. I'm sure by now the
BPMP has long been frozen and if the proposed binding works fine that's
good. No need to over-engineer.

If we ever need more than one I2C (or expose other busses) I'm sure we
can find a way to switch to something like the above later on. Like I
said, that's very unlikely to happen on Tegra186, so we'll have a new
compatible string (and hence an easy way to differentiate between these
bindings) anyway.

Thierry

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXm16tAAoJEN0jrNd/PrOhXTYP/iiFsGU+f3UM/A4aSAdgM/9g
/Ev3g9tDMCi/5iP1MJa8cJGmzI0TyqFIHJVOuIb2vGd4A2w9RfNZ1VRoSh2xz8ej
hWIIukHEB9isCwfGIf0qV9O+rAx8GEIkIVeTLXXhAO/mzarRhdFZdfB4zL8kFw3x
gv//SUKxWLmpnHyh3ZdfXLnLxImT8gT7u9gQJCOu/sh+Ovu7hhmn8SFgNP3S+dWO
X43++LY0g4VNm+QfnAf2rW5L9KKOG+Zvv46OSJx9XFw+HSaMHJn0BI+jyNuI0CDJ
xYGE6BrydqmsmblkmqWaGXIe4oJCWc995FkeXfRe0BoHrqQZQJMxZrBj8jlsT8XT
cdoXCoGDc/7AAEkVicBAUZVAtcQavoGSs3rFCvyc/d8Wn4qc3sOuwuy+Ut9U3i/n
yEbx4qFvjqYXchmjAXRylcTE60pED2jf9gJGuQYmoK8/EbsDMJrZsAhPJ9F65f2I
AUUTk85T5XTdSIdq0LN8ygLto7Nfct2geeS5S+SKjlYdVpheFe5wVcmUY+lOenW3
9l46kQ4vgKR1jluDXK2kk5cmVQLYKqRnfayxsoTp8B8C4df2X87TqU6pSrw4ZgBN
RHZNCbeaiRgSitk42EnR0X5tA0ulCX0b4a31DTN6q/TUN3NxONSHRkHkt98HQ2n7
0XmMgrh0rhTgAI4YX9Nb
=4lLS
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
