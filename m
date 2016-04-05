From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v10 3/9] dt-bindings: phy: tegra-xusb-padctl: Add Tegra210
 support
Date: Tue, 5 Apr 2016 15:10:16 -0600
Message-ID: <570429B8.3060002@wwwdotorg.org>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-3-git-send-email-thierry.reding@gmail.com>
 <56E99F10.1060508@wwwdotorg.org> <20160405144416.GA10809@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160405144416.GA10809-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/05/2016 08:44 AM, Thierry Reding wrote:
> On Wed, Mar 16, 2016 at 11:59:44AM -0600, Stephen Warren wrote:
>> On 03/04/2016 09:19 AM, Thierry Reding wrote:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Extend the binding to cover the set of feature found in Tegra210.
>>
>> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>>
>>> +	padctl@0,7009f000 {
>> ...
>>> +		pads {
>> ...
>>> +		};
>>> +
>>> +		ports {
>> ...
>>> +		};
>>
>> As a comment not affecting my ack in any way: At the top-level, we place all
>> the child nodes into "array container" nodes named "pads" and "ports". This
>> is nice since it separates different types of child nodes and allows easily
>> adding more types of child nodes in the future without interference, and in
>> a way that allows us to explicitly know what each node is without having to
>> interpret its name or compatible value to do so. However, we haven't done
>> this with the per-lane child nodes inside each pad. If we were to rev the
>> design, I'd be tempted to suggest:
>>
>> 	padctl@0,7009f000 {
>> 		pads {
>> 			usb2 {
>> 				lanes { // This level is new
>> 					usb2-0 {
>
> I tried to make this work, but it's unfortunately not possible with the
> current code. The reason is that the PHY subsystem assumes that either
> the provider DT node corresponds to that of the device (the usb2 pad in
> the above example) or one of its children. Hence, putting everything
> into one more level further down would require some mechanism to tell
> the subsystem about it so that it can be found.

When the padctl driver registers the PHY objects with the PHY subsystem, 
can it pass the lanes node as the DT node? That woulud mean each lane 
/was/ a child of the node registered with the PHY subsystem.

Perhaps the PHY subsystem requires a struct device rather than a DT node 
registered with it? If so, does it make sense to create a separate 
struct device with the of_node pointing at lanes{}?

> Arguably the current support code isn't a good argument for designing a
> binding, so perhaps it'd be useful to add this mechanism in order to get
> a better binding. On the other hand, I'm not sure it's really worth it,
> since we already have generic bindings that specify the layout of child
> devices, and those have been agreed upon broadly (presumably).
>
> In light of the recent discussion on DPAUX vs. I2C, I see how having the
> extra level would be useful to provide additional context. If you think
> it's worth it I can spend the extra time to get this implemented in the
> core.

Naively, it sounds like it'd be a good idea to fix the PHY core. It 
really shouldn't care about the parent of any object registered with it; 
it should only interact with the specific object it was given, and any 
other data such as "ops" callbacks. Do you have any inkling how much 
work that would be?

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
