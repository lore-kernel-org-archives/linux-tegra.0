From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] i2c/tegra: I2C driver uses the suspend_noirq/resume_noirq
Date: Thu, 11 Aug 2011 14:43:55 -0700
Message-ID: <CAMbhsRTVm+dUODDgqiekpTrrNnpo9trJNNvOQ2ETCNkneh-L-g@mail.gmail.com>
References: <1312586102-27907-1-git-send-email-swarren@nvidia.com>
	<CAMbhsRScgMaTZ2e3a__OgOrrA6HN9_dkGuuNGaEfP+iqRdjyNQ@mail.gmail.com>
	<20110806084805.GA18098@sirena.org.uk>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24CC8@HQMAIL01.nvidia.com>
	<CAMbhsRR2+bhpjhGfUSt9M5tDk1EW2d70yC-tZy27zEgVqtkfSg@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24D09@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04AEA24D09-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 11, 2011 at 2:09 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Colin Cross wrote at Thursday, August 11, 2011 2:51 PM:
>> Cc: Mark Brown; Ben Dooks; Dilan Lee; linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; lin=
ux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
>> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [PATCH] i2c/tegra: I2C driver uses the suspend_noirq/re=
sume_noirq
>>
>> On Thu, Aug 11, 2011 at 12:35 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
> wrote:
>> > Mark Brown wrote at Saturday, August 06, 2011 2:48 AM:
>> >> On Fri, Aug 05, 2011 at 09:33:31PM -0700, Colin Cross wrote:
>> > ...
>> >> > NAK - moving the suspend order around is not the correct way to=
 solve
>> >> > this. =A0If wm8903 needs to talk to the i2c bus in its suspend =
handler,
>> >> > it needs to be child device on the i2c bus. =A0suspend_noirq is=
 for
>> >>
>> >> WM8903 is an I2C device. =A0The problem is that it's suspended as=
 part of
>> >> the ASoC suspend since the audio subsystem is composed of multipl=
e
>> >> devices that all need to work together coherently. =A0I did start=
 doing
>> >> some stuff to bodge around this like we do on probe but there are=
 enough
>> >> system wide problems with this that it didn't seem worth the comp=
lexity
>> >> when the existing workarounds are so straightforward.
>> >
>> > Colin, given Mark's explanation, are you OK with the patch now?
>>
>> It's still not the right way to handle this, are you going to mark
>> every I2C controller as suspend_noirq? =A0What happens when you find=
 an
>> I2C controller that needs its irq on to suspend? =A0These are the ki=
nds
>> of hacks we've been asked not to do in ARM, so I'd like to see a
>> response from the I2C maintainers.
>
> Well, while that's true, the thing is the right way to handle it does=
n't
> appear to exist at present.

Yes, but the maintainers have been asked to stop using one-off hacks
to fix everything that isn't supported in common code, and work
towards getting the common code fixed instead.  If the common code
maintainers say this is the best way to fix it for now, fine, but I'd
like to hear an opinion first.

> I did briefly try to move the entire ASoC suspend to early suspend (o=
r
> something like that), but ran into a whole slew of issues, that I
> unfortunately don't recall right now. That would also impact every us=
er
> of ASoC, not just Tegra...
>
> So, in other words, how do you suggest I proceed with this?

device_pm_move_after(deva, devb) makes should make deva suspend before
devb.  Maybe subsystems that link multiple devices together should
call device_pm_move_after() to make sure that all of their devices
suspend before the parents of any of their devices?

> Mark Brown wrote:
>> Unfortunately it's the only tool Linux has for dealing with this sor=
t of
>> issue right now. =A0We were supposed to be getting support for telli=
ng the
>> PM core about dependencies but Linus didn't like that,
>
> Mark, can you fill in a little more detail; did Linus not like the co=
ncept
> of drivers registering dependencies on each-other, or was there a pro=
blem
> with the specific implementation that was proposed? I assume we're st=
ill a
> long way away from anything like that working. You also mentioned Gra=
nt's
> device registration retry stuff, but doesn't that only solve the init=
ial
> probing, not shutdown/suspend dependencies, or do devices take locks =
on
> each-other to handle that too?
>
> Thanks.
>
> --
> nvpubilc
>
>
