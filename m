From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 4/9] tegra: fdt: i2c: Add extra I2C bindings for U-Boot
Date: Wed, 07 Mar 2012 13:35:09 -0700
Message-ID: <4F57C67D.9030903@wwwdotorg.org>
References: <1330536689-9121-5-git-send-email-sjg@chromium.org>	<4F4E88BC.4070106@nvidia.com>	<CAPnjgZ3fVwwvt6Cxr5RU0Bw=UkZ7Rq7fswfRYxpHBvhwrXCn3g@mail.gmail.com>	<4F4E8C48.1020408@nvidia.com> <CAPnjgZ0Xu-8cXWW=Z7mQd6UqNXT_RnRKAP-y3dvA4WtZtL1jKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ0Xu-8cXWW=Z7mQd6UqNXT_RnRKAP-y3dvA4WtZtL1jKQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/06/2012 09:22 PM, Simon Glass wrote:
> Hi Stephen,
> 
> On Wed, Feb 29, 2012 at 12:36 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 02/29/2012 01:32 PM, Simon Glass wrote:
>>> Hi Stephen,
>>>
>>> On Wed, Feb 29, 2012 at 12:21 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>> On 02/29/2012 10:31 AM, Simon Glass wrote:
>>>>> Add U-Boot's peripheral clock information to the Tegra20 device tree file.
>>>>
>>>>> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
>>>>
>>>>>               compatible = "nvidia,tegra20-i2c";
>>>>>               reg = <0x7000C000 0x100>;
>>>>>               interrupts = < 70 >;
>>>>> +             clocks = <&tegra_car 12>;       /* PERIPH_ID_I2C1 */
>>>>>       };
>>>>
>>>> The I2C modules all require 2 clocks; the one you've added in this patch
>>>> and a second reference to pll_p_out3. Can you please list both of these
>>>> here, and update the I2C binding to describe the set of clocks that it
>>>> requires. Thanks.
>>>
>>> OK - do you have a pointer to the kernel commit please? I always seem
>>> to have trouble tracking this stuff down.
>>
>> The clock stuff isn't in the kernel yet, so there's no commit to point
>> to. The commit I asked you to create would update the bindings to define
>> which clocks the I2C node needs, and would then go into U-Boot and the
>> kernel.
> 
> Which binding should I update? I have had a look through Olof's trees at:

Oh, it looks like we don't have any binding documentation for the Tegra
I2C controller at all yet.

So, there's nothing in the kernel to update. Sorry about that. If you
want, you could submit a kernel patch to add such a binding, but since
there isn't one already I won't hold you to it. I see you added a rough
placeholder binding doc in the U-Boot tree in your updated U-Boot patch
which is probably fine for now if you want.
