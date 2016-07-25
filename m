From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC 3/6] dt/bindings: Add bindings for Tegra20/30 NOR bus driver
Date: Mon, 25 Jul 2016 15:49:26 +0200
Message-ID: <20160725134926.GM21170@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-4-git-send-email-mirza.krak@gmail.com>
 <434561ec-510e-a3bf-c7b6-c961db299bd6@nvidia.com>
 <20160725115923.GF21170@ulmo.ba.sec>
 <2b8c0fb7-b3c7-35bb-a237-2397fefbb725@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DheUW4aQn8WJk6WR"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2b8c0fb7-b3c7-35bb-a237-2397fefbb725@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mirza Krak <mirza.krak@gmail.com>, swarren@wwwdotorg.org, gnurou@gmail.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@armlinux.org.uk
List-Id: linux-tegra@vger.kernel.org


--DheUW4aQn8WJk6WR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2016 at 02:36:35PM +0100, Jon Hunter wrote:
>=20
> On 25/07/16 12:59, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Thu, Jul 21, 2016 at 10:56:44AM +0100, Jon Hunter wrote:
> >>
> >> On 19/07/16 14:36, Mirza Krak wrote:
> >>> From: Mirza Krak <mirza.krak@gmail.com>
> >>>
> >>> Document the devicetree bindings for NOR bus driver found on Tegra20 =
and
> >>> Tegra30 SOCs
> >>>
> >>> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> >>> ---
> >>>  .../devicetree/bindings/bus/nvidia,tegra20-nor.txt | 73 ++++++++++++=
++++++++++
> >>>  1 file changed, 73 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegr=
a20-nor.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor=
=2Etxt b/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt
> >>> new file mode 100644
> >>> index 0000000..9ee4a66
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt
> >>> @@ -0,0 +1,73 @@
> >>> +Device tree bindings for NVIDIA Tegra20/30 NOR Bus
> >>> +
> >>> +The NOR controller supports a number of memory types, including sync=
hronous NOR,
> >>> +asynchronous NOR, and other flash memories with similar interfaces, =
such as
> >>> +MuxOneNAND. One could also connect high speed devices like FPGAs, DS=
Ps,
> >>> +CAN chips, Wi-Fi chips etc.
> >>
> >> Nit-pick ... the Tegra documentation refers to this controller as the
> >> GMI (general memory interface) or SNOR (sync-NOR) controller because it
> >> is not just limited to NOR as you mentioned. I see references to GMI in
> >> the Tegra pinctrl driver and so may be we should use this name.
> >>
> >>> +
> >>> +The actual devices are instantiated from the child nodes of a NOR no=
de.
> >>> +
> >>> +Required properties:
> >>> +
> >>> + - compatible: should be "nvidia,tegra20-nor", "nvidia,tegra30-nor"
> >>
> >> I see at least one difference at the register level between Tegra20 and
> >> Tegra30 and so I think this should be something like ...
> >>
> >>  - compatible : Should contain one of the following:
> >> 	For Tegra20 must contain "nvidia,tegra20-gmi".
> >>  	For Tegra30 must contain "nvidia,tegra30-gmi".
> >>
> >>> + - reg: Should contain NOR controller registers location and length.
> >>> + - clocks: Must contain one entry, for the module clock.
> >>> +   See ../clocks/clock-bindings.txt for details.
> >>> + - resets : Must contain an entry for each entry in reset-names.
> >>> +   See ../reset/reset.txt for details.
> >>> + - reset-names : Must include the following entries:
> >>> +  - nor
> >>> + - #address-cells: Must be set to 2 to allow memory address translat=
ion
> >>> + - #size-cells:	Must be set to 1 to allow CS address passing
> >>> + - ranges: Must be set up to reflect the memory layout with four int=
eger
> >>> + 		values for each chip-select line in use.
> >>> + - nvidia,config: This property represents the SNOR_CONFIG_0 registe=
r.
> >>
> >> There is also a SNOR_MIO_CONFIG for the MIO address space and so I thi=
nk
> >> that this should be nvidia,snor-config to be explicit. It might be nice
> >> to also add a "nvidia,mio-config" while you are at it as well, however,
> >> that could always be done later. If you do, then the
> >> "nvidia,snor-config" becomes optional depending on whether you are usi=
ng
> >> the SNOR or MIO address space.
> >>
> >> Thierry, Stephen, do prefer all the fields on the config registers are
> >> broken out? There are quite a few but I am not sure what we typically
> >> recommend here?
> >=20
> > As I said elsewhere, I prefer breaking the fields out into separate
> > properties because that makes it a lot easier to write the DT. Rather
> > than having to go and manually assemble 32-bit values for this register
> > and the timing registers, it must be a lot easier to look at datasheets
> > and copy the values into the corresponding DT properties.
>=20
> That's what I thought :-)
>=20
> >>> +Note that the NOR controller does not have any internal chip-select =
address
> >>> +decoding and if you want to access multiple devices external chip-se=
lect
> >>> +decoding must be provided.
> >>
> >> Although it is true, you do have the MIO address space and so you could
> >> support two devices via the SNOR address space and MIO address space
> >> (assuming that the MIO can be used for the 2nd device).
> >=20
> > Now I'm even more confused. If the GMI controller itself can't select a
> > chip, what is the SNOR_SEL field in the SNOR_CONFIG_0 register for? Does
> > that not select a specific chip?
>=20
> So the GMI has 8 chip-selects and these can be used by either the SNOR
> interface for MIO interface. As you mentioned the chip-select used for
> the SNOR interface is configured by the field SNOR_SEL in the
> SNOR_CONFIG and similarly the chip-select for the MIO interface is
> configured by the MIO_SEL field in the MIO_CONFIG register.
>=20
> Looking at the Tegra20 TRM, the SNOR interface is mapped to the address
> range 0xd0000000-0xdfffffff and the MIO interface is mapped to the
> address range 0xe0000000-0xefffffff. If chip-select 0 is used for SNOR
> and chip-select 1 is used for MIO, you can support two devices at the
> same time and they will be accessible via different address ranges.
> Whether you can use the MIO interface for the 2nd device is another
> question.
>=20
> If you want to support two 256MB NOR devices on the SNOR interface, then
> you would need to reconfigure the SNOR_CONFIG each time you swap between
> the two devices.
>=20
> >> Furthermore, if you do have external logic to support multiple devices
> >> this would assume that the devices use the same timing and so are
> >> probably the same type. It also assumes both can fit in the 256MB
> >> address range. May be worth mentioning.
> >=20
> > Similarly if you switch between different devices, wouldn't you have to
> > reprogram the timing registers if they are different?
>=20
> Yes.

Okay, good. I'm relieved that I wasn't completely mistaken about how
this kind of hardware works. =3D)

> > The way I remember this kind of interface to work (it's been a long time
> > since I used one) is that in order to operate on a chip you need to
> > acquire the bus first. Typically that would be an API exposed by the bus
> > driver or some framework that the bus driver registers with. That API
> > arbitrates between multiple devices on the bus and makes sure that the
> > proper chip select is asserted and timing is programmed when you're
> > granted access. A driver that has acquired the bus can then perform what
> > operations they need and release the bus when done.
> >=20
> > SPI uses a mechanism like this, for example.
>=20
> That would make sense. However, I am not sure how that would work with
> the client drivers, such as the CAN driver Mirza is using, that wishes
> to read/write directly to the SNOR address space. I am guessing that SPI
> works like I2C and buffers up the requests and performs them in sequence.

Yes, you would of course have to guard accesses by the drivers with
calls to an API that acquire and release the bus. Not that it's very
nice, but in the absence of automatic address to CS translation that
really is the only way to solve it (explicit chip-select).

It doesn't seem like we currently have infrastructure for it, but we
would need something like that to solve this in the general case.

Thierry

--DheUW4aQn8WJk6WR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlhjmAAoJEN0jrNd/PrOh6uwQAKnDvVJjSg50qtf1bANwJxxI
TnGum+coVOSIYSQliG/AjHl87mWyShJD8bYfz+Z2DhD/bg43V+UxoE5FTx92f5Ju
z45YN8FIpp5+KsrjgxarBHfz2ZVStmFYxvEvzkTi5w+V2Zsx2y15gBEge18porGa
dH+vZqKBjffTtSw3jMOScVsIY7o2D60hAD9Xv3elPPPsxcequSZ3kSTQMMsDetQb
RXAuUhJ7MkZpUh/0HgXmCSnQplVSn9VBBfVHWK483SH3C6CiCXarMwe0djKG7TAI
13rCTjBSEi1gClKnkP/aKXAXuUgrUfILgBErJSI9bce71dMq6MDP3TchsVGRo+X4
qtwz37TFWrTaBT6wQ/YJZEcrCutK/GpAf0F8seLSVI6ABSksoHO9DT1lX3k4b0TS
OHF4rTCoZvb1E5kcXH9px19XmhIwe22pz+9R/dLx8CiNFHGZto3PSmHengr73Xg3
F4Yjx6yfTDpC7MH/Za4Gagg3Ry+jfch39mVMN8bq6vTUdAt8wrGgX3tnXtYE8mhB
oI6HYXLSuy/nkGTWOEFTRo4nDr2HQAa4Y7653xOduhYKNDXz8BwjNvw698KKkE6n
NDbD3ipyRraArByeDMbHUz9BfC+9rg2foyDpv5yob9qRHBlI24TTBeS3S56bXO1C
miOsmLxRLukW5G83huIa
=tGLd
-----END PGP SIGNATURE-----

--DheUW4aQn8WJk6WR--
