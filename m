From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: paz00: set gpiod_lookup table conn_id's
Date: Tue, 30 Jun 2015 16:56:54 +0300
Message-ID: <5592A026.3010200@gmail.com>
References: <1435520160-16862-1-git-send-email-digetx@gmail.com> <CAAVeFuKcaz1C9OV26+8A+LypScqDcufR+X99KDJwVui39Nq7xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuKcaz1C9OV26+8A+LypScqDcufR+X99KDJwVui39Nq7xA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

30.06.2015 16:42, Alexandre Courbot =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Mon, Jun 29, 2015 at 4:34 AM, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
>> Commit 72daceb9a10a ("net: rfkill: gpio: Add default GPIO driver map=
pings
>> for ACPI") removed possibility to request GPIO by table index for no=
n-ACPI
>> platforms without changing it users. As result "shutdown" GPIO reque=
st
>> will fail if request for "reset" GPIO succeeded or "reset" will be
>> requested instead of "shutdown" if "reset" wasn't defined. Fix it by
>> setting conn_id's in gpiod_lookup_table.
>
> Yep, and using con_ids is a good idea anyway.
>
> Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>

After discussion on irc, turned out that patch missed=20
s/GPIO_LOOKUP_IDX/GPIO_LOOKUP. I'll send V2.

And s/conn_id/con_id typo started to annoy me...

--=20
Dmitry
