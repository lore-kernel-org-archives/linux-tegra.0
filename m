From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH] timekeeping: Move persistent clock registration code
 from ARM to kernel
Date: Sat, 15 Nov 2014 02:09:29 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1411150154280.3909@nanos>
References: <1415388855-35074-1-git-send-email-anatol.pomozov@gmail.com> <20141110095325.GC12126@ulmo> <CAOMFOmXpAm5iKCLFyorTW+n9YmgZMmrDGGe736tJX8C6BYQv-A@mail.gmail.com> <alpine.DEB.2.11.1411132334400.3935@nanos> <CAOMFOmVziftM=pWGG-L9J-E6AHYAK7k9bmBcpS1adPboLciX9g@mail.gmail.com>
 <alpine.DEB.2.11.1411150115390.3909@nanos> <CAOMFOmV5=tes6Ak1eUKb2qircp8ba6jt6v-bg66Kp_-jYk9m2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMFOmV5=tes6Ak1eUKb2qircp8ba6jt6v-bg66Kp_-jYk9m2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatol Pomozov <anatol.pomozov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 14 Nov 2014, Anatol Pomozov wrote:
> On Fri, Nov 14, 2014 at 4:18 PM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> >> So what I suppose to do with my patch? If it does not work could
> >> anyone provide patch that removes ARM arch dependency from
> >> tegra20_timer.c?
> >
> > Huch? You want other people to solve your problems?
> 
> This is not the point. I provided patch that fixes the issue. Other
> people said that they have ideas how to do it different (and better)
> way. So I am asking to share these ideas represented as a patch.

That's not the way it works.

You sent a patch to solve an problem which you are facing.

Now the people who review the patch think that there is a better
approach than moving code from arm/ to the timekeeping core code.

So it's up to you to come up with a patch which solves the problem in
the right way.

Thanks,

	tglx
