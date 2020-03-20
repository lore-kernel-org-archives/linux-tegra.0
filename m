From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
Date: Fri, 20 Mar 2020 16:27:07 +0300
Message-ID: <0c70b161-64e8-7765-cc4f-112c2cec9a29@gmail.com>
References: <CGME20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c@eucas1p1.samsung.com>
 <20200127140716.15673-1-geert+renesas@glider.be>
 <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
 <CAMuHMdUGu4eStpYp5W0SKJd8yrLLDTgF4__Jq_n+Z7SWtPM+Cg@mail.gmail.com>
 <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com>
 <CAMuHMdVkhf+4CQwpf9tn3UfaMb=qoRRYS2XpwcgBMciTVmXjHA@mail.gmail.com>
 <75358399-c292-4e60-abdc-bd0729cf5c08@gmail.com>
 <CAMuHMdX9PH+WUvONz2C8D1fRrZXn5rEND-p_my2mYvoyxF_gWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdX9PH+WUvONz2C8D1fRrZXn5rEND-p_my2mYvoyxF_gWA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Eric Miao <eric.miao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

20.03.2020 12:18, Geert Uytterhoeven пишет:
...
> Thanks for the info!
> 
>> I recalled that CONFIG_THUMB2_KERNEL=y is set in my kernel's config and
>> disabling thumb2 build fixes the problem. Please correct it in the next
>> version of the patch, thanks in advance.
> 
> Interesting.  I enabled CONFIG_THUMB2_KERNEL=y, and it doesn't make
> a difference for the few board combos I've tried (with/without appended DTB).
> So it must be related to ATAGS.  Will dive deeper...
> 
> P.S. I never realized CONFIG_THUMB2_KERNEL=y had such a big size
> impact: my kernel shrunk by ca. 1 MiB.

A quick observation tells that fdt_get_mem_start() returns a wrong
address with CONFIG_THUMB2_KERNEL=y, I haven't tried to look further yet.

Disabling all ATAGS options in kernel's config doesn't help.

Kernel config:
https://gist.github.com/digetx/b7c4e1d2d4dae0c5566748c0d7f1e884
