From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: Tegra: DMA: Fail safe if initialization fails
Date: Wed, 23 Feb 2011 09:54:35 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF03112A5CF5@HQMAIL01.nvidia.com>
References: <1298482170-3678-1-git-send-email-swarren@nvidia.com>
 <AANLkTi=iWsX_UN6pE7nE=7NBXRPv7=6Ja68B=u8U4Ww=@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=iWsX_UN6pE7nE=7NBXRPv7=6Ja68B=u8U4Ww=@mail.gmail.com>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin Cross wrote at Wednesday, February 23, 2011 10:38 AM:
>=20
> On Wed, Feb 23, 2011 at 9:29 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> =
wrote:
> > tegra_dma_init currently simply bails out early if any initializati=
on fails.
> > This skips various data-structure initialization. In turn, this mea=
ns that
> > tegra_dma_allocate_channel can still hand out channels. In this cas=
e, when
> > tegra_dma_free_channel is called, which calls tegra_dma_cancel, the=
 walking
> > on ch->list will OOPS since the list's next/prev pointers may still=
 be
> > NULL.
> >
> > To solve this:
> > * Mark all possible channels as in-use before doing anything else i=
n init.
> > * Only mark a channel as free once all channel-related initializati=
on has
> > =A0completed.
> >
> > This prevents allocate_channel from handing out uninitialized chann=
els.
> >
> > There is still one small hole; allocate_channel can't check the usa=
ge array
> > for the shared channel, since this channel is permanently marked in=
-use.
> > This could be solved using an explicit "init OK" flag that allocate=
_channel
> > could check.
>
> If we still need an init complete flag, why not skip this patch and
> just add that?

I tend to like the cleanup in this patch; it simplifies the channel_usa=
ge
initialization. I'll let you make the call on whether to take this or n=
ot.

I can certainly throw together a second patch, or modify this patch, to=
 also
use an init_ok flag to completely solve the shared channel case too tho=
ugh.

--=20
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
