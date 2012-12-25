From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv4 5/8] drm: tegra: Remove redundant host1x
Date: Mon, 24 Dec 2012 22:25:00 -0700
Message-ID: <50D938AC.50001@wwwdotorg.org>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com> <1356089964-5265-6-git-send-email-tbergstrom@nvidia.com> <20121221143614.GA16167@avionic-0098.adnet.avionic-design.de> <50D55820.7030302@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D55820.7030302-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org" <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/21/2012 11:50 PM, Terje Bergstr=F6m wrote:
> On 21.12.2012 16:36, Thierry Reding wrote:
>> On Fri, Dec 21, 2012 at 01:39:21PM +0200, Terje Bergstrom wrote:
>>> +static struct platform_driver tegra_drm_platform_driver =3D {
>>> +	.driver =3D {
>>> +		.name =3D "tegradrm",
>>
>> This should be "tegra-drm" to match the module name.
>=20
> We've actually created two problems.
>=20
> First is that the device name should match driver name which should
> match module name. But host1x doesn't know the module name of tegradr=
m.

There's no hard requirement for the device/driver name to match the
module name. It's good thing to do, but nothing will blow up if it don'=
t
(modules can use MODULE_ALIAS() to declare which drivers they expose).

But, what's the problem with host1x knowing the driver name; the host1x
driver and tegradrm driver are both part of the same code-base, so this
seems trivial to achieve.

> Second problem is that host1x driver creates tegradrm device even if
> tegradrm isn't loaded to system.

That's fine. If there's no driver, the device simply won't be probe()d.
That's just like a device node existing in device tree, but the driver
for it not being enabled in the kernel, or the relevant module not bein=
g
inserted.

> These mean that the device has to be created in tegra-drm module to h=
ave

I definitely disagree here.
