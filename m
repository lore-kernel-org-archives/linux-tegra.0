From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Tue, 21 Aug 2012 15:53:07 -0600
Message-ID: <50340343.1050206@wwwdotorg.org>
References: <50323513.3090606@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50323513.3090606-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/20/2012 07:01 AM, Terje Bergstr=F6m wrote:
> Hi,
>=20
> I've been trying to figure out the best way to bind together tegradrm
> and nvhost. I assume that nvhost and tegradrm will live as separate
> drivers, with tegradrm taking care of display controller, and nvhost
> taking care of host1x and other client devices.
>=20
> I've identified a bumps that we need to agree on. I've included here =
the
> problem and my proposal:
>=20
> 1) Device & driver registration
> tegradrm registers as platform_driver, and exports ioctl's. Here we
> already have to agree on which device the platform_driver maps to.
> Currently it maps to host1x, but we'll need to move control of host1x=
 to
> nvhost driver. We'll need to pass drm_platform_init() some
> platform_device - I propose that we create a virtual device for this.

I don't think there's any need for a virtual device. There's one device
in HW, and that can be represented by a single device object within the
kernel. There's nothing then stopping that device exposing multiple
APIs, i.e. providing host1x APIs to clients, and also instantiating the
tegra-drm driver directly on top of the host1x device.
