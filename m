From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC 3/6] dt/bindings: Add bindings for Tegra20/30 NOR bus driver
Date: Mon, 25 Jul 2016 15:27:11 +0200
Message-ID: <20160725132711.GI21170@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-4-git-send-email-mirza.krak@gmail.com>
 <20160720124408.GA19113@rob-hp-laptop>
 <CALw8SCXFexogJn3BwrZm63yEL0rtTpYsYYb0O9D_ibhginVLqw@mail.gmail.com>
 <1f280c99-156f-59d3-308f-b4c8ff0f8f7c@nvidia.com>
 <20160725113638.GE21170@ulmo.ba.sec>
 <CALw8SCUxbpWGz0Mrp-Wf=jxa84Frk6mubeL9+KAYFAbq+-9CZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dCSxeJc5W8HZXZrD"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALw8SCUxbpWGz0Mrp-Wf=jxa84Frk6mubeL9+KAYFAbq+-9CZQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mirza Krak <mirza.krak@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, pdeschrijver@nvidia.com, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, linux@armlinux.org.uk
List-Id: linux-tegra@vger.kernel.org


--dCSxeJc5W8HZXZrD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2016 at 03:20:44PM +0200, Mirza Krak wrote:
> 2016-07-25 13:36 GMT+02:00 Thierry Reding <thierry.reding@gmail.com>:
> > On Thu, Jul 21, 2016 at 11:26:09AM +0100, Jon Hunter wrote:
> >>
> >> On 20/07/16 20:28, Mirza Krak wrote:
> >> > 2016-07-20 14:44 GMT+02:00 Rob Herring <robh@kernel.org>:
> >> >> On Tue, Jul 19, 2016 at 03:36:34PM +0200, Mirza Krak wrote:
> >> >>> From: Mirza Krak <mirza.krak@gmail.com>
> >> >>>
> >> >>> Document the devicetree bindings for NOR bus driver found on Tegra=
20 and
> >> >>> Tegra30 SOCs
> >> >>>
> >> >>> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> >> >>> ---
> >> >>>  .../devicetree/bindings/bus/nvidia,tegra20-nor.txt | 73 +++++++++=
+++++++++++++
> >> >>>  1 file changed, 73 insertions(+)
> >> >>>  create mode 100644 Documentation/devicetree/bindings/bus/nvidia,t=
egra20-nor.txt
> >> >>>
> >> >>> diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra20-=
nor.txt b/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt
> >> >>> new file mode 100644
> >> >>> index 0000000..9ee4a66
> >> >>> --- /dev/null
> >> >>> +++ b/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt
> >> >>> @@ -0,0 +1,73 @@
> >> >>> +Device tree bindings for NVIDIA Tegra20/30 NOR Bus
> >> >>> +
> >> >>> +The NOR controller supports a number of memory types, including s=
ynchronous NOR,
> >> >>> +asynchronous NOR, and other flash memories with similar interface=
s, such as
> >> >>> +MuxOneNAND. One could also connect high speed devices like FPGAs,=
 DSPs,
> >> >>> +CAN chips, Wi-Fi chips etc.
> >> >>> +
> >> >>> +The actual devices are instantiated from the child nodes of a NOR=
 node.
> >> >>> +
> >> >>> +Required properties:
> >> >>> +
> >> >>> + - compatible: should be "nvidia,tegra20-nor", "nvidia,tegra30-no=
r"
> >> >>> + - reg: Should contain NOR controller registers location and leng=
th.
> >> >>> + - clocks: Must contain one entry, for the module clock.
> >> >>> +   See ../clocks/clock-bindings.txt for details.
> >> >>> + - resets : Must contain an entry for each entry in reset-names.
> >> >>> +   See ../reset/reset.txt for details.
> >> >>> + - reset-names : Must include the following entries:
> >> >>> +  - nor
> >> >>> + - #address-cells: Must be set to 2 to allow memory address trans=
lation
> >> >>> + - #size-cells:      Must be set to 1 to allow CS address passing
> >> >>> + - ranges: Must be set up to reflect the memory layout with four =
integer
> >> >>> +             values for each chip-select line in use.
> >> >>> + - nvidia,config: This property represents the SNOR_CONFIG_0 regi=
ster.
> >> >>> +
> >> >>> +Note that the NOR controller does not have any internal chip-sele=
ct address
> >> >>> +decoding and if you want to access multiple devices external chip=
-select
> >> >>> +decoding must be provided.
> >> >>
> >> >> Then what are the 2 chip selects in ranges?
> >> >>
> >> >> Rob
> >> >
> >> > Those two chip selects are actually a representation of a external
> >> > decoding logic based on what we use on our board. Even though it the
> >> > NOR controller only supports one single chip select I wanted to give
> >> > an example on how one could create more chip-selects with an external
> >> > logic and what it would look like in the device tree representation.
> >>
> >> Technically, the GMI/SNOR controller supports 8 chip-selects, however,
> >> unlike some devices, it appears that software has to select the active
> >> chip-select. Although this sounds odd, I believe that the idea is that
> >> in order to support devices greater than 256MB (external address space
> >> for available NOR/async devices) you can use the chip-selects to page
> >> through memory greater than this 256MB range. At least that it my
> >> (limited) understanding!
> >
> > Actually I had assumed that software would at some point need to select
> > the active chip to switch between multiple connected chips. I suppose it
> > could be possible to have multiple chips share the same chip-select and
> > decode the address lines to determine whether they're being accessed or
> > not.
> >
> > What I don't understand, and it's further complicated by the fact that
> > external chip-selects are being used, is how does the controller get
> > told what chip to select? It seems to me like it would always access the
> > same chips because the SNOR_CONFIG_0 register is only ever written on
> > ->probe().
> >
> > For external chip selects, how do they tie in with all this? Who gets to
> > implement this logic? Wouldn't we need to abstract this away somehow so
> > that we can support whatever board designers will come up with?
> >
> > Thierry
>=20
> You answered it your self :).
>=20
> >I suppose it
> > could be possible to have multiple chips share the same chip-select and
> > decode the address lines to determine whether they're being accessed or
> > not.
>=20
> That is what we do and is what I refer to as external chip-selects.

Okay, so there aren't actually chips or pins that serve as external chip
selects, but rather the GMI address lines are used to select the chip? I
guess that's more like traditional address decoding rather than chip
select. Anyway, understanding how your board design works helps devising
a device tree binding that is flexible enough to support production
devices.

Thierry

--dCSxeJc5W8HZXZrD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlhOuAAoJEN0jrNd/PrOhF0UQAIv7wwjOw2msnSbq62UimU9b
eVr+jpKuf2S/9Fm0s58QZKEvy5kzMX35ohBXIr9S3pdROFUIMAYVAGy0fvp0+/Lw
GfJ8Rm1V+HshErje4akevSrdAYkEvQbgZ41xWhtzk/70uXIfazKiL85Md8lDOePM
aTqdVU0CSn4CMUDKgoU0/1gADrkfZIepBn3sn1yXHB111Gwr+GqfrrfeqAlhfh/K
2kYElPlPRSGPiODoq6H30BkF3S8i2Qxt6h7aqJvHgcoMVhLAcDRQhvlJkD/XIF/2
CuwwExHxjODNebREscu6CQ2Ivut/TSLyn1tuqe+0hwHKQ95bHe22hvP9qdC+qBUf
t3xY7ZgYqjg6QDNFLQnI4tXrZJfAyTTOyl5ExhvQriIyhtz865sNqjIeMCkFyHqL
UpC2r+MAqb0zYfF/HjEmwYlU7CJBfN8yxNidOt7Iyto8DQvgeEZnjEDd1WRI1lvi
aItywBiYEZ6hvSrFfdbDILSt4DINdaLu8zmsfBVu7mC4tREJEsQEiJsPExcTJxj7
lVBiOn4zSZn6NgonnnOe4ztUv7KiyuDII0ICD4xCNScwihr+h9zDjvfVQDjMExEd
MV0BvG0kl23G7Ojtqnyuz5fQbmY9/g4y8yfu32MX/LtBSzdjCkQs8umomALCR/sc
3SoMzRPSGj5cy+Pcybmk
=fEYP
-----END PGP SIGNATURE-----

--dCSxeJc5W8HZXZrD--
