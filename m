From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Convert Generic Power Domain
 bindings to json-schema
Date: Wed, 23 Oct 2019 09:42:06 +0200
Message-ID: <20191023074206.GA10189@pi3>
References: <20191002160632.11140-1-krzk@kernel.org>
 <20191011150339.GA16245@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191011150339.GA16245@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 11, 2019 at 10:03:39AM -0500, Rob Herring wrote:
> On Wed, Oct 02, 2019 at 06:06:30PM +0200, Krzysztof Kozlowski wrote:
> > Convert Generic Power Domain bindings to DT schema format using
> > json-schema.  The consumer bindings are split to separate file.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 
> > Changes since v1:
> > 1. Select all nodes for consumers,
> > 2. Remove from consumers duplicated properties with dt-schema,
> > 3. Fix power domain pattern,
> > 4. Remove unneeded types.
> > ---
> >  .../devicetree/bindings/arm/arm,scmi.txt      |   2 +-
> >  .../devicetree/bindings/arm/arm,scpi.txt      |   2 +-
> >  .../bindings/arm/freescale/fsl,scu.txt        |   2 +-
> >  .../bindings/clock/clk-exynos-audss.txt       |   2 +-
> >  .../bindings/clock/exynos5433-clock.txt       |   4 +-
> >  .../bindings/clock/renesas,cpg-mssr.txt       |   2 +-
> >  .../clock/renesas,r8a7778-cpg-clocks.txt      |   2 +-
> >  .../clock/renesas,r8a7779-cpg-clocks.txt      |   2 +-
> >  .../clock/renesas,rcar-gen2-cpg-clocks.txt    |   2 +-
> >  .../bindings/clock/renesas,rz-cpg-clocks.txt  |   2 +-
> >  .../bindings/clock/ti/davinci/psc.txt         |   2 +-
> >  .../bindings/display/etnaviv/etnaviv-drm.txt  |   2 +-
> >  .../devicetree/bindings/display/msm/dpu.txt   |   2 +-
> >  .../devicetree/bindings/display/msm/mdp5.txt  |   2 +-
> >  .../devicetree/bindings/dsp/fsl,dsp.yaml      |   2 +-
> >  .../firmware/nvidia,tegra186-bpmp.txt         |   2 +-
> >  .../bindings/media/imx7-mipi-csi2.txt         |   3 +-
> >  .../bindings/media/mediatek-jpeg-decoder.txt  |   3 +-
> >  .../bindings/media/mediatek-mdp.txt           |   3 +-
> >  .../bindings/opp/qcom-nvmem-cpufreq.txt       |   2 +-
> >  .../devicetree/bindings/pci/pci-keystone.txt  |   2 +-
> >  .../bindings/phy/ti,phy-am654-serdes.txt      |   2 +-
> >  .../bindings/power/amlogic,meson-gx-pwrc.txt  |   2 +-
> >  .../devicetree/bindings/power/fsl,imx-gpc.txt |   2 +-
> >  .../bindings/power/fsl,imx-gpcv2.txt          |   2 +-
> >  .../power/power-domain-consumers.yaml         | 105 +++++++++
> >  .../bindings/power/power-domain.yaml          | 134 ++++++++++++
> >  .../bindings/power/power_domain.txt           | 205 ------------------
> >  .../devicetree/bindings/power/qcom,rpmpd.txt  |   2 +-
> >  .../bindings/power/renesas,rcar-sysc.txt      |   2 +-
> >  .../bindings/power/renesas,sysc-rmobile.txt   |   2 +-
> >  .../bindings/power/xlnx,zynqmp-genpd.txt      |   2 +-
> >  .../bindings/soc/bcm/brcm,bcm2835-pm.txt      |   2 +-
> >  .../bindings/soc/mediatek/scpsys.txt          |   2 +-
> >  .../bindings/soc/ti/sci-pm-domain.txt         |   2 +-
> >  .../bindings/usb/nvidia,tegra124-xusb.txt     |   4 +-
> >  MAINTAINERS                                   |   2 +-
> >  37 files changed, 278 insertions(+), 241 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/power/power-domain-consumers.yaml
> >  create mode 100644 Documentation/devicetree/bindings/power/power-domain.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/power/power_domain.txt
> 
> 
> > diff --git a/Documentation/devicetree/bindings/power/power-domain-consumers.yaml b/Documentation/devicetree/bindings/power/power-domain-consumers.yaml
> > new file mode 100644
> > index 000000000000..f65078e1260e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/power-domain-consumers.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/power/power-domain-consumers.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: PM domain consumers
> > +
> > +maintainers:
> > +  - Rafael J. Wysocki <rjw@rjwysocki.net>
> > +  - Kevin Hilman <khilman@kernel.org>
> > +  - Ulf Hansson <ulf.hansson@linaro.org>
> > +
> > +description: |+
> > +  See power-domain.yaml
> > +
> > +select: true
> > +
> > +allOf:
> > +  - $ref: /schemas/power-domain/power-domain-consumer.yaml
> 
> I don't like this split. We should move the contents of this file to the 
> above file.
> 
> I checked the authorship of the relevant lines and they are all except 
> for a small number of lines from Linaro authors (Viresh and Ulf). I have 
> permission from Linaro to dual license Linaro authored bindings, so it's 
> not a problem to move this. I can do that and you can just drop this file.

Sure, what to do with the references to power-domain consumers part? I
could leave the text file and do not update the references for
consumers (like I did in last PWM bindings patch, v4).


Best regards,
Krzysztof

> 
> > +
> > +properties:
> > +  required-opps:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      This contains phandle to an OPP node in another device's OPP table.
> > +      It may contain an array of phandles, where each phandle points to an OPP
> > +      of a different device. It should not contain multiple phandles to the OPP
> > +      nodes in the same OPP table. This specifies the minimum required OPP
> > +      of the device(s), whose OPP's phandle is present in this property,
> > +      for the functioning of the current device at the current OPP (where this
> > +      property is present).
> > +
> > +examples:
> > +  - |
> > +    leaky-device@12350000 {
> > +      compatible = "foo,i-leak-current";
> > +      reg = <0x12350000 0x1000>;
> > +      power-domains = <&power 0>;
> > +      power-domain-names = "io";
> > +    };
> > +
> > +    leaky-device@12351000 {
> > +      compatible = "foo,i-leak-current";
> > +      reg = <0x12351000 0x1000>;
> > +      power-domains = <&power 0>, <&power 1> ;
> > +      power-domain-names = "io", "clk";
> > +    };
> > +
> > +    // The first example above defines a typical PM domain consumer device, which is
> > +    // located inside a PM domain with index 0 of a power controller represented by a
> > +    // node with the label "power".
> > +    // In the second example the consumer device are partitioned across two PM domains,
> > +    // the first with index 0 and the second with index 1, of a power controller that
> > +    // is represented by a node with the label "power".
> > +
> > +  - |
> > +    // Example with  OPP table for domain provider that provides two domains:
> > +
> > +    domain0_opp_table: opp-table0 {
> > +      compatible = "operating-points-v2";
> > +
> > +      domain0_opp_0: opp-1000000000 {
> > +        opp-hz = /bits/ 64 <1000000000>;
> > +        opp-microvolt = <975000 970000 985000>;
> > +      };
> > +      domain0_opp_1: opp-1100000000 {
> > +        opp-hz = /bits/ 64 <1100000000>;
> > +        opp-microvolt = <1000000 980000 1010000>;
> > +      };
> > +    };
> > +
> > +    domain1_opp_table: opp-table1 {
> > +      compatible = "operating-points-v2";
> > +
> > +      domain1_opp_0: opp-1200000000 {
> > +        opp-hz = /bits/ 64 <1200000000>;
> > +        opp-microvolt = <975000 970000 985000>;
> > +      };
> > +      domain1_opp_1: opp-1300000000 {
> > +        opp-hz = /bits/ 64 <1300000000>;
> > +        opp-microvolt = <1000000 980000 1010000>;
> > +      };
> > +    };
> > +
> > +    power: power-controller@12340000 {
> > +      compatible = "foo,power-controller";
> > +      reg = <0x12340000 0x1000>;
> > +      #power-domain-cells = <1>;
> > +      operating-points-v2 = <&domain0_opp_table>, <&domain1_opp_table>;
> > +    };
> > +
> > +    leaky-device0@12350000 {
> > +      compatible = "foo,i-leak-current";
> > +      reg = <0x12350000 0x1000>;
> > +      power-domains = <&power 0>;
> > +      required-opps = <&domain0_opp_0>;
> > +    };
> > +
> > +    leaky-device1@12350000 {
> > +      compatible = "foo,i-leak-current";
> > +      reg = <0x12350000 0x1000>;
> > +      power-domains = <&power 1>;
> > +      required-opps = <&domain1_opp_1>;
> > +    };
