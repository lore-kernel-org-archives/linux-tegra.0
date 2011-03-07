From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: seaboard: register i2c devices
Date: Mon, 7 Mar 2011 15:48:45 -0800
Message-ID: <AANLkTinTg+E6grA_ns22gNHeYLCZ4G1BuGRwOJ002FBR@mail.gmail.com>
References: <1299540862-3848-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF045687B99F@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF045687B99F-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 7, 2011 at 3:42 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:

>> @@ -166,6 +166,7 @@ static struct tegra_gpio_table gpio_table[] =3D =
{
>> =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_SD2_POWER, =A0 =A0 =A0 =A0 .enabl=
e =3D true },
>> =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_LIDSWITCH, =A0 =A0 =A0 =A0 .enabl=
e =3D true },
>> =A0 =A0 =A0 { .gpio =3D TEGRA_GPIO_POWERKEY, =A0 =A0 =A0 =A0 =A0.ena=
ble =3D true },
>> + =A0 =A0 { .gpio =3D TEGRA_GPIO_ISL29018_IRQ, =A0 =A0 =A0.enable =3D=
 true },
>
> There's a space after "_IRQ," here. I think that's what's throwing of=
f
> the display in my crappy email reader.
>
> Aside from that,

Ah, d'oh. thanks. Fixed up as I added your acked-by, I won't repost
just for that though.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
