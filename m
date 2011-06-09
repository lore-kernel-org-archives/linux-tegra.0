From: Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra/harmony: enable USB host ports
Date: Thu, 9 Jun 2011 09:53:18 +0300
Message-ID: <BANLkTikRZw+OjUit=uLpHYS1KkPeM2FbEw@mail.gmail.com>
References: <1307528018-14454-1-git-send-email-marc.zyngier@arm.com>
	<74CDBE0F657A3D45AFBB94109FB122FF0498E1CDC5@HQMAIL01.nvidia.com>
	<4DEFADCB.90805@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4DEFADCB.90805-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 8, 2011 at 8:13 PM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wro=
te:
>
> > I'm not sure if that platform data is appropriate for tegra_ehci1_d=
evice;
> > the ChromeOS kernel doesn't enable that port.
>
> There's probably some kind of GPIO trickery involved to reset the por=
t...

I don't think it's possible to enable port 1 in host mode on
harmony... As far as I remember, port 1 is routed to mini-B connector
and there's nothing that would supply Vbus in the host mode...

> > You can find that at either:
> >
> > http://git.chromium.org/chromiumos/third_party/kernel.git
> >
> > or commit 0d7ae83b763bb3727e6b6189b49925cd3ab2e204
> > http://avon.wwwdotorg.org/downloads/kernel.git asoc_for-2.6.40_plus=
_harmony
>
> Thanks for the pointers.
>
> Cheers,
>
> =A0 =A0 =A0 =A0M.
> --
> Jazz is not dead. It just smells funny...
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--
Sincerely Yours,
Mike.
