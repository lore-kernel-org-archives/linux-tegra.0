From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC PATCH 23/23] arm: use kconfig fragments for tegra_defconfig/multi_v7_defconfig
Date: Tue, 6 Dec 2016 11:49:53 -0800
Message-ID: <CAOesGMgUnz3WMq_cfabMkFfkp-hvja2TegXubKxFXuMmVNHphQ@mail.gmail.com>
References: <1481027938-31831-1-git-send-email-b.zolnierkie@samsung.com> <1481027938-31831-24-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481027938-31831-24-git-send-email-b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 6, 2016 at 4:38 AM, Bartlomiej Zolnierkiewicz
<b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Replace [tegra,multi_v7]_defconfig-s with
> a Makefile target using merge_config.
>
> The patch was verified with doing:
>
>     $ make [tegra,multi_v7]_defconfig
>     $ make savedefconfig
>
> and comparing resulting defconfig files (before/after the patch).
>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

I'll just reply to this one patch in addition to the cover letter (you
sent the patches to more people than the cover letter, which means
that most people who see these patches don't have full context).

NACK. See cover letter reply for motivation thereof.


-Olof
