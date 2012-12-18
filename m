From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Tue, 18 Dec 2012 08:37:44 +0200
Message-ID: <50D00F38.1020005@nvidia.com>
References: <50BF345A.8050201@nvidia.com> <20121205120429.GA29943@avionic-0098.adnet.avionic-design.de> <50C5CAB5.3040000@nvidia.com> <20121212160829.GA30278@avionic-0098.adnet.avionic-design.de> <50C99677.6090306@nvidia.com> <20121213085750.GA14740@avionic-0098.adnet.avionic-design.de> <50CA175F.60002@wwwdotorg.org> <50CAC2AC.1010704@nvidia.com> <50CB5205.1030303@wwwdotorg.org> <50CB850F.9090704@nvidia.com> <20121216121603.GA31780@avionic-0098.adnet.avionic-design.de> <50CDF8C4.4070108@nvidia.com> <50CF86D1.7090303@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50CF86D1.7090303-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 17.12.2012 22:55, Stephen Warren wrote:
> On 12/16/2012 09:37 AM, Terje Bergstr=C3=B6m wrote:
> ...
>> ... Sure we could tell DC to ask its parent
>> (host1x), and call host1x driver with platform_device pointer found =
that
>> way, and host1x would return a pointer to tegradrm's data. Hanging t=
he
>> data onto host1x driver is just a more complicated way of implementi=
ng
>> global data
>=20
> No it's not; at that point, the data is no longer global, but specifi=
c
> to the driver instance.

We have only one tegradrm, so the advantage is theoretical - the one
driver gets the same pointer in both cases.

If we use static pointer with an accessor function, we can keep the
solution contained to one source code file and the ownership of data is
clear - tegradrm allocates and deallocates the object and is the sole
user. Code is already in the patchset I sent.

Shared responsibility with host1x and tegradrm would work probably
something like this:

tegradrm creates an object, and passes the reference to host1x
(host1x_set_drm_pdata(host1x_platform_dev, object). host1x sets the
pdata to a member in struct host1x. A getter host1x_get_drm_pdata()
allows retrieving the object. DC would call it with
"host1x_get_drm_pdata(to_platform_device(pdev->dev.parent))".

This assumes that tegradrm would keep ownership of the data and free it
before host1x gets unloaded.

To me this sounds like a steep price and I fail to see the advantage.

Dummy device is something that would come then on top of this mechanism=
=2E

Terje
