From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] Documentation: DT bindings: Tegra AHB: note base
 address change
Date: Thu, 19 Mar 2015 11:46:44 -0600
Message-ID: <550B0B84.6050400@wwwdotorg.org>
References: <20150317083221.32662.14647.stgit@baseline> <20150317083221.32662.96822.stgit@baseline> <550859A0.9090500@wwwdotorg.org> <alpine.DEB.2.02.1503191528570.9480@utopia.booyaka.com> <550AEEE9.70806@wwwdotorg.org> <alpine.DEB.2.02.1503191617140.9480@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1503191617140.9480-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/19/2015 10:34 AM, Paul Walmsley wrote:
> On Thu, 19 Mar 2015, Stephen Warren wrote:
>
>> On 03/19/2015 09:33 AM, Paul Walmsley wrote:
>>> On Tue, 17 Mar 2015, Stephen Warren wrote:
>>>
>>>> On 03/17/2015 02:32 AM, Paul Walmsley wrote:
>>>>> For Tegra132 and later chips, we can now use the correct hardware base
>>>>> address for the Tegra AHB IP block in the DT data.  Update the DT
>>>>> binding
>>>>> documentation to reflect this change.
>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
>>>>> b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
>>>>> index 067c979..7692b4c 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
>>>>> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
>>>>> @@ -2,10 +2,15 @@ NVIDIA Tegra AHB
>>>>>
>>>>>     Required properties:
>>>>>     - compatible : For Tegra20, must contain "nvidia,tegra20-ahb".  For
>>>>> -  Tegra30, must contain "nvidia,tegra30-ahb".  Otherwise, must contain
>>>>> -  '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is tegra124,
>>>>> -  tegra132, or tegra210.
>>>>> -- reg : Should contain 1 register ranges(address and length)
>>>>> +  Tegra30, must contain "nvidia,tegra30-ahb".  For Tegra114 and
>>>>> Tegra124,
>>>>> must
>>>>> +  contain '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is
>>>>> tegra114
>>>>> +  or tegra124.  For Tegra132, the compatible string must contain
>>>>> +  "nvidia,tegra132-ahb".
>>>>> +
>>>>> +- reg : Should contain 1 register ranges(address and length).  On
>>>>> Tegra20,
>>>>> +  Tegra30, Tegra114, and Tegra124 chips, the low byte of the physical
>>>>> base
>>>>> +  address of the IP block must end in 0x04.  On DT files for later
>>>>> chips,
>>>>> the
>>>>> +  actual hardware base address of the IP block should be used.
>>>>
>>>> A table-based approach rather than prose might make this more legible?
>>>>
>>>> - compatible: Must contain the following:
>>>>     Tegra20:  "nvidia,tegra20-ahb"
>>>>     Tegra30:  "nvidia,tegra30-ahb"
>>>>     Tegra114: "nvidia,tegra114-ahb", "nvidia,tegra30-ahb"
>>>>     Tegra124: "nvidia,tegra124-ahb", "nvidia,tegra30-ahb"
>>>>     Tegra132: "nvidia,tegra132-ahb"
>>>>     Tegra210: "nvidia,tegra210-ahb", "nvidia,tegra132-ahb"
>>>>
>>>> With any luck, we can extend that final item for future chips to be:
>>>>
>>>>     Tegra210, TegraNNN:
>>>>               "nvidia,tegra<chip>-ahb", "nvidia,tegra132-ahb"
>>>>
>>>> Perhaps we format the 114/124 entry that way too.
>>>
>>> I think I'm just going to drop this patch, since Russell prefers that the
>>> workaround is applied in the driver.
>>>
>>> With regards to using tables rather than narrative descriptions: perhaps
>>> consider a patch to
>>> Documentation/devicetree/bindings/submitting-patches.txt ?  I don't know
>>> what the DT binding documentation maintainers' future plans are with
>>> regards to automated documentation reflow, etc., but submitting a patch
>>> there would stimulate at least some coordination on the issue.
>>
>> I don't think it's appropriate for that file to dictate that, in the same way
>> that coding style documentation generally doesn't address that kind of detail
>> regarding code structure.
>
> We do indeed specify details like this in our documentation guidelines.
> Here are two examples:
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/kernel-doc-nano-HOWTO.txt#n103
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/CodingStyle#n464

Perhaps I phrased my point slightly differently form the core of what I 
meant.

I'm not aware that review feedback can't address topics that are not 
already addressed by the documentation. Is there such a rule?

Equally, I think if you want the documentation to address a particular 
point, it's appropriate for you to submit a patch to the documentation 
to update it, rather than ask the reviewer to do so before accepting the 
review feedback.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
