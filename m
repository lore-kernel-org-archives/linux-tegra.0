From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ASoC: Add device tree binding for WM8903
Date: Thu, 1 Dec 2011 17:11:42 +0000
Message-ID: <20111201171142.GB18120@opensource.wolfsonmicro.com>
References: <1322700455-26916-1-git-send-email-swarren@nvidia.com>
 <20111201132559.GG2915@opensource.wolfsonmicro.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDB01D8@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174FDB01D8-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 01, 2011 at 08:46:35AM -0800, Stephen Warren wrote:
> Mark Brown wrote at Thursday, December 01, 2011 6:26 AM:

> > This all seems really complicated and invasive, especially the
> > have_pdata flag.  Why not just always have a platform data structure and
> > fill it in from the device tree?

> The first patch set did that, and you objected to how it was structured...

No, that's what I asked you to do first time round (or at least what we
discussed on IRC).  The problem with the first version was that you had
two unrelated places where the defaults were specified, the problem with
this version is that you copy everything into new variables which makes
the diff really big and noisy.  I'd *really* expect the device tree data
to just be a different way of supplying platform data.

> > > +			trigger = irqd_get_trigger_type(irq_data);

> > This stuff isn't device tree specific.

> OK, I could remove the platform data's irq_active_low flag, and determine
> the IRQ polarity this way in all cases. Do you want that? I avoided doing
> it this time around since it'd affect non-device-tree users of the codec
> too, and I aimed for complete backwards compatibility (although that said,
> the only in-tree user is the Tegra machines, and they don't set this flag,
> so the impact would be minimal in-tree)

As a first step I'd use this code to set the default if the platform
data doesn't set the flag.
