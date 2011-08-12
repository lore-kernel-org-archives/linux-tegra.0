From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] i2c/tegra: I2C driver uses the suspend_noirq/resume_noirq
Date: Thu, 11 Aug 2011 19:59:27 -0700
Message-ID: <CAMbhsRShLvyc2XKJAL8PwR0Uj4Pnp9rVt7QyK1qAVxJ-R2PSdQ@mail.gmail.com>
References: <1312586102-27907-1-git-send-email-swarren@nvidia.com>
	<CAMbhsRScgMaTZ2e3a__OgOrrA6HN9_dkGuuNGaEfP+iqRdjyNQ@mail.gmail.com>
	<20110806084805.GA18098@sirena.org.uk>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24CC8@HQMAIL01.nvidia.com>
	<CAMbhsRR2+bhpjhGfUSt9M5tDk1EW2d70yC-tZy27zEgVqtkfSg@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24D09@HQMAIL01.nvidia.com>
	<CAMbhsRTVm+dUODDgqiekpTrrNnpo9trJNNvOQ2ETCNkneh-L-g@mail.gmail.com>
	<1313109916.19990.28.camel@finisterre.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1313109916.19990.28.camel-bheZrs9scGZIiRQ44+TIyueM+bqZidxxUxDKcUsq0RM@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 11, 2011 at 5:45 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Thu, 2011-08-11 at 14:43 -0700, Colin Cross wrote:
>> On Thu, Aug 11, 2011 at 2:09 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:
>
>> > Well, while that's true, the thing is the right way to handle it d=
oesn't
>> > appear to exist at present.
>
>> Yes, but the maintainers have been asked to stop using one-off hacks
>> to fix everything that isn't supported in common code, and work
>> towards getting the common code fixed instead. =A0If the common code
>> maintainers say this is the best way to fix it for now, fine, but I'=
d
>> like to hear an opinion first.
>
> We've been through this quite a few times already at the driver core
> level, mostly in the context of PMIC probing. Fixing this properly
> requires some surgery on the core device model infrastructure which i=
t's
> not realistic to expect driver authors to implement.
>
>> > So, in other words, how do you suggest I proceed with this?
>
>> device_pm_move_after(deva, devb) makes should make deva suspend befo=
re
>> devb. =A0Maybe subsystems that link multiple devices together should
>> call device_pm_move_after() to make sure that all of their devices
>> suspend before the parents of any of their devices?
>
> This wouldn't be a robust solution for bus independent subsystems as =
it
> doesn't maintain any sort of sorting - it just does a direct move so
> it'll only capture the last dependency we saw. If you've got two
> dependencies we could easily end up breaking things.
>
> For example with ASoC we'd sort all the components before the ASoC ca=
rd
> without regard for their bus dependencies or any other dependencies t=
hey
> have (eg, their regulators). Since the ASoC card is a platform device
> it's likely to have registered early with no regard for where the bus=
es
> the card needs are registered. I'd expect there's a reasonable chance
> it'll actually make things worse in the short term.

You can't just move everything after the card, you have to move
everything after the last device that was probed, and it only works if
nothing depends on any of the devices that are moved.

> I'll mail Ted and see if we can get this on the topic for KS, it's
> getting more and more serious.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
