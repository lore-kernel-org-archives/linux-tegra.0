From: Anatol Pomozov <anatol.pomozov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] timekeeping: Move persistent clock registration code from
 ARM to kernel
Date: Fri, 14 Nov 2014 14:03:18 -0800
Message-ID: <CAOMFOmVziftM=pWGG-L9J-E6AHYAK7k9bmBcpS1adPboLciX9g@mail.gmail.com>
References: <1415388855-35074-1-git-send-email-anatol.pomozov@gmail.com>
	<20141110095325.GC12126@ulmo>
	<CAOMFOmXpAm5iKCLFyorTW+n9YmgZMmrDGGe736tJX8C6BYQv-A@mail.gmail.com>
	<alpine.DEB.2.11.1411132334400.3935@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1411132334400.3935@nanos>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi

On Thu, Nov 13, 2014 at 2:46 PM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> On Mon, 10 Nov 2014, Anatol Pomozov wrote:
>> On Mon, Nov 10, 2014 at 1:53 AM, Thierry Reding
>> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > On Fri, Nov 07, 2014 at 11:34:15AM -0800, Anatol Pomozov wrote:
>> >> ARM timekeeping functionality allows to register persistent/boot clock dynamically.
>> >> This code is arch-independent and can be useful on other plaforms as well.
>> >>
>> >> As a byproduct of this change, tegra20_timer becomes ARM64 compatible.
>> >>
>> >> Tested: backported the change to chromeos-3.14 kernel ran on tegra 64bit
>> >> board, made sure high-resolution clock works.
>> >
>> > Using this on an upstream kernel doesn't work, though, because 64-bit
>> > ARM doesn't implement struct delay_timer which the driver needs since
>> > v3.17.
>> >
>> > But I suppose the delay timer infrastructure could be moved into the
>> > core similar to the persistent and boot clock as this patch does.
>>
>> Thanks. It makes sense, I will send it in a separate patch, once this
>> one will be reviewed. On our kernel I haven't seen this issue as we
>> still use 3.14.
>
> That's why you should test/compile your stuff on latest greatest and
> not on a year old conglomorate of unknown provenance. :)

Unfortunately it is not possible to test this patch with upstream.
There is no ARM64 bit support for Tegra yet. I am trying to
cleanup/upstream my ChromeOS patches and this clock patch in
particular makes one small step towards this goal. Also Thierry
mentioned that he works on full ARM64 Tegra support and it is really
exciting!


So what I suppose to do with my patch? If it does not work could
anyone provide patch that removes ARM arch dependency from
tegra20_timer.c?

> Aside of that I really wonder why we need that persistent_clock stuff
> at all. We already have mechanisms to register persistent clocks AKA
> RTCs after the early boot process and update the wall clock time
> before we actually need it. Nothing in early boot depends on correct
> wall clock at all.
>
> So instead of adding more extra persistent clock nonsense, can we just
> move all of that to the place where it belongs, i.e. RTC?
>
> Thanks,
>
>         tglx
>
