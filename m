From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator tps65911
Date: Sat, 2 Jun 2012 14:19:57 -0700
Message-ID: <CAOesGMgYAR938F8PnVWaymzMBQwDKeAiUgEP81bv2nN14NmLGg@mail.gmail.com>
References: <1337691917-15040-2-git-send-email-ldewangan@nvidia.com>
	<4FBBC192.7030900@wwwdotorg.org>
	<4FBBC830.2060802@nvidia.com>
	<4FBBCA8F.3050903@wwwdotorg.org>
	<4FBBD33C.8020802@nvidia.com>
	<4FBBDA97.6000006@wwwdotorg.org>
	<4FBBDE06.5080806@nvidia.com>
	<4FC916AC.4060804@wwwdotorg.org>
	<20120601204052.GB4258@opensource.wolfsonmicro.com>
	<4FC92990.5030104@wwwdotorg.org>
	<20120601210451.GC4258@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120601210451.GC4258-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

[+devicetree-discuss and grant/rob]

On Fri, Jun 1, 2012 at 2:04 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Fri, Jun 01, 2012 at 02:44:00PM -0600, Stephen Warren wrote:
>
>> Could you expand on "named property" a bit; I'm not quite sure what
>> you're getting at - literally a property with name "named" (which
>> would be the same as regulator-id under just a different property
>> name), or ...?
>
> Just a property where we only care about a name (ie, that the propert=
y
> is present).
>
>> > Can't we use the right hand side of this? =A0It appears to just be
>> > syntactic sugar without any current meaning.
>
>> The stuff to the right of @ is the "unit address" and must match the
>> value in the reg property. Using that was the first proposal I had
>> above (which I also didn't like as much)
>
> The stuff to the left of the @ is just noise right now, though - it h=
as
> no meaning currently. =A0It's filled in with "regulator" because we n=
eed
> to put something there AFAICT.

Right. In general (and historically) in the device tree, names of the
nodes should have meaning for the person reading the device tree, but
it's not meant to be used for software to figure out the hardware
configuration -- that should instead be handled through compatible +
other properties.

Names are generally kept fairly generic (ethernet, cpus, memory, pci, e=
tc).

Where it starts to become gray area is when it comes down to specific
bindings, and essentially the device nodes underneath of those
devices. It's been generally accepted that we can put meaning to the
names there if needed, but it's still better to avoid it.

I was originally OK with the regulator binding where names have
meaning, but after having looked at it a bit recently when looking at
bindings for some new boards we have, I realized that the original
suggestion for regulator bindings doesn't necessarily isolate the
naming dependencies to only be under the regulators in question. In
particular, for things such as fixed regulators, they can be located
at other places in the device tree.

Maybe the solution to that case is to just aggregate them in one place
and make a pseudo-binding for that (or those, in case of multiple
locations).

On the rest of the name-has-meaning discussion, I think it would be
cleaner to move away from it now while there's relatively few users of
it (with a migratin path), rather than revise it later. But I'll leave
it to Grant and Rob to decide which way the prefer things to be. I
think they might both be travelling around LC/LinuxCon events at the
moment though.


-Olof
