From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 1/2] pinctrl: tegra: Add DT binding for io pads control
Date: Fri, 25 Nov 2016 10:13:54 +0100
Message-ID: <20161125091354.GA11512@ulmo.ba.sec>
References: <1479976734-30498-1-git-send-email-ldewangan@nvidia.com>
 <1479976734-30498-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479976734-30498-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2016 at 02:08:53PM +0530, Laxman Dewangan wrote:
> NVIDIA Tegra124 and later SoCs support the multi-voltage level and
> low power state of some of its IO pads. The IO pads can work in
> the voltage of the 1.8V and 3.3V of IO voltage from IO power rail
> sources. When IO interfaces are not used then IO pads can be
> configure in low power state to reduce the power consumption from
> that IO pads.
>=20
> On Tegra124, the voltage level of IO power rail source is auto
> detected by hardware(SoC) and hence it is only require to configure
> in low power mode if IO pads are not used.
>=20
> On T210 onwards, the auto-detection of voltage level from IO power

You say Tegra124 above but T210 here. Please use consistent spelling to
make it more obvious that we're talking about chip generations here.
Tegra<gen> is preferred over T<gen>.

> rail is removed from SoC and hence SW need to configure the PMC
> register explicitly to set proper voltage in IO pads based on
> IO rail power source voltage.
>=20
> Add DT binding document for detailing the DT properties for
> configuring IO pads voltage levels and its power state.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> ---
> Changes from V1:
>  New in series based on pinctrl driver requirement.
>=20
> Changes from V2:
>  Updated the statement to say 1.8V and 3.3V as nominal voltage.
>  Corrected DT example by adding -supply and taken care of V1 review
>  from Rob.
>=20
>  .../bindings/pinctrl/nvidia,tegra-io-pad.txt       | 126 +++++++++++++++=
++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegr=
a-io-pad.txt
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pa=
d.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
> new file mode 100644
> index 0000000..a88c484
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
> @@ -0,0 +1,126 @@
> +NVIDIA Tegra PMC IO pad controller
> +
> +NVIDIA Tegra124 and later SoCs support the multi-voltage level and low p=
ower
> +state of some of its IO pads. When IO interface are not used then IO pad=
s can
> +be configure in low power state to reduce the power from that IO pads. T=
he IO
> +pads can work in the nominal IO voltage of 1.8V and 3.3V from power rail
> +sources.
> +
> +On Tegra124, the voltage of IO power rail source is auto detected by SoC=
 and
> +hence it is only require to configure in low power mode if IO pads are n=
ot
> +used.
> +
> +On T210 onwards, the HW based auto-detection for IO voltage is removed a=
nd
> +hence SW need to configure the PMC register explicitly, to set proper vo=
ltage
> +in IO pads, based on IO rail power source voltage.
> +
> +The voltage configurations and low power state of IO pads should be done=
 in
> +boot if it is not going to change otherwise dynamically based on IO rail
> +voltage on that IO pads and usage of IO pads

Missing fullstop at the end.

> +
> +The DT property of the IO pads must be under the node of pmc i.e.
> +pmc@7000e400 for Tegra124 onwards.

The PMC is at a different address on Tegra186, so I think we should just
drop this to avoid having to update it whenever a new chip relocates it
to a different address.

Come to think of it, if these I/O pads are represented as subnodes in
the PMC device tree node, perhaps this should be merged into the PMC
documentation?

> +Please refer to <pinctrl-bindings.txt> in this directory for details of =
the
> +common pinctrl bindings used by client devices, including the meaning of=
 the
> +phrase "pin configuration node".
> +
> +Tegra's pin configuration nodes act as a container for an arbitrary numb=
er of
> +subnodes. Each of these subnodes represents some desired configuration f=
or an
> +IO pads, or a list of IO pads. This configuration can include the voltag=
e and
> +power enable/disable control

Missing fullstop.

> +
> +The name of each subnode is not important; all subnodes should be enumer=
ated
> +and processed purely based on their content. Each subnode only affects t=
hose
> +parameters that are explicitly listed. Unspecified is represented as an =
absent
> +property,

Should be fullstop instead of comma at the end of the sentence. Also I'm
not sure the last sentence is even necessary. The previous one already
says that only explicitly listed parameters take effect.

> +
> +See the TRM to determine which properties and values apply to each IO pa=
ds.

Perhaps give a reference to where in the TRM this can be found?

> +
> +Required subnode-properties:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +- pins : An array of strings. Each string contains the name of an IO pad=
s. Valid
> +	 values for these names are listed below.
> +
> +Optional subnode-properties:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +Following properties are supported from generic pin configuration explai=
ned
> +in <dt-bindings/pinctrl/pinctrl-binding.txt>.

I don't think such a directory exists. Maybe make these relative
references, though that might become slightly more difficult if this
whole document is merged with the PMC documentation.

> +low-power-enable:		enable low power mode.
> +low-power-disable:		disable low power mode.

Why the extra padding with tabs? I find that difficult to read. Also, no
need for a fullstop since it's not a proper sentence.

> +Valid values for pin for T124 are:

Tegra124

> +	audio, bb, cam, comp, csia, csib, csie, dsi, dsib, dsic, dsid, hdmi,
> +	hsic, hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-clk2,
> +	pex-ctrl, sdmmc1, sdmmc3, sdmmc4, sys-ddc, uart, usb0, usb1, usb2,
> +	usb-bias
> +
> +Valid values for pin for T210 are:

Tegra210

> +	audio, audio-hv, cam, csia, csib, csic, csid, csie, csif,
> +	dbg, debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2,
> +	gpio, hdmi, hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2,
> +	pex-ctrl, sdmmc1, sdmmc3, spi, spi-hv, uart, usb-bias, usb0,
> +	usb1, usb2, usb3.
> +
> +To find out the IO rail voltage for setting the voltage of IO pad by SW,
> +the regulator supply handle must provided from the DT and it is explained
> +in the regulator DT binding document
> +	<devicetree/bindings/regulator/regulator.txt>.

Again, maybe make this relative because as it is it isn't obvious as to
what the base of the above path is.

> +For example, for GPIO rail the supply name is vddio-gpio and regulator
> +handle is supplied from DT as
> +	vddio-gpio-supply =3D <&regulator_xyz>;
> +
> +For T210, following IO pads support the 1.8V/3.3V and the corresponding

Tegra210

> +IO voltage pin names are as follows:
> +	audio -> vddio-audio
> +	audio-hv -> vddio-audio-hv
> +	cam ->vddio-cam
> +	dbg -> vddio-dbg
> +	dmic -> vddio-dmic
> +	gpio -> vddio-gpio
> +	pex-ctrl -> vddio-pex-ctrl
> +	sdmmc1 -> vddio-sdmmc1
> +	sdmmc3 -> vddio-sdmmc3
> +	spi -> vddio-spi
> +	spi-hv -> vddio-spi-hv
> +	uart -> vddio-uart

It's slightly confusing to only have this list for Tegra210. I assume
that is because on Tegra124 there is no way to control the voltage of
the pins, but I think that could be made clearer. Also, it might be
worth explicitly mentioning that this is a subset of the list of pins
given above and that the other pins (those not in this list) don't
support 1.8/3.3 V control, but only the low power state.

> +
> +Example:
> +	i2c@7000d000 {
> +		pmic@3c {
> +			regulators {
> +				vddio_sdmmc1: ldo2 {
> +					/* Regulator entries for LDO2 */
> +				};
> +
> +				vdd_cam: ldo3 {
> +					/* Regulator entries for LDO3 */

These comments are somewhat stating the obvious. Perhaps simply use a
=2E.. as a placeholder?

> +				};
> +			};
> +		};
> +	};
> +
> +	pmc@7000e400 {
> +		vddio-cam-supply =3D <&vdd_cam>;
> +		vddio-sdmmc1-supply =3D <&vddio_sdmmc1>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&tegra_io_pad_volt_default>;
> +		tegra_io_pad_volt_default: common {
> +			audio-hv {
> +				pins =3D "audio-hv";
> +				low-power-disable;
> +			};

I wonder if this is at all useful. Shouldn't we rather put all pads into
a low-power state by default and only take them out of the low-power
state when the driver decides to do so?

Thierry

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYOADPAAoJEN0jrNd/PrOho1kP/1kY/kunCY5MY76RZ3AEA0KM
jM9izgb90i9uuILWRLZxj36qTb5zhWF05pb/hpPaPFoAnHs4uCwY70rmqEZggTbh
s+BgyU+wZwFK8fCaQtL3w9Gng6YM01CgzYG+PKUV5SiY6sREvgaKZzm7H/KinIJI
RDCkH2vaAbyAUCMNi1dDnXnD805in9XvBx5H8/tpe+WAutdfP9KqAKaUXDbM4bwv
bLUzeYiRztm2zo9ou7YZDF791+hGdi13XeSj1JWm6+fbvU/DQkhCiuwVIB2ZlT9N
Zk2dn4tbaCDa95wCdvpy6O2PUYpDDQHWaMCDOE+IhVxd3LZiGNwdY8RrUMlooA4u
3YJzA6IqzUGnjVntE9G3K+KkMaoYHUHoOeQNB58S1lvnyn72CA1JY1j16t6PYq3P
7z7r3Snm4F0pD173XRh/FKBwzixvoRRTStSriVLE0Lr2DUaEUsiUpWUz7Gck0shE
+1S3GmPglnve3vgo1HPjEYOGwrwU/BOLfSNb08XES2hSIa8F37QvHqHcj8fjPjOk
RH9K7kpR8Wmegs2EA3x8zdspY3objecHvzmvto4Kv+Kz2WIZTOAlZksdesjFkRgX
7553cWNe5MBaj44xAOCsL+cBNTZo30/qPHGsflPrm2i/KpiF0kM403m1pk5jvVg1
X/Ng/6srhPTTGSG8BBSl
=/tsh
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
