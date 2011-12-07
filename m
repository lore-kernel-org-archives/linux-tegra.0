From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 5/5] ASoC: WM8903: Add device tree binding
Date: Wed, 7 Dec 2011 12:33:09 +0000
Message-ID: <20111207123308.GA18715@opensource.wolfsonmicro.com>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com>
 <1322863721-29793-6-git-send-email-swarren@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1750B773EE@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1750B773EE-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 06, 2011 at 10:22:24AM -0800, Stephen Warren wrote:

> Now, everything still works without this. Looking at the Linux OF code,
> it works by retrieving the compatible property, taking everything after
> the comma if present, and then creating an i2c_board_info with that
> type, which in this case is "wm8903" and matches wm8903.c's i2c_device_id
> table. See drivers/of/of_i2c.c:of_i2c_register_devices() and the call to
> base.c:of_modalias_node().

> So, the question is: Should I go back and add the of_match table, or
> is I2C intended to work without it perpetually? I notice that you added
> an of_match table for all the other WM codecs.

You can't go back and do anything now as the patches are merged, you
need to fix incrementally.  You should do this for completeness even if
currently we work without it.
