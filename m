From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: seaboard: register i2c devices
Date: Mon, 7 Mar 2011 11:29:53 -0800
Message-ID: <AANLkTin6kCEnOFuua70ze4D3igtZuUEVTNRf4zq-qD4D@mail.gmail.com>
References: <1299486399-21761-1-git-send-email-olof@lixom.net>
	<1299486399-21761-2-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF045687B855@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF045687B855-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

[oops, missed reply-all]

Hi,

On Mon, Mar 7, 2011 at 9:24 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Olof Johansson wrote at Monday, March 07, 2011 1:27 AM:
>> Register the base i2c devices on seaboard. A few more are pending,
>> but it's a start.
>>
>> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>> ---
>> =A0arch/arm/mach-tegra/board-seaboard-pinmux.c | =A0 =A01 +
>> =A0arch/arm/mach-tegra/board-seaboard.c =A0 =A0 =A0 =A0| =A0 83
>> +++++++++++++++++++++++++++
>> =A02 files changed, 84 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-tegra/board-seaboard-pinmux.c b/arch/arm/=
mach-
>> tegra/board-seaboard-pinmux.c
>> index 7e96d49..d84d1dd 100644
>> --- a/arch/arm/mach-tegra/board-seaboard-pinmux.c
>> +++ b/arch/arm/mach-tegra/board-seaboard-pinmux.c
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
> The indentation between fields looks different there.

No, shouldn't be? I just checked the code, it uses the same whitespace
(tabs/spaces).
[...]

[...]

>> +static void __init seaboard_i2c_init(void)
>> +{
>> + =A0 =A0 gpio_request(TEGRA_GPIO_ISL29018_IRQ, "isl29018");
>> + =A0 =A0 gpio_direction_input(TEGRA_GPIO_ISL29018_IRQ);
>
> Hmm. For some reason I thought drivers did this themselves, or IRQ
> registration did this for them. However, I looked and that's not true=
=2E I
> think I was remembering snd_soc_jack_add_gpios instead.
>
> So, this code looks fine, but I guess equivalent calls are missing fo=
r the
> WM8903 IRQ in my patches?

Yeah, probably.

>> + =A0 =A0 i2c_register_board_info(0, &isl29018_device, 1);
>> +
>> + =A0 =A0 i2c_register_board_info(4, &adt7461_device, 1);
>> +
>> + =A0 =A0 common_i2c_init();
>> +}
>> +
>> +static void __init kaen_i2c_init(void)
>> +{
>
> {seaboard,kaen,wario}_i2c_init seem identical. Should this be a singl=
e shared
> function, and only the board-specific bits in the non-common function=
s? Also,
> see below.

They are now -- they weren't when all i2c devices were registered. I
can re-join them and split them when devices are re-introduced later.



>
>> + =A0 =A0 gpio_request(TEGRA_GPIO_ISL29018_IRQ, "isl29018");
>> + =A0 =A0 gpio_direction_input(TEGRA_GPIO_ISL29018_IRQ);
>> +
>> + =A0 =A0 i2c_register_board_info(0, &isl29018_device, 1);
>> +
>> + =A0 =A0 i2c_register_board_info(4, &adt7461_device, 1);
>> +
>> + =A0 =A0 common_i2c_init();
>> +}
>> +
>> +static void __init wario_i2c_init(void)
>> +{
>> + =A0 =A0 gpio_request(TEGRA_GPIO_ISL29018_IRQ, "isl29018");
>> + =A0 =A0 gpio_direction_input(TEGRA_GPIO_ISL29018_IRQ);
>> +
>> + =A0 =A0 i2c_register_board_info(0, &isl29018_device, 1);
>> +
>> + =A0 =A0 i2c_register_board_info(4, &adt7461_device, 1);
>> +
>> + =A0 =A0 common_i2c_init();
>> +}
>> +
>> =A0static void __init __tegra_seaboard_init(void)
>> =A0{
>> =A0 =A0 =A0 seaboard_pinmux_init();
>> @@ -145,6 +222,8 @@ static void __init tegra_seaboard_init(void)
>> =A0 =A0 =A0 debug_uart_platform_data[0].irq =3D INT_UARTD;
>>
>> =A0 =A0 =A0 __tegra_seaboard_init();
>> +
>> + =A0 =A0 seaboard_i2c_init();
>> =A0}
>>
>> =A0static void __init tegra_kaen_init(void)
>> @@ -155,6 +234,8 @@ static void __init tegra_kaen_init(void)
>> =A0 =A0 =A0 debug_uart_platform_data[0].irq =3D INT_UARTB;
>>
>> =A0 =A0 =A0 __tegra_seaboard_init();
>
> __tegra_seaboard_init calls seaboard_i2c_init.

It shouldn't be (note __tegra* vs tegra*). Maybe I should rename
__tegra_seaboard_init to something less alike.

>
>> +
>> + =A0 =A0 kaen_i2c_init();
>
> kaen_i2c_init is the same as seaboard_i2c_init.
>
> So, all the registration happens twice?

Shouldn't be. The code I am looking at doesn't, so please check your si=
de again?


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
