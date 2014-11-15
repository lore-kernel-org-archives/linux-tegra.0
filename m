From: Anatol Pomozov <anatol.pomozov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] timekeeping: Move persistent clock registration code from
 ARM to kernel
Date: Fri, 14 Nov 2014 16:51:33 -0800
Message-ID: <CAOMFOmV5=tes6Ak1eUKb2qircp8ba6jt6v-bg66Kp_-jYk9m2w@mail.gmail.com>
References: <1415388855-35074-1-git-send-email-anatol.pomozov@gmail.com>
	<20141110095325.GC12126@ulmo>
	<CAOMFOmXpAm5iKCLFyorTW+n9YmgZMmrDGGe736tJX8C6BYQv-A@mail.gmail.com>
	<alpine.DEB.2.11.1411132334400.3935@nanos>
	<CAOMFOmVziftM=pWGG-L9J-E6AHYAK7k9bmBcpS1adPboLciX9g@mail.gmail.com>
	<alpine.DEB.2.11.1411150115390.3909@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1411150115390.3909@nanos>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi

On Fri, Nov 14, 2014 at 4:18 PM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> On Fri, 14 Nov 2014, Anatol Pomozov wrote:
>> On Thu, Nov 13, 2014 at 2:46 PM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
>> > On Mon, 10 Nov 2014, Anatol Pomozov wrote:
>> >> On Mon, Nov 10, 2014 at 1:53 AM, Thierry Reding
>> >> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >> > On Fri, Nov 07, 2014 at 11:34:15AM -0800, Anatol Pomozov wrote:
>> >> >> ARM timekeeping functionality allows to register persistent/boot clock dynamically.
>> >> >> This code is arch-independent and can be useful on other plaforms as well.
>> >> >>
>> >> >> As a byproduct of this change, tegra20_timer becomes ARM64 compatible.
>> >> >>
>> >> >> Tested: backported the change to chromeos-3.14 kernel ran on tegra 64bit
>> >> >> board, made sure high-resolution clock works.
>> >> >
>> >> > Using this on an upstream kernel doesn't work, though, because 64-bit
>> >> > ARM doesn't implement struct delay_timer which the driver needs since
>> >> > v3.17.
>> >> >
>> >> > But I suppose the delay timer infrastructure could be moved into the
>> >> > core similar to the persistent and boot clock as this patch does.
>> >>
>> >> Thanks. It makes sense, I will send it in a separate patch, once this
>> >> one will be reviewed. On our kernel I haven't seen this issue as we
>> >> still use 3.14.
>> >
>> > That's why you should test/compile your stuff on latest greatest and
>> > not on a year old conglomorate of unknown provenance. :)
>>
>> Unfortunately it is not possible to test this patch with upstream.
>> There is no ARM64 bit support for Tegra yet. I am trying to
>> cleanup/upstream my ChromeOS patches and this clock patch in
>> particular makes one small step towards this goal. Also Thierry
>> mentioned that he works on full ARM64 Tegra support and it is really
>> exciting!
>
> Everything is exciting, but it does not change the fact, that this
> patch cannot work on current upstream.

Could you please be more specific what exactly does not work? Are you
talking about delay timer? But my patch does not touch any delay timer
code. I can compile tegra_timer for ARM. And this code is not usable
on arm64 anyway because whole Tegra is not ported yet. Somebody should
make additional changes to upstream tegra20_timer.c code. I might try
to do it later when Tegra will be ported.

>> So what I suppose to do with my patch? If it does not work could
>> anyone provide patch that removes ARM arch dependency from
>> tegra20_timer.c?
>
> Huch? You want other people to solve your problems?

This is not the point. I provided patch that fixes the issue. Other
people said that they have ideas how to do it different (and better)
way. So I am asking to share these ideas represented as a patch.
