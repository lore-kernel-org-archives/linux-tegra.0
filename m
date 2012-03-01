From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 5/8] ARM: tegra: work around tegra THUMB2_KERNEL bug
Date: Thu, 1 Mar 2012 20:42:04 +0000
Message-ID: <20120301204203.GA19274@n2100.arm.linux.org.uk>
References: <1330630010-11241-1-git-send-email-alan@signal11.us> <1330630010-11241-6-git-send-email-alan@signal11.us> <74CDBE0F657A3D45AFBB94109FB122FF17BE861726@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BE861726-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alan Ott <alan-yzvJWuRpmD1zbRFIqnYvSA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 01, 2012 at 12:02:42PM -0800, Stephen Warren wrote:
> Alan Ott wrote at Thursday, March 01, 2012 12:27 PM:
> > From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > 
> > The tegra smp code cannot currently be built for t2, so
> > disable that combination for now, as a workaround.
> > 
> > Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> At least in next-20120229 with the .config I'm using, everything appears
> to compile fine. The link step does fail, but the error messages I get
> don't appear to be Tegra specific:
> 
> xxx/kernel/sched/clock.c:334: relocation truncated to fit: R_ARM_THM_JUMP11 against symbol `sched_clock' defined in .text section in arch/arm/kernel/built-in.o
> kernel/built-in.o: In function `post_relocation':
> xxx/kernel/module.c:2860: relocation truncated to fit: R_ARM_THM_JUMP11 against symbol `module_finalize' defined in .text section in arch/arm/kernel/built-in.o
> kernel/built-in.o: In function `show_interrupts':
> xxx/kernel/irq/proc.c:431: relocation truncated to fit: R_ARM_THM_JUMP11 against symbol `arch_show_interrupts' defined in .text section in arch/arm/kernel/built-in.o
> drivers/built-in.o: In function `pci_set_master':
> xxx/drivers/pci/pci.c:2674: relocation truncated to fit: R_ARM_THM_JUMP11 against symbol `pcibios_set_master' defined in .text section in arch/arm/kernel/built-in.o

At a guess, it suggests your kernel image is too big for the relocations
contained within the code.  That's something for Thumb people to look
into and solve.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
