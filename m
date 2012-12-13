From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Thu, 13 Dec 2012 10:58:55 -0700
Message-ID: <50CA175F.60002@wwwdotorg.org>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-7-git-send-email-tbergstrom@nvidia.com> <20121205083335.GA20984@avionic-0098.adnet.avionic-design.de> <50BF1DAA.8030805@nvidia.com> <20121205111332.GA25676@avionic-0098.adnet.avionic-design.de> <50BF345A.8050201@nvidia.com> <20121205120429.GA29943@avionic-0098.adnet.avionic-design.de> <50C5CAB5.3040000@nvidia.com> <20121212160829.GA30278@avionic-0098.adnet.avionic-design.de> <50C99677.6090306@nvidia.com> <20121213085750.GA14740@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121213085750.GA14740-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/13/2012 01:57 AM, Thierry Reding wrote:
> On Thu, Dec 13, 2012 at 10:48:55AM +0200, Terje Bergstr=C3=B6m wrote:
>> On 12.12.2012 18:08, Thierry Reding wrote:
>>> I've briefly discussed this with Stephen on IRC because I
>>> thought I had remembered him objecting to the idea of adding a
>>> dummy device just for this purpose. It turns out, however, that
>>> what he didn't like was to add a dummy node to the DT just to
>>> make this happen, but he has no (strong) objections to a dummy
>>> platform device.
>>>=20
>>> While I'm not very happy about that solution, I've been going
>>> over it for a week now and haven't come up with any better
>>> alternative that doesn't have its own disadvantages. So perhaps
>>> we should go ahead and implement that. For the host1x driver
>>> this really just means creating a platform device and adding it
>>> to the system, with some of the fields tweaked to make things
>>> work.
>>=20
>> Even the virtual device is not too beautiful. The problem is that
>> the virtual device is not physical parent for DC, HDMI, etc, so=20
>> dev_get_drvdata(pdev->dev.parent) returns the data from host1x
>> device, not the virtual device.
>>=20
>> We'll post with something that goes around this, but it's not
>> going to be too pretty. Let's try to find the solution once we
>> get the code out.
>=20
> After some more discussion with Stephen on IRC we came to the
> conclusion that the easiest might be to have tegra-drm call into
> host1x with something like:
>=20
> void host1x_set_drm_device(struct host1x *host1x, struct device
> *dev);

If host1x is registering the dummy device that causes tegradrm to be
instantiated, then presumably there's no need for the API above, since
host1x will already have the struct device * for tegradrm, since it
created it?

> Once the dummy device has been properly set up and have each client
> use
>=20
> struct device *host1x_get_drm_device(struct host1x *host1x);
>=20
> to obtain a pointer to the dummy device, such that it can receive
> the driver-private data using dev_get_drvdata() on the returned
> device. As long as tegra-drm hasn't registered with host1x yet, the
> above function could return ERR_PTR(-EPROBE_DEFER), so that
> dependencies are automatically handled. This is required because,
> tegra-drm not being the parent of the child devices, it can be
> guaranteed that it is probed before any of the children.
>=20
> That way we should be able to get around any circular
> dependencies, since we only call into host1x from tegra-drm but not
> the other way around.
