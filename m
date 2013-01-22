From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Tue, 22 Jan 2013 10:15:21 +0100
Message-ID: <1358846121.1540.6.camel@tellur>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
	 <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de>
	 <50FE4E4F.6080506@nvidia.com>
	 <20130122085756.GA6315@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130122085756.GA6315-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 22.01.2013, 09:57 +0100 schrieb Thierry Reding:
> On Tue, Jan 22, 2013 at 10:31:11AM +0200, Terje Bergstr=C3=B6m wrote:
> > Of course, this has the prerequisite of having support for syncpts,
> > which I hoped we would get to 3.9. The review for host1x patches se=
em to
> > have stalled, so that's iffy.
>=20
> Yes, I haven't found as much time as I would have liked to look at th=
e
> latest patches. Perhaps there will be a time slot at the end of the
> week. I thought there was also the remaining issue with the memory
> allocator that Lucas (Cc'ed) was working on?
>=20
Yes, I haven't finished this work yet. I got side tracked by upstreamin=
g
the platform patches for the Colibri and some real life activities. I'l=
l
get back to this ASAP.

But even if I get this out real soon, I'm not really comfortable with
speeding things to 3.9. I would like to review the userspace side of
thing a lot more thoroughly, before committing to the interface. But
maybe this can also happen in the 3.9 RC timeframe.

Regards,
Lucas
