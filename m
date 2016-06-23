From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau: DRM: failed to create ce channel, -22 on Jetson TK1
Date: Thu, 23 Jun 2016 14:48:34 +0900
Message-ID: <CAAVeFuLZVXj+8mYk0W-cHBd8qKjU68+LXKdK2R3CLNE4kRDD9g@mail.gmail.com>
References: <20160623035913.GA22402@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623035913.GA22402-IRMp5PtgtdoigzW5ZibpNwC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Thu, Jun 23, 2016 at 12:59 PM, Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org> wrote:
> I see the following on a Jetson TK1:
>
> [    9.495425] [TTM] Initializing DMA pool allocator
> [    9.495513] nouveau 57000000.gpu: DRM: VRAM: 0 MiB
> [    9.495520] nouveau 57000000.gpu: DRM: GART: 1048576 MiB
> [    9.508076] nouveau 57000000.gpu: DRM: failed to create ce channel, -22
>
> A Google search suggests that I'm not the only one with this, but I
> don't see it being discussed anywhere.
>
> Is this known / expected?
>
> This is with 4.6 and 4.7-rc4.  The firmware is installed.

It is expected - Tegra does not have a CE channel and Nouveau
complains about it, but then falls back to using GR for copy and
everything should work. I tried to silence that message in the past
but the proposed patch was rejected (too complex for too little
benefit IIRC).

Is the GPU working fine otherwise? Your output suggests it should.
