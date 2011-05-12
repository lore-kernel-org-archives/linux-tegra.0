From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra I2C slave address patches
Date: Thu, 12 May 2011 11:15:08 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04986AA399@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "marc.dietrich-wkdnK3oF/XPYtB+G+YtuwQgYPMzSbZxj@public.gmane.org" <marc.dietrich-wkdnK3oF/XPYtB+G+YtuwQgYPMzSbZxj@public.gmane.org>
Cc: "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Wei,

I'm trying to consolidate the two Tegra I2C slave mode patches we posted
to the mailing lists:

Yours: http://www.spinics.net/lists/linux-i2c/msg05437.html
Mine: http://www.spinics.net/lists/linux-i2c/msg05464.html

I had some questions:

1) Why does your patch enable I2C_SL_CNFG_NACK. According to the Tegra
documentation, this prevents the slave I2C controller from ACKing any
transfers. Doesn't this prevent the slave functionality from working at
all?

2) Your patch sets up the slave_addr registers based on platform data.
However, I don't see any code in i2c-tegra.c to actually act as a slave
device. Hence, it seems pointless to configure the slave address.

Are those two things bug workarounds or something?

I know that Marc said he'd like to see the slave address configuration
code merged, since the AC100 uses it. However, I'm having a hard time
seeing how it'll make any difference to the driver right now; it seems
if/when slave mode is actually implemented, the slave_addr setup should
be part of that patch.

Thanks for any feedback.

-- 
nvpublic
