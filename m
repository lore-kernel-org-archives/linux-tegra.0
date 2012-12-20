From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Thu, 20 Dec 2012 15:29:42 -0700
Message-ID: <50D39156.7010600@wwwdotorg.org>
References: <50CB5205.1030303@wwwdotorg.org> <50CB850F.9090704@nvidia.com> <20121216121603.GA31780@avionic-0098.adnet.avionic-design.de> <50D2D792.1050401@nvidia.com> <50D34775.5010606@wwwdotorg.org> <50D34F00.4080308@nvidia.com> <50D3511F.2090308@wwwdotorg.org> <50D35287.3040509@nvidia.com> <20121220203059.GA12977@avionic-0098.adnet.avionic-design.de> <50D38462.3060302@nvidia.com> <20121220215008.GA30491@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121220215008.GA30491-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/20/2012 02:50 PM, Thierry Reding wrote:
> On Thu, Dec 20, 2012 at 11:34:26PM +0200, Terje Bergstr=C3=B6m wrote:
>> On 20.12.2012 22:30, Thierry Reding wrote:
>>> The problem with your proposed solution is that, even any of
>>> Stephen's valid objections aside, it won't work. Once the
>>> tegra-drm module is unloaded, the driver's data will be left in
>>> the current state and the link to the dummy device will be
>>> lost.
>>=20
>> The dummy device is created by tegradrm's module init, because
>> it's used only by tegradrm. When tegradrm is unloaded, all the
>> tegradrm devices and drivers are unloaded and freed, including
>> the dummy one.
>=20
> No, the children platform devices of host1x are not freed, so
> their driver data will still contain the data set by the previous
> call to their driver's .probe() function.
>=20
> But reading what you said again, you were proposing to set the
> children driver data from the tegra-drm dummy device's .probe(). In
> that case it would probably work.

Many things would work, but since tegradrm isn't (or at least should
not be) the driver for the platform devices which are host1x's
children, it shouldn't be randomly screwing around with those devices'
drvdata fields.
