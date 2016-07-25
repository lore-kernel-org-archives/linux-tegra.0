From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC 3/6] dt/bindings: Add bindings for Tegra20/30 NOR bus driver
Date: Mon, 25 Jul 2016 13:59:23 +0200
Message-ID: <20160725115923.GF21170@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-4-git-send-email-mirza.krak@gmail.com>
 <434561ec-510e-a3bf-c7b6-c961db299bd6@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RE3pQJLXZi4fr8Xo"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <434561ec-510e-a3bf-c7b6-c961db299bd6@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mirza Krak <mirza.krak@gmail.com>, swarren@wwwdotorg.org, gnurou@gmail.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@armlinux.org.uk
List-Id: linux-tegra@vger.kernel.org


--RE3pQJLXZi4fr8Xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2016 at 10:56:44AM +0100, Jon Hunter wrote:
>=20
> On 19/07/16 14:36, Mirza Krak wrote:
> > From: Mirza Krak <mirza.krak@gmail.com>
> >=20
> > Document the devicetree bindings for NOR bus driver found on Tegra20 and
> > Tegra30 SOCs
> >=20
> > Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> > ---
> >  .../devicetree/bindings/bus/nvidia,tegra20-nor.txt | 73 ++++++++++++++=
++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra2=
0-nor.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.t=
xt b/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt
> > new file mode 100644
> > index 0000000..9ee4a66
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt
> > @@ -0,0 +1,73 @@
> > +Device tree bindings for NVIDIA Tegra20/30 NOR Bus
> > +
> > +The NOR controller supports a number of memory types, including synchr=
onous NOR,
> > +asynchronous NOR, and other flash memories with similar interfaces, su=
ch as
> > +MuxOneNAND. One could also connect high speed devices like FPGAs, DSPs,
> > +CAN chips, Wi-Fi chips etc.
>=20
> Nit-pick ... the Tegra documentation refers to this controller as the
> GMI (general memory interface) or SNOR (sync-NOR) controller because it
> is not just limited to NOR as you mentioned. I see references to GMI in
> the Tegra pinctrl driver and so may be we should use this name.
>=20
> > +
> > +The actual devices are instantiated from the child nodes of a NOR node.
> > +
> > +Required properties:
> > +
> > + - compatible: should be "nvidia,tegra20-nor", "nvidia,tegra30-nor"
>=20
> I see at least one difference at the register level between Tegra20 and
> Tegra30 and so I think this should be something like ...
>=20
>  - compatible : Should contain one of the following:
> 	For Tegra20 must contain "nvidia,tegra20-gmi".
>  	For Tegra30 must contain "nvidia,tegra30-gmi".
>=20
> > + - reg: Should contain NOR controller registers location and length.
> > + - clocks: Must contain one entry, for the module clock.
> > +   See ../clocks/clock-bindings.txt for details.
> > + - resets : Must contain an entry for each entry in reset-names.
> > +   See ../reset/reset.txt for details.
> > + - reset-names : Must include the following entries:
> > +  - nor
> > + - #address-cells: Must be set to 2 to allow memory address translation
> > + - #size-cells:	Must be set to 1 to allow CS address passing
> > + - ranges: Must be set up to reflect the memory layout with four integ=
er
> > + 		values for each chip-select line in use.
> > + - nvidia,config: This property represents the SNOR_CONFIG_0 register.
>=20
> There is also a SNOR_MIO_CONFIG for the MIO address space and so I think
> that this should be nvidia,snor-config to be explicit. It might be nice
> to also add a "nvidia,mio-config" while you are at it as well, however,
> that could always be done later. If you do, then the
> "nvidia,snor-config" becomes optional depending on whether you are using
> the SNOR or MIO address space.
>=20
> Thierry, Stephen, do prefer all the fields on the config registers are
> broken out? There are quite a few but I am not sure what we typically
> recommend here?

As I said elsewhere, I prefer breaking the fields out into separate
properties because that makes it a lot easier to write the DT. Rather
than having to go and manually assemble 32-bit values for this register
and the timing registers, it must be a lot easier to look at datasheets
and copy the values into the corresponding DT properties.

> > +Note that the NOR controller does not have any internal chip-select ad=
dress
> > +decoding and if you want to access multiple devices external chip-sele=
ct
> > +decoding must be provided.
>=20
> Although it is true, you do have the MIO address space and so you could
> support two devices via the SNOR address space and MIO address space
> (assuming that the MIO can be used for the 2nd device).

Now I'm even more confused. If the GMI controller itself can't select a
chip, what is the SNOR_SEL field in the SNOR_CONFIG_0 register for? Does
that not select a specific chip?

> Furthermore, if you do have external logic to support multiple devices
> this would assume that the devices use the same timing and so are
> probably the same type. It also assumes both can fit in the 256MB
> address range. May be worth mentioning.

Similarly if you switch between different devices, wouldn't you have to
reprogram the timing registers if they are different?

The way I remember this kind of interface to work (it's been a long time
since I used one) is that in order to operate on a chip you need to
acquire the bus first. Typically that would be an API exposed by the bus
driver or some framework that the bus driver registers with. That API
arbitrates between multiple devices on the bus and makes sure that the
proper chip select is asserted and timing is programmed when you're
granted access. A driver that has acquired the bus can then perform what
operations they need and release the bus when done.

SPI uses a mechanism like this, for example.

Thierry

--RE3pQJLXZi4fr8Xo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlf8YAAoJEN0jrNd/PrOh+SgP/j6ihnIikH7REO3Z7UT7nMw3
vYmQtn+tk+kw1R8pRm3VuPsUHo7LGcksSLovh+kLAiWi4qV4FTCjZ4PtBury7bfz
nhhmTFF+2D5DyLFnruB925q3itC+P3AeoH4SNhwTP5v0r6O9do09OTrwBNquGWnJ
IYBBl+Dj3qUyhOJntxhxnJBB+d1hFSrol25dF9+MKustdFe5vyIFL8F1w2AEQ11k
sTMiowF0ypiya91DlDeJu23UdIMrtZi+pPeSoG4IY7p/N6TYrO3F/PELNVnxw5U4
E8qGoE0sVMpLOXq9sClm+Llu3UnMxiDS+0upD5vO6nNCipHDOghuoUHIRFeRYJym
0jsqORbAruEJRamaubp+5zLdYh7Of9db5of2rdZs1HYu1tOdnQ4ZYNpRQH8UBUnn
SM6knPy92K59Dxtft2DBkWgyG7Efpoln2JtWsfi4rTF3lcyu9pXEJZXOiFKVj5Q4
i9JG3LTbcG0GHygcn2X6vOjNgmIIc/LQiXZFoRnzMYNWZ8funpmhEmYyFxBf49nA
qCVCNu7bEj/IziivOCW1PmNgHA2NegGmOyrMtYh6bpqs9j0Ys+IeQntie/brwnhm
Q8enswHh9Rwo9Dc0rwZaYnSALFrkP3zniEJ3YSAsjYFhrL2mObywC509mFaZBSWW
ckyKbW3KO6indpBrGXYa
=oCU6
-----END PGP SIGNATURE-----

--RE3pQJLXZi4fr8Xo--
