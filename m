From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 3/4] power_supply: tps65090-charger: Add binding doc
Date: Tue, 05 Mar 2013 12:25:29 -0700
Message-ID: <513646A9.7000502@wwwdotorg.org>
References: <1362423709-29596-1-git-send-email-rklein@nvidia.com> <1362423709-29596-4-git-send-email-rklein@nvidia.com> <5136364B.7000506@wwwdotorg.org> <513643A6.4020109@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <513643A6.4020109-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/05/2013 12:12 PM, Rhyland Klein wrote:
> On 3/5/2013 1:15 PM, Stephen Warren wrote:
>> On 03/04/2013 12:01 PM, Rhyland Klein wrote:
>>> This change adds the binding documentation for the tps65090-charger.
>>> diff --git
>>> a/Documentation/devicetree/bindings/power_supply/tps65090.txt
>>> b/Documentation/devicetree/bindings/power_supply/tps65090.txt
>> ...
>>> +Example:
>>> +
>>> +    tps65090@48 {
>> ...
>>> +        regulators {
>>> +            ...
>>> +        };
>>
>> The "regulators" node in the example isn't mentioned in the list of
>> properties/nodes that's above. What goes in there? You probably want to
>> include text similar to what I've quoted below from
>> Documentation/devicetree/bindings/regulator/tps6586x.txt:
>>
>>> - regulators: A node that houses a sub-node for each regulator within the
>>>    device. Each sub-node is identified using the node's name (or the deprecated
>>>    regulator-compatible property if present), with valid values listed below.
>>>    The content of each sub-node is defined by the standard binding for
>>>    regulators; see regulator.txt.
>>>    sys, sm[0-2], ldo[0-9] and ldo_rtc
>
> The reason I didn't bother documenting the regulators node was that
> since this is a child device
> driver of an mfd device, there is already a child driver for the
> regulators with its own documentation
> 
> https://patchwork.kernel.org/patch/2051381/

Ah, I see.

> I wasn't sure how I should handle this, as splitting the bindings to
> make logic sense in the binding
> layout (charger under power_supply, and  regulators under regulator) or
> combine them somehow
> into a single documentation entry common to the device. The latter seems
> to make more sense to me,

Yes, given we're talking about properties in the same node, rather than
a binding for a new child node that could be plugged into arbitrary
parent nodes, I think everything should be documented in a single file.

> but since there aren't any dt specific entries for the core mfd part
> currently, it doesn't have its own
> documentation, and sticking the charger info under the regulators seemed
> backwards to me.

Hmmm. That's a good question. I'm not really sure where the best
location for that file would be. Admittedly regulators does seem
slightly over-specific, but short of creating a new bindings/mfd/
directory, it doesn't seem to unreasonable to just put the whole binding
in the existing file in bindings/regulators/.

Perhaps Grant or Rob can comment on what their preference would be.
