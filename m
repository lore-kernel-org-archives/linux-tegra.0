From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 4/9] tegra: fdt: i2c: Add extra I2C bindings for U-Boot
Date: Wed, 7 Mar 2012 22:31:01 -0800
Message-ID: <CAPnjgZ3AxtS8guUnbFnuFoD-Dqfvy0XKvPH+f84RyKmxin1Hhw@mail.gmail.com>
References: <1331096428-6317-5-git-send-email-sjg@chromium.org>
	<4F57C76D.6040004@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F57C76D.6040004-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Wed, Mar 7, 2012 at 12:39 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>=
 wrote:
> On 03/06/2012 10:00 PM, Simon Glass wrote:
>> Add U-Boot's peripheral clock information to the Tegra20 device tree=
 file.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ...
>> diff --git a/doc/device-tree-bindings/i2c/tegra20-i2c.txt b/doc/devi=
ce-tree-bindings/i2c/tegra20-i2c.txt
> ...
>> +Required properties:
>> + - clocks : Two clocks must be given, each as a phandle to the Tegr=
a's
>> + =A0 =A0 =A0 =A0 =A0 =A0CAR node and the clock number as a paramete=
r:
>
> I'd rather rely on the common clock binding documentation for the for=
mat
> of the clock specifiers than duplicate the information here. True, th=
at
> document isn't in U-Boot (nor is it final). I.e.:
>
> =A0 =A0Two clocks must be specified:
>
> But I think this is fine for now (I might care more if submitting a d=
oc
> file for the kernel tree), so
>
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

Thanks. Good to get this in.

Regards,
Simon
>
>> + =A0 =A0 - the I2C clock to use for the peripheral
>> + =A0 =A0 - the pll_p_out3 clock, which can be used for fast operati=
on. This
>> + =A0 =A0 =A0 =A0 =A0does not change and is the same for all I2C nod=
es.
>> +
>> +Example:
>> +(TODO: merge with existing example):
>> +
>> + =A0 =A0 i2c@7000c400 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-i2c";
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x7000C400 0x100>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D < 116 >;
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* PERIPH_ID_I2C2, PLL_P_OUT3 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 clocks =3D <&tegra_car 54>, <&tegra_car 12=
4>;
>> + =A0 =A0 };
