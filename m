From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 5/6] dt-bindings: ARM: tegra: Add ASUS Google Nexus 7
Date: Thu, 2 Apr 2020 17:52:51 +0300
Message-ID: <4c059f4a-111a-086b-c165-eb8ae798d606@gmail.com>
References: <20200331214327.6496-1-digetx@gmail.com>
 <20200331214327.6496-6-digetx@gmail.com>
 <20200402045008.GB11124@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200402045008.GB11124-cHozx32mtrEEUmgCuDUIdw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Pedro_=c3=82ngelo?= <pangelo-yxaQD43p5Qo@public.gmane.org>, Matt Merhar <mattmerhar-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

02.04.2020 07:50, Michał Mirosław пишет:
> On Wed, Apr 01, 2020 at 12:43:26AM +0300, Dmitry Osipenko wrote:
>> Add a binding for the Tegra30-based ASUS Google Nexus 7 tablet device.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/tegra.yaml | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
>> index 7fd0b66c69b2..fb3bbf7a5fb4 100644
>> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
>> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
>> @@ -62,6 +62,13 @@ properties:
>>                - toradex,colibri_t30-eval-v3
>>            - const: toradex,colibri_t30
>>            - const: nvidia,tegra30
>> +      - items:
>> +          - const: asus,grouper
>> +          - const: nvidia,tegra30
>> +      - items:
>> +          - const: asus,tilapia
>> +          - const: asus,grouper
>> +          - const: nvidia,tegra30
>>        - items:
>>            - enum:
>>                - nvidia,dalmore
> 
> Is it really necessary to list every possible device using a SoC chip?

Yes, otherwise make dtbs_check will give you a warning about the unknown
compatible.

> Wouldn't it be enough to just list SoC value nvidia,tegraXYZ and allow
> any other supplemental "compatibles"?

I don't know what was the initial intention of having boards defined in
a way it's currently done, maybe Rob;Thierry;Stephen;Jon could clarify?
