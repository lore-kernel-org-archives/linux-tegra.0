From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC 7/7] pwm-backlight: Add rudimentary device-tree support
Date: Wed, 21 Dec 2011 10:32:57 +0100
Message-ID: <20111221093257.GF542@avionic-0098.mockup.avionic-design.de>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-8-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92EBE@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0692743372463030905=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF176BE92EBE-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============0692743372463030905==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline


--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> Thierry Reding wrote at Tuesday, December 20, 2011 3:32 AM:
[...]
> > +  - default-brightness: the default brightness setting
> > +  - max-brightness: the maximum brightness setting
>=20
> What are the units of those two properties? Percentage seems like a
> reasonable choice, although that's not what the patch implements.

That's just the way the pwm-backlight driver works. Typically the maximum
brightness is set to 255. I think you can set these values to pretty much
anything, and the driver will convert the brightness set via sysfs to the
range from 0 to max-brightness.

> > +Example:
> > +
> > +	backlight {
> > +		compatible =3D "pwm-backlight";
> > +		default-brightness =3D <224>;
> > +		max-brightness =3D <255>;
> > +		pwm =3D <&pwm 0 5000000>;
> > +	};
>=20
> This may be fine, but I'm not sure that representing the backlight as a
> standalone object is correct;

I don't think there really is any other way because we need the device node=
 in
order to have the corresponding platform device instantiated.

> I wonder if you want to represent a complete
> LCD display complex, including backlight, various GPIOs, and other display
> properties, all in the one node? That said, I suppose you could easily
> layer this as follows:
>=20
> reg: regulator {
>     // GPIO regulator
> };
>=20
> bl: backlight {
>     compatible =3D "pwm-backlight";
>     default-brightness =3D <224>;
>     max-brightness =3D <255>;
>     pwm =3D <&pwm 0 5000000>;
>     power-supply =3D <&reg>;
> };
>=20
> lcd@x {
>     backlight =3D <&bl>;
>     ...
> };
>=20
> so this probably is OK.

This looks pretty reasonable. I actually like it. I don't think there's any
code to resolve the &bl reference from the lcd driver yet, but that should =
be
rather easy to do.

> > +	/*
> > +	 * TODO: Most users of this driver use a number of GPIOs to control
> > +	 *       backlight power. Support for specifying these needs to be
> > +	 *       added.
> > +	 */
>=20
> At least for the power GPIO, this should probably modeled as a GPIO-based
> fixed voltage regulator. Are there other GPIOs that are directly related
> to a backlight rather than an LCD complex?

Currently some platforms seem to use more than a single GPIO for the power.
PXA/Magician has two, depending on the brightness. Viper for example takes a
shortcut and controls both the backlight power and LCD enable from the
pwm-backlight callbacks. I guess if/when those machines are converted, they
can use a complete LCD complex as you described.

Thierry

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7xp8kACgkQZ+BJyKLjJp9c5ACeJ+2pXOV8de1z1Kx+1WuYs7c7
OL4AnjDW9pzOcXRggJhCNpz7uj4eyLOX
=EjB5
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--

--===============0692743372463030905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0692743372463030905==--
