From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Wed, 5 Dec 2012 17:43:24 +0200
Message-ID: <50BF6B9C.3020006@nvidia.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-7-git-send-email-tbergstrom@nvidia.com> <20121205083335.GA20984@avionic-0098.adnet.avionic-design.de> <50BF1DAA.8030805@nvidia.com> <20121205111332.GA25676@avionic-0098.adnet.avionic-design.de> <50BF345A.8050201@nvidia.com> <20121205120429.GA29943@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121205120429.GA29943-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05.12.2012 14:04, Thierry Reding wrote:
> On Wed, Dec 05, 2012 at 01:47:38PM +0200, Terje Bergstr=C3=B6m wrote:
> Yes, but there's more. For instance I went to great lengths to make s=
ure
> there's no global data whatsoever. So all the data is bound to the
> host1x device in the current code. I know many other drivers like to
> take a shortcut and just put these things into global variables but I
> didn't want to.

Sure, that feedback is in the todo list. For some parts I already have =
a
proposed solution, but for chip ops not yet.

>> The problem with doing drm_platform_init() with host1x device as
>> parameter is that drm_get_platform_dev() will take control of drvdat=
a.
>> We'd need to put host1x specific struct host1x pointer to some other
>> place and I'm not sure what that place could be.
>=20
> Not anymore. I submitted a patch so that it no longer does that. The
> patch was merged about a month and a half ago.

Oops, I must've checked the status from a stale tree. Thanks for that.
In this case there's no technical reason why host1x couldn't act as the
device to register for drm, as drm wouldn't touch host1x device data in
any way.

How about if we treat the host1x driver as utility library, and move th=
e
code for host1x probe altogether to tegradrm/host1x.c? I haven't yet
checked how bad the dependencies between host1x's driver's host1x.c and
the rest of the driver are, so I'm not sure if it's feasible and if
there would be a clear design. Just tossing in ideas.

That would solve the circular dependency problem. I've already committe=
d
to contents of host1x.c being very different in downstream and upstream=
,
so this change would just emphasize that.

Terje
