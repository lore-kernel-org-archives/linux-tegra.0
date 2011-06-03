From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 3/3] ARM:Tegra: Device Tree Support: Initialize from wm8903
 the device tree
Date: Fri, 3 Jun 2011 10:20:21 -0600
Message-ID: <BANLkTimAtYw9KAunOzMApyTuaHWqHO9EoA@mail.gmail.com>
References: <20110511231905.10362.12844.stgit@riker> <20110511232711.10362.53256.stgit@riker>
 <20110512074917.GA16250@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110512074917.GA16250-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 12, 2011 at 1:49 AM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Wed, May 11, 2011 at 04:27:18PM -0700, John Bonesio wrote:
>> This patch makes it so the wm8903 is initialized from it's device tr=
ee node.
>>
>> Signed-off-by: John Bonesio<bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> ---
>>
>> =A0arch/arm/boot/dts/tegra-harmony.dts | =A0 17 ++++++
>> =A0sound/soc/codecs/wm8903.c =A0 =A0 =A0 =A0 =A0 | =A0 93 ++++++++++=
+++++++++++++++++++++++--
>
> This needs to be sent separately to the relevant mailing lists and
> maintainers. =A0You can't go making substantial changes to drivers wi=
thout
> even telling the maintainers about it - this will apply to any device
> tree work you're doing. =A0In this case one of the maintainers happen=
s to
> be me, but even so.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D < 347 >;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq-active-low =3D <0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 micdet-cfg =3D <0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 micdet-delay =3D <100>;
>
> Some of this looks like chip default, why is it being configured?
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #gpio-cells =3D <2>;
>
> The fact that this device is a GPIO controller is a physical property=
 of
> the device, we shouldn't need to be putting it into the device tree.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio-num-cfg =3D < 5 >;
>
> Similarly here, the device has a fixed number of GPIOs.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* #define WM8903_GPIO_NO_=
CONFIG 0x8000 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio-cfg =3D < 0x8000 0x80=
00 0 0x8000 0x8000 >;
>
> This doesn't seem great for usability. =A0I'd suggest key/value pairs
> rather than an array.
>
>> - =A0 =A0 if (pdata && pdata->gpio_base)
>> + =A0 =A0 wm8903->gpio_chip.base =3D -1;
>> + =A0 =A0 if (pdata && pdata->gpio_base) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 wm8903->gpio_chip.base =3D pdata->gpio_b=
ase;
>> - =A0 =A0 else
>> - =A0 =A0 =A0 =A0 =A0 =A0 wm8903->gpio_chip.base =3D -1;
>> + =A0 =A0 } else if (codec->dev->of_node) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_property(codec->dev->of_no=
de, "gpio-base", NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (prop)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wm8903->gpio_chip.base =3D=
 be32_to_cpup(prop);
>> + =A0 =A0 }
>
> We have to do manual endianness conversions to read from the device
> tree? =A0Oh, well.
>
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 prop =3D of_get_property(codec->dev->of_no=
de, "interrupts", NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (prop)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 wm8903->irq =3D be32_to_cp=
up(prop);
>> +
>
> We have a standard way of passing the IRQ number to I2C devices, sure=
ly
> we should make sure that works at the bus level rather than having to
> replicate this code everywhere?

Yes actually there is.  The code in drivers/of/of_i2c.c already
correctly populates the i2c_client irq from the device tree.  This
hunk can be completely removed.

g.
