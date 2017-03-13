From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] gpio: Add Tegra186 support
Date: Mon, 13 Mar 2017 18:44:07 +0100
Message-ID: <20170313174407.GA19679@ulmo.ba.sec>
References: <20170310162629.31455-1-thierry.reding@gmail.com>
 <58C6C72C.4080408@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <58C6C72C.4080408-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2017 at 09:52:04PM +0530, Laxman Dewangan wrote:
>=20
> On Friday 10 March 2017 09:56 PM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Tegra186 has two GPIO controllers that are largely register compatible
> > between one another but are completely different from the controller
> > found on earlier generations.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes in v2:
> > - add pin names to allow easy lookup using the chardev interface
> > - distinguish AON and main GPIO controllers by label
> > - use gpiochip_get_data() instead of container_of()
> > - use C99 initializers
> >=20
>=20
> Overall it looks fine to me.
> Only thing I did not like is the of_xlate manipulation where the gpio num=
ber
> is translated to another number for register access.
> The reason is that it complicate in debugging when we instrument the
> callbacks for some gpios and this is very common in our debugging.
>=20
> I still request here to use simple mapping instead of complicating.

I fail to see how this is complicating things. Yes, you can no longer
directly map from an offset to the port/index, but since we have a name
associated with each pin, we can simply print the name if we want to
know what pin we're dealing with.

So you could simply do something like this:

	static int tegra186_gpio_get_direction(struct gpio_chip *chip,
					       unsigned int offset)
	{
		struct gpio_desc *desc =3D gpiochip_get_desc(chip, offset);
		...
		dev_dbg(chip->parent, "GPIO %s (%s)\n", desc->name, desc->label);
		...
	}

The alternative that you're talking about would be something like this:

	static int tegra186_gpio_get_direction(struct gpio_chip *chip,
					       unsigned int offset)
	{
		struct tegra_gpio_port_soc_info *info;
		unsigned int port =3D GPIO_PORT(offset);
		unsigned int pin =3D GPIO_PIN(offset);
		...
		info =3D tgi->soc->port[port];
		...
		dev_dbg(chip->parent, "GPIO P%s.%02u\n", info->port_name, pin);
		...
	}

And with the above you'd either duplicate the logic that constructs the
pin name: once in the instrumentation code and once in the code that
sets up the pin names. Or you could decide not to set up any pin names
at all, in which case userspace would need to deal with the numbering
schemes itself, which makes things really complicated, especially when
we start supporting multiple SoC families.

The proposal in this patch is really quite elegant, if I may say so, in
that individual pins are identified by their name. Userspace can query
the list and get only the ones that actually exist. The wholes in the
GPIO range are not there, so there's not even a chance of userspace
messing with non-existing GPIOs.

Similarly the kernel has access to the name of these GPIOs, so the same
"string representation" can be used as for userspace.

I think this makes the driver very consistent across all use-cases. The
only remaining downside I see is that we're moving away from the 8-pins
per port from earlier chips. But I actually see that as a feature, even
something that we should backport to older chips.

The only reason why the driver for older chips works is because the
registers are laid out such that the pins of a port share one register
block, so if a non-existing GPIO is accessed, we'd be accessing a non-
existing field in an existing register, which seems to be less of an
issue than accessing a non-existing register.

Thierry

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljG2mMACgkQ3SOs138+
s6HfRxAAia90orQszbZT3VOd+ykbzT38utpi5vw82nvavOjwoepYZ8SuG0mK4s1u
XdwsnAzgUt0vZlUzaOL3qx8ldW/VcW2zE3fSfobCEcXJZQDp2n5yyrCRkBixQIuG
HDTLkAQoPj11IrHH4I0KmX+CZkmfgtTR8xkjf0xd6R0idz0k9JIRswhk8tF5RuBs
BfKGMxp8glnSFqFTpQFNFq+tb1fM2AQnwsqdZvbUuHrCG//Trv+O2Cxf4rk2b7HY
Jx6PzA078eyBqzWnepdgA6e3sCIBUz9gKf2AHJSIBowb4mquGm/CxTgkYeHOejyR
Z+sZSSpvACJCJbuSbHsvxHOaTw9v/SH3Pz2z/vmd+zz4jbJnTf9kf0ZlRxH5Tkx9
pdRnByf08e7N1cye8n1RuPPPNkU1j0dTxRWUmIfsxb0l1sutE/G5EgxxYnKHmXaW
twfJIrYSsgQUZkUZYD2Pkoz3z1l1qo7YCUT3D5mmD/MtITDqujR21mOAr8dX+5ih
oiR4HTMBeL4mCn0GqkyiY7Uj98IMPlAGFLoUTcpj3xN5WIYu2M0wpRsI2qZtQxqi
FHdUkMDDgbXPhcQqhi1FcwjZE/76oFxXj+vaoWNIuBUdOKl7EbWvTdcs2dPUqw/7
PwkII1LtFFviHm1LTtvJ1979u2oci0qXzPgy4qSTsVSFOYa1v4g=
=hF+7
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
