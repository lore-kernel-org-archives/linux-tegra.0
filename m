From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 3/6] dt/bindings: Add bindings for Tegra GMI controller
Date: Wed, 10 Aug 2016 09:45:06 +0100
Message-ID: <d72d3f8f-6987-3623-077f-14485679e321@nvidia.com>
References: <1470512452-8322-1-git-send-email-mirza.krak@gmail.com>
 <1470512452-8322-4-git-send-email-mirza.krak@gmail.com>
 <901be576-a810-c630-9b83-de922e945df0@nvidia.com>
 <CALw8SCV61w6BgtBb8pY4czeB4yFmbtLmB2MuyrvGcvepmRpeBQ@mail.gmail.com>
 <5e0402db-10ce-75eb-cf95-d9e2d26e3efe@nvidia.com>
 <CALw8SCVrQeZLQjkapLjk9Me=AVU4kbtOskem8jeEeYDK5tznGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CALw8SCVrQeZLQjkapLjk9Me=AVU4kbtOskem8jeEeYDK5tznGg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mirza Krak <mirza.krak@gmail.com>
Cc: mark.rutland@arm.com, Alexandre Courbot <gnurou@gmail.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, pawel.moll@arm.com, Stephen Warren <swarren@wwwdotorg.org>, pdeschrijver@nvidia.com, ijc+devicetree@hellion.org.uk, sboyd@codeaurora.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 09/08/16 21:48, Mirza Krak wrote:
> 2016-08-09 15:34 GMT+02:00 Jon Hunter <jonathanh@nvidia.com>:
>>
>> On 09/08/16 09:40, Mirza Krak wrote:
>>> 2016-08-08 16:44 GMT+02:00 Jon Hunter <jonathanh@nvidia.com>:
>>>>
>>>> On 06/08/16 20:40, Mirza Krak wrote:
>>>>> From: Mirza Krak <mirza.krak@gmail.com>
>>>>>
> 
> <--snip-->
> 
>>>>> + - nvidia,snor-we-width: Number of cycles during which WE stays asserted.
>>>>> +   Valid values are 0-15, default is 1
>>>>> + - nvidia,snor-oe-width: Number of cycles during which OE stays asserted.
>>>>> +   Valid values are 0-255, default is 1
>>>>> + - nvidia,snor-wait-width: Number of cycles before READY is asserted.
>>>>> +   Valid values are 0-255, default is 3
>>>>> +
>>>>> +Example with two SJA1000 CAN controllers connected to the GMI bus:
>>>>> +
>>>>> +  gmi@70090000 {
>>>>> +    #address-cells = <1>;
>>>>> +    #size-cells = <1>;
>>>>
>>>> I think 0 for size makes sense. I know that caused you problems before,
>>>> but I am wondering if ...
>>>>
>>>>> +    ranges;
>>>>
>>>> ... ranges is needed here? If we do have it, I am wondering if it should
>>>> be a single entry for the chip-select that is being used. For now we
>>>> could only support a ranges with one entry.
>>>>
>>>>         #address-cells = <1>;
>>>>         #size-cells = <1>;
>>>>         ranges = <4 0x48000000 0x00040000>;
>>>
>>> I prefer if we have "ranges" with one single entry, and warn if user enters
>>> multiple for now, like we discussed earlier. Should have really done it in
>>> this series.
>>
>> I think I do as well.
>>
>>>>
>>>>> +    nvidia,snor-mux-mode;
>>>>> +    nvidia,snor-adv-inv;
>>>>> +    nvidia,snor-cs-select = <4>;
>>>>
>>>> I would have expected these under bus@X node as they are specific to the
>>>> GMI CS.
>>>
>>> Yes, that is true.
>>>
>>>>
>>>> I would also expect that the actual chip-select number is encoded in the
>>>> reg property.
>>>>
>>>>> +
>>>>> +    bus@0,0 {
>>>>
>>>> bus@4
>>>
>>> ACK.
>>>
>>>>
>>>> No mention of this bus node in the above documentation.
>>>
>>> I was hesitant documenting it since I am not sure if we really need it
>>> in a generic case? It does make sense in my
>>> specific case. But what would it look like if we could maintain CS in software.
>>>
>>> Do you then have a bus node per CS? I am guessing not. Is it enough to
>>> document it in my "example brief"?
>>
>> I see what you mean. May be it is fine to document with the examples
>> below how child devices should be populated. You should also state that
>> currently the GMI only supports one child device currently for the
>> chip-select that is being used.
> 
> Should I really need to state that? Is it not always the case, that
> you have one child device per chip-select?

I think so. Remember it is one child device for the GMI, however, that
child device could still have one than one child device (per you example
with two CANs). The GMI child represents the active chip-select and we
only currently support one with this driver.

Jon

-- 
nvpublic
