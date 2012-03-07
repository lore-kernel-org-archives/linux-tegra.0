From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/9] tegra: fdt: i2c: Add extra I2C bindings for U-Boot
Date: Tue, 6 Mar 2012 20:22:16 -0800
Message-ID: <CAPnjgZ0Xu-8cXWW=Z7mQd6UqNXT_RnRKAP-y3dvA4WtZtL1jKQ@mail.gmail.com>
References: <1330536689-9121-5-git-send-email-sjg@chromium.org>
	<4F4E88BC.4070106@nvidia.com>
	<CAPnjgZ3fVwwvt6Cxr5RU0Bw=UkZ7Rq7fswfRYxpHBvhwrXCn3g@mail.gmail.com>
	<4F4E8C48.1020408@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F4E8C48.1020408-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Wed, Feb 29, 2012 at 12:36 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> On 02/29/2012 01:32 PM, Simon Glass wrote:
>> Hi Stephen,
>>
>> On Wed, Feb 29, 2012 at 12:21 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
> wrote:
>>> On 02/29/2012 10:31 AM, Simon Glass wrote:
>>>> Add U-Boot's peripheral clock information to the Tegra20 device tr=
ee file.
>>>
>>>> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
>>>
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-i2c";
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x7000C000 0x100>;
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D < 70 >;
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 clocks =3D <&tegra_car 12>; =A0 =A0 =A0 =
/* PERIPH_ID_I2C1 */
>>>> =A0 =A0 =A0 };
>>>
>>> The I2C modules all require 2 clocks; the one you've added in this =
patch
>>> and a second reference to pll_p_out3. Can you please list both of t=
hese
>>> here, and update the I2C binding to describe the set of clocks that=
 it
>>> requires. Thanks.
>>
>> OK - do you have a pointer to the kernel commit please? I always see=
m
>> to have trouble tracking this stuff down.
>
> The clock stuff isn't in the kernel yet, so there's no commit to poin=
t
> to. The commit I asked you to create would update the bindings to def=
ine
> which clocks the I2C node needs, and would then go into U-Boot and th=
e
> kernel.

Which binding should I update? I have had a look through Olof's trees a=
t:

git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git

I would expect to find the Tegra i2c binding file in
Documentation/devicetree/bindings/i2c, but all I see is:

arm-versatile.txt  fsl-i2c.txt      i2c-designware.txt  samsung-i2c.txt
ce4100-i2c.txt     fsl-imx-i2c.txt  omap-i2c.txt        trivial-devices=
=2Etxt

I have looked through the device tree mailing list, and I have
searched using my favourite search engine, but I honestly cannot find
anything. Are you sure that this has been done?

If it is not available anywhere, please can you email me the current
binding file that you want me to update and I will send out a patch
with the binding, and then a separate patch with the clock update.

>
> As a reference though, look at the kernel I2C driver and see that it
> performs two clk_get() calls, and then look into tegra2_clocks.c to s=
ee
> the two clocks it matches.

OK I think you want something like:

 clocks =3D <&tegra_car 12>, <&tegra_car 124>;       /* PERIPH_ID_I2C1,
PLL_P_OUT3 */

I will update this patch to do that, at least, while I wait for
information about the binding.

Regards,
Simon

>
> --
> nvpublic
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
