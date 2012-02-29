From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 4/9] tegra: fdt: i2c: Add extra I2C bindings for U-Boot
Date: Wed, 29 Feb 2012 12:32:59 -0800
Message-ID: <CAPnjgZ3fVwwvt6Cxr5RU0Bw=UkZ7Rq7fswfRYxpHBvhwrXCn3g@mail.gmail.com>
References: <1330536689-9121-5-git-send-email-sjg@chromium.org>
	<4F4E88BC.4070106@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F4E88BC.4070106-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Wed, Feb 29, 2012 at 12:21 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> On 02/29/2012 10:31 AM, Simon Glass wrote:
>> Add U-Boot's peripheral clock information to the Tegra20 device tree=
 file.
>
>> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-i2c";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x7000C000 0x100>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D < 70 >;
>> + =A0 =A0 =A0 =A0 =A0 =A0 clocks =3D <&tegra_car 12>; =A0 =A0 =A0 /*=
 PERIPH_ID_I2C1 */
>> =A0 =A0 =A0 };
>
> The I2C modules all require 2 clocks; the one you've added in this pa=
tch
> and a second reference to pll_p_out3. Can you please list both of the=
se
> here, and update the I2C binding to describe the set of clocks that i=
t
> requires. Thanks.

OK - do you have a pointer to the kernel commit please? I always seem
to have trouble tracking this stuff down.

Regards,
Simon

>
> --
> nvpublic
