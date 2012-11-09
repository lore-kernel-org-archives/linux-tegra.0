From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drm: tegra: Add HDMI support
Date: Fri, 9 Nov 2012 17:04:09 +0100
Message-ID: <CACna6rxOBENLVC8mgJdsSdAZdWranMiivSgq_8DzeTo0hzzWqg@mail.gmail.com>
References: <1352469579-3337-1-git-send-email-thierry.reding@avionic-design.de>
	<1352469579-3337-3-git-send-email-thierry.reding@avionic-design.de>
	<CACna6rycZ=TGHP7KpVa_r0JSpc6c=PB89pijR9E_4A=bQ=74Bw@mail.gmail.com>
	<509D28B6.3060207@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <509D28B6.3060207-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

2012/11/9 Christian K=C3=B6nig <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>:
> On 09.11.2012 16:45, Rafa=C5=82 Mi=C5=82ecki wrote:
>> I was told it won't work on different endian devices. See
>> [RFC][PATCH] drm/radeon/hdmi: define struct for AVI infoframe
>> http://lists.freedesktop.org/archives/dri-devel/2012-May/022544.html
>
>
> Yeah, that's indeed true. And honestly adding just another implementa=
tion of
> the HDMI info frames sounds like somebody should finally sit down and
> implement it in a common drm_hdmi.c

Agree.

--=20
Rafa=C5=82
