From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 3/6] dt/bindings: Add bindings for Tegra20/30 NOR bus driver
Date: Mon, 25 Jul 2016 13:30:34 +0200
Message-ID: <20160725113034.GD21170@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-4-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468935397-11926-4-git-send-email-mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 03:36:34PM +0200, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Document the devicetree bindings for NOR bus driver found on Tegra20 and
> Tegra30 SOCs
>=20
> Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/bus/nvidia,tegra20-nor.txt | 73 ++++++++++++++++=
++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra20-=
nor.txt
>=20
> diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt=
 b/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt
> new file mode 100644
> index 0000000..9ee4a66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt
> @@ -0,0 +1,73 @@
> +Device tree bindings for NVIDIA Tegra20/30 NOR Bus
> +
> +The NOR controller supports a number of memory types, including synchron=
ous NOR,
> +asynchronous NOR, and other flash memories with similar interfaces, such=
 as
> +MuxOneNAND. One could also connect high speed devices like FPGAs, DSPs,
> +CAN chips, Wi-Fi chips etc.
> +
> +The actual devices are instantiated from the child nodes of a NOR node.
> +
> +Required properties:
> +
> + - compatible: should be "nvidia,tegra20-nor", "nvidia,tegra30-nor"
> + - reg: Should contain NOR controller registers location and length.
> + - clocks: Must contain one entry, for the module clock.
> +   See ../clocks/clock-bindings.txt for details.
> + - resets : Must contain an entry for each entry in reset-names.
> +   See ../reset/reset.txt for details.
> + - reset-names : Must include the following entries:
> +  - nor
> + - #address-cells: Must be set to 2 to allow memory address translation
> + - #size-cells:	Must be set to 1 to allow CS address passing
> + - ranges: Must be set up to reflect the memory layout with four integer
> + 		values for each chip-select line in use.
> + - nvidia,config: This property represents the SNOR_CONFIG_0 register.

I'd prefer if this was split out into separate properties. It's somewhat
friendlier in my opinion to let people know what each of the settings is
along with any units and such, rather than point them at the TRM, which
they may or may not have access to.

Or which not be available anymore.

> +
> +Note that the NOR controller does not have any internal chip-select addr=
ess
> +decoding and if you want to access multiple devices external chip-select
> +decoding must be provided.
> +
> +Optional properties:
> +
> + - nvidia,cs-timing: The timing array represents the SNOR_TIMING0_0 and
> +   SNOR_TIMING1_0 registers for the NOR controller. If unset reset-value=
s will
> +   be used. See reference documentation for detailed description of the =
timing
> +   registers.

Are the reset values sensible? Are they reasonable defaults for a class
of use-cases? I'm thinking that if they aren't we might as well make it
a required property.

Also, I'd prefer if this was split out into individual fields for the
same reasons as the SNOR_CONFIG_0 register property.

> +
> +Example with two SJA1000 CAN controllers connected to the NOR bus:
> +
> +	nor@70009000 {
> +		status =3D "okay";
> +		compatible =3D "nvidia,tegra20-nor", "nvidia,tegra30-nor";
> +		reg =3D <0x70009000 0x1000>;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <1>;
> +		clocks =3D <&tegra_car TEGRA30_CLK_NOR>;
> +		resets =3D < &tegra_car 42>;

No space between < and &, please.

> +		reset-names =3D "nor";
> +		ranges =3D <
> +			0 0 0x48000000 0x00000100
> +			1 0 0x48040000 0x00000100
> +		>;
> +
> +		can@0,0 {
> +			compatible =3D "nxp,sja1000";
> +			reg =3D <0 0 0x100>;
> +			interrupt-parent =3D <&gpio>;
> +			interrupts =3D <TEGRA_GPIO(B, 5) IRQ_TYPE_EDGE_RISING>;
> +			nxp,external-clock-frequency =3D <24000000>;
> +			nxp,tx-output-config =3D <0x16>;
> +			nxp,clock-out-frequency =3D <24000000>;
> +			reg-io-width =3D <2>;
> +		};
> +
> +

There's an extra blank line here.

> +		can@1,0 {
> +			compatible =3D "nxp,sja1000";
> +			reg =3D <1 0 0x100>;
> +			interrupt-parent =3D <&gpio>;
> +			interrupts =3D <TEGRA_GPIO(A, 6) IRQ_TYPE_EDGE_RISING>;
> +			nxp,external-clock-frequency =3D <24000000>;
> +			nxp,tx-output-config =3D <0x16>;
> +			reg-io-width =3D <2>;
> +	};

I'm somewhat confused about how this hardware works. My understanding
was that each chip gets mapped to the whole range of the NOR address
range (0x48000000 - 0x4fffffff on Tegra30).

The above suggests that one of the CAN controllers gets mapped to an
address 0x48000000 and the other gets mapped to 0x48040000. But why do
we even need a chip-select at all in that case? If both chips don't use
any overlapping memory region, what good does the chip-select do?

Also, it seems to me that you'd have to program the SNOR_CONFIG_0
register in order to select a specific chip, but I don't see anything in
the driver access that register after the initial write of the register.

I would've expected this to require some sort of infrastructure to allow
devices connected to the GMI controller to acquire the bus via some API
to select their chip.

Thierry

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlfhXAAoJEN0jrNd/PrOh/KgQAJ1Ygbt/h625AN1nyqG5yidy
ZZK22zpGFnXUigRFtqXCnzMD9KNzQSeuobMPlgiceLhDnItf9QhWLs5znD57r5F0
jJAgUJixK5opf/Yzl+x3mLBsp1L4gk8jlUszUY8SjOoTsEp/lQUoK1uBMiXBrl1D
4A0pMfFSYYtjrBFg0BHfEyYr76H1pBcwfdLjcVl7vFfunCOY26ZWTWzjOcGfy43j
4KwEBBFk6YQnsflU5hzn08KxIJueuyr0h7jCEyrz4+cGqlXPrAlDygQFV686v5aS
LDeQHSJlieEU9JCSp8Ivquu9ym1niNUX//A0UquWT5KlOJRBGnuZor3u7GddBOLW
wuBKlZ09rvo0qNAmwX3wZKcTUKyrBl7fx+L4Of0kuCzZxH6aT2rF/ATM5gOXeUQG
9+2D4K//T22bhVkR3lu9f2N847Gh8Z+fQVwL5rzvgnkrVEWT62J2THOu7IImL2kZ
fxK+6sMCo72D3+wEwowL9F/BFCnnZdsrM+yD58o3DtUWYpHX2CKFm7tlNEfA/LQa
Bz/feV5v6qoaxZn2dvHG2Il0z65auts33m0C99iuM+dXdxbeKzYilThsw5Se+Yjx
KX21M8M1qf5w2ZggEiQ/ywZZmexSrPLAhlKkmLWhlg5fU0nUxKGCdwtrIs6dy1UX
1wlZNPIG+H1KauqtlGXg
=Wa24
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
