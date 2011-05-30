From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [RFC 2/2] ARM:Tegra: Device Tree Support: Initialize audio card
 gpio's from the device tree.
Date: Mon, 30 May 2011 11:38:27 +0800
Message-ID: <20110530033826.GE4130@opensource.wolfsonmicro.com>
References: <20110527205444.21000.90209.stgit@riker>
 <20110527205721.21000.78599.stgit@riker>
 <20110528012427.GB5971@opensource.wolfsonmicro.com>
 <BANLkTinKLcYmStvBEGDcN84BapJXe5Y5bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTinKLcYmStvBEGDcN84BapJXe5Y5bg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, May 29, 2011 at 08:11:34PM -0700, Olof Johansson wrote:
> On Fri, May 27, 2011 at 6:24 PM, Mark Brown

> > This is a step back from the usability of the existing platform dat=
a -
> > the platform data uses a series of individually named GPIOs while t=
his
> > uses an array of GPIO numbers with magic indexes. =A0The fact that =
you
> > need comments explaining what the functions of the array elements a=
re
> > is a bit of a red flag here.

> Agreed, I had similar concerns with the sdhci bindings where it used =
a
> 3-element array of gpios instead of the previous named ones. I was
> told it's common practice to do it that way though? Seems like a step
> backwards to me. :(

Interesting...  what was the reasoning behind this?  It's a definite
step backwards but it does explain my major concern with the new batch
of device tree patches.
