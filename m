From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] dt/bindings: Add bindings for Tegra GMI controller
Date: Tue, 9 Aug 2016 22:48:00 +0200
Message-ID: <CALw8SCVrQeZLQjkapLjk9Me=AVU4kbtOskem8jeEeYDK5tznGg@mail.gmail.com>
References: <1470512452-8322-1-git-send-email-mirza.krak@gmail.com>
 <1470512452-8322-4-git-send-email-mirza.krak@gmail.com> <901be576-a810-c630-9b83-de922e945df0@nvidia.com>
 <CALw8SCV61w6BgtBb8pY4czeB4yFmbtLmB2MuyrvGcvepmRpeBQ@mail.gmail.com> <5e0402db-10ce-75eb-cf95-d9e2d26e3efe@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5e0402db-10ce-75eb-cf95-d9e2d26e3efe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

2016-08-09 15:34 GMT+02:00 Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
>
> On 09/08/16 09:40, Mirza Krak wrote:
>> 2016-08-08 16:44 GMT+02:00 Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
>>>
>>> On 06/08/16 20:40, Mirza Krak wrote:
>>>> From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>

<--snip-->

>>>> + - nvidia,snor-we-width: Number of cycles during which WE stays asserted.
>>>> +   Valid values are 0-15, default is 1
>>>> + - nvidia,snor-oe-width: Number of cycles during which OE stays asserted.
>>>> +   Valid values are 0-255, default is 1
>>>> + - nvidia,snor-wait-width: Number of cycles before READY is asserted.
>>>> +   Valid values are 0-255, default is 3
>>>> +
>>>> +Example with two SJA1000 CAN controllers connected to the GMI bus:
>>>> +
>>>> +  gmi@70090000 {
>>>> +    #address-cells = <1>;
>>>> +    #size-cells = <1>;
>>>
>>> I think 0 for size makes sense. I know that caused you problems before,
>>> but I am wondering if ...
>>>
>>>> +    ranges;
>>>
>>> ... ranges is needed here? If we do have it, I am wondering if it should
>>> be a single entry for the chip-select that is being used. For now we
>>> could only support a ranges with one entry.
>>>
>>>         #address-cells = <1>;
>>>         #size-cells = <1>;
>>>         ranges = <4 0x48000000 0x00040000>;
>>
>> I prefer if we have "ranges" with one single entry, and warn if user enters
>> multiple for now, like we discussed earlier. Should have really done it in
>> this series.
>
> I think I do as well.
>
>>>
>>>> +    nvidia,snor-mux-mode;
>>>> +    nvidia,snor-adv-inv;
>>>> +    nvidia,snor-cs-select = <4>;
>>>
>>> I would have expected these under bus@X node as they are specific to the
>>> GMI CS.
>>
>> Yes, that is true.
>>
>>>
>>> I would also expect that the actual chip-select number is encoded in the
>>> reg property.
>>>
>>>> +
>>>> +    bus@0,0 {
>>>
>>> bus@4
>>
>> ACK.
>>
>>>
>>> No mention of this bus node in the above documentation.
>>
>> I was hesitant documenting it since I am not sure if we really need it
>> in a generic case? It does make sense in my
>> specific case. But what would it look like if we could maintain CS in software.
>>
>> Do you then have a bus node per CS? I am guessing not. Is it enough to
>> document it in my "example brief"?
>
> I see what you mean. May be it is fine to document with the examples
> below how child devices should be populated. You should also state that
> currently the GMI only supports one child device currently for the
> chip-select that is being used.

Should I really need to state that? Is it not always the case, that
you have one child device per chip-select?

Best Regards
Mirza
