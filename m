From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: GPIO/IRQ expander cannot map interrupt
Date: Tue, 29 Nov 2011 07:59:26 +0100
Message-ID: <20111129065926.GA5044@avionic-0098.mockup.avionic-design.de>
References: <20111125104511.GA16748@avionic-0098.adnet.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAF8B7@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174FDAF8B7-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Friday, November 25, 2011 3:45 AM:
> > The following is an extract from a device tree of a Tegra2-based board =
I'm
> > working on:
> >=20
> [swarren: Abbreviated the DT during quoting]
> > 	i2c@7000c000 {
> > 		keypad1: sx8634@2b {
> > 			interrupt-parent =3D <&gpioext>;
> > 			interrupts =3D <2>;
> > 		gpioext: gpio-ad8p@41 {
> > 			gpio-controller;
> > 			#gpio-cells =3D <2>;
> > 			interrupt-controller;
> > 			#interrupt-cells =3D <1>;
> > 	i2c@7000c400 {
> > 		keypad2: sx8634@2b {
> > 			interrupt-parent =3D <&gpioext>;
> > 			interrupts =3D <3>;
> >=20
> > So basically I have a GPIO/IRQ expander on the first I2C bus (gpioext) =
to
> > which the two keypad (sx8634) chips are connected. They use GPIOs 2 and=
 3 of
> > the expander as interrupts.
> >=20
> > This all seems to work partially: the gpioext is properly detected as p=
arent
> > for both keypad controllers during I2C device registration. Within the
> > gpio-ad8p driver I register an IRQ domain (using irq_domain_add_simple(=
)) in
> > order to allow the OF code to properly map the IRQs for the controller's
> > children.
> >=20
> > The problem, however, is that the keypad I2C devices are registered bef=
ore the
> > gpioext device is probed, which results in a situation where the IRQs c=
annot
> > be mapped because the gpioext device hasn't had a chance to register th=
e IRQ
> > domain yet.
>=20
> I believe this is something that the forthcoming "deferred probing"
> mechanism will solve. This isn't in place yet. I /think/ it's one of the
> things that Grant Likely is working on getting going during his sabattica=
l,
> so hopefully there will be some patches you can try out soon.

I've seen some patches floating around, but I'm not sure that, in the curre=
nt
form, deferred probing will solve this issue. Or at least not solve it in t=
he
most efficient way. From what I understand, deferred probing is merely a so=
rt
of hook that allows the driver to specify at probe time that some resources
are still missing and is used for cases where there is no explicit dependen=
cy
information and thus the driver core doesn't know in which order devices ne=
ed
to be probed.

However, for this particular case we actually have this explicit dependency
information because the devices specify an interrupt and/or GPIO parent.
Moreover it's not really the probing that is the issue here, but rather the
device instantiation. The OF core instantiates the I2C slaves much too early
(i.e. together with the interrupt parent) and therefore requires access to
the IRQ domain mapping at the time of the instantiation already.

Using deferred probing in this case would require the driver to repeat the
complete IRQ mapping sequence that is already done when OF populates the
device tree. Perhaps in addition to deferred probing we also need deferred
*instantiation*.

Thierry

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7Ugs4ACgkQZ+BJyKLjJp9htACfYnWdPFgmsxKj9yCxRXjS9RD/
cakAoK6fz0TIhqxCeYnz5blskZyXWu7U
=Po6w
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
