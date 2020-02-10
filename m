From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: sound: tegra: add DT binding for AHUB
Date: Mon, 10 Feb 2020 17:00:56 +0530
Message-ID: <af58b6b2-25b2-e968-73c9-d87e1a9e2746@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-2-git-send-email-spujar@nvidia.com>
 <20200206181045.GA31521@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200206181045.GA31521@bogus>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2/6/2020 11:40 PM, Rob Herring wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, Jan 30, 2020 at 04:03:34PM +0530, Sameer Pujar wrote:
>> Audio Hub (AHUB) comprises a collection of hardware accelerators for audio
>> pre-processing and post-processing and a programmable full crossbar for
>> audio routing across these accelerators. This patch adds YAML schema for DT
>> binding of AHUB and few of its following components. These devices will be
>> registered as ASoC components.
>>   * ADMAIF
>>   * I2S
>>   * DMIC
>>   * DSPK
>>
>> Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   .../bindings/sound/nvidia,tegra186-dspk.yaml       | 105 +++++++++++++
>>   .../bindings/sound/nvidia,tegra210-admaif.yaml     | 165 +++++++++++++++++++++
>>   .../bindings/sound/nvidia,tegra210-ahub.yaml       | 130 ++++++++++++++++
>>   .../bindings/sound/nvidia,tegra210-dmic.yaml       | 105 +++++++++++++
>>   .../bindings/sound/nvidia,tegra210-i2s.yaml        | 112 ++++++++++++++
>>   5 files changed, 617 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
>>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> new file mode 100644
>> index 0000000..dc9fef3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>> @@ -0,0 +1,105 @@
>> +# SPDX-License-Identifier: (GPL-2.0)
. . .
>> +    items:
>> +      - description: initial module clock rate
>> +
>> +  "#sound-dai-cells":
>> +    const: 1
>> +
>> +  sound-name-prefix:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description:
>> +      Used as prefix for sink/source names of the component. Must be a
>> +      unique string among multiple instances of the same component.
>> +      The name can be "DSPK1" or "DSPKx", where x depends on the maximum
> Sounds like a constraint.

Is there a better way to convey the recommended strings above?

All the other comments I will fix in next revision. Thanks.
. . .
