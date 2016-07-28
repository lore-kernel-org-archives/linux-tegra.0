From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: allow child nodes inside the Tegra BPMP
Date: Thu, 28 Jul 2016 16:08:47 +0200
Message-ID: <20160728140847.GA28342@ulmo.ba.sec>
References: <20160719191442.15439-1-swarren@wwwdotorg.org>
 <20160719191442.15439-2-swarren@wwwdotorg.org>
 <20160726100302.GE2433@ulmo.ba.sec>
 <f1ca284a-5332-3323-80b9-7cf61e7c97ac@wwwdotorg.org>
 <36967d69-cb2a-654e-9a4c-2021fd476464@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <36967d69-cb2a-654e-9a4c-2021fd476464-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2016 at 03:50:52PM -0600, Stephen Warren wrote:
> On 07/26/2016 10:21 AM, Stephen Warren wrote:
> > On 07/26/2016 04:03 AM, Thierry Reding wrote:
> > > On Tue, Jul 19, 2016 at 01:14:41PM -0600, Stephen Warren wrote:
> > > > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >=20
> > > > The BPMP implements some services which must be represented by sepa=
rate
> > > > nodes. For example, it can provide access to certain I2C controller=
s,
> > > > and
> > > > the I2C bindings represent each I2C controller as a device tree nod=
e.
> > > > Update the binding to describe how the BPMP supports this.
> > > >=20
> > > > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > >  .../bindings/firmware/nvidia,tegra186-bpmp.txt     | 23
> > > > ++++++++++++++++++++++
> > > >  1 file changed, 23 insertions(+)
> > > >=20
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.t=
xt
> > > > b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.t=
xt
> > > > index 9a3864f56955..142d363406f6 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.t=
xt
> > > > +++
> > > > b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.t=
xt
> > > > @@ -38,6 +38,24 @@ implemented by this node:
> > > >  - .../reset/reset.txt
> > > >  - <dt-bindings/reset/tegra186-reset.h>
> > > >=20
> > > > +The BPMP implements some services which must be represented by
> > > > separate nodes.
> > > > +For example, it can provide access to certain I2C controllers, and
> > > > the I2C
> > > > +bindings represent each I2C controller as a device tree node. Such
> > > > nodes should
> > > > +be nested directly inside the main BPMP node.
> > > > +
> > > > +Software can determine whether a child node of the BPMP node
> > > > represents a device
> > > > +by checking for a compatible property. Any node with a compatible
> > > > property
> > > > +represents a device that can be instantiated. Nodes without a
> > > > compatible
> > > > +property may be used to provide configuration information regarding
> > > > the BPMP
> > > > +itself, although no such configuration nodes are currently defined
> > > > by this
> > > > +binding.
> > > > +
> > > > +The BPMP firmware defines no single global name-/numbering-space f=
or
> > > > such
> > > > +services. Put another way, the numbering scheme for I2C buses is
> > > > distinct from
> > > > +the numbering scheme for any other service the BPMP may provide
> > > > (e.g. a future
> > > > +hypothetical SPI bus service). As such, child device nodes will ha=
ve
> > > > no reg
> > > > +property, and the BPMP node will have no #address-cells or
> > > > #size-cells property.
> > >=20
> > > My understanding is that the I2C bus number is passed as part of the
> > > request to the BPMP firmware. Does that not count as addressing? Could
> > > we not represent that generically using a device tree hierarchy? I'm
> > > thinking something along these lines:
> > >=20
> > >     bpmp {
> > >         ...
> > >=20
> > >         services {
> > >             i2c {
> > >                 i2c@0 {
> > >                     reg =3D <0>;
> >=20
> > Technically, that is possible. However, Rob Herring rejected the idea of
> > multiple levels of sub-nodes.
> >=20
> > Can we please just go with what we have? DT bindings are frankly an
> > obstacle to getting anything done:-(
>=20
> Thierry, any further thoughts here? I really need to get these DT bindings
> finalized so that I can use them in U-Boot, which is very urgent. Thanks.

If everyone else is fine with these bindings, let's go ahead with them.

Thierry

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXmhHtAAoJEN0jrNd/PrOhhrwP/315BduqkjDP08CjJbucTRC+
R4xcUW59CcsdukplWKggtDA6NuZa3/ZrLa59oyl8CxxdX6u+BOka2tcV9Qem7jvw
43jQEiPouxszrtxnOb3rJHLoWGwNerMmXZNXZZlr+GIWxj1vDCsuUbosf8Ayz9B3
E6mimbcG+wUy528cR9Blp3ebr9shP851WIJgsdaJ9vbXUpBJ26SMleBUlEf5G2TB
oHONTFqPrYd+5deFY/7c7Nq84P20UewEkhWVCGMq1uAmS/mTcBMGH2XouZCLxK9a
m5ifKh4hYCz76c6BAc1DeN6KW6jQ1xb3YbNYHnHTjTG+SHAkNPJ17KSynCqzFSp3
Zdj2zRlCz48JaTQ9lvVyDa/4XNtvgdge5hAM5Q9BP2S/e3irc8/PN6RC6PHk0eBa
3JNzjU2DRP80I1lP4yIeZb9Rklu2NzEMMcaUu2sOyiZuC/rzM/qL/7Cp+TO+1W3m
qUz1W7iL3BaIWd1+m/9Z2wV+JjjrerOtXp4TE6yhJhZ85scCbym5tfGddmMpk+Ve
UHdN7lVyo1UOqc0eDg/oVm8brlwSUNvNvkbl1EpwxLJpf81Hd/UjB3nl9fR75erT
6jNbT7Gtq//zc+NQ+dm1DEDbnNfWnFit+xVHRPqpKEPb/FUIW4rAE+sbzIG6rVmd
gC1CQrZ20b1SFUKYn3Eh
=Qi2O
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
