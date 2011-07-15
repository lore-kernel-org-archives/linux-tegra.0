From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL] Tegra updates for v3.1
Date: Fri, 15 Jul 2011 16:00:40 +0200
Message-ID: <201107151600.40794.arnd@arndb.de>
References: <CAMbhsRQoZ7vJGchkXLUOrOH4rpKJzJe-iGvLjTfBmz4R=8HtVw@mail.gmail.com> <201107151506.29281.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201107151506.29281.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 15 July 2011, Arnd Bergmann wrote:
> On Friday 15 July 2011, Colin Cross wrote:
> > Please pull Tegra updates from:
> > 
> > git://android.git.kernel.org/kernel/tegra.git for-next
> > 
> > Mostly peripheral support in existing boards, but also a few fixes and
> > code reduction.

Hi Colin,

Sorry about the first message. I accidentally looked at the tegra/for-next
branch, not at for-next, so the stuff I commented on is very historic and
has been merged a few releases ago.

The stuff you sent now does look very good. It would still be better
to reorganize it into separate branches next time, but it's small
enough overall that I'll just merge it as one for this release.

Again, sorry if my first message caused any trouble.

	Arnd

> Hi Colin,
> 
> I've browsed over the patches, and I had the impression that there are
> still a number of issues that should be resolved before I pull this.
> 
> Specifically, what I noticed is:
> 
> * The cpufreq driver should now live in drivers/cpufreq/
> * The DMA driver uses its own interface instead of the regular
>   dma-engine API. I don't want to merge any more drivers like this.
> * The legacy-irq code is essentially dead code, it's not being used
>   anywhere. My impression is that it would need to look differently
>   if you actually want to use it.
> * The pinmux code is getting largely replaced with new code, but
>   the new version does not use the new pinmux API from Linus Walleij.
> * The commit named "[ARM] tegra: clock: Add dvfs support, bug fixes,
>   and cleanups" puts a lot of stuff into a single patch that doesn't
>   even belong into the same pull request.
> 
> I would very much like to at least pull the cleanups and bug fixes,
> but it doesn't work like this, sorry.
> 
> Please remove the controversial patches and submit separate pull
> requests for the bug fixes and cleanups. It's probably a good idea
> to also  have the patches that add features reviewed on the mailing
> lists again and then decide how to proceed with each one..
> 
> 	Arnd
> 
