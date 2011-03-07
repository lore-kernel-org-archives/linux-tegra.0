From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/3] ARM: tegra: seaboard: register i2c devices
Date: Mon, 7 Mar 2011 11:39:31 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF045687B8E2@HQMAIL01.nvidia.com>
References: <1299486399-21761-1-git-send-email-olof@lixom.net>
	<1299486399-21761-2-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF045687B855@HQMAIL01.nvidia.com>
 <AANLkTin6kCEnOFuua70ze4D3igtZuUEVTNRf4zq-qD4D@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTin6kCEnOFuua70ze4D3igtZuUEVTNRf4zq-qD4D-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Monday, March 07, 2011 12:30 PM:
> [oops, missed reply-all]
>=20
> Hi,
>=20
> On Mon, Mar 7, 2011 at 9:24 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> > Olof Johansson wrote at Monday, March 07, 2011 1:27 AM:
> >> Register the base i2c devices on seaboard. A few more are pending,
> >> but it's a start.
> >>
> >> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> >> ---
> >> =A0arch/arm/mach-tegra/board-seaboard-pinmux.c | =A0 =A01 +
> >> =A0arch/arm/mach-tegra/board-seaboard.c =A0 =A0 =A0 =A0| =A0 83
> >> +++++++++++++++++++++++++++
> >> =A02 files changed, 84 insertions(+), 0 deletions(-)
>...
> >> + =A0 =A0 i2c_register_board_info(0, &isl29018_device, 1);
> >> +
> >> + =A0 =A0 i2c_register_board_info(4, &adt7461_device, 1);
> >> +
> >> + =A0 =A0 common_i2c_init();
> >> +}
> >> +
> >> +static void __init kaen_i2c_init(void)
> >> +{
> >
> > {seaboard,kaen,wario}_i2c_init seem identical. Should this be a sin=
gle
> > shared function, and only the board-specific bits in the non-common
> > functions? Also, see below.
>=20
> They are now -- they weren't when all i2c devices were registered. I
> can re-join them and split them when devices are re-introduced later.

Perhaps move the common code into common_i2c_init, then put only the
differences in ${boardname}_i2c_init(), which would currently be empty
except to call the common function?

> >> + =A0 =A0 gpio_request(TEGRA_GPIO_ISL29018_IRQ, "isl29018");
> >> + =A0 =A0 gpio_direction_input(TEGRA_GPIO_ISL29018_IRQ);
> >> +
> >> + =A0 =A0 i2c_register_board_info(0, &isl29018_device, 1);
> >> +
> >> + =A0 =A0 i2c_register_board_info(4, &adt7461_device, 1);
> >> +
> >> + =A0 =A0 common_i2c_init();
> >> +}
> >> +
> >> +static void __init wario_i2c_init(void)
> >> +{
> >> + =A0 =A0 gpio_request(TEGRA_GPIO_ISL29018_IRQ, "isl29018");
> >> + =A0 =A0 gpio_direction_input(TEGRA_GPIO_ISL29018_IRQ);
> >> +
> >> + =A0 =A0 i2c_register_board_info(0, &isl29018_device, 1);
> >> +
> >> + =A0 =A0 i2c_register_board_info(4, &adt7461_device, 1);
> >> +
> >> + =A0 =A0 common_i2c_init();
> >> +}
> >> +
> >> =A0static void __init __tegra_seaboard_init(void)
> >> =A0{
> >> =A0 =A0 =A0 seaboard_pinmux_init();
> >> @@ -145,6 +222,8 @@ static void __init tegra_seaboard_init(void)
> >> =A0 =A0 =A0 debug_uart_platform_data[0].irq =3D INT_UARTD;
> >>
> >> =A0 =A0 =A0 __tegra_seaboard_init();
> >> +
> >> + =A0 =A0 seaboard_i2c_init();
> >> =A0}
> >>
> >> =A0static void __init tegra_kaen_init(void)
> >> @@ -155,6 +234,8 @@ static void __init tegra_kaen_init(void)
> >> =A0 =A0 =A0 debug_uart_platform_data[0].irq =3D INT_UARTB;
> >>
> >> =A0 =A0 =A0 __tegra_seaboard_init();
> >
> > __tegra_seaboard_init calls seaboard_i2c_init.
>=20
> It shouldn't be (note __tegra* vs tegra*). Maybe I should rename
> __tegra_seaboard_init to something less alike.

Oh right. I double-checked that, but made the same reading mistake
both times; the __ version appeared right above the diff, so I=20
must have skipped reading the @@ line.

> >
> >> +
> >> + =A0 =A0 kaen_i2c_init();
> >
> > kaen_i2c_init is the same as seaboard_i2c_init.
> >
> > So, all the registration happens twice?
>=20
> Shouldn't be. The code I am looking at doesn't, so please check your =
side
> again?

Yes, it looks functionally OK when read correctly.

If you want, I can ack this, but perhaps reworking the code duplication
and making that __tegra_seaboard_init rename would make sense;
common_seaboard_init or common_board_init?

--=20
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
