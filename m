From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] usb: host: ehci-tegra: Avoid getting the same
 reset twice
Date: Wed, 4 May 2016 22:25:46 +0200
Message-ID: <20160504202544.GB21480@mithrandir.ba.sec>
References: <1462372800-30900-1-git-send-email-thierry.reding@gmail.com>
 <1462372800-30900-2-git-send-email-thierry.reding@gmail.com>
 <572A3008.4020602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <572A3008.4020602-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2016 at 11:23:20AM -0600, Stephen Warren wrote:
> On 05/04/2016 08:40 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Starting with commit 0b52297f2288 ("reset: Add support for shared reset
> > controls") there is a reference count for reset control assertions. The
> > goal is to allow resets to be shared by multiple devices and an assert
> > will take effect only when all instances have asserted the reset.
> >=20
> > In order to preserve backwards-compatibility, all reset controls become
> > exclusive by default. This is to ensure that reset_control_assert() can
> > immediately assert in hardware.
> >=20
> > However, this new behaviour triggers the following warning in the EHCI
> > driver for Tegra:
> ...
> > The reason is that Tegra SoCs have three EHCI controllers, each with a
> > separate reset line. However the first controller contains UTMI pads
> > configuration registers that are shared with its siblings and that are
> > reset as part of the first controller's reset. There is special code in
> > the driver to assert and deassert this shared reset at probe time, and
> > it does so irrespective of which controller is probed first to ensure
> > that these shared registers are reset before any of the controllers are
> > initialized. Unfortunately this means that if the first controller gets
> > probed first, it will request its own reset line and will subsequently
> > request the same reset line again (temporarily) to perform the reset.
> > This used to work fine before the above-mentioned commit, but now
> > triggers the new WARN.
> >=20
> > Work around this by making sure we reuse the controller's reset if the
> > controller happens to be the first controller.
>=20
> > diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegr=
a.c
>=20
> > @@ -81,15 +81,23 @@ static int tegra_reset_usb_controller(struct platfo=
rm_device *pdev)
>=20
> > +	bool has_utmi_pad_registers =3D false;
> >=20
> >   	phy_np =3D of_parse_phandle(pdev->dev.of_node, "nvidia,phy", 0);
> >   	if (!phy_np)
> >   		return -ENOENT;
> >=20
> > +	if (of_property_read_bool(phy_np, "nvidia,has-utmi-pad-registers"))
> > +		has_utmi_pad_registers =3D true;
>=20
> Isn't that just:
>=20
> has_utmi_pad_registers =3D of_property_read_bool(phy_np,
>     "nvidia,has-utmi-pad-registers");
>=20
> ... and then you can remove " =3D false" from the declaration too?

Yes. This is really only for aesthetics. The direct assignment doesn't
fit within 80 columns, and wrapping it looks ugly whichever way you do
it.

> >   	if (!usb1_reset_attempted) {
> >   		struct reset_control *usb1_reset;
> >=20
> > -		usb1_reset =3D of_reset_control_get(phy_np, "utmi-pads");
> > +		if (!has_utmi_pad_registers)
> > +			usb1_reset =3D of_reset_control_get(phy_np, "utmi-pads");
> > +		else
> > +			usb1_reset =3D tegra->rst;
> ...
> >   		usb1_reset_attempted =3D true;
> >   	}
>=20
> This is a pre-existing issue, but what happens if the probes for two USB
> controllers run in parallel; there seems to be missing locking related to
> testing/setting usb1_reset_attempted, which could cause multiple parallel
> attempts to get the "utmi-pads" reset object, which would presumably cause
> essentially the same issue this patch is solving in other cases?

Hah! Interestingly my initial attempt at fixing this was to introduce a
lock to serialize these, because I thought that was what was going on. I
don't think this function can ever run concurrently for different
devices because the driver core already serializes probes (unless a
driver specifically requests asynchronous probing, which this one
doesn't).

Thierry

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKlrHAAoJEN0jrNd/PrOhRzUP/RlcC75e+47527q5qE2JrqbN
bNzz66t0Y+hNi7AGlJ+v8m02NoKvmLdgOXSJtfvtgS4HpMpTNiFXRR3Equv3+HUn
RtVYA1RyNNxmNW02Tq/yLMA/Q7kdUoWAaOT2fQqDcZJswLurS7ToJXzc2fSWIxeJ
2kABs6vQYPpM4rUnrbTGiQVOpzpFM3wMSwyD2zI3ktm9yzOQLHn4hWJ03F0GjflL
TsGtgTrKO5+7lB6KK1GppliD6wjeXAVL08fTQVd4hjBQaMwz8e4Yc1QRIg/5xopb
r9SrX3pKGdkSdaXhW80qo9I/YGWiUKJ0UVEPLBLKxjSfFkNykqyTgHLA8iN8sfP7
LPZuFkYNtDTLoT4geXr2CBvkqMffChYTPIMEZWvIAYy+eMEZ6ac2zjt/ZFQtbvts
z8Fi0/yikGpKIxg1jmI3vXSwXuK/OC5bPhsN9P9CoQ8bsAUhEImvBhwH15SQWc0L
xf2FHyojtTsYlSm0dQnVCZ6Cq/GPpNIIC2k11mDkQW1g7mqOT9kZC7k2KQifHD5l
NESaDfDNd3J95F/qc6lSUVm79+2trZVRAeg9EKLTvUkb7tSD4rjGQ6uA/co6kwoN
Xz0v22RBUE7GMHyu3TOjYdzSXqdAUDUpf8OxF72GJXxOUA1MqeuBhJ7Q9CCle/wj
oB4KXgI59l/4bMVVSQpJ
=AviU
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
