From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 4/8] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
Date: Mon, 23 Mar 2020 11:35:00 +0100
Message-ID: <20200323103500.GA3883508@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200310152003.2945170-5-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 04:19:59PM +0100, Thierry Reding wrote:
> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Add the binding document for the external memory controller (EMC) which
> communicates with external LPDDR4 devices. It includes the bindings of
> the EMC node and a sub-node of EMC table which under the reserved memory
> node. The EMC table contains the data of the rates that EMC supported.
>=20
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v5:
> - convert to dt-schema
>=20
>  .../nvidia,tegra210-emc.yaml                  | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/=
nvidia,tegra210-emc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,=
tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nv=
idia,tegra210-emc.yaml
> new file mode 100644
> index 000000000000..caf21c08f9cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra21=
0-emc.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-em=
c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra210 SoC External Memory Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +  - Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> +
> +description: |
> +  The EMC interfaces with the off-chip SDRAM to service the request stre=
am
> +  sent from the memory controller.
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra210-emc
> +
> +  reg:
> +    maxItems: 3
> +
> +  clocks:
> +    items:
> +      - description: external memory clock
> +
> +  clock-names:
> +    items:
> +      - const: emc
> +
> +  interrupts:
> +    items:
> +      - description: EMC general interrupt
> +
> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to a reserved memory region describing the table of EMC
> +      frequencies trained by the firmware

Hi Rob,

the dt_binding_check error aside, do you have any feedback on this
particular property? This is a replacement for what we used to do on
earlier chips where each frequency had its own device tree node, and
each such node had a bunch of properties, which made it not very
readable and cumbersome to parse.

The reason I ask about this specifically is because there are two
levels of bootloaders involved here to pass the information to the
kernel and I'd like to get those patches merged into the bootloaders
while I'm finishing up the Linux kernel support.

Dmitry asked whether the format of this table would need to be
documented in the bindings. I'm on the fence about this. On one hand
we don't have this documented anywhere, but on the other hand, the table
has things like revision fields and so on, so it could technically
change, even though it's very unlikely that it will.

If you do want it formatted, do you have any suggestions on what that
should look like? Should I simply dump the C struct definition into the
bindings document?

Thierry

> +
> +  nvidia,memory-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle of the memory controller node
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - nvidia,memory-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra210-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #
> +    reserved-memory {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +        ranges;
> +
> +        emc_table: emc-table@83400000 {
> +            compatible =3D "nvidia,tegra210-emc-table";
> +            reg =3D <0x0 0x83400000 0x0 0x10000>;
> +            status =3D "okay";
> +        };
> +    };
> +
> +    external-memory-controller@7001b000 {
> +        compatible =3D "nvidia,tegra210-emc";
> +        reg =3D <0x0 0x7001b000 0x0 0x1000>,
> +              <0x0 0x7001e000 0x0 0x1000>,
> +              <0x0 0x7001f000 0x0 0x1000>;
> +        clocks =3D <&tegra_car TEGRA210_CLK_EMC>;
> +        clock-names =3D "emc";
> +        interrupts =3D <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +        memory-region =3D <&emc_table>;
> +        nvidia,memory-controller =3D <&mc>;
> +    };
> --=20
> 2.24.1
>=20

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54kNEACgkQ3SOs138+
s6HGbw/8D3FMkRoHso29aJcXd+/hiG0qdIcibTe1TKRxxTnhKsgvv2OmUza/erFr
LdSaPpSnQh0oJmhy0AJErTuyIBXlunn4cT1uaLTs/0fWQ/gWvKS53lvPpJMctjU9
baut4xlJRxEtZCjofZXb1+elMvSvbt/25D/rS7a/fiCQ2ycKkWtDe5s96X1/Unsp
o7IHFnpb6b/QoNxrj/Oe/As/VLlEYm/7qpGcM9FYWGF/pTM/deaUT55leK+5+Ivz
CaS02xPMvcWW/bW1Ra72d0Wkox/1Q/phXiHS7D2LMfT5UFHE0x7ge3hFo/abkuAo
0OgKDB+5xeRKPxtDSfcI8P6B4KczVxHOMqxDOP/KiENt5ALJ3+ziykm013eqd65H
CZHKSbXvsRK44bknU3pOW1xcc1aZaqwl3tkW0Lcn5DIZkwQoV4/HVAt2CNgjPuNt
kTLiA4r4ihpZCpDNWubV3os5gs8AaaZnS/8Ww14FsQW5zD9NH3toEITLaWCn0UMO
UeIfgxCGQ2RgKaKRszXsMDC6R7i4X0kO+675PiIixsL5LlwEhOcbPp/+dkaU5q+Z
W2c5c3xwFez6FbcuLoYOez9Mcj5p5pFbrFPQknFmyk4Nqb9fBQtU5wwsxD53mGO2
r8Bpz30EBRWsYibJsB2mpnfE+R2GWpV9TIXbmLPAHfR/mwQqmD8=
=jRIY
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
