From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/38] dt-bindings: display: tegra: Convert to json-schema
Date: Thu, 18 Jun 2020 16:16:30 +0200
Message-ID: <20200618141630.GB3663225@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-8-thierry.reding@gmail.com>
 <20200617231326.GD2975260@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200617231326.GD2975260@bogus>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 05:13:26PM -0600, Rob Herring wrote:
> On Fri, Jun 12, 2020 at 04:18:32PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Convert the Tegra host1x controller bindings from the free-form text
> > format to json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../display/tegra/nvidia,tegra20-host1x.txt   |  516 ------
> >  .../display/tegra/nvidia,tegra20-host1x.yaml  | 1418 +++++++++++++++++
> >  2 files changed, 1418 insertions(+), 516 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra20-host1x.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra20-host1x.yaml
>=20
>=20
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-host1x.yaml
> > new file mode 100644
> > index 000000000000..3347e1b3c8f0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-ho=
st1x.yaml
> > @@ -0,0 +1,1418 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-host1x=
=2Eyaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra host1x controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > +  - Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > +
> > +description: The host1x top-level node defines a number of children, e=
ach
> > +  representing one of the host1x client modules defined in this bindin=
g.
> > +
> > +properties:
> > +  # required
> > +  compatible:
> > +    oneOf:
> > +      - description: NVIDIA Tegra20
> > +        items:
> > +          - const: nvidia,tegra20-host1x
> > +
> > +      - description: NVIDIA Tegra30
> > +        items:
> > +          - const: nvidia,tegra30-host1x
> > +
> > +      - description: NVIDIA Tegra114
> > +        items:
> > +          - const: nvidia,tegra114-host1x
> > +
> > +      - description: NVIDIA Tegra124
> > +        items:
> > +          - const: nvidia,tegra124-host1x
> > +
> > +      - description: NVIDIA Tegra132
> > +        items:
> > +          - const: nvidia,tegra132-host1x
> > +          - const: nvidia,tegra124-host1x
> > +
> > +      - description: NVIDIA Tegra210
> > +        items:
> > +          - const: nvidia,tegra210-host1x
> > +
> > +      - description: NVIDIA Tegra186
> > +        items:
> > +          - const: nvidia,tegra186-host1x
> > +
> > +      - description: NVIDIA Tegra194
> > +        items:
> > +          - const: nvidia,tegra194-host1x
>=20
> I don't think the descriptions really add much. I'd rather see all the=20
> single entry cases as 1 'enum'.

Okay, done.

> > +
> > +  interrupts:
> > +    items:
> > +      - description: host1x syncpoint interrupt
> > +      - description: host1x general interrupt
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: syncpt
> > +      - const: host1x
> > +
> > +  '#address-cells':
> > +    description: The number of cells used to represent physical base a=
ddresses
> > +      in the host1x address space.
> > +    enum: [1, 2]
> > +
> > +  '#size-cells':
> > +    description: The number of cells used to represent the size of an =
address
> > +      range in the host1x address space.
> > +    enum: [1, 2]
> > +
> > +  # required
>=20
> Odd comment...

There were a couple of others like this. I've removed them all now.

>=20
> > +  ranges:
> > +    description: The mapping of the host1x address space to the CPU ad=
dress
> > +      space.
>=20
> That's every 'ranges'. If you know how many entries, then define=20
> 'maxItems'. If not, 'ranges: true' is enough.

Done.

> > +
> > +  clocks:
> > +    description: Must contain one entry, for the module clock. See
> > +      ../clocks/clock-bindings.txt for details.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: host1x
> > +
> > +  resets:
> > +    description: Must contain an entry for each entry in reset-names. =
See
> > +      ../reset/reset.txt for details.
> > +
> > +  reset-names:
> > +    items:
> > +      - const: host1x
> > +
> > +  # optional
> > +  iommus:
> > +    $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
>=20
> This is already applied to every 'iommus' property, so you just need to=
=20
> define how many entries.

Done.

> > +
> > +  memory-controllers:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - interrupt-names
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - ranges
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +
> > +unevaluatedProperties: false
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra186-host1x
> > +              - nvidia,tegra194-host1x
> > +    then:
> > +      properties:
> > +        reg-names:
> > +          items:
> > +            - const: hypervisor
> > +            - const: vm
> > +
> > +        reg:
> > +          items:
> > +            - description: physical base address and length of the reg=
ister
> > +                region assigned to the VM
> > +            - description: physical base address and length of the reg=
ister
> > +                region used by the hypervisor
> > +
> > +      required:
> > +        - reg-names
> > +    else:
> > +      properties:
> > +        reg:
> > +          maxItems: 1
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
>=20
> Use 'enum'.

Done.

> > +
> > +    then:
> > +      patternProperties:
> > +        "^vi@[0-9a-f]+$":
> > +          description: video input
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra20-vi
> > +                - const: nvidia,tegra30-vi
> > +                - const: nvidia,tegra114-vi
> > +                - const: nvidia,tegra124-vi
>=20
> Use a 'enum' for these 4.

Done.

>=20
> > +                - items:
> > +                    - const: nvidia,tegra132-vi
> > +                    - const: nvidia,tegra124-vi
> > +
> > +            reg:
> > +              maxItems: 1
> > +
> > +            interrupts:
> > +              maxItems: 1
> > +
> > +            clocks:
> > +              maxItems: 1
> > +
> > +            resets: true
> > +
> > +            reset-names:
> > +              items:
> > +                - const: vi
> > +    else:
> > +      patternProperties:
> > +        "^vi@[0-9a-f]+$":
> > +          description: video input
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra210-vi
> > +                - const: nvidia,tegra186-vi
> > +                - const: nvidia,tegra194-vi
> > +
> > +            reg:
> > +              maxItems: 1
> > +
> > +            interrupts:
> > +              maxItems: 1
> > +
> > +            clocks:
> > +              maxItems: 1
> > +
> > +            power-domains: true
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            oneOf:
> > +              - const: nvidia,tegra210-host1x
> > +    then:
> > +      patternProperties:
> > +        "^vi@[0-9a-f]+$":
>=20
> type: object

Done.

>=20
> > +          patternProperties:
> > +            "^csi@[0-9a-f]+$":
> > +              description: camera sensor interface
> > +              type: object
> > +              properties:
> > +                compatible:
> > +                  enum:
> > +                    - nvidia,tegra210-csi
> > +
> > +                reg: true
> > +
> > +                clocks: true
> > +
> > +                clock-names:
> > +                  items:
> > +                    - const: csi
> > +                    - const: cilab
> > +                    - const: cilcd
> > +                    - const: cile
> > +                    - const: csi_tpg
> > +
> > +                power-domains: true
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra20-host1x
> > +              - nvidia,tegra30-host1x
> > +              - nvidia,tegra114-host1x
> > +    then:
> > +      patternProperties:
> > +        "^epp@[0-9a-f]+$":
> > +          description: encoder pre-processor
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              enum:
> > +                - nvidia,tegra20-epp
> > +                - nvidia,tegra30-epp
> > +                - nvidia,tegra114-epp
> > +
> > +            reg:
> > +              maxItems: 1
> > +
> > +            interrupts:
> > +              maxItems: 1
> > +
> > +            clocks:
> > +              maxItems: 1
> > +
> > +            resets:
> > +              items:
> > +                - description: module reset
> > +
> > +            reset-names:
> > +              items:
> > +                - const: epp
> > +
> > +            iommus:
> > +              $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
> > +
> > +          unevaluatedProperties: false
>=20
> I think 'additionalProperties: false' will work here.

Yes, it does.

>=20
> > +
> > +        "^mpe@[0-9a-f]+$":
> > +          description: video encoder
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              enum:
> > +                - nvidia,tegra20-mpe
> > +                - nvidia,tegra30-mpe
> > +                - nvidia,tegra114-mpe
> > +
> > +            reg:
> > +              minItems: 1
> > +              maxItems: 1
> > +
> > +            interrupts:
> > +              minItems: 1
> > +              maxItems: 1
> > +
> > +            clocks:
> > +              minItems: 1
> > +              maxItems: 1
> > +
> > +            resets:
> > +              minItems: 1
> > +              maxItems: 1
> > +
> > +            reset-names:
> > +              items:
> > +                - const: mpe
> > +
> > +            iommus:
> > +              $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
> > +
> > +          unevaluatedProperties: false
> > +
> > +        "^gr2d@[0-9a-f]+$":
> > +          description: 2D graphics engine
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              enum:
> > +                - nvidia,tegra20-gr2d
> > +                - nvidia,tegra30-gr2d
> > +                - nvidia,tegra114-gr2d
> > +
> > +            reg:
> > +              maxItems: 1
> > +
> > +            interrupts:
> > +              maxItems: 1
> > +
> > +            clocks:
> > +              maxItems: 1
> > +
> > +            resets:
> > +              items:
> > +                - description: module reset
> > +
> > +            reset-names:
> > +              items:
> > +                - const: 2d
> > +
> > +            iommus:
> > +              $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
> > +
> > +          unevaluatedProperties: false
> > +
> > +        "^gr3d@[0-9a-f]+$":
> > +          description: 3D graphics engine
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              enum:
> > +                - nvidia,tegra20-gr3d
> > +                - nvidia,tegra30-gr3d
> > +                - nvidia,tegra114-gr3d
> > +
> > +            reg:
> > +              maxItems: 1
> > +
> > +            iommus:
> > +              $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
> > +
> > +          allOf:
> > +            - if:
> > +                properties:
> > +                  compatible:
> > +                    contains:
> > +                      const: nvidia,tegra30-gr3d
> > +              then:
> > +                properties:
> > +                  clocks:
> > +                    items:
> > +                      - description: primary module clock
> > +                      - description: secondary module clock
> > +
> > +                  clock-names:
> > +                    items:
> > +                      - const: 3d
> > +                      - const: 3d2
> > +
> > +                  resets:
> > +                    items:
> > +                      - description: primary module reset
> > +                      - description: secondary module reset
> > +
> > +                  reset-names:
> > +                    items:
> > +                      - const: 3d
> > +                      - const: 3d2
> > +              else:
> > +                properties:
> > +                  clocks:
> > +                    items:
> > +                      - description: module clock
> > +
> > +                  clock-names:
> > +                    items:
> > +                      - const: 3d
> > +
> > +                  resets:
> > +                    items:
> > +                      - description: module reset
> > +
> > +                  reset-names:
> > +                    items:
> > +                      - const: 3d
> > +
> > +          unevaluatedProperties: false
> > +
> > +        "^tvo@[0-9a-f]+$":
> > +          description: TV encoder output
> > +          type: object
> > +          properties:
> > +            # required
> > +            compatible:
> > +              enum:
> > +                - nvidia,tegra20-tvo
> > +                - nvidia,tegra30-tvo
> > +                - nvidia,tegra114-tvo
> > +
> > +            reg:
> > +              maxItems: 1
> > +
> > +            interrupts:
> > +              maxItems: 1
> > +
> > +            clocks:
> > +              maxItems: 1
> > +
> > +            status:
> > +              $ref: "/schemas/dt-core.yaml#/properties/status"
> > +
> > +          unevaluatedProperties: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra20-host1x
> > +              - nvidia,tegra30-host1x
> > +              - nvidia,tegra114-host1x
> > +              - nvidia,tegra124-host1x
> > +              - nvidia,tegra132-host1x
> > +              - nvidia,tegra210-host1x
> > +    then:
> > +      patternProperties:
> > +        "^dc@[0-9a-f]+$":
> > +          description: display controller
> > +          type: object
> > +          properties:
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra20-dc
> > +                - const: nvidia,tegra30-dc
> > +                - const: nvidia,tegra114-dc
> > +                - const: nvidia,tegra124-dc
> > +                - items:
> > +                    - const: nvidia,tegra124-dc
> > +                    - const: nvidia,tegra132-dc
> > +                - const: nvidia,tegra210-dc
> > +
> > +            reg:
> > +              maxItems: 1
> > +
> > +            interrupts:
> > +              maxItems: 1
> > +
> > +            clocks:
> > +              items:
> > +                - description: display controller pixel clock
> > +
> > +            clock-names:
> > +              items:
> > +                - const: dc
> > +
> > +            resets:
> > +              items:
> > +                - description: module reset
> > +
> > +            reset-names:
> > +              items:
> > +                - const: dc
> > +
> > +            iommus:
> > +              $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > +
> > +            nvidia,head:
> > +              description: The number of the display controller head. =
This is
> > +                used to setup the various types of output to receive v=
ideo
> > +                data from the given head.
> > +              $ref: "/schemas/types.yaml#/definitions/uint32"
> > +
> > +          allOf:
> > +            - if:
> > +                properties:
> > +                  compatible:
> > +                    contains:
> > +                      enum:
> > +                        - nvidia,tegra20-dc
> > +                        - nvidia,tegra30-dc
> > +                        - nvidia,tegra114-dc
> > +              then:
> > +                properties:
> > +                  rgb:
> > +                    description: Each display controller node has a ch=
ild node,
> > +                      named "rgb", that represents the RGB output asso=
ciated
> > +                      with the controller.
> > +                    type: object
> > +                    properties:
> > +                      nvidia,ddc-i2c-bus:
> > +                        description: phandle of an I2C controller used=
 for DDC
> > +                          EDID probing
> > +                        $ref: "/schemas/types.yaml#/definitions/phandl=
e"
> > +
> > +                      nvidia,hpd-gpio:
> > +                        description: specifies a GPIO used for hotplug
> > +                          detection
> > +                        $ref: "/schemas/types.yaml#/definitions/phandl=
e-array"
> > +
> > +                      nvidia,edid:
> > +                        description: supplies a binary EDID blob
> > +                        $ref: "/schemas/types.yaml#/definitions/uint8-=
array"
> > +
> > +                      nvidia,panel:
> > +                        description: phandle of a display panel
> > +                        $ref: "/schemas/types.yaml#/definitions/phandl=
e"
> > +
> > +          unevaluatedProperties: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra186-host1x
> > +              - nvidia,tegra194-host1x
> > +    then:
> > +      patternProperties:
> > +        "^display-hub@[0-9a-f]+$":
> > +          properties:
> > +            compatible:
> > +              oneOf:
> > +                - description: NVIDIA Tegra186
> > +                  const: nvidia,tegra186-display
> > +
> > +                - description: NVIDIA Tegra194
> > +                  const: nvidia,tegra194-display
> > +
> > +            '#address-cells':
> > +              const: 1
> > +
> > +            '#size-cells':
> > +              const: 1
> > +
> > +            reg:
> > +              maxItems: 1
> > +
> > +            interrupts:
> > +              maxItems: 1
> > +
> > +            ranges:
> > +              $ref: "/schemas/dt-core.yaml#/properties/ranges"
> > +
> > +            status:
> > +              $ref: "/schemas/dt-core.yaml#/properties/status"
> > +
> > +            resets:
> > +              items:
> > +                - description: display hub reset
> > +                - description: window group 0 reset
> > +                - description: window group 1 reset
> > +                - description: window group 2 reset
> > +                - description: window group 3 reset
> > +                - description: window group 4 reset
> > +                - description: window group 5 reset
> > +
> > +            reset-names:
> > +              items:
> > +                - const: misc
> > +                - const: wgrp0
> > +                - const: wgrp1
> > +                - const: wgrp2
> > +                - const: wgrp3
> > +                - const: wgrp4
> > +                - const: wgrp5
> > +
> > +            power-domains:
> > +              $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > +
> > +          patternProperties:
> > +            "^display@[0-9a-f]+$":
> > +              description: display controller
> > +              type: object
> > +              properties:
> > +                compatible:
> > +                  enum:
> > +                    - nvidia,tegra186-dc
> > +                    - nvidia,tegra194-dc
> > +
> > +                reg:
> > +                  maxItems: 1
> > +
> > +                interrupts:
> > +                  maxItems: 1
> > +
> > +                clocks:
> > +                  items:
> > +                    - description: display controller pixel clock
> > +
> > +                clock-names:
> > +                  items:
> > +                    - const: dc
> > +
> > +                resets:
> > +                  items:
> > +                    - description: display controller reset
> > +
> > +                reset-names:
> > +                  items:
> > +                    - const: dc
> > +
> > +                power-domains:
> > +                  description: A list of phandle and specifiers that i=
dentify
> > +                    the power domains that this display controller is =
part of.
> > +                  $ref: "/schemas/types.yaml#/definitions/phandle-arra=
y"
> > +
> > +                iommus:
> > +                  description: a phandle and specifier identifying the=
 SMMU
> > +                    master interface of this display controller.
> > +                  $ref: "/schemas/types.yaml#/definitions/phandle-arra=
y"
> > +
> > +                memory-controllers:
> > +                  $ref: /schemas/types.yaml#/definitions/phandle-array
> > +
> > +                nvidia,outputs:
> > +                  description: A list of phandles of outputs that this=
 display
> > +                    controller can drive.
> > +                  $ref: "/schemas/types.yaml#/definitions/phandle-arra=
y"
> > +
> > +                nvidia,head:
> > +                  description: The number of the display controller he=
ad. This
> > +                    is used to setup the various types of output to re=
ceive
> > +                    video data from the given head.
> > +                  $ref: "/schemas/types.yaml#/definitions/uint32"
> > +
> > +              unevaluatedProperties: false
> > +
> > +          allOf:
> > +            - if:
> > +                properties:
> > +                  compatible:
> > +                    contains:
> > +                      const: nvidia,tegra186-display
> > +              then:
> > +                properties:
> > +                  clocks:
> > +                    items:
> > +                      - description: display core clock
> > +                      - description: display stream compression clock
> > +                      - description: display hub clock
> > +
> > +                  clock-names:
> > +                    items:
> > +                      - const: disp
> > +                      - const: dsc
> > +                      - const: hub
> > +              else:
> > +                properties:
> > +                  clocks:
> > +                    items:
> > +                      - description: display core clock
> > +                      - description: display hub clock
> > +
> > +                  clock-names:
> > +                    items:
> > +                      - const: disp
> > +                      - const: hub
> > +
> > +          unevaluatedProperties: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra20-host1x
> > +              - nvidia,tegra30-host1x
> > +              - nvidia,tegra114-host1x
> > +              - nvidia,tegra124-host1x
> > +    then:
> > +      patternProperties:
> > +        "^hdmi@[0-9a-f]+$":
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
> > +                - items:
> > +                    - const: nvidia,tegra132-hdmi
> > +                    - const: nvidia,tegra124-hdmi
> > +            reg:
> > +              maxItems: 1
> > +
> > +            interrupts:
> > +              maxItems: 1
> > +
> > +            clocks:
> > +              items:
> > +                - description: module clock
> > +                - description: parent clock
> > +
> > +            clock-names:
> > +              items:
> > +                - const: hdmi
> > +                - const: parent
> > +
> > +            resets:
> > +              items:
> > +                - description: module reset
> > +
> > +            reset-names:
> > +              items:
> > +                - const: hdmi
> > +
> > +            hdmi-supply:
> > +              description: supply for the +5V HDMI connector pin
> > +
> > +            vdd-supply:
> > +              description: regulator for supply voltage
> > +
> > +            pll-supply:
> > +              description: regulator for PLL
> > +
> > +            # optional
> > +            nvidia,ddc-i2c-bus:
> > +              description: phandle of an I2C controller used for DDC E=
DID
> > +                probing
> > +              $ref: "/schemas/types.yaml#/definitions/phandle"
> > +
> > +            nvidia,hpd-gpio:
> > +              description: specifies a GPIO used for hotplug detection
> > +              $ref: "/schemas/types.yaml#/definitions/phandle-array"
>=20
> *-gpio has a type already. Just 'maxItems: 1' needed.

Yes, that seems to work fine.

> > +
> > +            nvidia,edid:
> > +              description: supplies a binary EDID blob
> > +              $ref: "/schemas/types.yaml#/definitions/uint8-array"
> > +
> > +            nvidia,panel:
> > +              description: phandle of a display panel
> > +              $ref: "/schemas/types.yaml#/definitions/phandle"
> > +
> > +            status:
> > +              $ref: "/schemas/dt-core.yaml#/properties/status"
> > +
> > +            phandle:
> > +              $ref: "/schemas/types.yaml#/definitions/uint32"
> > +
> > +          unevaluatedProperties: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra124-host1x
> > +              - nvidia,tegra210-host1x
> > +              - nvidia,tegra186-host1x
> > +              - nvidia,tegra194-host1x
> > +    then:
> > +      patternProperties:
> > +        "^sor@[0-9a-f]+$":
> > +          description: |
> > +            The Serial Output Resource (SOR) can be used to drive HDMI=
, LVDS,
> > +            eDP and DP outputs.
> > +
> > +            See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for inform=
ation
> > +            regarding the DPAUX pad controller bindings.
> > +          type: object
> > +          properties:
> > +            # required
> > +            compatible:
> > +              oneOf:
> > +                - const: nvidia,tegra124-sor
> > +                - items:
> > +                    - const: nvidia,tegra132-sor
> > +                    - const: nvidia,tegra124-sor
> > +                - const: nvidia,tegra210-sor
> > +                - const: nvidia,tegra210-sor1
> > +                - const: nvidia,tegra186-sor
> > +                - const: nvidia,tegra186-sor1
> > +                - const: nvidia,tegra194-sor
> > +
> > +            reg:
> > +              maxItems: 1
> > +
> > +            interrupts:
> > +              maxItems: 1
> > +
> > +            resets:
> > +              items:
> > +                - description: module reset
> > +
> > +            reset-names:
> > +              items:
> > +                - const: sor
> > +
> > +            status:
> > +              $ref: "/schemas/dt-core.yaml#/properties/status"
>=20
> 'status' should never need to be listed.

This seems to be needed at least when I try to validate against a single
binding, like so:

	$ make DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/display/tegra/n=
vidia,tegra20-host1x.yaml dtbs_check

I assume that that somehow prevents the tooling from looking at any of
the other bindings, which in turn then causes status and other standard
properties to never be defined and then it flags them as extra and
causes a failure.

I think I've even seen this trigger on dt_binding_check if I happened to
have status in there. Now, you've mentioned elsewhere that we shouldn't
use "status" in examples, so that would work around this. However, I
think I've seen this happen as well in examples that referenced some
node via phandle, and then dt_binding_check would emit an error about
phandle being undefined.

Perhaps this is a problem with the tooling? Should we instruct the
scripts to always include the core schema even if we're only testing a
single YAML file via DT_SCHEMA_FILES?

> > +
> > +            power-domains:
> > +              $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > +
> > +            avdd-io-hdmi-dp-supply:
> > +              description: I/O supply for HDMI/DP
> > +
> > +            vdd-hdmi-dp-pll-supply:
> > +              description: PLL supply for HDMI/DP
> > +
> > +            hdmi-supply:
> > +              description: +5.0V HDMI connector supply
> > +
> > +            # Tegra186 and later
> > +            nvidia,interface:
> > +              description: index of the SOR interface
> > +              $ref: "/schemas/types.yaml#/definitions/uint32"
> > +
> > +            # optional
> > +            nvidia,ddc-i2c-bus:
> > +              description: phandle of an I2C controller used for DDC E=
DID
> > +                probing
> > +              $ref: "/schemas/types.yaml#/definitions/phandle"
> > +
> > +            nvidia,hpd-gpio:
> > +              description: specifies a GPIO used for hotplug detection
> > +              $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > +
> > +            nvidia,edid:
> > +              description: supplies a binary EDID blob
> > +              $ref: "/schemas/types.yaml#/definitions/uint8-array"
> > +
> > +            nvidia,panel:
> > +              description: phandle of a display panel
> > +              $ref: "/schemas/types.yaml#/definitions/phandle"
> > +
> > +            nvidia,xbar-cfg:
> > +              description: 5 cells containing the crossbar configurati=
on.
> > +                Each lane of the SOR, identified by the cell's index, =
is
> > +                mapped via the crossbar to the pad specified by the ce=
ll's
> > +                value.
> > +              $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > +
> > +            # optional when driving an eDP output
> > +            nvidia,dpaux:
> > +              description: phandle to a DispayPort AUX interface
> > +              $ref: "/schemas/types.yaml#/definitions/phandle"
> > +
> > +            pinctrl-names: true
> > +            phandle:
> > +              $ref: "/schemas/types.yaml#/definitions/uint32"
>=20
> 'phandle' shouldn't need to be listed.
>=20
> > +
> > +          patternProperties:
> > +            "^pinctrl-[0-9]+$": true
>=20
> pinctrl properties are automatically added, but maybe not if under an=20
> 'if' schema. Really, I think probably either this should be split=20
> into multiple schema files or all of these child nodes should be=20
> described at the top-level. I'm not sure it's really important to define=
=20
> which set of child nodes belong or not for each chip.

I'm not too worried about the set of child nodes for each chip, but I
think having this all in one file underlines the importance of the
hierarchy. If these were discrete bindings for each of the compatible
strings it'd be easy for someone to create them as standalone nodes in
device tree, but that's not something that would work. All of these
devices are children of host1x and they do depend on host1x for a lot
of the functionality, so the hierarchy must be respected.

> I'm stopping there. I think the rest is more of the same comments.

I've made a pass over the whole file and fixed the issues that you
pointed out above in other places.

Sounds like the biggest remaining issue is with the duplicated standard
properties. I'm not a huge fan of giving up on doing the right thing
because the tooling can't deal with it. I think we should fix the
tooling to do the right thing. So if there's something in the core DT
schema then it should apply regardless of what mode we run in. Much of
the above issues should go away once that's fixed.

Any thoughts on making some of the schema files "always included"? I
haven't looked at this side of the tooling at all yet, so I'm not sure
how difficult that would be, but if you're okay with it conceptually I
can take a closer look.

Thierry

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7rdzsACgkQ3SOs138+
s6EUfhAAq0p75n9uOwmMkPcMFQNS8jJ4rMNhl48dmakMT2R+0p0VN6BR77cE7ie9
xw827NJ1F5+fqDR7/koiKt57Ufx8/UP0sFD+f4p9Gc+NvIU0hJ5i1jhhw5WPQ8w5
GyjB4qIDfePQaJ7cWsJwGWd7Aixb1VA78a3r6gkZiECNZcekGSdImKXCuBrzRWLE
kX+peYh8VlaTgsbJ/1E2pC0tnOfEF4hz5gIAbug4I+OE1aIj+qmk/iIEYt4YEcLq
Jgl3+7bJV9RyNgX6LEVYhkaVlXuumR3JQDslEcBL72pC949m9DfIVGtmtewReBqK
aNeeMExfWL8dOy1cZCSWPV4npnMcF8ODiFqfDzNkH5kRFCCZKFPsNd/YIgd/qB9g
R0vY3+HcjbzmnN5m3BCAOxeawsxyD0qTdKVbcGGhRHYspQZMttGBBK9WZwf+JJmF
vM16v06CWO7rcIwBhyEXBoFi+CVViy9ZJddmAip3vEV0U3GZ62XMndb5gGQKw65D
PydHcCUgG0Ay96r8tXpB0xcYvRRtj5QLa6tWpf295q8l3FnYErJMVF+FV56ByE/R
y4u6Xm6oxc+kwGzcex3daJLSt1Tfm+ZoVB4KK9uwEioa1j9YJm3Yb9zpI02ajS0o
d1w0qGwh53ugtpcqUTFVK0X9wieX2ihlu2OX0wSCsVBxGRjJnLk=
=k2uu
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
