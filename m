From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Tue, 22 Jan 2013 10:48:12 +0100
Message-ID: <1358848092.1540.13.camel@tellur>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
	 <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de>
	 <50FE4E4F.6080506@nvidia.com>
	 <20130122085756.GA6315@avionic-0098.adnet.avionic-design.de>
	 <1358846121.1540.6.camel@tellur>
	 <20130122093150.GA22264@avionic-0098.adnet.avionic-design.de>
	 <50FE5F61.4080103@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50FE5F61.4080103-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 22.01.2013, 11:44 +0200 schrieb Terje Bergstr=C3=B6m:
> On 22.01.2013 11:31, Thierry Reding wrote:
> > I'm not quite sure if I remember correctly, but I think David menti=
oned
> > something along the lines of requiring a working userspace that can=
 be
> > used to test the DRM interfaces as a prerequisite to getting this k=
ind
> > of code merged.
>=20
> That's why we have provided user space, test suite that tests all
> interfaces we are exporting, and a demo application that runs. If the
> prerequisite is a working DDX, that's obviously not enough.
>=20
I think the test suite is enough to fulfil the formal requirement of
having a working userspace. But still it would be nice to have at least
some simple accel functions working in the DDX. Maybe just to see on ho=
w
well the current design integrates into the DDX code.

So I wouldn't make a working DDX a hard requirement for merging G2D
code, but I suspect that if the kernel code goes into 3.10 instead of
3.9, we'll just naturally get to the point of working DDX accel by the
same time.

Regards,
Lucas
