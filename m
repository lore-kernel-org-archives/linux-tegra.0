From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 8/8] drm: tegra: Add gr2d device
Date: Mon, 11 Feb 2013 07:40:10 -0800
Message-ID: <511910DA.8070600@nvidia.com>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com> <1358250244-9678-9-git-send-email-tbergstrom@nvidia.com> <20130204125618.GD595@avionic-0098.mockup.avionic-design.de> <511095F9.6040607@nvidia.com> <20130205095403.GF20437@avionic-0098.mockup.avionic-design.de> <5112C9C5.8080205@nvidia.com> <20130208070734.GB15429@avionic-0098.mockup.avionic-design.de> <51183E8D.1090607@nvidia.com> <20130211064452.GA16676@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130211064452.GA16676-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10.02.2013 22:44, Thierry Reding wrote:
> On Sun, Feb 10, 2013 at 04:42:53PM -0800, Terje Bergstr=F6m wrote:
>> You're right about performance. We already saw quite a bad performan=
ce
>> hit with the current firewall, so we'll need to worry about performa=
nce
>> later.
>=20
> I guess the additional overhead of looking up in a table vs. an actua=
l
> function being run will be rather small compared to the total overhea=
d
> incurred by having the firewall in the first place.

Yeah, I'll just implement a simple linear table lookup and let's see
what happens. I'll optimize with bitfield if needed.

Terje
