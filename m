From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Mon, 7 Jan 2013 10:20:03 +0200
Message-ID: <50EA8533.3020109@nvidia.com>
References: <50BF345A.8050201@nvidia.com> <20121205120429.GA29943@avionic-0098.adnet.avionic-design.de> <50C5CAB5.3040000@nvidia.com> <20121212160829.GA30278@avionic-0098.adnet.avionic-design.de> <50C99677.6090306@nvidia.com> <20121213085750.GA14740@avionic-0098.adnet.avionic-design.de> <50CA175F.60002@wwwdotorg.org> <50CAC2AC.1010704@nvidia.com> <50CB5205.1030303@wwwdotorg.org> <50CB850F.9090704@nvidia.com> <20121216121603.GA31780@avionic-0098.adnet.avionic-design.de> <50D2D792.1050401@nvidia.com> <50D34775.5010606@wwwdotorg.org> <50D42486.7080901@nvidia.com> <50D4D25B.7030506@wwwdotorg.org> <50E6AA69.4030001@nvidia.com> <50E73AA2.7090500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E73AA2.7090500-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04.01.2013 22:25, Stephen Warren wrote:
> On 01/04/2013 03:09 AM, Terje Bergstr=C3=B6m wrote:
> ...
>> I think we have now two ways to go forward with cons and pros:
>>  1) Keep host1x and tegra-drm as separate driver
>>    + Code almost done
>>    - we need dummy device and dummy driver
>>    - extra code and API when host1x creates dummy device and its pas=
sed
>> to tegra-drm
>=20
> Just to play devil's advocate:
>=20
> I suspect that's only a few lines of code.

Yes, that's true. There's some overhead, but there's not too many actua=
l
code lines.

>>    - tegra-drm device would need to be a child of host1x device. Hav=
ing
>> virtual and real devices as host1x children sounds weird.
>=20
> And I doubt that would cause problems.

True. It could become a problem if the driver just assumed that all
host1x children are actual hardware, but we could avoid that.

>>  2) Merge host1x and tegra-drm into one module. drm is a subcomponen=
t,
>> and whatever other personalities we wish would also be subcomponents=
 of
>> host1x. host1x calls tegra-drm directly to handle preparation for dr=
m
>> initialization. As they're in the same module, circular dependency i=
s ok.
>>    + Simpler conceptually (no dummy device/driver)
>>    + Less code
>>    - Proposal doesn't yet exist
>=20
> But that said, I agree this approach would be very reasonable; it see=
ms
> to me that host1x really is the main HW behind a DRM driver or a V4L2
> driver or ... As such, it seems quite reasonable for a single struct
> device to exist that represents host1x, and for the driver for that
> device to register both a DRM and a V4L2 driver etc. The code could
> physically be organized into separate modules, and under different
> Kconfig options for configurability etc.
>=20
> But either way, I'll let you (Thierry and Terje) work out which way t=
o go.

If we want separate modules, we'd need the dummy device & dummy driver
binding between them. We could also just put them in the same module.
It'd make DRM a requirement to host1x driver, but given the current
structure, I think that'd be reasonable. We could later make it more
configurable if needed. Does this now make tegra-drm and host1x too
dependent on each other? I'm not sure.

I also like the fact that we don't have to export APIs to include, but
we can (if we so choose) keep all tegra-drm-host1x-APIs in local header
files. As we have noted, the two drivers are tightly interconnected,
changing the APIs is easier if we can just work on the same directory
hierarchy.

Terje
