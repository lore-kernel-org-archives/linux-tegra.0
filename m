From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 5/8] ARM: tegra: Add auxiliary data for nvhost
Date: Tue, 27 Nov 2012 10:17:42 -0700
Message-ID: <50B4F5B6.6000008@wwwdotorg.org>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-6-git-send-email-tbergstrom@nvidia.com> <50B3FDCC.7080709@wwwdotorg.org> <50B45EA8.7000502@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B45EA8.7000502-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/26/2012 11:33 PM, Terje Bergstr=F6m wrote:
> On 27.11.2012 01:39, Stephen Warren wrote:
>> Clock names shouldn't be passed in platform data; instead, clk_get()
>> should be passed the device object and device-relative (i.e. not glo=
bal)
>> clock name. I expect if the driver is fixed to make this change, the
>> changes to tegra*_clocks_data.c won't be needed either.
>=20
> Isn't this code doing exactly that - getting a device relative clock,
> nvhost_module_init() in nvhost.acm.c:
>=20
> (...)
> 	/* initialize clocks to known state */
> 	while (pdata->clocks[i].name && i < NVHOST_MODULE_MAX_CLOCKS) {
> 		long rate =3D pdata->clocks[i].default_rate;
> 		struct clk *c;
>=20
> 		c =3D devm_clk_get(&dev->dev, pdata->clocks[i].name);

The line above is getting the (device-relative) clock name from platfor=
m
data, rather than using some fixed name as it should be.
