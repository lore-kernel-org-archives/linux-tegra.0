From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 04/28] ARM: mm: cache-l2x0: Add support for re-enabling l2x0
Date: Fri, 4 Feb 2011 17:32:26 -0600
Message-ID: <AANLkTi=cTXmQFm_s5OL2pGyyaFv5UR_f9MV=S5Ajx0tu@mail.gmail.com>
References: <1295834493-5019-1-git-send-email-ccross@android.com>
	<1295834493-5019-5-git-send-email-ccross@android.com>
	<1295968464.10109.264.camel@e102109-lin.cambridge.arm.com>
	<20110125154133.GB17280@n2100.arm.linux.org.uk>
	<1295979242.10109.308.camel@e102109-lin.cambridge.arm.com>
	<2f97ec8a084e590220e1548fc927b60e@mail.gmail.com>
	<-8932138696981683633@unknownmsgid>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <-8932138696981683633@unknownmsgid>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 25, 2011 at 12:39 PM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wro=
te:
> Santosh,
>
>> > > Maybe we need a notifier list which can be told when cpuidle
>> > events
>> > > happen, so that parts of the system such as VFP and L2 cache
>> > support
>> > > can do the right thing without having platforms add lots of stuf=
f
>> > like
>> > >
>> > > =A0 =A0 =A0 =A0 gic_secondary_init();
>> > > =A0 =A0 =A0 =A0 gic_restore_interrupt_types();
>> > > =A0 =A0 =A0 =A0 vfp_enable();
>> > > =A0 =A0 =A0 =A0 l2x0_enable();
>> > > =A0 =A0 =A0 =A0 twd_enable();
>> > > =A0 =A0 =A0 =A0 ... etc ...
>> > >
>> > > in their SoC specific code.
>> >
>> > But do we need a strict order between such operations? The notifie=
r
>> > call
>> > chain isn't too flexible.
>> >
>> I guess it does depends on how the archs have integrated a9. Example
>> on OMAP there are different power modes possible.
>> =A0 =A0 =A0 1. CPU context ,TWD lost
>> =A0 =A0 =A0 2. CPU context ,TWD + L1 is lost
>> =A0 =A0 =A0 3. CPU context + L1 is lost + GIC lost
>> =A0 =A0 =A0 4. CPU context + L1 is lost + GIC lost + L2 lost
>> So there is need to have flexibility of calling these function
>> based on power modes. I don't know how notifiers can give
>> this flexibility
>
> Well if you set the priority fields in the notifier blocks correctly
> then you can just return NOTIFY_STOP when you've saved/restored as mu=
ch
> as you want. This assumes of course that you can identify which power
> mode you're entering/leaving and that each one is `deeper' than the p=
revious.

I doubt its possible to create an order that will work for all
architectures, and returning NOTIFY_STOP would require the decision on
when to finish to be made by the notifier block instead of the
platform code.

Tegra has three possible idle modes:

1.  WFI - nothing reset
2.  CPU, TWD, L1, GIC lost, L2 needs to be disabled but not reset
3.  CPU, TWD, L1, GIC, and L2 lost

CPU and L1 are already handled by the platform-specific suspend code.
TWD is handled by the clockevents broadcast notifiers.  That leaves L2
and GIC.

The L2 can be idled in two ways: just disable it, but keep the
contents, which prevents having to refill the cache, or a full reset.
Disabling can already be handled by outer_cache_disable().

The GIC needs to be idled differently depending on which cpus are
idle.  On Tegra, if both cpus are idle, the secondary cpu needs to
disable its GIC and go to WFI, while the first cpu saves the GIC
distributor state and powers off both cpus.

While it seems possible to handle all of these cases with a notifier
chain, the amount of platform-specific knowledge and ordering seems
too much to make it worthwhile.

If the ordering requirements are close enough between platforms, or
non-existent (I don't think there are any requirements on Tegra), a
notifier chain with a mask of the hardware that is being reset could
work.  On Tegra, in case 2 above, CPU1 would call:

idle_notify(IDLE_ENTER | GIC_DISABLE)

and CPU0 would call:

idle_notify(IDLE_ENTER | GIC_DISABLE | GIC_SAVE | L2_DISABLE)
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
