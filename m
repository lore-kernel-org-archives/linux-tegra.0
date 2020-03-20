From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
Date: Fri, 20 Mar 2020 10:18:57 +0100
Message-ID: <CAMuHMdX9PH+WUvONz2C8D1fRrZXn5rEND-p_my2mYvoyxF_gWA@mail.gmail.com>
References: <CGME20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c@eucas1p1.samsung.com>
 <20200127140716.15673-1-geert+renesas@glider.be> <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
 <CAMuHMdUGu4eStpYp5W0SKJd8yrLLDTgF4__Jq_n+Z7SWtPM+Cg@mail.gmail.com>
 <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com> <CAMuHMdVkhf+4CQwpf9tn3UfaMb=qoRRYS2XpwcgBMciTVmXjHA@mail.gmail.com>
 <75358399-c292-4e60-abdc-bd0729cf5c08@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <75358399-c292-4e60-abdc-bd0729cf5c08-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Eric Miao <eric.miao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On Thu, Mar 19, 2020 at 3:35 PM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 19.03.2020 11:18, Geert Uytterhoeven пишет:
> > On Thu, Mar 19, 2020 at 2:11 AM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> 25.02.2020 14:40, Geert Uytterhoeven пишет:
> >>> On Tue, Feb 25, 2020 at 12:24 PM Marek Szyprowski
> >>> <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> >>>> On 27.01.2020 15:07, Geert Uytterhoeven wrote:
> >>>>> Currently, the start address of physical memory is obtained by masking
> >>>>> the program counter with a fixed mask of 0xf8000000.  This mask value
> >>>>> was chosen as a balance between the requirements of different platforms.
> >>>>> However, this does require that the start address of physical memory is
> >>>>> a multiple of 128 MiB, precluding booting Linux on platforms where this
> >>>>> requirement is not fulfilled.
> >>>>>
> >>>>> Fix this limitation by obtaining the start address from the DTB instead,
> >>>>> if available (either explicitly passed, or appended to the kernel).
> >>>>> Fall back to the traditional method when needed.
> >>>>>
> >>>>> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> >>>>> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> >>>>> i.e. not at a multiple of 128 MiB.
> >>>>>
> >>>>> Suggested-by: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
> >>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >>>>> Reviewed-by: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
> >>>>> ---
> >>>>> Against arm/for-next.
> >>>>
> >>>> This patch landed recently in linux-next. It breaks legacy booting from
> >>>> the zImage + appended DT + cmdline/memory info provided via ATAGs. I
> >>>> will debug it further once I find some spare time. What I noticed so
> >>>> far, the cmdline/memory info is not read from the ATAGs, only the values
> >>>> provided via appended DT are used.
> >>>
> >>> Oops, something happening like this was one of my biggest worries when
> >>> posting this patch... Sorry for the breakage.
> >>>
> >>> IIUIC, the kernel still boots, but just doesn't use the info passed by ATAGs?
> >>>
> >>> I'll have a closer look later today.
> >>> In the mean time, I've sent some debug code I used when developing
> >>> this patch, which may be useful, hopefully.
> >>
> >> NVIDIA Tegra is also affected by this patch. A week ago an updated
> >> version of the patch was pushed into linux-next and now machine doesn't
> >> boot at all.
> >
> > I'm sorry to hear that.
> >
> > Did v2 work for you?
>
> Same as it was for Marek.
>
> > Are you sure this updated version is the culprit? There are several other
> > recent changes to head.S in arm/for-next.
>
> Yes
>
> > Do you boot a separate DTB or an appended DTB?
>
> Appended
>
> > Do you use ATAGS?
>
> Yes

Thanks for the info!

> I recalled that CONFIG_THUMB2_KERNEL=y is set in my kernel's config and
> disabling thumb2 build fixes the problem. Please correct it in the next
> version of the patch, thanks in advance.

Interesting.  I enabled CONFIG_THUMB2_KERNEL=y, and it doesn't make
a difference for the few board combos I've tried (with/without appended DTB).
So it must be related to ATAGS.  Will dive deeper...

P.S. I never realized CONFIG_THUMB2_KERNEL=y had such a big size
impact: my kernel shrunk by ca. 1 MiB.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
