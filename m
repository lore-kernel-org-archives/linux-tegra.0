From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: tegra: add seaboard, wario and kaen boards
Date: Mon, 21 Feb 2011 21:52:03 -0800
Message-ID: <AANLkTikBPGbjzRGMv5a_6SFsDZP6hOMTT8vOCP=ghMUg@mail.gmail.com>
References: <1298315206-8887-1-git-send-email-olof@lixom.net>
	<1298315206-8887-6-git-send-email-olof@lixom.net>
	<AANLkTik6OjZZ=MTU0iq3yk9X57F6ZneBnQGsYFno1zKR@mail.gmail.com>
	<AANLkTimJrcXQoymKdny1+GZtmM192xNVcUPHj8pC6J4v@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimJrcXQoymKdny1+GZtmM192xNVcUPHj8pC6J4v-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 8:30 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Mon, Feb 21, 2011 at 7:07 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote:
>>> +++ b/arch/arm/mach-tegra/board-seaboard-pinmux.c
>>> @@ -0,0 +1,179 @@
>>> +/*
>>> + * Copyright (C) 2010 NVIDIA Corporation
>> This seems unique enough not be copyright nVidia.
>
> Having copyrights on every single file is silly to start with, but I
> carried this over since they had it on the patch that introduced
> seaboard in the chromium os repository.
>
> I'll be rewriting the file for next post due to the import from
> /sys/kernel/debug as Erik suggested though, so the copyright will
> switch for that reason.

Actually, deltas were pretty small and there's also the drive strength
settings that came from Nvidia. So I'm keeping their copyright on the
file, seems appropriate. Not a big deal either way, and I'd rather err
on the side of keeping copyrights than stripping them.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
