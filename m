From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Fri, 14 Dec 2012 09:21:25 -0700
Message-ID: <50CB5205.1030303@wwwdotorg.org>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-7-git-send-email-tbergstrom@nvidia.com> <20121205083335.GA20984@avionic-0098.adnet.avionic-design.de> <50BF1DAA.8030805@nvidia.com> <20121205111332.GA25676@avionic-0098.adnet.avionic-design.de> <50BF345A.8050201@nvidia.com> <20121205120429.GA29943@avionic-0098.adnet.avionic-design.de> <50C5CAB5.3040000@nvidia.com> <20121212160829.GA30278@avionic-0098.adnet.avionic-design.de> <50C99677.6090306@nvidia.com> <20121213085750.GA14740@avionic-0098.adnet.avionic-design.de> <50CA175F.60002@wwwdotorg.org> <50CAC2AC.1010704@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50CAC2AC.1010704@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom@nvidia.com>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 12/13/2012 11:09 PM, Terje Bergstr=C3=B6m wrote:
> On 13.12.2012 19:58, Stephen Warren wrote:
>> On 12/13/2012 01:57 AM, Thierry Reding wrote:
>>> After some more discussion with Stephen on IRC we came to the
>>> conclusion that the easiest might be to have tegra-drm call into
>>> host1x with something like:
>>>
>>> void host1x_set_drm_device(struct host1x *host1x, struct device
>>> *dev);
>>
>> If host1x is registering the dummy device that causes tegradrm to be
>> instantiated, then presumably there's no need for the API above, sin=
ce
>> host1x will already have the struct device * for tegradrm, since it
>> created it?
>=20
> I didn't add the dummy device in my latest patch set. I first set out=
 to
> add it, and moved the drm global data to be drvdata of that device. T=
hen
> I noticed that it doesn't actually help at all.
>=20
> The critical accesses to the global data are from probes of DC, HDMI,
> etc.

OK

> They want to get the global data by getting drvdata of their parent.

There's no reason that /has/ to be so; they can get any information fro=
m
wherever it is, rather than trying to require it to be somewhere it isn=
't.

> The dummy device is not their parent - host1x is. There's no
> connection between the dummy and the real client devices.

It's quite possible for the client devices to ask their actual parent
(host1x) for the tegradrm struct device *, by calling a host1x API, and
have host1x implement that API by returning the dummy/virtual device
that it created. That should be just 1-2 lines of code to implement in
host1x, plus maybe a couple more to correctly return -EPROBE_DEFERRED
when appropriate.
