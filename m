From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/16] gpio: Tight IRQ chip integration and banked infrastructure
Date: Thu, 14 Sep 2017 15:54:56 +0200
Message-ID: <CACRpkdaRsG-9YU2ufb+FxGOO38+x=AAfVUqxH5s56NH2iLw7oA@mail.gmail.com>
References: <20170901185736.28051-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170901185736.28051-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ext Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 1, 2017 at 8:57 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> here's the latest series of patches that implement the tighter IRQ chip
> integration as well as the banked GPIO infrastructure that we had
> discussed a couple of weeks/months back.

Yes it has become really tasty now, don't you think :)

I really like the series.

Banks are handled in the core, exactly as I wanted.

I will likely go in and change some things I don't like, like switching
num_pins in the bank to num_lines. I have preferred that terminology
to avoid confusion with pin control. So GPIO chips have lines, not pins.
But it's so minor that I can fix it up if you don't want to.

We also need to go in and patch Documentation/gpio/driver.txt
to represent the current best practice. But that can be later,
separate patch.

> The first couple of patches are mostly preparatory work in order to
> consolidate all IRQ chip related fields in a new structure and create
> the base functionality for adding IRQ chips.
>
> After that, I've added the Tegra186 GPIO support patch that makes use of
> the new tight integration.
>
> To round things off the new banked GPIO infrastructure is added (along
> with some more preparatory work), followed by the conversion of the two
> Tegra GPIO drivers to the new infrastructure.

I have put all on a branch for pushing to the test builders to begin with.

Then I plan to make one branch with all infrastructure patches
(patches 1-10, 12-14) and pull that into devel, then apply patch
11 and 15-16 directly on devel.

That way other subsystems (pinctrl ...) can pull in the infrastructure
for people adding new gpiochips this cycle.

> Any thoughts on this? I'd like to target 4.15 with this,

Me, too.

> unless you'd be
> willing to take this into 4.14, which I doubt at this point. The absence
> of a GPIO driver has been hampering Tegra186 support upstream for a
> while now, so it'd be good to make progress on this.

Sorry about that. Let's move ahead with this now, it is neat and
clean.

What I want (as maintainer) is a bit of fingerpointing at the drivers
that need to be converted to use the new banking infrastructure
so they don't stay with their old crappy design pattern. OMAP is
a clear candidate right? (Added Tony to CC...)

Who else?

Yours,
Linus Walleij
