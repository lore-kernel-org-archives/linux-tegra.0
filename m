From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Stable I2C branch needed as a dependency for Tegra change
Date: Thu, 03 May 2012 17:19:51 -0600
Message-ID: <4FA31297.8000904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Wolfram,

A change I'd like to make for Tegra in 3,5:

http://www.spinics.net/lists/arm-kernel/msg172756.html

relies on an I2C change that's also scheduled for 3.5:

http://www.spinics.net/lists/linux-i2c/msg07808.html
(which is already committed as 1475e39 "of/i2c: implement
of_find_i2c_adapter_by_node")

Is your i2c-embedded/for-next branch stable (i.e. that commit will not
be rebased between now and when you send a pull request for 3.5), so I
can use it as a baseline for a Tegra branch? If not, could you let me
know when it is stable, so I can create the Tegra branch as that time.

Thanks!
