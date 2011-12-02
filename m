From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v3 3/6] ASoC: WM8903: Pass pdata to wm8903_init_gpio
Date: Fri, 2 Dec 2011 01:05:51 +0000
Message-ID: <20111202010549.GB31948@opensource.wolfsonmicro.com>
References: <1322772564-27343-1-git-send-email-swarren@nvidia.com>
 <1322772564-27343-3-git-send-email-swarren@nvidia.com>
 <20111202002730.GA31903@opensource.wolfsonmicro.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDB03FF@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174FDB03FF-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 01, 2011 at 04:48:11PM -0800, Stephen Warren wrote:
> Mark Brown wrote at Thursday, December 01, 2011 5:28 PM:

> > This will break existing users in counjuntion with the previous patch.
> > Previously if the user provided platform data but left gpio_base as zero
> > we'd use -1 and let gpiolib pick for us.  Now instead the driver will
> > take that zero and pass it on to gpiolib, probably failing as the SoC
> > will have taken the low numbered GPIOs.

> Yes, I suppose that's true. However, I don't see it as a problem.

> Surely if the user provided pdata, it's their responsibility to fill
> it in correctly and completely. It seems a little random to take the
> pdata, and try to guess whether 0 means 0 or "I didn't set the value,
> so use the default". I think the same comment applies w.r.t to your

No, that's not been the general approach as it avoids breaking existing
users when you add new elements to the platform data and it means that
users don't have to worry about every single field which is much more
friendly as the number of fields gets larger.  In the case of GPIOs it
was frankly a bad idea to have 0 be a valid GPIO value in the first
place; it makes the API that little bit more fiddly to work with.

Device tree is much nicer in this regard as you can just omit properties
which is unambiguous.

> comment on patch 2 (gpio_cfg); 0 is a perfectly legitimate value for
> the register; why should the driver double-guess that value and assume
> 0 means "don't touch the pin"?

Yeah, that's annoying.  There's a reason why most of the chips do the
write of zero by setting an out of bounds bit in the pdata.  At least
for the devices I deal with directly 0 is fortunately usually a
nonsensical value to want to set anyway so it's not so important.
