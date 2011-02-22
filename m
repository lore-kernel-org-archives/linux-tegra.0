From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: tegra: add seaboard, wario and kaen boards
Date: Mon, 21 Feb 2011 20:30:07 -0800
Message-ID: <AANLkTimJrcXQoymKdny1+GZtmM192xNVcUPHj8pC6J4v@mail.gmail.com>
References: <1298315206-8887-1-git-send-email-olof@lixom.net>
	<1298315206-8887-6-git-send-email-olof@lixom.net>
	<AANLkTik6OjZZ=MTU0iq3yk9X57F6ZneBnQGsYFno1zKR@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTik6OjZZ=MTU0iq3yk9X57F6ZneBnQGsYFno1zKR-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 7:07 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:
> On Mon, Feb 21, 2011 at 11:06 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wro=
te:

>> +config MACH_SEABOARD
>> + =A0 =A0 =A0 bool "Seaboard board family"
>> + =A0 =A0 =A0 help
>> + =A0 =A0 =A0 =A0 Support for nVidia Seaboard development platform
>> +
>> +config MACH_KAEN
>> + =A0 =A0 =A0 bool "Kaen board"
>> + =A0 =A0 =A0 depends on MACH_SEABOARD
>> + =A0 =A0 =A0 help
>> + =A0 =A0 =A0 =A0 Support for the Kaen version of Seaboard
>> +
>> +config MACH_WARIO
>> + =A0 =A0 =A0 bool "Wario board"
>> + =A0 =A0 =A0 depends on MACH_SEABOARD
>> + =A0 =A0 =A0 help
>> + =A0 =A0 =A0 =A0 Support for the Wario version of Seaboard
>> +
> It's easier to prevent merge conflicts if these stay in alphabetical
> order. =A0Even though these 3 are closely related, the next person to
> add a board is going to assume they are not in alphabetical order and
> put theirs at the bottom. =A0I would also suggest "selects
> MACH_SEABOARD" instead of "depends on MACH_SEABOARD", which will help
> when they are out of order.

Works for me. Creates less of an appearance of hierarchy between
different board types too.

>> +++ b/arch/arm/mach-tegra/board-seaboard-pinmux.c
>> @@ -0,0 +1,179 @@
>> +/*
>> + * Copyright (C) 2010 NVIDIA Corporation
> This seems unique enough not be copyright nVidia.

Having copyrights on every single file is silly to start with, but I
carried this over since they had it on the patch that introduced
seaboard in the chromium os repository.

I'll be rewriting the file for next post due to the import from
/sys/kernel/debug as Erik suggested though, so the copyright will
switch for that reason.

>> diff --git a/arch/arm/mach-tegra/board-seaboard.c b/arch/arm/mach-te=
gra/board-seaboard.c
>> new file mode 100644
>> index 0000000..deeddfe
>> --- /dev/null
>> +++ b/arch/arm/mach-tegra/board-seaboard.c
> <snip>
>> +#include <mach/io.h>
> #include <linux/io.h> instead
>
> <snip>

Thanks.

>> +static void __init __tegra_seaboard_init(void)
>> +{
>> + =A0 =A0 =A0 seaboard_pinmux_init();
>> +
>> + =A0 =A0 =A0 tegra_common_init();
> My recent clock patch series includes a change to replace
> tegra_common_init with tegra_early_init. =A0If my patch goes in befor=
e
> this one, you'll need to update this one.

Will do.

[..]
> These should be in the order they are called during init: map_io,
> init_irq, timer, init_machine.

Sure.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
