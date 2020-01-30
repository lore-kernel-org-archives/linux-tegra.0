From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] dt-bindings: display: Convert Tegra host1x to json-schema
Date: Thu, 30 Jan 2020 14:58:21 -0600
Message-ID: <CAL_JsqKopxTzh+MACgrbqK_UdbJ977c2rqjwMgvaWaj4nD4P5Q@mail.gmail.com>
References: <20200130174006.3154922-1-thierry.reding@gmail.com> <20200130174636.GA3154793@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200130174636.GA3154793@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 30, 2020 at 11:46 AM Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Thu, Jan 30, 2020 at 06:40:06PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Convert the Tegra host1x controller bindings from the free-form text
> > format to json-schema.
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../display/tegra/nvidia,tegra20-host1x.txt   | 487 ----------
> >  .../display/tegra/nvidia,tegra20-host1x.yaml  | 884 ++++++++++++++++++
> >  2 files changed, 884 insertions(+), 487 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> [...]
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> > new file mode 100644
> > index 000000000000..26b2325813eb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> > @@ -0,0 +1,884 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-host1x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra host1x controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > +  - Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > +
> > +description: The host1x top-level node defines a number of children, each
> > +  representing one of the host1x client modules defined in this binding.
> > +
> > +properties:
> > +  # required
> > +  compatible:
> > +    oneOf:
> > +      - description: NVIDIA Tegra20
> > +        allOf:
> > +          - enum:
> > +              - nvidia,tegra20-host1x
> > +          - const: simple-bus
> > +
> > +      - description: NVIDIA Tegra30
> > +        allOf:
> > +          - enum:
> > +              - nvidia,tegra30-host1x
> > +          - const: simple-bus
> > +
> > +      - description: NVIDIA Tegra114
> > +        allOf:
> > +          - enum:
> > +              - nvidia,tegra114-host1x
> > +          - const: simple-bus
> > +
> > +      - description: NVIDIA Tegra124
> > +        allOf:
> > +          - enum:
> > +              - nvidia,tegra124-host1x
> > +          - const: simple-bus
> > +
> > +      - description: NVIDIA Tegra132
> > +        allOf:
> > +          - enum:
> > +              - nvidia,tegra132-host1x
> > +          - const: simple-bus
> > +
> > +      - description: NVIDIA Tegra210
> > +        allOf:
> > +          - enum:
> > +              - nvidia,tegra210-host1x
> > +          - const: simple-bus
> > +
> > +      - description: NVIDIA Tegra186
> > +        allOf:
> > +          - enum:
> > +              - nvidia,tegra186-host1x
> > +          - const: simple-bus
> > +
> > +      - description: NVIDIA Tegra194
> > +        allOf:
> > +          - enum:
> > +              - nvidia,tegra194-host1x
> > +          - const: simple-bus

These are all wrong as they can never be true. compatible cannot be a
single string that's both nvidia,tegra194-host1x and simple-bus.

What you needed here is s/allOf/items/. However, I'd prefer the
description be dropped and combine everything into one big enum (and
then '- const: simple-bus').

>
> Hi Rob, all,
>
> I've been trying to convert this to json-schema, but I'm running into
> weird issues. What I seem to be seeing is that the above schema for the
> compatible string ends up matching various device tree nodes, such as
> the top-level "regulators" node which has just:
>
>         compatible = "simple-bus";
>
> The intention here is to have one (or more) SoC-specific string and a
> "simple-bus" in the compatible string. Here are a few examples:
>
>         tegra124.dtsi: compatible = "nvidia,tegra124-host1x", "simple-bus";
>         tegra132.dtsi: compatible = "nvidia,tegra132-host1x",
>                                     "nvidia,tegra124-host1x",
>                                     "simple-bus";

Side note, this case doesn't seem to be handled.

>         tegra186.dtsi: compatible = "nvidia,tegra186-host1x", "simple-bus";
>
> For some reason none of the variants I've tried (such as items: instead
> of allOf: in the above) seem to properly match.
>
> Any ideas what I'm doing wrong here? There are a couple of additional
> errors flagged when I run this through the checker, but I think they are
> all follow-up errors from the mismatched compatible strings.

You need a custom 'select' entry to omit 'simple-bus'. See some
primecell bindings like pl061 for an example.

>
> Quoting in full for reference.
>
> Thierry
>
> > +
> > +  interrupts:
> > +    items:
> > +      - description: host1x syncpoint interrupt
> > +      - description: host1x general interrupt
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  '#address-cells':
> > +    description: The number of cells used to represent physical base addresses
> > +      in the host1x address space.
> > +    enum: [1, 2]
> > +
> > +  '#size-cells':
> > +    description: The number of cells used to represent the size of an address
> > +      range in the host1x address space.
> > +    enum: [1, 2]
> > +
> > +  ranges:
> > +    description: The mapping of the host1x address space to the CPU address
> > +      space.
> > +
> > +  clocks:
> > +    description: Must contain one entry, for the module clock. See
> > +      ../clocks/clock-bindings.txt for details.
> > +
> > +  resets:
> > +    description: Must contain an entry for each entry in reset-names. See
> > +      ../reset/reset.txt for details.
> > +
> > +  reset-names:
> > +    items:
> > +      - const: host1x
> > +
> > +  # optional
> > +  interconnects:
> > +    description: Description of the interconnect paths for the host1x
> > +      controller; see ../interconnect/interconnect.txt for details.
> > +  interconnect-names:
> > +    description: A list of names identifying each entry listed in the
> > +      "interconnects" property.
> > +
> > +  # host1x clients
> > +  vi:
> > +    description: video input
> > +    type: object

These should all be broken out into there only files.

> > +    properties:
> > +      compatible:
> > +        oneOf:
> > +          - const: nvidia,tegra20-vi
> > +          - const: nvidia,tegra30-vi
> > +          - const: nvidia,tegra114-vi
> > +          - const: nvidia,tegra124-vi
> > +          - allOf:

items

> > +              - const: nvidia,tegra132-vi
> > +              - const: nvidia,tegra124-vi
> > +          - const: nvidia,tegra210-vi
> > +          - const: nvidia,tegra186-vi
> > +          - const: nvidia,tegra194-vi
> > +

> > +      reg: true
> > +      interrupts: true
> > +      clocks: true
> > +
> > +      resets: true

Need to know how many entries for each of these.

> > +      reset-names:
> > +        items:
> > +          - const: vi
> > +
> > +  isp:
> > +    description: image signal processor
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        oneOf:
> > +          - const: nvidia,tegra20-isp
> > +          - const: nvidia,tegra30-isp
> > +          - const: nvidia,tegra114-isp
> > +          - const: nvidia,tegra124-isp
> > +          - allOf:
> > +              - const: nvidia,tegra132-isp
> > +              - const: nvidia,tegra124-isp
> > +          - const: nvidia,tegra210-isp
> > +          - const: nvidia,tegra186-isp
> > +          - const: nvidia,tegra194-isp
> > +
> > +      reg: true
> > +      interrupts: true
> > +      clocks: true
> > +      resets: true
> > +      reset-names:
> > +        items:
> > +          - const: isp
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            oneOf:
> > +              - const: nvidia,tegra186-host1x
> > +              - const: nvidia,tegra194-host1x

oneOf+const(s) is just an 'enum'

There's a judgement call for doing if/then vs. splitting bindings to
separate schema files. Not saying you need to split it for that
reason, but something to keep in mind.

> > +    then:
> > +      properties:
> > +        reg-names:
> > +          items:
> > +            - const: hypervisor
> > +            - const: vm
> > +        reg:
> > +          items:
> > +            - description: physical base address and length of the register
> > +                region assigned to the VM
> > +            - description: physical base address and length of the register
> > +                region used by the hypervisor
> > +    else:
> > +      properties:
> > +        reg:
> > +          items:
> > +            - description: physical base address and length of the controller
> > +                registers

The description is pretty much every reg property. Just this is
sufficient for a single entry:

reg:
  maxItems: 1

> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            oneOf:
> > +              - const: nvidia,tegra20-host1x
> > +              - const: nvidia,tegra30-host1x
> > +    then:
> > +      properties:
> > +        epp:
> > +          description: encoder pre-processor
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra20-epp
> > +                - const: nvidia,tegra30-epp
> > +                - const: nvidia,tegra114-epp
> > +            reg: true
> > +            interrupts: true
> > +            clocks: true
> > +            resets: true
> > +            reset-names:
> > +              items:
> > +                - const: epp
> > +
> > +        mpe:
> > +          description: video encoder
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra20-mpe
> > +                - const: nvidia,tegra30-mpe
> > +                - const: nvidia,tegra114-mpe
> > +            reg: true
> > +            interrupts: true
> > +            clocks: true
> > +            resets: true
> > +            reset-names:
> > +              items:
> > +                - const: mpe
> > +
> > +        gr2d:
> > +          description: 2D graphics engine
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra20-gr2d
> > +                - const: nvidia,tegra30-gr2d
> > +                - const: nvidia,tegra114-gr2d
> > +            reg: true
> > +            interrupts: true
> > +            clocks: true
> > +            resets: true
> > +            reset-names:
> > +              items:
> > +                - const: 2d
> > +
> > +        gr3d:
> > +          description: 3D graphics engine
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra20-gr3d
> > +                - const: nvidia,tegra30-gr3d
> > +                - const: nvidia,tegra114-gr3d
> > +            reg: true
> > +            clocks: true
> > +            resets: true
> > +
> > +          allOf:
> > +            - if:
> > +                properties:
> > +                  compatible:
> > +                    contains:
> > +                      oneOf:
> > +                        - const: nvidia,tegra30-gr3d
> > +              then:
> > +                properties:
> > +                  clock-names:
> > +                    items:
> > +                      - const: 3d
> > +                      - const: 3d2
> > +                  reset-names:
> > +                    items:
> > +                      - const: 3d
> > +                      - const: 3d2
> > +              else:
> > +                properties:
> > +                  clock-names:
> > +                    items:
> > +                      - const: 3d
> > +                  reset-names:
> > +                    items:
> > +                      - const: 3d
> > +
> > +        tvo:
> > +          description: TV encoder output
> > +          type: object
> > +          properties:
> > +            # required
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra20-tvo
> > +                - const: nvidia,tegra30-tvo
> > +                - const: nvidia,tegra114-tvo
> > +            reg: true
> > +            interrupts: true
> > +            clocks: true
> > +
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            oneOf:
> > +              - const: nvidia,tegra20-host1x
> > +              - const: nvidia,tegra30-host1x
> > +              - const: nvidia,tegra114-host1x
> > +              - const: nvidia,tegra124-host1x
> > +              - const: nvidia,tegra132-host1x
> > +              - const: nvidia,tegra210-host1x
> > +    then:
> > +      properties:
> > +        dc:
> > +          description: display controller
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra20-dc
> > +                - const: nvidia,tegra30-dc
> > +                - const: nvidia,tegra114-dc
> > +                - const: nvidia,tegra124-dc
> > +                - allOf:
> > +                    - const: nvidia,tegra124-dc
> > +                    - const: nvidia,tegra132-dc
> > +                - const: nvidia,tegra210-dc
> > +            reg: true
> > +            interrupts: true
> > +            clocks: true
> > +            clock-names:
> > +              items:
> > +                - const: dc
> > +                - const: parent
> > +            resets: true
> > +            reset-names:
> > +              items:
> > +                - const: dc
> > +            interconnects: true
> > +            interconnect-names:
> > +              items:
> > +                - const: XXX
> > +                - const: XXX
> > +            nvidia,head:
> > +              description: The number of the display controller head. This is
> > +                used to setup the various types of output to receive video
> > +                data from the given head.
> > +              $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +          if:
> > +            properties:
> > +              compatible:
> > +                contains:
> > +                  oneOf:
> > +                    - const: nvidia,tegra20-dc
> > +                    - const: nvidia,tegra30-dc
> > +                    - const: nvidia,tegra114-dc
> > +          then:
> > +            properties:
> > +              rgb:
> > +                description: Each display controller node has a child node,
> > +                  named "rgb", that represents the RGB output associated with
> > +                  the controller.
> > +                type: object
> > +                properties:
> > +                  nvidia,ddc-i2c-bus:
> > +                    $ref: /schemas/types.yaml#/definitions/phandle
> > +                    description: phandle of an I2C controller used for DDC
> > +                      EDID probing
> > +
> > +                  nvidia,hpd-gpio:
> > +                    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +                    description: specifies a GPIO used for hotplug detection
> > +
> > +                  nvidia,edid:
> > +                    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +                    description: supplies a binary EDID blob
> > +
> > +                  nvidia,panel:
> > +                    $ref: /schemas/types.yaml#/definitions/phandle
> > +                    description: phandle of a display panel
> > +
> > +                  # XXX
> > +    else:
> > +      properties:
> > +        display-hub:
> > +          description: display controller hub
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              oneOf:
> > +                - allOf:
> > +                    - const: nvidia,tegra186-display
> > +                    - const: simple-bus
> > +                - allOf:
> > +                    - const: nvidia,tegra194-display
> > +                    - const: simple-bus
> > +            reg: true
> > +            interrupts: true
> > +            clocks: true
> > +            clock-names:
> > +              items:
> > +                - const: disp
> > +                - const: dsc
> > +                - const: hub
> > +            resets: true
> > +            reset-names:
> > +              items:
> > +                - const: misc
> > +                - const: wgrp0
> > +                - const: wgrp1
> > +                - const: wgrp2
> > +                - const: wgrp3
> > +                - const: wgrp4
> > +                - const: wgrp5
> > +            power-domains: true
> > +            ranges: true
> > +
> > +            display:
> > +              #$nodename: display@[0-9a-f]+
> > +              description: display controller
> > +              type: object
> > +              properties:
> > +                compatible:
> > +                  oneOf:
> > +                    - const: nvidia,tegra186-dc
> > +                    - const: nvidia,tegra194-dc
> > +                reg: true
> > +                interrupts: true
> > +                clocks: true
> > +                clock-names:
> > +                  items:
> > +                    - const: dc
> > +                    - const: parent
> > +                resets: true
> > +                reset-names:
> > +                  items:
> > +                    - const: dc
> > +                power-domains:
> > +                  description: A list of phandle and specifiers that identify
> > +                    the power domains that this display controller is part of.
> > +
> > +                interconnects: true
> > +                interconnect-names:
> > +                  items:
> > +                    - const: read-0
> > +                    - const: read-1
> > +
> > +                iommus:
> > +                  $ref: /schemas/types.yaml#/definitions/phandle-array
> > +                  description: a phandle and specifier identifying the SMMU
> > +                    master interface of this display controller.
> > +                nvidia,outputs:
> > +                  description: A list of phandles of outputs that this display
> > +                    controller can drive.
> > +                  $ref: /schemas/types.yaml#/definitions/phandle-array
> > +                nvidia,head:
> > +                  description: The number of the display controller head. This
> > +                    is used to setup the various types of output to receive
> > +                    video data from the given head.
> > +                  $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            oneOf:
> > +              - const: nvidia,tegra20-host1x
> > +              - const: nvidia,tegra30-host1x
> > +              - const: nvidia,tegra114-host1x
> > +              - const: nvidia,tegra124-host1x
> > +    then:
> > +      properties:
> > +        hdmi:
> > +          description: High Definition Multimedia Interface
> > +          type: object
> > +          properties:
> > +            # required
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra20-hdmi
> > +                - const: nvidia,tegra30-hdmi
> > +                - const: nvidia,tegra114-hdmi
> > +                - const: nvidia,tegra124-hdmi
> > +                - allOf:
> > +                    - const: nvidia,tegra132-hdmi
> > +                    - const: nvidia,tegra124-hdmi
> > +            reg: true
> > +            interrupts: true
> > +            clocks: true
> > +            clock-names:
> > +              items:
> > +                - const: hdmi
> > +                - const: parent
> > +            resets: true
> > +            reset-names:
> > +              items:
> > +                - const: hdmi
> > +            hdmi-supply:
> > +              description: supply for the +5V HDMI connector pin
> > +            vdd-supply:
> > +              description: regulator for supply voltage
> > +            pll-supply:
> > +              description: regulator for PLL
> > +
> > +            # optional
> > +            nvidia,ddc-i2c-bus:
> > +              description: phandle of an I2C controller used for DDC EDID
> > +                probing
> > +              $ref: /schemas/types.yaml#/definitions/phandle
> > +            nvidia,hpd-gpio:
> > +              description: specifies a GPIO used for hotplug detection
> > +              $ref: /schemas/types.yaml#/definitions/phandle-array
> > +            nvidia,edid:
> > +              description: supplies a binary EDID blob
> > +              $ref: /schemas/types.yaml#/definitions/uint8-array
> > +            nvidia,panel:
> > +              description: phandle of a display panel
> > +              $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            oneOf:
> > +              - const: nvidia,tegra124-host1x
> > +              - const: nvidia,tegra210-host1x
> > +              - const: nvidia,tegra186-host1x
> > +              - const: nvidia,tegra194-host1x
> > +    then:
> > +      properties:
> > +        sor:
> > +          description: The Serial Output Resource (SOR) can be used to drive
> > +            HDMI, LVDS, eDP and DP outputs.
> > +
> > +            See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information
> > +            regarding the DPAUX pad controller bindings.
> > +          type: object
> > +          properties:
> > +            # required
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra124-sor
> > +                - allOf:
> > +                    - const: nvidia,tegra132-sor
> > +                    - const: nvidia,tegra124-sor
> > +                - const: nvidia,tegra210-sor
> > +                - const: nvidia,tegra210-sor1
> > +                - const: nvidia,tegra186-sor
> > +                - const: nvidia,tegra186-sor1
> > +                - const: nvidia,tegra194-sor
> > +            reg: true
> > +            interrupts: true
> > +            clocks: true
> > +            clock-names:
> > +              items:
> > +                - description: clock input for the SOR hardware
> > +                  const: sor
> > +                - description: SOR output clock
> > +                  const: out
> > +                - description: input for the pixel clock
> > +                  const: parent
> > +                - description: reference clock for the SOR clock
> > +                  const: dp
> > +                - description: safe reference clock for the SOR clock during
> > +                    power up
> > +                  const: safe
> > +                  # deprecated
> > +                - description: source clock for the SOR clock (obsolete, use
> > +                    "out" instead)
> > +                  const: source
> > +                  # Tegra186 and later
> > +                - description: SOR pad output clock
> > +                  const: pad
> > +            resets: true
> > +            reset-names:
> > +              items:
> > +                - description: module reset
> > +                  const: sor
> > +
> > +            # Tegra186 and later
> > +            nvidia,interface:
> > +              $ref: /schemas/types.yaml#/definitions/uint32
> > +              description: index of the SOR interface
> > +
> > +            # optional
> > +            nvidia,ddc-i2c-bus:
> > +              $ref: /schemas/types.yaml#/definitions/phandle
> > +              description: phandle of an I2C controller used for DDC EDID
> > +                probing
> > +
> > +            nvidia,hpd-gpio:
> > +              $ref: /schemas/types.yaml#/definitions/phandle-array
> > +              description: specifies a GPIO used for hotplug detection
> > +
> > +            nvidia,edid:
> > +              $ref: /schemas/types.yaml#/definitions/uint8-array
> > +              description: supplies a binary EDID blob
> > +
> > +            nvidia,panel:
> > +              $ref: /schemas/types.yaml#/definitions/phandle
> > +              description: phandle of a display panel
> > +
> > +            nvidia,xbar-cfg:
> > +              $ref: /schemas/types.yaml#/definitions/uint32-array
> > +              description: 5 cells containing the crossbar configuration.
> > +                Each lane of the SOR, identified by the cell's index, is
> > +                mapped via the crossbar to the pad specified by the cell's
> > +                value.
> > +
> > +            # optional when driving an eDP output
> > +            nvidia,dpaux:
> > +              $ref: /schemas/types.yaml#/definitions/phandle
> > +              description: phandle to a DispayPort AUX interface
> > +
> > +        dpaux:
> > +          description: DisplayPort AUX interface
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra124-dpaux
> > +                - allOf:
> > +                    - const: nvidia,tegra132-dpaux
> > +                    - const: nvidia,tegra124-dpaux
> > +                - const: nvidia,tegra210-dpaux
> > +                - const: nvidia,tegra186-dpaux
> > +                - const: nvidia,tegra194-dpaux
> > +            reg: true
> > +            interrupts: true
> > +            clocks: true
> > +            clock-names:
> > +              items:
> > +                - description: clock input for the DPAUX hardware
> > +                  const: dpaux
> > +                - description: reference clock
> > +                  const: parent
> > +            resets: true
> > +            reset-names:
> > +              items:
> > +                - const: dpaux
> > +            vdd-supply:
> > +              description: phandle of a supply that powers the DisplayPort
> > +                link
> > +            i2c-bus:
> > +              description: Subnode where I2C slave devices are listed. This
> > +                subnode must be always present. If there are no I2C slave
> > +                devices, an empty node should be added. See ../../i2c/i2c.yaml
> > +                for more information.
> > +
> > +        vic:
> > +          description: Video Image Compositor
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra124-vic
> > +                - allOf:
> > +                    - const: nvidia,tegra132-vic
> > +                    - const: nvidia,tegra124-vic
> > +                - const: nvidia,tegra210-vic
> > +                - const: nvidia,tegra186-vic
> > +                - const: nvidia,tegra194-vic
> > +            reg: true
> > +            interrupts: true
> > +            clocks: true
> > +            clock-names:
> > +              items:
> > +                - description: clock input for the VIC hardware
> > +                - const: vic
> > +            resets: true
> > +            reset-names:
> > +              items:
> > +                - const: vic
> > +            interconnects: true
> > +            interconnect-names:
> > +              items:
> > +                - const: read
> > +                - const: write
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            oneOf:
> > +              - const: nvidia,tegra30-host1x
> > +              - const: nvidia,tegra114-host1x
> > +              - const: nvidia,tegra124-host1x
> > +              - const: nvidia,tegra210-host1x
> > +              - const: nvidia,tegra186-host1x
> > +    then:
> > +      properties:
> > +        dsi:
> > +          description: display serial interface
> > +          type: object
> > +          properties:
> > +            # required
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra30-dsi
> > +                - const: nvidia,tegra114-dsi
> > +                - const: nvidia,tegra124-dsi
> > +                - allOf:
> > +                    - const: nvidia,tegra132-dsi
> > +                    - const: nvidia,tegra124-dsi
> > +                - const: nvidia,tegra210-dsi
> > +                - const: nvidia,tegra186-dsi
> > +            reg: true
> > +            clocks: true
> > +            clock-names:
> > +              items:
> > +                - description: DSI module clock
> > +                  const: dsi
> > +                - description: low-power module clock
> > +                  const: lp
> > +                - description: input for the pixel clock
> > +                  const: parent
> > +            resets: true
> > +            reset-names:
> > +              items:
> > +                - description: module reset
> > +                - const: dsi
> > +            avdd-dsi-supply:
> > +              description: phandle of a supply that powers the DSI controller
> > +              $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +            nvidia,mipi-calibrate:
> > +              $ref: /schemas/types.yaml#/definitions/phandle-array
> > +              description: Should contain a phandle and a specifier specifying
> > +                which pads are used by this DSI output and need to be
> > +                calibrated. See also ../display/tegra/nvidia,tegra114-mipi.txt.
> > +
> > +            # optional
> > +            nvidia,ddc-i2c-bus:
> > +              $ref: /schemas/types.yaml#/definitions/phandle
> > +              description: phandle of an I2C controller used for DDC EDID
> > +                probing
> > +            nvidia,hpd-gpio:
> > +              $ref: /schemas/types.yaml#/definitions/phandle-array
> > +              description: specifies a GPIO used for hotplug detection
> > +            nvidia,edid:
> > +              $ref: /schemas/types.yaml#/definitions/uint8-array
> > +              description: supplies a binary EDID blob
> > +            nvidia,panel:
> > +              $ref: /schemas/types.yaml#/definitions/phandle
> > +              description: phandle of a display panel
> > +            nvidia,ganged-mode:
> > +              $ref: /schemas/types.yaml#/definitions/phandle
> > +              description: contains a phandle to a second DSI controller to
> > +                gang up with in order to support up to 8 data lanes
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/tegra20-car.h>
> > +
> > +    host1x {
> > +        compatible = "nvidia,tegra20-host1x", "simple-bus";
> > +        reg = <0x50000000 0x00024000>;
> > +        interrupts = <0 65 0x04   /* mpcore syncpt */
> > +                      0 67 0x04>; /* mpcore general */
> > +        clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
> > +        resets = <&tegra_car 28>;
> > +        reset-names = "host1x";
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        ranges = <0x54000000 0x54000000 0x04000000>;
> > +
> > +        mpe {
> > +                compatible = "nvidia,tegra20-mpe";
> > +                reg = <0x54040000 0x00040000>;

Note that these should be giving you dtc warnings with W=1 because you
are missing unit-addresses. Adding them is going to affect the schema
if you keep defining the host1x child nodes in the schema. I simply
would not do that and rely on the normal compatible string matching to
check child nodes.

Rob
