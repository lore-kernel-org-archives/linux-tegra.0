From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: What's in tegra.git for 3.4
Date: Sun, 4 Mar 2012 10:59:01 -0800
Message-ID: <20120304185901.GI31064@quad.lixom.net>
References: <CAOesGMjnWPgSa44hgRu+d0jrQLm9KuOcuufg9V8fYZ8TytsbPw@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17BD8BCF6A@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BD8BCF6A-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 27, 2012 at 09:41:56AM -0800, Stephen Warren wrote:
> Olof Johansson wrote at Sunday, February 26, 2012 3:51 PM:
> > We're closing in on when things need to be in the sub-arch trees in
> > time to get merged for the next merge window. The shortlog below is
> > what i have queued up today.
> 
> The following are in patchwork and should probably be picked up:

Btw, patchwork is down, so I had to guess which patches were being referred to.
While it's convenient to have the links, also having the patch subject would be
good. :-)


> http://patchwork.ozlabs.org/patch/139197/
> http://patchwork.ozlabs.org/patch/142663/ (should be merged elsewhere?)

Applied x2.

> 
> Are these still relevant?
> http://patchwork.ozlabs.org/patch/132936/

I'll revisit this one later -- one of the drivers is buggy and causes problems
on boot.

> http://patchwork.ozlabs.org/patch/132919/

This is already in mainline

> Should you ping Dmitry on?
> http://patchwork.ozlabs.org/patch/134093/

Pinged repeatedly, no answers.

> I need to ping Ben on:
> http://patchwork.ozlabs.org/patch/139494/

Yeah, we can take it through tegra if needed, we've done it in the past.


-Olof
