From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: tegra: add tegra_gpio_table and tegra_gpio_config
Date: Mon, 21 Feb 2011 12:44:12 -0800
Message-ID: <AANLkTi=Mg7-hM69EMVSOkS8goU+H53KnDC5q2KASHOtz@mail.gmail.com>
References: <AANLkTikauaANKBpfNHXF5PgCRS4vdbq+eNDF6itU6yHS@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikauaANKBpfNHXF5PgCRS4vdbq+eNDF6itU6yHS-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Mon, Feb 21, 2011 at 11:40 AM, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wr=
ote:

>> This should remove the need for calling these from specific drivers =
and
>> thus reduce tegra-specific code from them.
>
> It was never my intention that drives call gpio_enable/disable, just =
board
> files.

True, but it seems even then that it ends up in various parts of the
per-board files. Having it in one central location (for the base
config) seems like a good idea.



>> @@ -138,7 +140,18 @@ static struct tegra_pingroup_config harmony_pin=
mux[]
>> =3D {
>> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_XM2D, =A0TEGRA_MUX_NONE, =A0 =A0 =A0 =
=A0 =A0TEGRA_PUPD_NORMAL,
>> =A0 =A0TEGRA_TRI_NORMAL},
>> =A0};
>
> An aside: you may want to fully specify the pingroup table here.=A0 T=
his keeps
> new bootloaders from leaving you nasty susurprises.=A0 To make this e=
asier the
> debugfs file outputs a file you can cut and paste here.

Good point, and something i had missed myself. I'll update the harmony
file separately (make the 'enable sdmmc2' patch an 'update pinmux
table'), and refresh the seaboard patch.


> Gpio subsystem init and configurations should be left separate.

I.e. not part of the pinmux file? Sure, can do.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
