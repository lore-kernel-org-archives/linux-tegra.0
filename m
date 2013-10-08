From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 08/27] drm/tegra: gr2d: Miscellaneous cleanups
Date: Tue, 8 Oct 2013 08:48:48 +0300
Message-ID: <52539CC0.3020901@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-9-git-send-email-treding@nvidia.com> <CABPQNSbkS40_jyGz14s08+x3e+-pxnfy90V7pzAOfiqUF2ma2g@mail.gmail.com> <20131007121452.GA8324@ulmo.nvidia.com> <CABPQNSb52HmS-2T=MUXteMFc1tndHdvtUnZqsVsPKjP1Dy6Esw@mail.gmail.com> <CABPQNSZGyuS3wAvJ8fFj=LMXxFJz9x_sKqEWW7QbiqC1gneLKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABPQNSZGyuS3wAvJ8fFj=LMXxFJz9x_sKqEWW7QbiqC1gneLKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07.10.2013 16:02, Erik Faye-Lund wrote:
> So the question is really how the hardware treats writes to
> non-existent registers. My guess would be that they are simply not
> recorded, and if that's the case it doesn't matter what we do. And
> doing an unconditional AND is faster than doing a bit-test followed by
> a conditional branch.

Hardware ignores writes to non-existent registers. Sometimes
non-existent registers are taken into use in future versions, though.

Terje
