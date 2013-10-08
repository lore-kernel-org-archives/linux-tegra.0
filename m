From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 08/27] drm/tegra: gr2d: Miscellaneous cleanups
Date: Tue, 8 Oct 2013 08:36:12 +0300
Message-ID: <525399CC.6080808@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-9-git-send-email-treding@nvidia.com> <CABPQNSbkS40_jyGz14s08+x3e+-pxnfy90V7pzAOfiqUF2ma2g@mail.gmail.com> <20131007121452.GA8324@ulmo.nvidia.com> <5252AE8C.9090609@nvidia.com> <CABPQNSa59hBU__yjQMZsdEghpSwH1ayJYiD6HrBrhABicgzxuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABPQNSa59hBU__yjQMZsdEghpSwH1ayJYiD6HrBrhABicgzxuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07.10.2013 16:05, Erik Faye-Lund wrote:
> On Mon, Oct 7, 2013 at 2:52 PM, Terje Bergstr=F6m <tbergstrom@nvidia.=
com> wrote:
>> AND 0xff is necessary, because the same registers are mirrored in
>> multiple contexts. AND removes the offset coming from context, and
>> leaves just the plain register offset.
> The offsets in the commands don't have enough bits to reach over to
> the next context. The contexts are repeated at multiples of 0x4000,
> and 0xFFF is the largest encodable offset. So I don't really thing th=
e
> AND is needed for *that* purpose.

Well, that was embarrassing. Of course that is true. You can access all
registers via MMIO or with SETCLASS to correct context. But that was
still the reason I used when I wrote that 0xff, so it's bogus.

Real fix is to do what Thierry already did: limit the bitmap to max
register number we're interested in, and have a if() to fail fast if
register number falls outside that range.

Even better, get IOMMU up and running.

Terje
