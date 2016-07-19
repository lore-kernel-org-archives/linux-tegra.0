From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add DT binding for Tegra186 BPMP I2C
Date: Mon, 18 Jul 2016 20:52:24 -0500
Message-ID: <CAL_JsqLqCC+rN61Wu5J08MsnV9anFrNr=2eHWWcjEcUZAapucA@mail.gmail.com>
References: <20160707193711.5891-1-swarren@wwwdotorg.org> <20160716210728.GA22144@rob-hp-laptop>
 <578D00DB.4080307@wwwdotorg.org> <CAL_JsqKuV+nMCBChBGAHzVWBPEbtDB3T=nOukR9159izEz6maQ@mail.gmail.com>
 <578D66DA.5030307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <578D66DA.5030307-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 18, 2016 at 6:31 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 07/18/2016 03:00 PM, Rob Herring wrote:
>>
>> On Mon, Jul 18, 2016 at 11:16 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>> wrote:
>>>
>>> On 07/16/2016 03:07 PM, Rob Herring wrote:
>>>>
>>>>
>>>> On Thu, Jul 07, 2016 at 01:37:11PM -0600, Stephen Warren wrote:
>>>>>
>>>>>
>>>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>
>>>>> In Tegra186, the BPMP (Boot and Power Management Processor) owns
>>>>> certain
>>>>> HW devices, such as the I2C controller for the power management I2C
>>>>> bus.
>>>>> Software running on other CPUs must perform IPC to the BPMP in order to
>>>>> execute transactions on that I2C bus. This binding describes an I2C bus
>>>>> that is accessed in such a fashion.
>>>>>
>>>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>> ---
>>>>>    .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt      | 35
>>>>> ++++++++++++++++++++++
>>>>>    1 file changed, 35 insertions(+)
>>>>>    create mode 100644
>>>>> Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
>>>>> b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
>>>>> new file mode 100644
>>>>> index 000000000000..eb9f70723ab7
>>>>> --- /dev/null
>>>>> +++
>>>>> b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
>>>>> @@ -0,0 +1,35 @@
>>>>> +NVIDIA Tegra186 BPMP I2C controller
>>>>> +
>>>>> +In Tegra186, the BPMP (Boot and Power Management Processor) owns
>>>>> certain
>>>>> HW
>>>>> +devices, such as the I2C controller for the power management I2C bus.
>>>>> Software
>>>>> +running on other CPUs must perform IPC to the BPMP in order to execute
>>>>> +transactions on that I2C bus. This binding describes an I2C bus that
>>>>> is
>>>>> +accessed in such a fashion.
>>>>> +
>>>>> +Required properties:
>>>>> +- compatible:
>>>>> +    Array of strings.
>>>>> +    One of:
>>>>> +    - "nvidia,tegra186-bpmp-i2c".
>>>>> +- address-cells: Address cells for I2C device address.
>>>>> +    Single-cell integer.
>>>>> +    Must be <1>.
>>>>> +- size-cells:
>>>>> +    Single-cell integer.
>>>>> +    Must be <0>.
>>>>> +- nvidia,bpmp:
>>>>> +    The phandle to the BPMP device.
>>>>
>>>>
>>>>
>>>> Any reason to not make this a sub-node of the BPMP device?
>>>
>>>
>>>
>>> That would be possible too.
>>>
>>> My thought process was along the lines of: The system has an I2C bus,
>>> which
>>> deserves a DT node. That fact seemed more important than the access
>>> mechanism; the fact it's accessed via BPMP rather than direct register
>>> access felt a bit more like an implementation detail. Still, I suppose we
>>> could flip it around and store the node underneath the BPMP if you want;
>>> let
>>> me know.
>>
>>
>> I prefer to utilize the hierarchy unless there are reasons it can't be
>> which doesn't seem to be the case here.
>
>
> OK, how does the following look? If it seems OK, I'll write up the binding
> changes:
>
>>         bpmp: bpmp {
>>                 compatible = "nvidia,tegra186-bpmp";
>
> ...
>>
>>                 #clock-cells = <1>;
>>                 #power-domain-cells = <1>;
>>                 #reset-cells = <1>;
>>
>>                 sub-devices {
>>                         #address-cells = <1>;
>>                         #size-cells = <0>;
>
> // There actually aren't any registers, so perhaps those two aren't
> // needed. Perhaps those two properties should be dropped?
>>
>>
>>                         bpmp-i2c {
>>                                 compatible = "nvidia,tegra186-bpmp-i2c";
>>                                 nvidia,bpmp-bus-id = <5>;

Given you need this bus number, what about doing "i2c@5" for the node
and using reg property. After all, that is how you "address" the bus.

>>                                 #address-cells = <1>;
>>                                 #size-cells = <0>;
>>                                 status = "disabled";
>>                         };
>>                 };
>>         };
>
>
> Rationale:
>
> There may be more than 1 I2C bus, so we need a structure that can house n of
> them.
>
> It's plausible the BPMP could support other sub-device-types in the future
> that each need their own node, so it's useful to have a scheme that supports
> arbitrary sub-devices, each using compatible values to define what they are.
>
> We house the sub-devices in an explicit "sub-devices" node, rather than
> directly as children of the top-level bpmp node, so that the BPMP can
> separate any sub-nodes it uses for its own top-level configuration from
> sub-nodes that represent child-/sub-devices. This keeps things clean, and
> allows additions to the bpmp binding without complicating how sub-devices
> are enumerated. This is rather like the recent optinonal i2c-bus child node
> of I2C controllers.
>
> Sound good?

I'm not crazy about having the extra layer, but I'm not going to
object. I'd argue that i2c@X is unique enough.

Rob
