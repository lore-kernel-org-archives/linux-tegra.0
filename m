From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC 3/6] dt/bindings: Add bindings for Tegra20/30 NOR bus driver
Date: Mon, 25 Jul 2016 13:36:38 +0200
Message-ID: <20160725113638.GE21170@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-4-git-send-email-mirza.krak@gmail.com>
 <20160720124408.GA19113@rob-hp-laptop>
 <CALw8SCXFexogJn3BwrZm63yEL0rtTpYsYYb0O9D_ibhginVLqw@mail.gmail.com>
 <1f280c99-156f-59d3-308f-b4c8ff0f8f7c@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tMbDGjvJuJijemkf"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1f280c99-156f-59d3-308f-b4c8ff0f8f7c@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mirza Krak <mirza.krak@gmail.com>, Rob Herring <robh@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, pdeschrijver@nvidia.com, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, linux@armlinux.org.uk
List-Id: linux-tegra@vger.kernel.org


--tMbDGjvJuJijemkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2016 at 11:26:09AM +0100, Jon Hunter wrote:
>=20
> On 20/07/16 20:28, Mirza Krak wrote:
> > 2016-07-20 14:44 GMT+02:00 Rob Herring <robh@kernel.org>:
> >> On Tue, Jul 19, 2016 at 03:36:34PM +0200, Mirza Krak wrote:
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
> >>> +
> >>> +The actual devices are instantiated from the child nodes of a NOR no=
de.
> >>> +
> >>> +Required properties:
> >>> +
> >>> + - compatible: should be "nvidia,tegra20-nor", "nvidia,tegra30-nor"
> >>> + - reg: Should contain NOR controller registers location and length.
> >>> + - clocks: Must contain one entry, for the module clock.
> >>> +   See ../clocks/clock-bindings.txt for details.
> >>> + - resets : Must contain an entry for each entry in reset-names.
> >>> +   See ../reset/reset.txt for details.
> >>> + - reset-names : Must include the following entries:
> >>> +  - nor
> >>> + - #address-cells: Must be set to 2 to allow memory address translat=
ion
> >>> + - #size-cells:      Must be set to 1 to allow CS address passing
> >>> + - ranges: Must be set up to reflect the memory layout with four int=
eger
> >>> +             values for each chip-select line in use.
> >>> + - nvidia,config: This property represents the SNOR_CONFIG_0 registe=
r.
> >>> +
> >>> +Note that the NOR controller does not have any internal chip-select =
address
> >>> +decoding and if you want to access multiple devices external chip-se=
lect
> >>> +decoding must be provided.
> >>
> >> Then what are the 2 chip selects in ranges?
> >>
> >> Rob
> >=20
> > Those two chip selects are actually a representation of a external
> > decoding logic based on what we use on our board. Even though it the
> > NOR controller only supports one single chip select I wanted to give
> > an example on how one could create more chip-selects with an external
> > logic and what it would look like in the device tree representation.
>=20
> Technically, the GMI/SNOR controller supports 8 chip-selects, however,
> unlike some devices, it appears that software has to select the active
> chip-select. Although this sounds odd, I believe that the idea is that
> in order to support devices greater than 256MB (external address space
> for available NOR/async devices) you can use the chip-selects to page
> through memory greater than this 256MB range. At least that it my
> (limited) understanding!

Actually I had assumed that software would at some point need to select
the active chip to switch between multiple connected chips. I suppose it
could be possible to have multiple chips share the same chip-select and
decode the address lines to determine whether they're being accessed or
not.

What I don't understand, and it's further complicated by the fact that
external chip-selects are being used, is how does the controller get
told what chip to select? It seems to me like it would always access the
same chips because the SNOR_CONFIG_0 register is only ever written on
->probe().

For external chip selects, how do they tie in with all this? Who gets to
implement this logic? Wouldn't we need to abstract this away somehow so
that we can support whatever board designers will come up with?

Thierry

--tMbDGjvJuJijemkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlfnGAAoJEN0jrNd/PrOhPM8P/A8cRNhirfegLEmOe3hFA+IF
p+f3Cwn0h3uI0RTpLO8/yiF+QwA4PWq2Ma/egh+/V528fmBPYLrSUtR3BDbhJ5Lq
7LNjxM9/6qpGFASeiGl06od/62NjcIz/MekI9GMrExZ/RbwSCP9UVwrSYtSUZSOm
QTsZRzNTbTLQXUsMRb14ZbZQCxbay2SQcZKWw3OO89spDCmgLo68zeejtHRBss8Z
PT4JEjdbVQobvli+ySMQYQRdE5RYa4vWZRI9eVYhKgwulmaPJCG50iqEFhNxiRMf
voAHiNmSTbD/kRyKpyqJ8lurUx7oQUjgwzziYMBWWxBybc9sRwDbiZmUvugEBz03
sUj5K+IUnS2t2MR8aonomzcCAHbZ/eX6hrUNk1lxcLyGiKcvSfnLGpLb/HuImPhZ
x9jrClOl0cXwltNPf9/JpeQJ26vdhnsWNILo1ZtePbmvPaAmgYZYv5Lf9HC73n/D
eX35whfEudNAknQUD3BijkfqeIxS1rDJt8kJwjXvPtKtc+LKWfD0ADnnX3p3mbBX
jDLZNq+myMdXmi1VzOzHgY9P4CpTwtpLB3wqcAnazKU3WqtRikigNEHUdbhsj5hn
nLGbDaJP56XMxm2ylXc0ReNLMEod/5uR7KgzmTMOBPRWF5hAoE4KOd1pJOAs/8zQ
EcJg2NROGPHnBfqSDAJ9
=pk8t
-----END PGP SIGNATURE-----

--tMbDGjvJuJijemkf--
