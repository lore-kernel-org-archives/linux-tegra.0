From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v9 11/15] dt-bindings: memory: Add binding for NVIDIA
 Tegra30 External Memory Controller
Date: Thu, 1 Aug 2019 21:35:26 +0300
Message-ID: <f323db8e-c551-8a56-20df-16d3c633ed4b@gmail.com>
References: <20190730165618.10122-1-digetx@gmail.com>
 <20190730165618.10122-12-digetx@gmail.com>
 <CAL_JsqJgENCznrnYX8ARia2sNKJ7XxYRzzavk5qoePPYzYAQvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJgENCznrnYX8ARia2sNKJ7XxYRzzavk5qoePPYzYAQvA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

01.08.2019 21:11, Rob Herring пишет:
> On Tue, Jul 30, 2019 at 10:58 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Add device-tree binding for NVIDIA Tegra30 External Memory Controller.
>> The binding is based on the Tegra124 EMC binding since hardware is
>> similar, although there are couple significant differences.
>>
>> Note that the memory timing description is given in a platform-specific
>> form because there is no detailed information on how to convert a
>> typical-common DDR timing into the register values. The timing format is
>> borrowed from downstream kernel, hence there is no hurdle in regards to
>> upstreaming of memory timings for the boards.
>>
>> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../nvidia,tegra30-emc.yaml                   | 341 ++++++++++++++++++
>>  1 file changed, 341 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
>> new file mode 100644
>> index 000000000000..6865cfb16e59
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
>> @@ -0,0 +1,341 @@
>> +# SPDX-License-Identifier: (GPL-2.0)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra30-emc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NVIDIA Tegra30 SoC External Memory Controller
>> +
>> +maintainers:
>> +  - Dmitry Osipenko <digetx@gmail.com>
>> +  - Jon Hunter <jonathanh@nvidia.com>
>> +  - Thierry Reding <thierry.reding@gmail.com>
>> +
>> +description: |
>> +  The EMC interfaces with the off-chip SDRAM to service the request stream
>> +  sent from Memory Controller. The EMC also has various performance-affecting
>> +  settings beyond the obvious SDRAM configuration parameters and initialization
>> +  settings. Tegra30 EMC supports multiple JEDEC standard protocols: LPDDR2,
>> +  LPDDR3, and DDR3.
>> +
>> +properties:
>> +  compatible:
>> +    const: nvidia,tegra30-emc
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
>> +      Physical base address.
> 
> Same comment here.
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description:
>> +      EMC clock.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description:
>> +      EMC General interrupt.
>> +
>> +  nvidia,memory-controller:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle of the Memory Controller node.
>> +
>> +patternProperties:
>> +  "^emc-timings-[0-9]+$":
>> +    type: object
>> +    properties:
>> +      nvidia,ram-code:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          Value of RAM_CODE this timing set is used for.
>> +
>> +    patternProperties:
>> +      "^timing-[0-9]+$":
>> +        type: object
>> +        properties:
>> +          clock-frequency:
>> +            description:
>> +              Memory clock rate in Hz.
>> +            minimum: 1000000
>> +            maximum: 900000000
>> +
>> +          nvidia,emc-auto-cal-interval:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description:
>> +              Pad calibration interval.
> 
> Any value 0 - 4G is valid?

No, this is in microseconds and the maximum is 2 seconds.

>> +
>> +          nvidia,emc-mode-1:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description:
>> +              Mode Register 1.
>> +
>> +          nvidia,emc-mode-2:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description:
>> +              Mode Register 2.
>> +
>> +          nvidia,emc-mode-reset:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description:
>> +              Mode Register 0.
>> +
>> +          nvidia,emc-zcal-cnt-long:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description:
>> +              Number of EMC clocks to wait before issuing any commands after
>> +              sending ZCAL_MRW_CMD.
> 
> Valid range?

I'll add all the ranges in the next revision.

>> +
>> +          nvidia,emc-cfg-dyn-self-ref:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description:
>> +              Dynamic self-refresh enabled.
> 
> Sounds like a boolean?
> 
>> +
>> +          nvidia,emc-cfg-periodic-qrst:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            description:
>> +              FBIO "read" FIFO periodic resetting enabled.
> 
> boolean?

Yes, and it looked to me that it should be okay since that's what T124
binding uses and it makes the properties parsing in the driver's code a
bit neater :) I'll change them to booleans in the next revision to make
it clear.
