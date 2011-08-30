From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Outstanding Tegra I2C patches
Date: Tue, 30 Aug 2011 09:46:09 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B3279D5A@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ben Dooks (ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org)" <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Ben,

There are a number of patches to the Tegra I2C driver that have been
posted and outstanding for a while:

[PATCH] i2c: Tegra: Add of_match_table
http://www.spinics.net/lists/linux-i2c/msg05898.html

[PATCH] i2c: tegra: add I2C_FUNC_SMBUS_EMUL to adapter functionality
http://www.spinics.net/lists/linux-i2c/msg05396.html

[PATCH] i2c: tegra: fix possible race condition after tx
http://www.spinics.net/lists/linux-i2c/msg06103.html

Could these please be merged so they make it into 3.2? If not the last,
then at least the first two.

I can repost these if you need.

Thank you.

-- 
nvpublic
