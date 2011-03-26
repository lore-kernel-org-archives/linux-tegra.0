From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [patch 02/23] arm: tegra: Remove unused function which fiddles
 with irq_desc
Date: Sat, 26 Mar 2011 21:24:50 +0100 (CET)
Message-ID: <alpine.LFD.2.00.1103262118010.31464@localhost6.localdomain6>
References: <20110325131617.258789658@linutronix.de> <20110325132047.552074703@linutronix.de> <4D8E4897.5030705@nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D8E4897.5030705-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Lennert Buytenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, 27 Mar 2011, Varun Wadekar wrote:
> 
> Thomas, then how do you think we should handle restoring of gpio states
> across suspend-resume cycles?

That code is unused. Period. No caller, nothing nada. So what does it
handle?
 
> > -
> > -	for (i = INT_GPIO_BASE; i < (INT_GPIO_BASE + TEGRA_NR_GPIOS); i++) {
> > -		struct irq_desc *desc = irq_to_desc(i);
> > -		if (!desc || (desc->status & IRQ_WAKEUP))
> > -			continue;
> > -		enable_irq(i);
> > -	}

And this part is totally unacceptable and should have never been
merged. Further it is in the way of cleanups to the core code and as
there is no user I'm not willing to even think about what it does and
why it is there.

FYI, the core code deals with interrupt suspending/resuming
already. So if there is a problem with that which does not cover your
specific problem, then you better talk to me before hacking up such
private workarounds and expecting that I tolerate them in unused code.

Thanks,

	tglx
