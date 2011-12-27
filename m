From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 2/5] Tegra devicetree updates for 3.3
Date: Tue, 27 Dec 2011 22:43:39 +0000
Message-ID: <201112272243.39791.arnd@arndb.de>
References: <CAOesGMhSEbpcKXv87_cv+1b-wB7g8zmtFR2wMygByuTBv_bmvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMhSEbpcKXv87_cv+1b-wB7g8zmtFR2wMygByuTBv_bmvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 21 December 2011, Olof Johansson wrote:
> Hi Arnd,
> 
> Please pull the following device tree-related updates for tegra for 3.3. Thanks!
> 
> 
> The following changes since commit 5611cc4572e889b62a7b4c72a413536bf6a9c416:
> 
>   Linux 3.2-rc4 (2011-12-01 14:56:01 -0800)
> 
> are available in the git repository at:
>   git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git for-3.3/dt
> 

Pulled into a new next/dt branch, thanks!

There is a bogus conflict in arch/arm/mach-tegra/Makefile from merging
two different versions of "arm/tegra: fix variable formatting in makefile".
The patches are identical, but 317d5330 made it into tegra/dt and
584634e3 into tegra/cleanup.

Trivial to fix, but something to watch out for in the future.

Another conflict in arch/arm/mach-tegra/board-dt.c with the "ARM:
tegra2: convert to CONFIG_MULTI_IRQ_HANDLER", also trivial.

	Arnd
