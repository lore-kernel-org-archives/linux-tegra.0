From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCHv4 0/8] Support for Tegra 2D hardware
Date: Fri, 21 Dec 2012 14:59:24 +0100
Message-ID: <1356098364.1490.114.camel@tellur>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com>
	 <1356097818.1490.109.camel@tellur> <50D46AE4.8020308@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D46AE4.8020308-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Freitag, den 21.12.2012, 15:57 +0200 schrieb Terje Bergstr=C3=B6m:
> On 21.12.2012 15:50, Lucas Stach wrote:
> > This has to be resolved before merging. Personally I'm in favour of
> > keeping reg access patterns close to what is done in other parts of=
 the
> > kernel.
>=20
> I haven't so far received comments from too many people, so that's wh=
y I
> left it as is.
>=20
> >>  * Uses still CMA helpers. IOMMU support will replace CMA with hos=
t1x
> >>    specific allocator.
> >=20
> > I really want the allocator issue resolved before talking about mer=
ging
> > those patches. Proper IOMMU support will require a bit of rework of=
 the
> > current upstream IOMMU API, so it will still be a bit out.
> >=20
> > But if you don't mind I'll try to implement the host1x allocator ov=
er
> > the holidays and provide an incremental patch.
>=20
> Do you mean host1x CMA allocator using dma mapping API? That'd be gre=
at
> if you could help out. I've just tried to concentrate on getting ok f=
or
> base essentials before doing any extra work.
>=20
Yes, exactly that.

I'll provide comments to the other patches when I find time to do so.
Digging in the code might help with this.

Regards,
Lucas
