From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Patch v3 3/4] power_supply: tps65090-charger: Add binding doc
Date: Wed, 13 Mar 2013 17:08:30 -0400
Message-ID: <5140EACE.80802@nvidia.com>
References: <1363126089-9071-1-git-send-email-rklein@nvidia.com> <1363126089-9071-4-git-send-email-rklein@nvidia.com> <513FB5D7.5090800@wwwdotorg.org> <5140D2C1.8020507@nvidia.com> <5140E48D.60501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5140E48D.60501-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 3/13/2013 4:41 PM, Stephen Warren wrote:
> On 03/13/2013 01:25 PM, Rhyland Klein wrote:
>> On 3/12/2013 7:10 PM, Stephen Warren wrote:
>>> On 03/12/2013 04:08 PM, Rhyland Klein wrote:
>>>> This change adds the binding documentation for the tps65090-charger.
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/power_supply/tps65090.txt
>>>> b/Documentation/devicetree/bindings/power_supply/tps65090.txt
>>>> +Example:
>>>> +
>>>> +    tps65090@48 {
>>>> +        compatible = "ti,tps65090";
>>>> +        reg = <0x48>;
>>>> +        interrupts = <0 88 0x4>;
>>>> +
>>>> +        ti,enable-low-current-chrg;
>>>> +
>>>> +        regulators {
>>>> +            ...
>>>> +        };
>>> I'm a little confused by this binding.
>>>
>>> What goes in the regulators sub-node; is that specified by another
>>> binding file in bindings/regulator/tps65090.txt?
>>>
>>> I would expect one of the following:
>>>
>>> 1) A single binding file that describes absolutely everything in the
>>> chip. In this case, the main TPS65909 node wouldn't have child nodes for
>>> the MFD components, although the regulators sub-node, which in turn
>>> contains children does still make sense.
>>>
>>> 2) A separate binding for each component block, and perhaps also some
>>> top-level binding that indicates which child bindings can "plug into"
>>> it. In this case, I'd expect each block to be represented as a sub-node
>>> in DT. The overall regulator component might then still have a
>>> regulators child DT node itself, to represent each regulator's
>>> configuration. In this scenario, each binding document describes the
>>> entirety of a single node.
>>>
>>> I think what you've got here is a hybrid; a single top-level node, but
>>> different binding documents defining the various properties that are
>>> relevant to each component block in the device. That seems odd to me.
>>
>> Yes we started this discussion before and were discussing the proper
>> arrangement of
>
> (your message was wrapped far over 80 columns, please restrict to
> something like 72-74 or so).

Apparently line wrapping only works properly on thunderbird if you force 
it to plain text (which of course I think I had...) all better now.

>
>> documentation when dealing with devices like these. This is where the
>> drivers/ directory
>> naming in the binding docs might diverge a bit as it might make less
>> sense to have
>> a binding doc for each child component of an mfd.
>
> I think your discussion swaps #1 and #2 relative to my list above? It
> certainly makes more sense if I read it that way.

Yep you're right, I swapped them.

>
>> I was thinking about moving this driver towards #1 above, and using a
>> child node for
>> the charger. I would then also move the regulators to a child node, and
>> its structure would
>> be very similar to the Palmas driver/dt representation. My only concern
>> was that, from
>> what I understood, separating out the child node implied that the child
>> functionality
>> could/might be used somewhere else. Say in this case, that the charger
>> functionality might
>> be duplicated in another pmic from ti.
>
> Having separate nodes certainly makes it easy to /allow/ that. I don't
> think it /requires/ that TI release (or plan to release) another chip
> containing that IP block.
>
>> I don't know how much that is the case with the
>> tps65090 and so I am unsure if child nodes are the correct way to go.
>
> Thinking more about this, separate child nodes for separate IP blocks do
> start to make some sense. They definitely do allow easy
> binding/driver/... re-use if future chips come out with the same
> sub-block. Similarly, they neatly isolate each sub-block's binding from
> the others, so (a) avoid any conflicts between what the different IP
> blocks want to put in their nodes, like a list of regulators vs. using
> sub-nodes for other purposes, such as an integrate I2C mux with I2C bus
> child nodes, etc, and (b) the bindings can be defined separately thus
> avoiding the "where do we put the binding file" issue.
>
> It's certainly more work, but now I tend to think separate nodes are the
> way to go.

I agree, I think this is definitely a much cleaner way of doing it, then 
each component gets its own documentation file and is clean.

-rhyland

-- 
nvpublic
