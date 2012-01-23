From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: possible hrtimer related problem on tegra
Date: Mon, 23 Jan 2012 00:09:42 -0800
Message-ID: <CAOesGMhaXjxzoz-OWF3V0HsdWzuxRJMaE-MSjdAFwN8+KgQLBg@mail.gmail.com>
References: <1539302.lfXQIS47Lr@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1539302.lfXQIS47Lr@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Sun, Jan 22, 2012 at 7:18 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> Hi,
>
> I've been plagued with random lockups starting with Linux 3.0.13 (pulled from
> ChromeOS-3.0 tree) on a Tegra board (paz00). First symtoms are slowly losing
> responsiveness followed by a total lockup (nothing in dmesg, no oops). Using
> performance governor instead of ondemand, made it go away.
>
> So I started bisecting 3.0.12..3.0.13 and finially found that reverting
> 24ee8bfe (hrtimer: Fix extra wakeups from __remove_hrtimer()) fixes the
> problem.
>
> As Olof mentioned on IRC it is likely that the patch does not directly causes
> lockups but something else which was hidden before. It isn't clear to me if
> other tegra boards (seaboard, harmony) also suffer from this.
>
> Any hints on this issue are appreciated.

You're asking on a community list about issues with a distro kernel.
In general that is frowned upon.

Since I'm one of the people looking after the distro kernel in
particular though; The current 3.0 tegra branch has a handful of
stability issues with power management/cpufreq/dvfs enabled, and we
have chosen to (at least for now) disable those features in our
configs. Chances are good that that patch in question is tickling a
bug that is specific to the Chrome OS tree so without further
investigation I don't see a reason to pull in external folks right now
either.

The other tegra maintainers don't particularly know what's in our
distro tree either, and I wouldn't expect them to spend time on
working on out-of-tree code that isn't their own.

Best way forward is probably for you to do a local revert on the
offending patch and to open a new issue at http://crosbug.com/ for it.
Feel free to cc me (olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org) on the bug.


-Olof
