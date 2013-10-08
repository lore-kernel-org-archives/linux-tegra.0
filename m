From: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 08/27] drm/tegra: gr2d: Miscellaneous cleanups
Date: Tue, 8 Oct 2013 13:11:11 +0200
Message-ID: <CABPQNSY=fgvjep7J6XSAxD4xox5Dxy8P8O=t44AeS1Dtq0_XYw@mail.gmail.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-9-git-send-email-treding@nvidia.com> <CABPQNSbkS40_jyGz14s08+x3e+-pxnfy90V7pzAOfiqUF2ma2g@mail.gmail.com>
 <20131007121452.GA8324@ulmo.nvidia.com> <CABPQNSb52HmS-2T=MUXteMFc1tndHdvtUnZqsVsPKjP1Dy6Esw@mail.gmail.com>
 <CABPQNSZGyuS3wAvJ8fFj=LMXxFJz9x_sKqEWW7QbiqC1gneLKw@mail.gmail.com> <52539CC0.3020901@nvidia.com>
Reply-To: kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52539CC0.3020901-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 8, 2013 at 7:48 AM, Terje Bergstr=F6m <tbergstrom-DDmLM1+adcphl2p70BpVqQ@public.gmane.org=
m> wrote:
> On 07.10.2013 16:02, Erik Faye-Lund wrote:
>> So the question is really how the hardware treats writes to
>> non-existent registers. My guess would be that they are simply not
>> recorded, and if that's the case it doesn't matter what we do. And
>> doing an unconditional AND is faster than doing a bit-test followed =
by
>> a conditional branch.
>
> Hardware ignores writes to non-existent registers. Sometimes
> non-existent registers are taken into use in future versions, though.

Right. That might be a motivation to treat non-existent registers as
errors. But then I start to wonder about "holes" in the pointer
address space should be treated differently. For instance, from the
TRM it looks like registers 0x3 - 0x8, 0xe, 0x15 and 0x42 are
undefined for T20. If writes to registers beyond 0x4c fails, shouldn't
these also fail? Or are somehow guaranteed that these holes will never
be plugged? Are they simply missing from the TRM?

I dunno...
