From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Mon, 07 Jan 2013 10:07:25 -0700
Message-ID: <50EB00CD.2040204@wwwdotorg.org>
References: <50BF345A.8050201@nvidia.com> <20121205120429.GA29943@avionic-0098.adnet.avionic-design.de> <50C5CAB5.3040000@nvidia.com> <20121212160829.GA30278@avionic-0098.adnet.avionic-design.de> <50C99677.6090306@nvidia.com> <20121213085750.GA14740@avionic-0098.adnet.avionic-design.de> <50CA175F.60002@wwwdotorg.org> <50CAC2AC.1010704@nvidia.com> <50CB5205.1030303@wwwdotorg.org> <50CB850F.9090704@nvidia.com> <20121216121603.GA31780@avionic-0098.adnet.avionic-design.de> <50D2D792.1050401@nvidia.com> <50D34775.5010606@wwwdotorg.org> <50D42486.7080901@nvidia.com> <50D4D25B.7030506@wwwdotorg.org> <50E6AA69.4030001@nvidia.com> <50E73AA2.7090500@wwwdotorg.org> <50EA8533.3020109@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50EA8533.3020109-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/07/2013 01:20 AM, Terje Bergstr=C3=B6m wrote:
> On 04.01.2013 22:25, Stephen Warren wrote:
>> On 01/04/2013 03:09 AM, Terje Bergstr=C3=B6m wrote:
>> ...
>>> I think we have now two ways to go forward with cons and pros:
>>>  1) Keep host1x and tegra-drm as separate driver
>>>    + Code almost done
>>>    - we need dummy device and dummy driver
>>>    - extra code and API when host1x creates dummy device and its pa=
ssed
>>> to tegra-drm
=2E..
>>>  2) Merge host1x and tegra-drm into one module. drm is a subcompone=
nt,
>>> and whatever other personalities we wish would also be subcomponent=
s of
>>> host1x. host1x calls tegra-drm directly to handle preparation for d=
rm
>>> initialization. As they're in the same module, circular dependency =
is ok.
>>>    + Simpler conceptually (no dummy device/driver)
>>>    + Less code
>>>    - Proposal doesn't yet exist
>>
>> But that said, I agree this approach would be very reasonable; it se=
ems
>> to me that host1x really is the main HW behind a DRM driver or a V4L=
2
>> driver or ... As such, it seems quite reasonable for a single struct
>> device to exist that represents host1x, and for the driver for that
>> device to register both a DRM and a V4L2 driver etc. The code could
>> physically be organized into separate modules, and under different
>> Kconfig options for configurability etc.
>>
>> But either way, I'll let you (Thierry and Terje) work out which way =
to go.
>=20
> If we want separate modules, we'd need the dummy device & dummy drive=
r
> binding between them.

I haven't really thought it through, but I don't think so; I was
thinking separate modules more just to allow linking smaller chunks of
code at once rather than allowing optional functionality via loading (o=
r
not) various modules. Hence, simple function calls between the
files/modules. Still, there may well be no need at all to split it into
separate modules.
