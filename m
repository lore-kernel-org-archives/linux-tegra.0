From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Tue, 27 Nov 2012 11:22:56 +0100
Message-ID: <1354011776.1479.31.camel@tellur>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	 <1353935954-13763-9-git-send-email-tbergstrom@nvidia.com>
	 <CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com>
	 <50B46336.8030605@nvidia.com>
	 <CAPM=9txCuPJcFAfD7Hu5o2BVFK=pVah7B8HhG0ctLCyFPwNEnA@mail.gmail.com>
	 <50B476E1.4070403@nvidia.com>
	 <CAPM=9tysiK6LgnQdAwGSYfxnQfgcfRm0+X2tPSAEDxUPt-QZGA@mail.gmail.com>
	 <50B47DA8.60609@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B47DA8.60609-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 27.11.2012, 10:45 +0200 schrieb Terje Bergstr=C3=B6m:
> On 27.11.2012 10:32, Dave Airlie wrote:
> > On Tue, Nov 27, 2012 at 8:16 AM, Terje Bergstr=C3=B6m <tbergstrom@n=
vidia.com> wrote:
> >> Thanks for the pointer, I looked at exynos code. It indeed checks =
the
> >> registers written to, but it doesn't prevent overrun by checking s=
izes
> >> of buffers and compare against requests.
> > They probably need to add that, its not as important as the base
> > addresses, unless it takes negative strides, generally base address=
es
> > means you can target current->uid quite easily!
>=20
> Ok. We'll implement the firewall, unless we come up with even a bette=
r
> choice.
>=20
> >> If this is the way to go, I'll put the firewall behind a Kconfig f=
lag so
> >> that system integrator can decide if his system needs it.
> > We don't generally make security like this optional :-)
> >=20
> > If you do that you should restrict the drm device to root users onl=
y,
> > and never let a user with a browser anywhere near it.
>=20
Personally I would never trust any binary, but that's just my personal
opinion.

But I'm in favour of having the command stream checking optional, simpl=
y
backed by the fact that we are likely to use the same 2D driver
infrastructure for Tegra 2 and 3. On Tegra 3 we can most likely go
without in-depth command stream checking as the graphics core there sit=
s
behind the IOMMU, which can provide an appropriate level of security.

Regards,
Lucas
