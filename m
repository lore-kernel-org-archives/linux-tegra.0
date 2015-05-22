From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] tegra: dpaux: pinctrl proposal
Date: Fri, 22 May 2015 11:57:11 +0200
Message-ID: <20150522095709.GA16507@ulmo>
References: <1431963229-12867-1-git-send-email-jonathanh@nvidia.com>
 <20150519144654.GG26748@ulmo.nvidia.com>
 <555C901F.8090009@nvidia.com>
 <20150520154022.GB7734@ulmo.nvidia.com>
 <555CAE47.6070907@nvidia.com>
 <555CDC82.1010104@wwwdotorg.org>
 <555DD7B3.6020608@nvidia.com>
 <20150521140356.GA28021@ulmo.nvidia.com>
 <CACRpkdYP5FN=4_pWxc1j=e_JfcjA3bXCPDRmZYHeiZ8HDyEaEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYP5FN=4_pWxc1j=e_JfcjA3bXCPDRmZYHeiZ8HDyEaEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2015 at 09:03:17AM +0200, Linus Walleij wrote:
> On Thu, May 21, 2015 at 4:03 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> >> > I don't see any conceptual reason why the driver that binds to that =
node
> >> > can't register as both a pinctrl driver plus anything else it needs =
to.
> (...)
> >> Looking at it there should not be a problem here with regard to the
> >> driver_data member of the device struct and so I don't see why the
> >> tegra_dpaux_probe() could not call pinctrl_register() to register the
> >> device.
> >
> > Yes, I think that'd be the best solution.
>=20
> I'm pretty much ready to go to any compromises to get DRM/GPU
> drivers to use internal kernel subsystems. The tendency there
> is to reimplement all kernel driver frameworks and hammer registers
> they need to access.
>=20
> There are good reasons for. These drivers are usually so complex
> that things like probing and power up/down become a nightmare
> with cross-subsystem dependencies.
>=20
> They are a special case. I had a long discussion with Intel's
> Daniel Vetter about this and they (Intel) eventually used GPIO
> for some stuff where it would fit nicely, but didn't go to use fixed
> regulators as I had suggested.

I think the situation is somewhat more complicated for Intel than it is
for ARM because most of these interfaces have grown out of the ARM camp
as a means to address the absence of things like ACPI to deal with this
kind of resource.

It seems one of the obstacles Intel is facing in the mobile/embedded
market is that some aspects of the SoCs are structured very similarly to
what we're used to from the ARM world, but there's not enough
infrastructure to deal with this disconnect. I think they are pretty
much at a point now where ARM was a couple of years ago, and I suspect
they might run into similar problems unless they address this early on.
One of the examples I've seen, and I think that was where you were
involved too, was that they now need essentially board files to set up
these types of resources. I've always thought x86 should adopt device
tree more aggressively, especially in the embedded/mobile space where
they're facing the same problems that we've long solved on ARM. Most of
the glue is already there, and platforms exist that use it successfully
(I've worked on some of them before myself).

> >> However, it does mean that all the pinctrl/pinmux/pinconf ops for this
> >> pinctrl device will need to live in drivers/gpu/drm/tegra/dpaux.c which
> >> is fine,
>=20
> Yeah that's cool I already have e.g. GPIO chips all over the map,
> including DRM IIRC.
>=20
> >> but I *believe* that would require moving
> >> drivers/pinctrl/pinctrl-utils.h to include/linux/pinctrl/ in order to
> >> make use of these functions.
>=20
> Well I originally intended that to be private and neat, but whatever.
> Call it pinctrl-utils-internal.h or something then.
>=20
> >> May be that is fine too. I could put
> >> together a patch series and see what everyone thinks.
> >
> > I guess it depends mostly on whether Linus (Cc'ed) is willing to have
> > drivers outside of drivers/pinctrl implement pin controllers.
>=20
> For this case: go ahead.

Thanks for being pragmatic here. I think there's potential to make the
job as a maintainer more difficult because now you have to scan more
than a single directory when you update API, and you potentially have a
harder time build testing. But I think that problem can be addressed by
improving our tooling rather than by imposing artificial barriers on
driver code.

Thierry

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVXv1zAAoJEN0jrNd/PrOhi+QQAJfVsbN+WTw3+/Qfl9k+Iwh1
ewEIiN7dNdbVx87X+9pb0eIapX+v7cLHELlLRq4n7p336Lk22YIZ8gvqvQHHmCyi
RTCVusJrudJViY+SRurqXXCnb3Kuolh7lB9JAdyMqj7cYCAt5AERJL7C7U0HWDWx
mRFHtBIo974pbMo0+M2xxdwUQVEGEX9j3cAdN2fsNBPx3yagEhL9ajRD7Zm5/6L3
MhCAAfjQ6G7Kb8xhWonFbuA9yH3gMtqd/sH/VPTeGw2jSktX5BhYqbZmwNXSxoFT
zP465WqHqarsD8gI7b3NIEWl3n0MWKMN627JIcPLDKWSwpfLy3IFsKoEsdYoWWlL
K286BcDGMSRfH66H/n+OSatSbFUy5F0z4jh0btYlivwVcYI7ssxNY4TXdncQ+TTi
9gBHrIfrrd79SPgXoUNhFZEgfOLBV76+jD9be8FWGjva/aBDrwfdUwOyvumlC3Ab
pWNEsNi/Lf5NyiI0czlXjI/5+kx5U2AJBzPj4G6OXHISJdUU/k1TvcGWGTzjfYNW
jwb5EGPx1+TU8/85RDxJSZvRlk5mRICIL+jsB/VpAWCqdHo1ub2ALeXyis6HNd4F
fxa2qC4q14BlXAdJFNc77KDQ8CuXgjnwJOB9EU5AtwlhBkNITGTzGeyfbFOk6wPo
vXVTEXsaVCFzx3Ir5yms
=8K8T
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
