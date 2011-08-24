From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] i2c/tegra: I2C driver uses the suspend_noirq/resume_noirq
Date: Wed, 24 Aug 2011 14:33:59 -0700
Message-ID: <CAMbhsRRRa_JV8_LHEvsM2h3e8Hbf1GAcpXz8gdU3wCc8Jgz5gw@mail.gmail.com>
References: <1312586102-27907-1-git-send-email-swarren@nvidia.com>
	<CAMbhsRScgMaTZ2e3a__OgOrrA6HN9_dkGuuNGaEfP+iqRdjyNQ@mail.gmail.com>
	<20110806084805.GA18098@sirena.org.uk>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24CC8@HQMAIL01.nvidia.com>
	<CAMbhsRR2+bhpjhGfUSt9M5tDk1EW2d70yC-tZy27zEgVqtkfSg@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24D09@HQMAIL01.nvidia.com>
	<CAMbhsRTVm+dUODDgqiekpTrrNnpo9trJNNvOQ2ETCNkneh-L-g@mail.gmail.com>
	<1313109916.19990.28.camel@finisterre.wolfsonmicro.main>
	<CAMbhsRShLvyc2XKJAL8PwR0Uj4Pnp9rVt7QyK1qAVxJ-R2PSdQ@mail.gmail.com>
	<20110812031433.GE10218@opensource.wolfsonmicro.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04B24A3CA6@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04B24A3CA6-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 24, 2011 at 2:28 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Mark Brown wrote at Thursday, August 11, 2011 9:15 PM:
>> On Thu, Aug 11, 2011 at 07:59:27PM -0700, Colin Cross wrote:
>> > On Thu, Aug 11, 2011 at 5:45 PM, Mark Brown
>>
>> > > For example with ASoC we'd sort all the components before the AS=
oC card
>> > > without regard for their bus dependencies or any other dependenc=
ies they
>> > > have (eg, their regulators). Since the ASoC card is a platform d=
evice
>> > > it's likely to have registered early with no regard for where th=
e buses
>> > > the card needs are registered. I'd expect there's a reasonable c=
hance
>> > > it'll actually make things worse in the short term.
>>
>> > You can't just move everything after the card, you have to move
>> > everything after the last device that was probed, and it only work=
s if
>> > nothing depends on any of the devices that are moved.
>>
>> Sorry, I said that the wrong way round due to trying to reply quickl=
y -
>> the card would be the thing that moves since that's the thing that
>> actually does the suspend but we've *no* idea which device we need t=
o
>> move it after. =A0Since all the function does is a direct move after=
 or
>> before a single device all we can do is pick one and pray that it's =
the
>> right device.
>
> Colin,
>
> This thread seems to have died down; how should we make progress?
>
> It sounds like the suspend_irq solution is the current de-facto stand=
ard;
> not optimal, but all we really have right now and already in use. I c=
ould
> certainly see avoiding this solution if it was the first time it was
> employed, but re-using it seems reasonable to me?
>
> Alternatively, are you attending either Linux Plumbers Conference or =
the
> Kernel Summit? Mark implied this topic might well come up for discuss=
ion
> there. Unfortunately, I won't be able to make LPC due to a conflict.
I don't think I'll be able to make it.

> (and you'd mentioned having the subsystem maintainers weigh in on thi=
s;
> which sub-system; IRQ, power, I2C, ...?)

If Ben says its OK, its fine with me.  Or maybe Arnd wants to weigh in?
