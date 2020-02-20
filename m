From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v3 3/6] dt-binding: tegra: Add VI and CSI bindings
Date: Thu, 20 Feb 2020 12:39:35 -0800
Message-ID: <a41f3a6c-c6ed-4148-7af8-faf0cf36d67d@nvidia.com>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-4-git-send-email-skomatineni@nvidia.com>
 <20200218231503.GA19099@bogus>
 <5948bf42-9be2-8cf0-1c28-80f69b708c65@nvidia.com>
 <CAL_JsqKAVBS-KvP60Bv2JBQjUzTUgicx33nShn4enFpvysS9YA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKAVBS-KvP60Bv2JBQjUzTUgicx33nShn4enFpvysS9YA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Frank Chen <frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Helen Koike <helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 2/20/20 11:45 AM, Rob Herring wrote:
> External email: Use caution opening links or attachments
>
>
> On Tue, Feb 18, 2020 at 9:28 PM Sowjanya Komatineni
> <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>
>> On 2/18/20 3:15 PM, Rob Herring wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Fri, Feb 14, 2020 at 10:23:25AM -0800, Sowjanya Komatineni wrote:
>>>> Tegra contains VI controller which can support up to 6 MIPI CSI
>>>> camera sensors.
>>>>
>>>> Each Tegra CSI port from CSI unit can be one-to-one mapper to
>>>> VI channel and can capture from an external camera sensor or
>>>> from built-in test pattern generator.
>>>>
>>>> This patch adds dt-bindings for Tegra VI and CSI.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>    .../display/tegra/nvidia,tegra20-host1x.txt        | 55 ++++++++++++++++++----
>>>>    1 file changed, 47 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>>>> index 9999255ac5b6..3d0ed540a646 100644
>>>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>>>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>>>> @@ -40,14 +40,24 @@ of the following host1x client modules:
>>>>
>>>>      Required properties:
>>>>      - compatible: "nvidia,tegra<chip>-vi"
>>>> -  - reg: Physical base address and length of the controller's registers.
>>>> +  - reg: Physical base address and length of the controller registers.
>>>>      - interrupts: The interrupt outputs from the controller.
>>>> -  - clocks: Must contain one entry, for the module clock.
>>>> +  - clocks: Must contain an entry for the module clock "vi"
>>>>        See ../clocks/clock-bindings.txt for details.
>>>>      - resets: Must contain an entry for each entry in reset-names.
>>>>        See ../reset/reset.txt for details.
>>>> -  - reset-names: Must include the following entries:
>>>> -    - vi
>>>> +  - reset-names: Must include the entry "vi"
>>>> +
>>>> +  Tegra210 has CSI part of VI sharing same host interface and register
>>>> +  space. So, VI device node should have CSI child node.
>>>> +
>>>> +  - csi: mipi csi interface to vi
>>>> +
>>>> +    Required properties:
>>>> +    - compatible: "nvidia,tegra<chip>-csi"
>>>> +    - reg: Physical base address and length of the controller registers.
>>>> +    - clocks: Must contain entries csi, cilab, cilcd, cile clocks.
>>>> +      See ../clocks/clock-bindings.txt for details.
>>>>
>>>>    - epp: encoder pre-processor
>>>>
>>>> @@ -310,12 +320,41 @@ Example:
>>>>                 };
>>>>
>>>>                 vi {
>>>> -                     compatible = "nvidia,tegra20-vi";
>>>> -                     reg = <0x54080000 0x00040000>;
>>>> +                     compatible = "nvidia,tegra210-vi";
>>>> +                     reg = <0x0 0x54080000 0x0 0x700>;
>>>>                         interrupts = <0 69 0x04>;
>>>> -                     clocks = <&tegra_car TEGRA20_CLK_VI>;
>>>> -                     resets = <&tegra_car 100>;
>>>> +                     assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
>>>> +                     assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
>>>> +                     clocks = <&tegra_car TEGRA210_CLK_VI>;
>>>> +                     clock-names = "vi";
>>>> +                     resets = <&tegra_car 20>;
>>>>                         reset-names = "vi";
>>>> +
>>>> +                     #address-cells = <2>;
>>>> +                     #size-cells = <2>;
>>>> +
>>>> +                     ranges = <0x0 0x54080808 0x0 0x54080808 0x0 0x2000>;
>>>> +
>>>> +                     csi@0x54080838 {
>>> Drop '0x'
>> Will fix in v4
>>>> +                             compatible = "nvidia,tegra210-csi";
>>>> +                             reg = <0x0 0x54080838 0x0 0x2000>;
>>> Kind of odd that this address and ranges address are not the same. And
>>> also wrong that the size here exceeds the bounds of ranges.
>>>
>>> Also, best practice is to make the child address 0 or relative to the
>>> parent.
>> Actual CSI starts at offset 0x808 but we don't use couple of registers
>> at offset 0x808.
>>
>> Will update ranges in v4 to start from 0x838 offset and will make child
>> address relative to parent.
> Seems odd, but okay. And you will never, ever need to use those
> registers no matter what, and we can reject any DT change trying to
> change it later?
>
> Rob

Yes not required to access them by driver.

On T210, CSI registers under VI starts from location 0x54080808

SW don't need to access initial 3 registers at 0x54080808, 0x54080818, 
0x54080828

Actual CSI registers that are needed for SW starts from 0x54080838.
