From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 1/5] Tegra cleanups for 3.3
Date: Tue, 27 Dec 2011 22:19:38 +0000
Message-ID: <201112272219.38986.arnd@arndb.de>
References: <CAOesGMja7+nA-VSF9bEmUJRbpLbVwZ+ngC1+qJ4Sz8L3Bx0m5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMja7+nA-VSF9bEmUJRbpLbVwZ+ngC1+qJ4Sz8L3Bx0m5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 21 December 2011, Olof Johansson wrote:
> Hi Arnd,
> 
> Please pull the following cleanups for tegra. Thanks!
> 
> 
> The following changes since commit 5611cc4572e889b62a7b4c72a413536bf6a9c416:
> 
>   Linux 3.2-rc4 (2011-12-01 14:56:01 -0800)
> 
> are available in the git repository at:
>   git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git for-3.3/cleanup

Pulled and resolved a conflict with Marc's "ARM: tegra2: convert to
CONFIG_MULTI_IRQ_HANDLER" patch, which leaves entry-macro.S
almost empty with these contents:

        .macro  disable_fiq
        .endm

        .macro  arch_ret_to_user, tmp1, tmp2
        .endm

Please confirm if this is the correct resolution.

Thanks,

	Arnd
