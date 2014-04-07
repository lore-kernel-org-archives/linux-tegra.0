From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] gpu: host1x: handle the correct # of syncpt regs
Date: Mon, 7 Apr 2014 11:47:08 +0300
Message-ID: <5342660C.3050703@nvidia.com>
References: <1396650665-6992-1-git-send-email-swarren@wwwdotorg.org> <20140407081838.GB25718@ulmo> <5342630E.90908@nvidia.com> <20140407084124.GC25718@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140407084124.GC25718@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07.04.2014 11:41, Thierry Reding wrote:
> On Mon, Apr 07, 2014 at 11:34:22AM +0300, Terje Bergstr=C3=B6m wrote:
>> On 07.04.2014 11:18, Thierry Reding wrote:
>>> If I understand correctly there's no immediate need for this to go =
to
>>> stable kernels, nor for it to be queued for 3.15, right? That is th=
e
>>> potential extra write isn't causing any harm on actual hardware, is=
 it?
>>>
>>> In that case I'll queue this up for 3.16.
>>
>> The reads and writes would get ignored on 32-bit kernel. The change =
does
>> fix sync point behavior in 64-bit kernel, so it is fixing a real iss=
ue.
>=20
> Okay, but given that we don't support any 64 bit Tegra hardware upstr=
eam
> yet, 3.16 would still be enough, wouldn't it?

Sure, sounds good.

Terje
