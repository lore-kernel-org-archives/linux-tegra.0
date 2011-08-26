From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 00/13] arm/tegra: Initialize GPIO & pinmux from DT
Date: Fri, 26 Aug 2011 09:07:00 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B24A40D2@HQMAIL01.nvidia.com>
References: <1314315824-9687-1-git-send-email-swarren@nvidia.com>
 <CAOesGMiygfaNkPa7uURCiJpC=WDinWhKi07LFgJ+5JoGW_fLKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMiygfaNkPa7uURCiJpC=WDinWhKi07LFgJ+5JoGW_fLKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Thursday, August 25, 2011 11:05 PM:
> On Thu, Aug 25, 2011 at 4:43 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > v3:
...
> This is looking pretty sane to me.
> 
> Grant, how do you prefer to handle this, since it spans of/dt, gpio
> and tegra code? I can start a topic branch for Arnd to pull in for the
> tegra parts, would you prefer picking up the of helper functions on
> your own or is an ack from you and merge through the arm-soc tree
> easier?

I haven't thought through all the merging details yet, but do be aware
of the dependencies this patchset has:

1) Rename of arch/arm/mach-tegra/gpio.c -> drivers/gpio/gpio-tegra.c
   This is in Grant's gpio for-next branch, and hence linux-next.
   This is in some GPIO-related branch of Russell's.

2) Various previous Tegra <mach/gpio.h> rework.
   This is in some GPIO-related branch of Russell's; I assume the same one
   as (1), but I can't actually find this branch, so can't check.

Neither of those is in any Linus release or rc.

I *think* that's it.

For reference, this patchset was physical written/tested on top of
next-20110823, with the patches mentioned in (2) aboe, and some others that
hopefully aren't relevant, between linux-next and this patchset.

-- 
nvpublic
