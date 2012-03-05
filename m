From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: What's in tegra.git for 3.4
Date: Mon, 5 Mar 2012 10:10:22 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BE861C59@HQMAIL01.nvidia.com>
References: <CAOesGMjnWPgSa44hgRu+d0jrQLm9KuOcuufg9V8fYZ8TytsbPw@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17BD8BCF6A@HQMAIL01.nvidia.com>
 <20120304185901.GI31064@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120304185901.GI31064-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Sunday, March 04, 2012 11:59 AM:
> On Mon, Feb 27, 2012 at 09:41:56AM -0800, Stephen Warren wrote:
> > Olof Johansson wrote at Sunday, February 26, 2012 3:51 PM:
> > > We're closing in on when things need to be in the sub-arch trees in
> > > time to get merged for the next merge window. The shortlog below is
> > > what i have queued up today.
> >
> > The following are in patchwork and should probably be picked up:
> 
> Btw, patchwork is down, so I had to guess which patches were being referred to.
> While it's convenient to have the links, also having the patch subject would be
> good. :-)
...
> > I need to ping Ben on:
> > http://patchwork.ozlabs.org/patch/139494/

i2c: tegra: Remove unnecessary write to INT_STATUS

> Yeah, we can take it through tegra if needed, we've done it in the past.

For reference, Wolfram Sang has applied this to his i2c-embedded tree,
so it's going in through there.

-- 
nvpublic
