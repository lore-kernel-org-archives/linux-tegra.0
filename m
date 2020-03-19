From: Russell King - ARM Linux admin <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
Date: Thu, 19 Mar 2020 09:25:35 +0000
Message-ID: <20200319092535.GB25745@shell.armlinux.org.uk>
References: <CGME20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c@eucas1p1.samsung.com>
 <20200127140716.15673-1-geert+renesas@glider.be>
 <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
 <CAMuHMdUGu4eStpYp5W0SKJd8yrLLDTgF4__Jq_n+Z7SWtPM+Cg@mail.gmail.com>
 <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <90c006f2-8c13-2976-008f-37139ca49f37-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Eric Miao <eric.miao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 19, 2020 at 04:11:00AM +0300, Dmitry Osipenko wrote:
> 25.02.2020 14:40, Geert Uytterhoeven пишет:
> > Hi Marek,
> > 
> > On Tue, Feb 25, 2020 at 12:24 PM Marek Szyprowski
> > <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> >> On 27.01.2020 15:07, Geert Uytterhoeven wrote:
> >>> Currently, the start address of physical memory is obtained by masking
> >>> the program counter with a fixed mask of 0xf8000000.  This mask value
> >>> was chosen as a balance between the requirements of different platforms.
> >>> However, this does require that the start address of physical memory is
> >>> a multiple of 128 MiB, precluding booting Linux on platforms where this
> >>> requirement is not fulfilled.
> >>>
> >>> Fix this limitation by obtaining the start address from the DTB instead,
> >>> if available (either explicitly passed, or appended to the kernel).
> >>> Fall back to the traditional method when needed.
> >>>
> >>> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> >>> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> >>> i.e. not at a multiple of 128 MiB.
> >>>
> >>> Suggested-by: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
> >>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >>> Reviewed-by: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
> >>> ---
> >>> Against arm/for-next.
> >>
> >> This patch landed recently in linux-next. It breaks legacy booting from
> >> the zImage + appended DT + cmdline/memory info provided via ATAGs. I
> >> will debug it further once I find some spare time. What I noticed so
> >> far, the cmdline/memory info is not read from the ATAGs, only the values
> >> provided via appended DT are used.
> > 
> > Oops, something happening like this was one of my biggest worries when
> > posting this patch... Sorry for the breakage.
> > 
> > IIUIC, the kernel still boots, but just doesn't use the info passed by ATAGs?
> > 
> > I'll have a closer look later today.
> > In the mean time, I've sent some debug code I used when developing
> > this patch, which may be useful, hopefully.
> 
> Hello,
> 
> NVIDIA Tegra is also affected by this patch. A week ago an updated
> version of the patch was pushed into linux-next and now machine doesn't
> boot at all.
> 
> I couldn't find v3 on the ML, so replying to the v2. Please take a look
> and fix the problem, or revert/drop the offending patch, thanks in advance.

I'll drop the patch. It's clear that this is going to be difficult,
so I would ask you to test the next version, rather than waiting for
it to appear in linux-next.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
