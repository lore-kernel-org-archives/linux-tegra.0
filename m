From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Tue, 27 Nov 2012 12:47:50 +0100
Message-ID: <1354016870.1479.41.camel@tellur>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	 <1353935954-13763-9-git-send-email-tbergstrom@nvidia.com>
	 <CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com>
	 <50B46336.8030605@nvidia.com>
	 <CAPM=9txCuPJcFAfD7Hu5o2BVFK=pVah7B8HhG0ctLCyFPwNEnA@mail.gmail.com>
	 <50B476E1.4070403@nvidia.com>
	 <CAPM=9tysiK6LgnQdAwGSYfxnQfgcfRm0+X2tPSAEDxUPt-QZGA@mail.gmail.com>
	 <50B47DA8.60609@nvidia.com> <1354011776.1479.31.camel@tellur>
	 <20121127103739.GA3329@avionic-0098.adnet.avionic-design.de>
	 <50B4A483.8030305@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B4A483.8030305-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 27.11.2012, 13:31 +0200 schrieb Terje Bergstr=C3=B6m:
> On 27.11.2012 12:37, Thierry Reding wrote:
> > But in that case it should be made mandatory at first until proper =
IOMMU
> > support is enabled on Tegra30. Then it can be checked at driver pro=
be
> > time whether or not to enable the extra checks. That way we don't n=
eed a
> > special Kconfig option and we still get all the security that we ne=
ed,
> > right?
>=20
> I guess it depends on the level of security.
>=20
> If we want to only protect kernel and user space memory, this would b=
e
> sufficient and no firewall is needed if IOMMU is turned on.
>=20
> If we want to protect 2D buffers from each other, this is not suffici=
ent.
>=20
I guess we could change IOMMU address spaces for the graphics units
depending on the active channel. This would still be a bit of a
performance hit, because of the necessary TLB flushing and so on, but
should be much better than checking the whole command stream. This way
you at least get security on a process level, as no process is able to
corrupt another processes graphics resources.

This is the same level of security as provided by the nouveau driver.
But to do so all memory management has to be done in kernel and from th=
e
current submissions of the 2D infrastructure I fear that the current
architecture does too much of that in userspace, but I'll hold back wit=
h
any judgement until we actually get to see the userspace parts.

Also to implement this strategy you have to take ownership of the
graphics address space on a much lower level than the DMA API. This
might take some work together with the IOMMU guys.

Regards,
Lucas
