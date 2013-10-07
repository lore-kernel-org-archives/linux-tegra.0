From: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 08/27] drm/tegra: gr2d: Miscellaneous cleanups
Date: Mon, 7 Oct 2013 15:05:19 +0200
Message-ID: <CABPQNSa59hBU__yjQMZsdEghpSwH1ayJYiD6HrBrhABicgzxuA@mail.gmail.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-9-git-send-email-treding@nvidia.com> <CABPQNSbkS40_jyGz14s08+x3e+-pxnfy90V7pzAOfiqUF2ma2g@mail.gmail.com>
 <20131007121452.GA8324@ulmo.nvidia.com> <5252AE8C.9090609@nvidia.com>
Reply-To: kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5252AE8C.9090609-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 7, 2013 at 2:52 PM, Terje Bergstr=F6m <tbergstrom-DDmLM1+adcphl2p70BpVqQ@public.gmane.org=
m> wrote:
> On 07.10.2013 15:14, Thierry Reding wrote:
>> * PGP Signed by an unknown key
>>
>> On Mon, Oct 07, 2013 at 01:34:44PM +0200, Erik Faye-Lund wrote:
>>> On Mon, Oct 7, 2013 at 10:34 AM, Thierry Reding
>>> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> Rework the address table code for the host1x firewall. The previou=
s
>>>> implementation allocated a bitfield but didn't check for a valid p=
ointer
>>>> so it could potentially crash.
>>>
>>> I don't think it could crash. The bitmaps was allocated as a 256-bi=
t
>>> field, and the register offset gets AND'ed with 0xFF before being
>>> looked up. What am I missing?
>>
>> The pointer returned from the allocation is never checked, so it cou=
ld
>> theoretically be NULL and be used regardless.
>>
>> Also I'm not sure that AND'ing with 0xff is the right thing to do he=
re.
>
> Oops, there's a check for NULL missing. If that allocation fails, pro=
be
> should fail, so we just need to propagate the error condition. Otherw=
ise
> we might just leave the firewall off, and let everything go in unchec=
ked.
>
> AND 0xff is necessary, because the same registers are mirrored in
> multiple contexts. AND removes the offset coming from context, and
> leaves just the plain register offset.
>

The offsets in the commands don't have enough bits to reach over to
the next context. The contexts are repeated at multiples of 0x4000,
and 0xFFF is the largest encodable offset. So I don't really thing the
AND is needed for *that* purpose.

> If somebody gets access to the bitmap, he has access to kernel data
> structures. GR2D firewall is the least of our worries in this case.

Indeed, that's only a problem if someone is already on the other side
of the air-tight hatch.
