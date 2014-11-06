From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 04/13] of: document new emc-timings subnode in nvidia,tegra124-car
Date: Thu, 6 Nov 2014 18:15:38 +0900
Message-ID: <545B3C3A.3090902@nvidia.com>
References: <1414599796-30597-1-git-send-email-tomeu.vizoso@collabora.com> <1414599796-30597-5-git-send-email-tomeu.vizoso@collabora.com> <545B172C.4060105@nvidia.com> <CAAObsKBe8kigKfEs_ER+1X5fqLw3dZD69XHicEn4cVuQTyoFAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAObsKBe8kigKfEs_ER+1X5fqLw3dZD69XHicEn4cVuQTyoFAw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/06/2014 06:11 PM, Tomeu Vizoso wrote:
> On 6 November 2014 07:37, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 10/30/2014 01:22 AM, Tomeu Vizoso wrote:
>>>
>>> The EMC clock needs some extra information for changing its rate.
>>>
>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>> ---
>>>    .../bindings/clock/nvidia,tegra124-car.txt         | 46
>>> +++++++++++++++++++++-
>>>    1 file changed, 44 insertions(+), 2 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
>>> b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
>>> index ded5d62..42e0588 100644
>>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
>>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
>>> @@ -19,12 +19,35 @@ Required properties :
>>>      In clock consumers, this cell represents the bit number in the CAR's
>>>      array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
>>>
>>> +The node should contain a "emc-timings" subnode for each supported RAM
>>> type (see
>>> +field RAM_CODE in register PMC_STRAPPING_OPT_A), with its unit address
>>> being its
>>> +RAM_CODE.
>>> +
>>> +Required properties for "emc-timings" nodes :
>>> +- nvidia,ram-code : Should contain the value of RAM_CODE this timing set
>>> +  is used for.
>>> +
>>> +Each "emc-timings" node should contain a "timing" subnode for every
>>> supported
>>> +EMC clock rate. The "timing" subnodes should have the clock rate in Hz as
>>> their
>>> +unit address.
>>
>>
>> This seems to be a quite liberal use of unit addresses (same in the next
>> patch) - is this allowed by DT?
>
> Well, it's not that different from using the register address. I think
> it helps with readability more than an arbitrary index.
>
>>> +
>>> +Required properties for "timing" nodes :
>>> +- clock-frequency : Should contain the memory clock rate to which this
>>> timing
>>> +relates.
>>> +- nvidia,parent-clock-frequency : Should contain the rate at which the
>>> current
>>> +parent of the EMC clock should be running at this timing.
>>> +- clocks : Must contain an entry for each entry in clock-names.
>>> +  See ../clocks/clock-bindings.txt for details.
>>> +- clock-names : Must include the following entries:
>>> +  - emc-parent : the clock that should be the parent of the EMC clock at
>>> this
>>> +timing.
>>> +
>>>    Example SoC include file:
>>>
>>>    / {
>>> -       tegra_car: clock {
>>> +       tegra_car: clock@0,60006000 {
>>>                  compatible = "nvidia,tegra124-car";
>>> -               reg = <0x60006000 0x1000>;
>>> +               reg = <0x0 0x60006000 0x0 0x1000>;
>>>                  #clock-cells = <1>;
>>>                  #reset-cells = <1>;
>>>          };
>>> @@ -60,4 +83,23 @@ Example board file:
>>>          &tegra_car {
>>>                  clocks = <&clk_32k> <&osc>;
>>>          };
>>> +
>>> +       clock@0,60006000 {
>>> +               emc-timings@3 {
>>> +                       nvidia,ram-code = <3>;
>>> +
>>> +                       timing@12750000 {
>>> +                               clock-frequency = <12750000>;
>>> +                               nvidia,parent-clock-frequency =
>>> <408000000>;
>>> +                               clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
>>> +                               clock-names = "emc-parent";
>>> +                       };
>>> +                       timing@20400000 {
>>> +                               clock-frequency = <20400000>;
>>> +                               nvidia,parent-clock-frequency =
>>> <408000000>;
>>> +                               clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
>>> +                               clock-names = "emc-parent";
>>> +                       };
>>> +               };
>>> +       };
>>
>>
>> At first it seems confusing to see a top-level node without a compatible
>> property, until you realize it has already been defined before.
>>
>> In patch 05, you put "Example board file:" above a similar node, which is
>> enough to lift that ambiguity - could you do the same here?
>
> Oh, actually it was already in the file. I took this idea from here
> for patch 05.

My bad, missed it!

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
