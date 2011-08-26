From: Moon Hwa Hong <armkernel8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: ARMv7 MMU and cache enabling code in boot/compressed/head.S
Date: Fri, 26 Aug 2011 09:31:25 +0900
Message-ID: <CAFWwQu_-HirBTsyFpG8EKs6Su9r=O4Wi8=L3b-O4OdMKDC0f8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi!

I started arm linux kernel hacking.
I can't understand 554 line.
I think that 554 line is not necessary.
Because ISB instruction(556 line) makes synchronization between 553 and 557.
Please advice to me.


530 __armv7_mmu_cache_on:
.
.
.
553         mcr p15, 0, r0, c1, c0, 0   @ load control register
554         mrc p15, 0, r0, c1, c0, 0   @ and read it back
555         mov r0, #0
556         mcr p15, 0, r0, c7, c5, 4   @ ISB
557         mov pc, r12

Have a nice day.

MH Hong.
