From: Kyle Huey <me-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>
Subject: Re: [RESEND PATCH v3] ARM: tegra124: pmu support
Date: Mon, 27 Jul 2015 09:46:27 -0700
Message-ID: <CAP045Aoz4hzBSiZfbuE9jjbFggt=_ZBY4t6TVGL6ELwpi3Ue2Q@mail.gmail.com>
References: <1436808945-14524-1-git-send-email-khuey@kylehuey.com>
	<20150717085946.GB3057@ulmo>
	<CAP045ArZ0PUcpiWYeXsHbjo6BR3YD-ZzTRsBskZzUaQXfOohrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAP045ArZ0PUcpiWYeXsHbjo6BR3YD-ZzTRsBskZzUaQXfOohrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:TEGRA ARCHITECTUR..." <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Jul 18, 2015 at 6:54 AM, Kyle Huey <me-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org> wrote:
> On Fri, Jul 17, 2015 at 4:59 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Mon, Jul 13, 2015 at 10:35:45AM -0700, Kyle Huey wrote:
>>> This patch modifies the device tree for tegra124 based devices to enable
>>> the Cortex A15 PMU.  The interrupt numbers are taken from NVIDIA TRM
>>> DP-06905-001_v03p.  This patch was tested on a Jetson TK1.
>>>
>>> Updated for proper ordering and to add interrupt-affinity values.
>>>
>>> Signed-off-by: Kyle Huey <khuey-OhBmq/TcCDJWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/tegra124.dtsi | 17 +++++++++++++----
>>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> Is there any way to test this? What are the effects of adding this?
>
> Yes.  This enables the ARM PMU driver for the Cortex A15, which allows
> one to use hardware performance counters via the perf_event_open API.
> For a simple test program, see
> https://github.com/khuey/perf-counter-test/.  Without this patch, the
> perf_event_open syscall will fail.  With this patch, the program will
> print out the performance counter value for each iteration of the
> loop. (IIRC on the A15 the branch counter was removed, so you may want
> to replace 0xD with 0x8 which counts instructions executed if you want
> to see a non-zero number there).  You also will see a message about
> the PMU in the kernel log at startup after applying this patch.
>
> I have also tested this extensively (including the interrupt features
> of the PMU) on a more complex program.
>
>> Does it enable using perf for profiling?
>
> I have not tested it, but I believe you can use perf without this
> patch if you do not use features that require hardware performance
> counter support.  This patch would enable those features.
>
>>> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
>>> index 13cc7ca..de07d7e 100644
>>> --- a/arch/arm/boot/dts/tegra124.dtsi
>>> +++ b/arch/arm/boot/dts/tegra124.dtsi
>>> @@ -918,31 +918,40 @@
>>>               #address-cells = <1>;
>>>               #size-cells = <0>;
>>>
>>> -             cpu@0 {
>>> +             A15_0: cpu@0 {
>>>                       device_type = "cpu";
>>>                       compatible = "arm,cortex-a15";
>>>                       reg = <0>;
>>>               };
>>>
>>> -             cpu@1 {
>>> +             A15_1: cpu@1 {
>>>                       device_type = "cpu";
>>>                       compatible = "arm,cortex-a15";
>>>                       reg = <1>;
>>>               };
>>>
>>> -             cpu@2 {
>>> +             A15_2: cpu@2 {
>>>                       device_type = "cpu";
>>>                       compatible = "arm,cortex-a15";
>>>                       reg = <2>;
>>>               };
>>>
>>> -             cpu@3 {
>>> +             A15_3: cpu@3 {
>>>                       device_type = "cpu";
>>>                       compatible = "arm,cortex-a15";
>>>                       reg = <3>;
>>>               };
>>>       };
>>>
>>> +     pmu {
>>> +             compatible = "arm,cortex-a15-pmu";
>>> +             interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
>>> +             interrupt-affinity = <&A15_0>, <&A15_1>, <&A15_2>, <&A15_3>;
>>
>> These labels look somewhat artificial to me, perhaps we could do
>> something like the following instead?
>>
>>         interrupt-affinity = <&{/cpus/cpu@0}>, ...;
>>
>> That's slightly more obvious and avoids the need to "invent" labels for
>> the CPUs.
>>
>> No need to respin, I can fix that up when applying if nobody objects to
>> using the alternative notation.
>>
>> Thierry
>
> I have no objections.  I was not aware that the device tree syntax
> supported that.  FWIW I cargo-culted my way to victory from
> vexpress-v2p-ca9.dts here.
>
> - Kyle

Anything else I can do to help move this along?

- Kyle
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
