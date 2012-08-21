From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Tue, 21 Aug 2012 15:57:25 -0600
Message-ID: <50340445.6010908@wwwdotorg.org>
References: <50323513.3090606@nvidia.com>  <1345525045.31608.145.camel@markz-desktop>  <50331F32.4040903@nvidia.com> <1345529528.31608.165.camel@markz-desktop> <50332C22.7090009@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50332C22.7090009-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/21/2012 12:35 AM, Terje Bergstr=C3=B6m wrote:
> On 21.08.2012 09:12, Mark Zhang wrote:
>> OK, thank you. In current version, all devices are created by
>> "of_platform_populate" in board init function. So if we still need t=
o
>> define devices in dt, what's the benefit that we put these device
>> creation works into host1x's probe function? I don't see any differe=
nce
>> although create device in host1x probe() sounds more reasonable...
>=20
> Until I have managed to integrate nvhost to tegradrm, the devices
> creation should be done as it is done now. With nvhost, we will need
> extra data per device, so we'll need to create the devices in nvhost.

I don't believe that has any impact on how the devices need to be creat=
ed.

Both the following should be equally workable:

a)

* Each device gets instantiated as a platform device through simple
of_platform_populate.

* Each driver parses the device node for any information needed by a
host1x client. This parsing could be implemented via a helper function.

The driver can then register the device with host1x, passing in the
host1x-client-information parsed from DT.

b)

* host1x driver enumerates all the clients (sub-nodes) manually.

* As part of the enumeration, the host1x driver parses information from
the client nodes in order to create the device.

* Drivers for host1x devices get probed based on the devices created in
the previous step.

(a) sounds a heck of a lot simpler, because we don't end up creating a
new bus types etc., which in previous conversations you'd mentioned
ended up duplicating a lot of the logic already in the platform bus dri=
ver.
