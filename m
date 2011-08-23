From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Tegra I2C driver compilation failure (was: RE: [PATCH] dt: add
	empty of_get_property for non-dt)
Date: Tue, 23 Aug 2011 11:27:12 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B24A38CA@HQMAIL01.nvidia.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF04A0687289@HQMAIL01.nvidia.com>
 <20110812004732.GF19115@trinity.fluff.org>
 <74CDBE0F657A3D45AFBB94109FB122FF04AEA24F41@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04AEA24F41-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Friday, August 12, 2011 3:09 PM:
...
> Related, here's the list of outstanding patches for i2c-tegra.c that I'm
> aware of:
> 
> [PATCH] i2c: Tegra: Add of_match_table
> http://www.spinics.net/lists/linux-i2c/msg05898.html
> 
> [PATCH] i2c: tegra: add I2C_FUNC_SMBUS_EMUL to adapter functionality
> http://www.spinics.net/lists/linux-i2c/msg05396.html
> 
> [PATCH] i2c: tegra: fix possible race condition after tx
> http://www.spinics.net/lists/linux-i2c/msg06103.html
> 
> Hope this helps! Thanks.

Ben,

I see the patches above aren't in linux-next yet. I'd love to get them
queued up so they get into 3.2. Can you please apply them? At least the
second of these was first posted over 4 months ago.

Thanks very much!

-- 
nvpublic
