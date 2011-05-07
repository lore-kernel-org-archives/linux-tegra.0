From: Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] drivers: create a pinmux subsystem
Date: Sat, 7 May 2011 22:06:47 +0300
Message-ID: <BANLkTin9-aKZjEGdBeZqDwHwADXCYERErg@mail.gmail.com>
References: <1304363786-30376-1-git-send-email-linus.walleij@stericsson.com>
	<74CDBE0F657A3D45AFBB94109FB122FF0497F1B201@HQMAIL01.nvidia.com>
	<BANLkTimKU-=GXzrn8=MQn-GAmKHOvKmuNQ@mail.gmail.com>
	<20110504092219.GW2092@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110504092219.GW2092-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Martin Persson <martin.persson-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Erik Gilling <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 4, 2011 at 12:22 PM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote=
:
> * Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> [110502 14:26]:
>> On Mon, May 2, 2011 at 1:52 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> =
wrote:
>>
>> * Drive strength is also controlled through groups of pins, but
>> different groups than pinmux. =A0Most of the drive strength groups a=
re
>> collections of pad mux groups, but there are a few pins that are in
>> the same pad mux group but a different drive strength group.
>> * Setting a pin as a GPIO overrides its group's mux setting, except
>> for the group's tristate. =A0You must untristate the entire group to=
 use
>> a single pin as a GPIO.
>> * Each group has a "safe mode", but which mux id to select to enter
>> the safe mode is completely random.
>
> Just posted something in this thread regarding using standard data an=
d
> standard read and write functions, then allow setting platform specif=
ic
> custom flags as needed. Care to see if that works for you too?

Tegra does not allow pin muxing on the pin by pin basis. And,
registers that define mux config differ from those that define flags
(pull, driver strength, safe mode etc).

>> In the end, we determined that there was no way to sanely handle
>> setting up Tegra's pinmux programatically, and instead required each
>> board to pass in a table of pinmux settings.
>
> Eventually we should get the package specific table of available pins
> and the board specific settings in devicetree data. And then it's
> easy to set the pins as desired while being able to debug it.
>
> Regards,
>
> Tony
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>



--=20
=A0 =A0 Sincerely Yours,
=A0 =A0 =A0 =A0 Mike.
