From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [patch 02/23] arm: tegra: Remove unused function which fiddles
 with irq_desc
Date: Sun, 27 Mar 2011 10:07:15 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1103271004560.31464@localhost6.localdomain6>
References: <20110325131617.258789658@linutronix.de> <20110325132047.552074703@linutronix.de> <4D8E4897.5030705@nvidia.com> <alpine.LFD.2.00.1103262118010.31464@localhost6.localdomain6> <AANLkTi=y9JkpJVCq5G151G9k3d0rAcSH13gi6uGB_gDX@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463795968-845400213-1301213237=:31464"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=y9JkpJVCq5G151G9k3d0rAcSH13gi6uGB_gDX-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Lennert Buytenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463795968-845400213-1301213237=:31464
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

On Sat, 26 Mar 2011, Colin Cross wrote:

> On Sat, Mar 26, 2011 at 1:24 PM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> > On Sun, 27 Mar 2011, Varun Wadekar wrote:
> >>
> >> Thomas, then how do you think we should handle restoring of gpio states
> >> across suspend-resume cycles?
> >
> > That code is unused. Period. No caller, nothing nada. So what does it
> > handle?
> 
> Tegra suspend support didn't make it into 2.6.39, but should get
> merged in 2.6.40, and will call tegra_gpio_suspend/resume.
> 
> >> > -
> >> > -   for (i = INT_GPIO_BASE; i < (INT_GPIO_BASE + TEGRA_NR_GPIOS); i++) {
> >> > -           struct irq_desc *desc = irq_to_desc(i);
> >> > -           if (!desc || (desc->status & IRQ_WAKEUP))
> >> > -                   continue;
> >> > -           enable_irq(i);
> >> > -   }
> >
> > And this part is totally unacceptable and should have never been
> > merged. Further it is in the way of cleanups to the core code and as
> > there is no user I'm not willing to even think about what it does and
> > why it is there.
> >
> > FYI, the core code deals with interrupt suspending/resuming
> > already. So if there is a problem with that which does not cover your
> > specific problem, then you better talk to me before hacking up such
> > private workarounds and expecting that I tolerate them in unused code.
> 
> Yes, the existing code wrong, and unnecessary.  It was copied from
> mach-tegra/irq.c, which I later fixed, but I missed this one.  I'll
> take this patch for 2.6.39-rc1, which will prevent merge conflicts
> between your tree and the tegra tree in 2.6.40.

You can keep the functions if you need them anyway, but the irq
fiddling needs to go now as it blocks core code cleanups.

Thanks,

	tglx

---1463795968-845400213-1301213237=:31464--
