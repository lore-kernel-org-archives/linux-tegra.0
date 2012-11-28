From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Wed, 28 Nov 2012 14:33:22 +0100
Message-ID: <1354109602.1479.66.camel@tellur>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	 <1353935954-13763-9-git-send-email-tbergstrom@nvidia.com>
	 <CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com>
	 <50B46336.8030605@nvidia.com>
	 <CAPM=9txCuPJcFAfD7Hu5o2BVFK=pVah7B8HhG0ctLCyFPwNEnA@mail.gmail.com>
	 <50B476E1.4070403@nvidia.com>
	 <CAPM=9tysiK6LgnQdAwGSYfxnQfgcfRm0+X2tPSAEDxUPt-QZGA@mail.gmail.com>
	 <50B47DA8.60609@nvidia.com>	<1354011776.1479.31.camel@tellur>
	 <20121127103739.GA3329@avionic-0098.adnet.avionic-design.de>
	 <50B4A483.8030305@nvidia.com>
	 <CAPM=9tz=_0Drx3=Me3EQdPgBvYVGzs6Gnqaw6RBaTLsCG24RAg@mail.gmail.com>
	 <50B60EFF.1050703@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B60EFF.1050703-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 28.11.2012, 15:17 +0200 schrieb Terje Bergstr=C3=B6m:
> On 28.11.2012 01:00, Dave Airlie wrote:
> > We  generally aim for the first, to stop the gpu from reading/writi=
ng
> > any memory it hasn't been granted access to,
> > the second is nice to have though, but really requires a GPU with V=
M
> > to implement properly.
>=20
> I wonder if we should aim at root only access on Tegra20, and force
> IOMMU on Tegra30 and fix the remaining issues we have with IOMMU. The
> firewall turns out to be more complicated than I wished.
>=20
> Biggest problem is that we aim at zero-copy for everything possible,
> including command streams. Kernel gets a handle to a command stream, =
but
> the command stream is allocated by the user space process. So the use=
r
> space can tamper with the stream once it's been written to the host1x=
 2D
> channel.
>=20
So this is obviously wrong. Userspace has to allocate a pushbuffer from
the kernel just as every other buffer, then map it into it's own addres=
s
space to push in commands. At submit time of the pushbuf kernel has to
make sure that userspace is not able to access the memory any more, i.e=
=2E
kernel shoots down the vma or pagetable of the vma. To keep overhead lo=
w
and not do any blocking you can just keep some pushbufs around for one
channel and switch over the pagetable entries to the next free buffer,
just make sure that userspace is never able to tamper with a buffer as
long as the gpu isn't done with it.

Regards,
Lucas
