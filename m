From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 2/8] gpu: host1x: Add syncpoint wait and interrupts
Date: Wed, 6 Feb 2013 12:41:49 -0800
Message-ID: <5112C00D.7010507@nvidia.com>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com> <1358250244-9678-3-git-send-email-tbergstrom@nvidia.com> <20130204103032.GB27443@avionic-0098.mockup.avionic-design.de> <51108A94.3060501@nvidia.com> <20130205084255.GB20437@avionic-0098.mockup.avionic-design.de> <5112BD26.5060800@nvidia.com> <20130206203854.GA1012@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130206203854.GA1012-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06.02.2013 12:38, Thierry Reding wrote:
> On Wed, Feb 06, 2013 at 12:29:26PM -0800, Terje Bergstr=C3=B6m wrote:
>> This was done purely, because I'm hiding the struct size from the
>> caller. If the caller needs to allocate, I need to expose the struct=
 in
>> a header, not just a forward declaration.
>=20
> I don't think we need to hide the struct from the caller. This is all
> host1x internal. Even if a host1x client uses the struct it makes lit=
tle
> sense to hide it. They are all part of the same code base so there's =
not
> much to be gained by hiding the structure definition.

I agree, and will change.

>> Ok, I'll add the wrapper, and I'll check if passing struct host1x *
>> would make sense. In effect that'd render struct host1x_intr mostly
>> unused, so how about if we just merge the contents of host1x_intr to=
 host1x?
>=20
> We can probably do that. It might make some sense to keep it in order=
 to
> scope the related fields but struct host1x isn't very large yet, so I
> think omitting host1x_intr should be fine.

Yes, it's not very large, and it'd remove a lot of casting between
host1x and host1x_intr, so I'll just do that.

Terje
