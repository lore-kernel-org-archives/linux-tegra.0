From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v3 04/13] of: document new emc-timings subnode in nvidia,tegra124-car
Date: Fri, 07 Nov 2014 14:03:51 +0100
Message-ID: <545CC337.4020409@collabora.com>
References: <1414599796-30597-1-git-send-email-tomeu.vizoso@collabora.com> <1414599796-30597-5-git-send-email-tomeu.vizoso@collabora.com> <545B172C.4060105@nvidia.com> <CAL_JsqKYSF3JVrXH_dkqRXQrgUU3igzvoK1C2k1Caz-4UuHX6Q@mail.gmail.com> <545C5927.3010001@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545C5927.3010001-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/07/2014 06:31 AM, Alexandre Courbot wrote:
> On 11/07/2014 12:12 AM, Rob Herring wrote:
>> On Thu, Nov 6, 2014 at 12:37 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> On 10/30/2014 01:22 AM, Tomeu Vizoso wrote:
>>>>
>>>> The EMC clock needs some extra information for changing its rate.
>>>>
>>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>>> ---
>>>>    .../bindings/clock/nvidia,tegra124-car.txt         | 46
>>>> +++++++++++++++++++++-
>>>>    1 file changed, 44 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
>>>> b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
>>>> index ded5d62..42e0588 100644
>>>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
>>>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
>>>> @@ -19,12 +19,35 @@ Required properties :
>>>>      In clock consumers, this cell represents the bit number in the CAR's
>>>>      array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
>>>>
>>>> +The node should contain a "emc-timings" subnode for each supported RAM
>>>> type (see
>>>> +field RAM_CODE in register PMC_STRAPPING_OPT_A), with its unit address
>>>> being its
>>>> +RAM_CODE.
>>>> +
>>>> +Required properties for "emc-timings" nodes :
>>>> +- nvidia,ram-code : Should contain the value of RAM_CODE this timing set
>>>> +  is used for.
>>>> +
>>>> +Each "emc-timings" node should contain a "timing" subnode for every
>>>> supported
>>>> +EMC clock rate. The "timing" subnodes should have the clock rate in Hz as
>>>> their
>>>> +unit address.
>>>
>>>
>>> This seems to be a quite liberal use of unit addresses (same in the next
>>> patch) - is this allowed by DT?
>>
>> No, unit address should match a reg property.
> 
> Mmm, would you have any suggestion as to how this can be fixed? Right 
> now what I can think of is either to replace the "clock-frequency" 
> property by "reg" (which would be confusing), or to use a different 
> naming scheme, e.g. timing-12750000. IIUC the naming is not essential 
> for properly parsing these nodes, so maybe the second solution is the 
> way to go?

Yeah, there seems to be a precedent for embedding the frequency in the
node name in the TI DTs, e.g.: virt_12000000_ck.

Thanks,

Tomeu
