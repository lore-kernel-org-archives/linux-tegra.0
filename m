From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v6 07/15] dt-bindings: memory: tegra30: Convert to
 Tegra124 YAML
Date: Wed, 3 Jul 2019 07:22:34 -0600
Message-ID: <CAL_Jsq+-cuqVf60MbaNTz3jCUQkEpU8EgUe1xyOzHLsM5zjjEg@mail.gmail.com>
References: <20190630210019.26914-1-digetx@gmail.com> <20190630210019.26914-8-digetx@gmail.com>
 <CAL_JsqJq5iwQcbUixMWK819OTof8DzrZ3UMhByc1pTAFTdwnjg@mail.gmail.com>
 <ba299725-b65b-ce7d-6376-a26918cc985b@gmail.com> <d98f16ee-ac43-8f1e-d324-d6e2cfccf3c8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d98f16ee-ac43-8f1e-d324-d6e2cfccf3c8@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 2, 2019 at 6:48 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 01.07.2019 22:30, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 01.07.2019 22:11, Rob Herring =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On Sun, Jun 30, 2019 at 3:04 PM Dmitry Osipenko <digetx@gmail.com> wro=
te:
> >>>
> >>
> >> "Convert" implies you delete the old binding doc.
> >
> > Yes, unfortunately the deletion got lost by accident after rebase and i=
t was already
> > too late when I noticed that. Will be fixed in the next revision.
> >
> >>> The Tegra30 binding will actually differ from the Tegra124 a tad, in
> >>> particular the EMEM configuration description. Hence rename the bindi=
ng
> >>> to Tegra124 during of the conversion to YAML.
> >>>
> >>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>> ---
> >>>  .../nvidia,tegra124-mc.yaml                   | 149 ++++++++++++++++=
++
> >>>  1 file changed, 149 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/memory-controll=
ers/nvidia,tegra124-mc.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvi=
dia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers=
/nvidia,tegra124-mc.yaml
> >>> new file mode 100644
> >>> index 000000000000..d18242510295
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,teg=
ra124-mc.yaml
> >>> @@ -0,0 +1,149 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra12=
4-mc.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title:
> >>> +  NVIDIA Tegra124 SoC Memory Controller
> >>> +
> >>> +maintainers:
> >>> +  - Jon Hunter <jonathanh@nvidia.com>
> >>> +  - Thierry Reding <thierry.reding@gmail.com>
> >>> +
> >>> +description: |
> >>> +  Tegra124 SoC features a hybrid 2x32-bit / 1x64-bit memory controll=
er.
> >>> +  These are interleaved to provide high performance with the load sh=
ared across
> >>> +  two memory channels. The Tegra124 Memory Controller handles memory=
 requests
> >>> +  from internal clients and arbitrates among them to allocate memory=
 bandwidth
> >>> +  for DDR3L and LPDDR3 SDRAMs.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: nvidia,tegra124-mc
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +    description:
> >>> +      Physical base address.
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +    description:
> >>> +      Memory Controller clock.
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: mc
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +    description:
> >>> +      Memory Controller interrupt.
> >>> +
> >>> +  "#reset-cells":
> >>> +    const: 1
> >>> +
> >>> +  "#iommu-cells":
> >>> +    const: 1
> >>> +
> >>> +patternProperties:
> >>> +  ".*":
> >>
> >> Please define a node name or pattern for node names.
> >
> > There was no pattern specified in the original binding. But I guess the=
 existing
> > upstream device-trees could be used as the source for the pattern.
>
> Actually it looks like the use of explicit pattern is not really a good i=
dea because
> device-tree could have node named in a way that it doesn't match the patt=
ern and hence
> dtbs_check silently skips the non-matching nodes. Is there any way to exp=
ress that
> non-matching nodes shall be rejected?

additionalProperties: false

It's not ideal because you have to list all properties and can't
combine multiple schema, but that's getting addressed in json-schema
draft8. That shouldn't matter for you in this case though.

Rob
