From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC 3/6] dt/bindings: Add bindings for Tegra20/30 NOR bus driver
Date: Mon, 25 Jul 2016 16:15:44 +0200
Message-ID: <20160725141544.GN21170@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-4-git-send-email-mirza.krak@gmail.com>
 <20160725113034.GD21170@ulmo.ba.sec>
 <CALw8SCWEFVu__8Gyr5q995h+=oMQEz1VUNB=Ne7MRb0O-tZXqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7fwXp2o0gOrkU5lS"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALw8SCWEFVu__8Gyr5q995h+=oMQEz1VUNB=Ne7MRb0O-tZXqg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mirza Krak <mirza.krak@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, pdeschrijver@nvidia.com, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, linux@armlinux.org.uk
List-Id: linux-tegra@vger.kernel.org


--7fwXp2o0gOrkU5lS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2016 at 03:16:28PM +0200, Mirza Krak wrote:
> 2016-07-25 13:30 GMT+02:00 Thierry Reding <thierry.reding@gmail.com>:
[...]
> > The above suggests that one of the CAN controllers gets mapped to an
> > address 0x48000000 and the other gets mapped to 0x48040000. But why do
> > we even need a chip-select at all in that case? If both chips don't use
> > any overlapping memory region, what good does the chip-select do?
>=20
> If we take a look on similar controllers found on others SOCs they
> usually define an address range / chip-select.
>=20
> Example (weim):
> ranges =3D <
> 0 0 0x10000000 0x02000000
> 1 0 0x12000000 0x01000000
> 2 0 0x13000000 0x01000000
> 3 0 0x14000000 0x01000000
> 4 0 0x15000000 0x01000000
> 5 0 0x16000000 0x01000000
> >;
>=20
> Which means that you all ready have an address mapped to PIN function.
>=20
> But Tegra GMI controller is a first for me, where you do not have this
> kind of setup in hardware. Usually you also have a timing register /
> chip-select so that you can connect different chip types.
>=20
> The lack of hardware support do decode an address to a chip-select PIN
> function, we have implemented this our self externally.
>=20
> We actually have 6 different chips connected to the GMI bus and the
> "ranges" would be:
>   ranges =3D <
>    0 0 0x48000000 0x00000100
>    1 0 0x48040000 0x00000100
>    2 0 0x48080000 0x00000100
>    3 0 0x480A0000 0x00000100
>    4 0 0x480C0000 0x00000100
>    5 0 0x480E0000 0x00000100
>   >;
>=20
> And this not nothing complicated, small number of AND gates and that is i=
t.
>=20
> The chip-select signal is necessary for the access characteristics, so
> we need to translate an address to an chip-select so that the chip
> knows the host CPU wants to talk to it.
>=20
> Do not know if I made anything more clear here :).

Yes, that clarifies many things. The presence of an external, address-
based chip-select is essential information in order to describe this
setup properly.

Given that the external chip select is entirely invisible to software, I
think a more accurate description of your setup would be:

	gmi@70090000 {
		...

		/* for the chip select */
		#address-cells =3D <1>;
		#size-cells =3D <0>;

		/*
		 * Technically this could be used to translate the range from
		 * 0x48000000 to 0x4fffffff into a different range, but that
		 * no longer works because of the #address-cells. Does this
		 * matter?
		 */
		ranges;

		bus@0 {
			compatible =3D "simple-bus";
			reg =3D <0>;

			#address-cells =3D <1>;
			#size-cells =3D <1>;

			can@48000000 {
				reg =3D <0x48000000 0x100>;
				...
			};

			can@48040000 {
				reg =3D <0x48040000 0x100>;
				...
			};
		};
	};

That omits any reference to the external chip select, which I think
makes sense because it's something that software is completely unaware
of.

Perhaps one important question: does your setup use the GMI's CS lines
in any way? Or does it simply get ignored?

If it gets ignored, I suppose one could encode this as a special case:

	gmi@70090000 {
		...

		/* simple address translation */
		#address-cells =3D <1>;
		#size-cells =3D <1>;

		ranges =3D <0x48000000 0x48000000 0x08000000>;

		can@48000000 {
			...
			reg =3D <0x48000000 0x100>;
			...
		};

		can@48040000 {
			...
			reg =3D <0x48000000 0x100>;
			...
		};
	};

We could use that special case in order to make the driver behave in a
special way that suits your setup, namely without explicit chip-select.
The case where #size-cells =3D <0> could be treated as the explicit chip-
select case, that somebody could implement in the future if they need
it. All other cases could be treated as meaning that the chip-select is
automatically handled externally (like in your setup) and we simply
statically configure the controller with chip select 0 (kind of in the
way your current patch series does).

Rob, what do you think about the above?

> > Also, it seems to me that you'd have to program the SNOR_CONFIG_0
> > register in order to select a specific chip, but I don't see anything in
> > the driver access that register after the initial write of the register.
>=20
> This is only setup at probe.
>=20
> >
> > I would've expected this to require some sort of infrastructure to allow
> > devices connected to the GMI controller to acquire the bus via some API
> > to select their chip.
>=20
> Yes, ultimately you would need some sort of infrastructure to allow
> devices to acquire the GMI bus if you want to solve this in software.
> But at the moment I do not see such an infrastructure in place, and is
> it feasible to add one specifically for the GMI controller? If one
> such infrastructure was in place we would need to modify all the
> drivers that want to use to include Tegra specific infrastructure to
> access the GMI bus?
>=20
> Since my knowledge is limited it hard for me to comment on this, maybe
> there is a simple way of doing this?

I don't think there's a simple way to do this. In order to properly
implement it we'd need to implement a generic infrastructure for chip
selects so that drivers such as the one for your CAN controller can be
written without tying them specifically to the Tegra GMI controller.

=46rom what you and Jon were saying it sounds like the drivers are
completely agnostic of any chip-select, so conversion won't be easy.
But technically if these chips take a chip-select as input then it's
always possible to hook them up to a controller that doesn't do this
automatic translation of address to chip-select, so eventually some
setup is bound to come along where they'd need explicit chip-select
handling as well.

I don't think it's fair to require you to implement this infrastructure
if you don't actually need it. At the same time I want to be cautious
and make sure we keep the driver and binding flexible enough to allow
us to implement explicit chip-selects should we later need them.

Thierry

--7fwXp2o0gOrkU5lS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlh8NAAoJEN0jrNd/PrOh5uYQAKDhLbzQcu8OQXBEUkt8HjY+
jE3O9un4ft/1Bs/8t6oxC4T89/v0+xZKYyRFN9RnYlcmnF9Vnm+lpIOIuvESrnkp
GytHKBFSFcCOQaP8GphmCjs7vgtKiKKF2b2TZ28CDqR3RDliyyNBVRYJooEzhzFU
GQ4a/ytautrLWj61t27I9YHG9TFtsFlCb3ixrEXErUovlhaAPWtk2JyKAOpQiXxA
IvZxdQewkDN7pOde5m5Un0U6whkegCb/Oxp95/YVUhxPNkpm07Qo49qS1TsXFl2s
tCA67/9yL5lucNFV1CAUgpYGdJsgGfSncOSFAbW+bVPY5fng+qOm607HI+zbLEs9
FdH20NqBOXWAWQXf+5vRo+Jdt0nOWvKQot0yJc6u7W3gYf4JhfIItC8LuSh0fDMv
MfwHyOqj8cPeMyzRfobLURq1irNcDIoTkKd5vbRF0hxaHwTVc+VX/G+nXtbWGLeT
cpNQhsV1rTg5cuYtojEZ4viIlXNc3cSfewVmvyD15/7+SgovZSLG4+kuKEzs0BWP
iLUcCmWt9aDT+9ZsN4rN2IvQ6PTBHUIOb5Ahb+S9QrRFMcOl+/Lsx2O02tX5lJ1g
F0O+67HzCnvzSi1gz56YNcxsuY+RONmOhYNfBlMwsrOa0OUdK4RzPBv+PDyPRCXZ
v7WIQirvchn32JUu14Ra
=ZHPH
-----END PGP SIGNATURE-----

--7fwXp2o0gOrkU5lS--
