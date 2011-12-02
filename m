From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 3/6] ASoC: WM8903: Pass pdata to wm8903_init_gpio
Date: Thu, 1 Dec 2011 16:48:11 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174FDB03FF@HQMAIL01.nvidia.com>
References: <1322772564-27343-1-git-send-email-swarren@nvidia.com>
 <1322772564-27343-3-git-send-email-swarren@nvidia.com>
 <20111202002730.GA31903@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111202002730.GA31903-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Thursday, December 01, 2011 5:28 PM:
> On Thu, Dec 01, 2011 at 01:49:21PM -0700, Stephen Warren wrote:
> 
> > -	if (pdata && pdata->gpio_base)
> > -		wm8903->gpio_chip.base = pdata->gpio_base;
> > -	else
> > -		wm8903->gpio_chip.base = -1;
> > +	wm8903->gpio_chip.base = pdata->gpio_base;
> 
> This will break existing users in counjuntion with the previous patch.
> Previously if the user provided platform data but left gpio_base as zero
> we'd use -1 and let gpiolib pick for us.  Now instead the driver will
> take that zero and pass it on to gpiolib, probably failing as the SoC
> will have taken the low numbered GPIOs.

Yes, I suppose that's true. However, I don't see it as a problem.

Surely if the user provided pdata, it's their responsibility to fill
it in correctly and completely. It seems a little random to take the
pdata, and try to guess whether 0 means 0 or "I didn't set the value,
so use the default". I think the same comment applies w.r.t to your
comment on patch 2 (gpio_cfg); 0 is a perfectly legitimate value for
the register; why should the driver double-guess that value and assume
0 means "don't touch the pin"?

-- 
nvpublic
