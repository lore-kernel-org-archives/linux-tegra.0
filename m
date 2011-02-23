From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: Tegra: DMA: Fail safe if initialization fails
Date: Wed, 23 Feb 2011 10:39:31 -0800
Message-ID: <AANLkTinhrb+GFGs=93=eu=0XfPHtm_-hc6OATns6eKNY@mail.gmail.com>
References: <1298482170-3678-1-git-send-email-swarren@nvidia.com>
	<AANLkTi=iWsX_UN6pE7nE=7NBXRPv7=6Ja68B=u8U4Ww=@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF03112A5CF5@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF03112A5CF5-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 9:54 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Colin Cross wrote at Wednesday, February 23, 2011 10:38 AM:
>>
>> On Wed, Feb 23, 2011 at 9:29 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:
>> > tegra_dma_init currently simply bails out early if any initializat=
ion fails.
>> > This skips various data-structure initialization. In turn, this me=
ans that
>> > tegra_dma_allocate_channel can still hand out channels. In this ca=
se, when
>> > tegra_dma_free_channel is called, which calls tegra_dma_cancel, th=
e walking
>> > on ch->list will OOPS since the list's next/prev pointers may stil=
l be
>> > NULL.
>> >
>> > To solve this:
>> > * Mark all possible channels as in-use before doing anything else =
in init.
>> > * Only mark a channel as free once all channel-related initializat=
ion has
>> > =A0completed.
>> >
>> > This prevents allocate_channel from handing out uninitialized chan=
nels.
>> >
>> > There is still one small hole; allocate_channel can't check the us=
age array
>> > for the shared channel, since this channel is permanently marked i=
n-use.
>> > This could be solved using an explicit "init OK" flag that allocat=
e_channel
>> > could check.
>>
>> If we still need an init complete flag, why not skip this patch and
>> just add that?
>
> I tend to like the cleanup in this patch; it simplifies the channel_u=
sage
> initialization. I'll let you make the call on whether to take this or=
 not.
Ok, it seems like a reasonable cleanup.  Can I request a few changes?
Get rid of the redundant memsets
Replace the initial for loop to set all the bits with bitmap_set
Might as well add the init complete flag to this patch as well.  You
could also do it by checking the channel_usage bit for the shared
channel, and never setting it in tegra_dma_allocate_channel.

> I can certainly throw together a second patch, or modify this patch, =
to also
> use an init_ok flag to completely solve the shared channel case too t=
hough.
>
> --
> nvpublic
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
