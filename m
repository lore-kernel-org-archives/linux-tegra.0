From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Fri, 21 Dec 2012 08:31:18 +0200
Message-ID: <50D40236.9080403@nvidia.com>
References: <50CA175F.60002@wwwdotorg.org> <50CAC2AC.1010704@nvidia.com> <50CB5205.1030303@wwwdotorg.org> <50CB850F.9090704@nvidia.com> <20121216121603.GA31780@avionic-0098.adnet.avionic-design.de> <50D2D792.1050401@nvidia.com> <50D34775.5010606@wwwdotorg.org> <50D34F00.4080308@nvidia.com> <50D3511F.2090308@wwwdotorg.org> <50D35287.3040509@nvidia.com> <20121220203059.GA12977@avionic-0098.adnet.avionic-design.de> <50D38462.3060302@nvidia.com> <50D39122.3060401@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D39122.3060401-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 21.12.2012 00:28, Stephen Warren wrote:
> On 12/20/2012 02:34 PM, Terje Bergstr=C3=B6m wrote:
>> On 20.12.2012 22:30, Thierry Reding wrote:
>>> The problem with your proposed solution is that, even any of Stephe=
n's
>>> valid objections aside, it won't work. Once the tegra-drm module is
>>> unloaded, the driver's data will be left in the current state and t=
he
>>> link to the dummy device will be lost.
>>
>> The dummy device is created by tegradrm's module init, because it's =
used
>=20
> No, the tegradrm driver object might be registered by tegradrm's modu=
le
> init, but the dummy tegradrm platform device would need to be
> created/registered by host1x's probe. Otherwise, the device would get
> created even if there was no host1x/... in the system (disabled for s=
ome
> reason, multi-SoC kernel, ...)

Oh. I was all the time thinking that dummy device needs to be created b=
y
tegradrm, because it's only used by tegradrm.  But as we're mixing the
responsibilities, we might then just as well go all the way.

Terje
