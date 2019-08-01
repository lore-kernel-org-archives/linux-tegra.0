From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v9 09/15] dt-bindings: memory: tegra30: Convert to
 Tegra124 YAML
Date: Thu, 1 Aug 2019 20:52:12 +0300
Message-ID: <58e25c92-a61d-54f1-e784-ed85804236d7@gmail.com>
References: <20190730165618.10122-1-digetx@gmail.com>
 <20190730165618.10122-10-digetx@gmail.com>
 <CAL_JsqL_LA+cW2GbCMdzRTFuv2oKE3pzyOm2UwdzLVLyVTnmNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL_LA+cW2GbCMdzRTFuv2oKE3pzyOm2UwdzLVLyVTnmNw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

01.08.2019 19:25, Rob Herring пишет:
> On Tue, Jul 30, 2019 at 10:58 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> The Tegra30 binding will actually differ from the Tegra124 a tad, in
>> particular the EMEM configuration description. Hence rename the binding
>> to Tegra124 during of the conversion to YAML.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../nvidia,tegra124-mc.yaml                   | 158 ++++++++++++++++++
>>  .../memory-controllers/nvidia,tegra30-mc.txt  | 123 --------------
>>  2 files changed, 158 insertions(+), 123 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
>> new file mode 100644
>> index 000000000000..2e2a116f1911
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
>> @@ -0,0 +1,158 @@
>> +# SPDX-License-Identifier: (GPL-2.0)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-mc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NVIDIA Tegra124 SoC Memory Controller
>> +
>> +maintainers:
>> +  - Jon Hunter <jonathanh@nvidia.com>
>> +  - Thierry Reding <thierry.reding@gmail.com>
>> +
>> +description: |
>> +  Tegra124 SoC features a hybrid 2x32-bit / 1x64-bit memory controller.
>> +  These are interleaved to provide high performance with the load shared across
>> +  two memory channels. The Tegra124 Memory Controller handles memory requests
>> +  from internal clients and arbitrates among them to allocate memory bandwidth
>> +  for DDR3L and LPDDR3 SDRAMs.
>> +
>> +properties:
>> +  compatible:
>> +    const: nvidia,tegra124-mc
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
>> +      Physical base address.
> 
> You don't really need a description when there's only 1 item. Same on
> the others below.
> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Okay, I'll change that in the next revision. I also assume that the r-b
applies to all three patches, otherwise please let me know. Thanks!
