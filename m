From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: tegra: add tegra_gpio_table and tegra_gpio_config
Date: Mon, 21 Feb 2011 21:24:33 -0800
Message-ID: <AANLkTimOzxPUZV_JZH1wMQLxBvvJfY=nNKB=4GiKsg2J@mail.gmail.com>
References: <AANLkTikauaANKBpfNHXF5PgCRS4vdbq+eNDF6itU6yHS@mail.gmail.com>
	<AANLkTi=Mg7-hM69EMVSOkS8goU+H53KnDC5q2KASHOtz@mail.gmail.com>
	<AANLkTinDn5XefEpxQJycdiz_Ph_mKTx13TqK6gryib=3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinDn5XefEpxQJycdiz_Ph_mKTx13TqK6gryib=3@mail.gmail.com>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 2:58 PM, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wro=
te:
> On Mon, Feb 21, 2011 at 12:44 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wro=
te:
>> Hi,
>>
>> On Mon, Feb 21, 2011 at 11:40 AM, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>=
 wrote:
>>
>>>> This should remove the need for calling these from specific driver=
s and
>>>> thus reduce tegra-specific code from them.
>>>
>>> It was never my intention that drives call gpio_enable/disable, jus=
t board
>>> files.
>>
>> True, but it seems even then that it ends up in various parts of the
>> per-board files. Having it in one central location (for the base
>> config) seems like a good idea.
>
> sounds good to me.
>
>>> Gpio subsystem init and configurations should be left separate.
>>
>> I.e. not part of the pinmux file? Sure, can do.
>
> I meant that tegra_gpio_init should still be a postcore_initcall.
> That way GPIOs work even if you don't use the tegra_gpio_config
> helper.

Ok, brought that back.

>=A0Also, I'd take the __init off tegra_gpio_config. =A0The
> function could be useful in some suspend/resume chains where the boar=
d
> designer hates you.

While I agree that it'd be useful, I'd prefer dropping it when the
first in-tree user comes along for it. Otherwise, chances is some
janitor coming across it and adding it back for extra churn. :)


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
