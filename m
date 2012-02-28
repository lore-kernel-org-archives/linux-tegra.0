From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 11/20] tegra: fdt: Add clock bindings for Tegra2 Seaboard
Date: Tue, 28 Feb 2012 09:20:35 -0800
Message-ID: <CAPnjgZ0_xzn0tvETt3C=pjyRX-MXNA-JXy4fuAs9L8OdHuvLhg@mail.gmail.com>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
	<1330375973-10681-12-git-send-email-sjg@chromium.org>
	<4F4C11E9.1050907@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F4C11E9.1050907-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Mon, Feb 27, 2012 at 3:29 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> On 02/27/2012 01:52 PM, Simon Glass wrote:
>> Add the definition of the oscillator clock frequency.
>
>> diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts=
/tegra2-seaboard.dts
>
>> + =A0 =A0 clock@60006000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 clocks =3D <&osc>;
>> + =A0 =A0 };
>
> The CAR takes two clock inputs; one 32KHz clock (typically from the
> PMU/PMIC) and one from the oscillator. The 32KHz one is missing here.=
 I
> guess this won't make any difference to U-Boot since it isn't using t=
he
> clock inputs in the CAR driver, but it'd be best if the .dts file
> contained the correct content so it didn't act as an incorrect exampl=
e.
> See the example in the binding documentation for what should be there=
=2E

Yes I saw that - but it adds an i2c binding which I don't yet have. I
add i2c in the next series.

I will add that one i2c node here.

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
