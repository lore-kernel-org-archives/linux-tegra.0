From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 3/9] dt-bindings: phy: tegra-xusb-padctl: Add
 Tegra210 support
Date: Tue, 5 Apr 2016 16:44:16 +0200
Message-ID: <20160405144416.GA10809@ulmo.ba.sec>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-3-git-send-email-thierry.reding@gmail.com>
 <56E99F10.1060508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56E99F10.1060508-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2016 at 11:59:44AM -0600, Stephen Warren wrote:
> On 03/04/2016 09:19 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Extend the binding to cover the set of feature found in Tegra210.
>=20
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> > diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb=
-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-pa=
dctl.txt
>=20
> > +	padctl@0,7009f000 {
> ...
> > +		pads {
> ...
> > +		};
> > +
> > +		ports {
> ...
> > +		};
>=20
> As a comment not affecting my ack in any way: At the top-level, we place =
all
> the child nodes into "array container" nodes named "pads" and "ports". Th=
is
> is nice since it separates different types of child nodes and allows easi=
ly
> adding more types of child nodes in the future without interference, and =
in
> a way that allows us to explicitly know what each node is without having =
to
> interpret its name or compatible value to do so. However, we haven't done
> this with the per-lane child nodes inside each pad. If we were to rev the
> design, I'd be tempted to suggest:
>=20
> 	padctl@0,7009f000 {
> 		pads {
> 			usb2 {
> 				lanes { // This level is new
> 					usb2-0 {

I tried to make this work, but it's unfortunately not possible with the
current code. The reason is that the PHY subsystem assumes that either
the provider DT node corresponds to that of the device (the usb2 pad in
the above example) or one of its children. Hence, putting everything
into one more level further down would require some mechanism to tell
the subsystem about it so that it can be found.

Arguably the current support code isn't a good argument for designing a
binding, so perhaps it'd be useful to add this mechanism in order to get
a better binding. On the other hand, I'm not sure it's really worth it,
since we already have generic bindings that specify the layout of child
devices, and those have been agreed upon broadly (presumably).

In light of the recent discussion on DPAUX vs. I2C, I see how having the
extra level would be useful to provide additional context. If you think
it's worth it I can spend the extra time to get this implemented in the
core.

Thierry

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXA889AAoJEN0jrNd/PrOhrlwP/1s/hfQKGfeRZJDP4P7W8FRG
7Q6HYYLy3S6Y69EigHnnKdjIDWiIYl/O3UpcxKmA3fGbIzGJzOn2cPvbAPMTnaVr
cy0S531prsWOmRSsPk+ev/eLclRJov9Ccsapum0Hp5O7U2FyGFjRKdW1hxh18c/a
ewt3hT4NqQgyy4yQ4eTC++RbdbLMd5N/taRDV6T/P9yTrm3Fsf75071qmADgh+2B
5tX1Lofqum+4qEIj8KMJLv+umzj/t+b4eutxQwEsm+v6gAhJamhVdJr0lQ9UZKiH
eFyk3UoDHHJBZCeqzoxbHtikVMHk7WzWFA0ZxqYR920Q5CbhAWA89FupDarA6HwO
fB79dj8SN6AFxDhOCtggsY2DRrN2kVzBJNUI1OO+a31KNJjuXmpuq5UtXOFgkMtx
zWWww8bZvQp6Cysa7RymTanPgTO/ZA0piW0q7kLVebBC7qTQWN/Rs3hVVBjQR/ji
7YrRhcM8aQ/Vdci0SAKqgHog6D3byxThCrVBU/9XsCZceWEh8z/aTvDO2qhFnxDB
LBCoxEOURcSttZhx+Wsgn9tOobXZP7KHvwDm1nHdTTHbov5AKUTv5UiO4xIGGu/v
MBROApgPAs4vIFlelyVfzxw28F3DwnKUvv5EhWnrFKMPlRBoTdUE3HRWsmw5sgTL
K5fQWtSqK2uxE9bl3mn8
=NQmu
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
