From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: 3ad1308 pwm: tegra: Add device tree support
Date: Mon, 02 Jul 2012 11:38:14 -0600
Message-ID: <4FF1DC86.1030508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry,

Could I ask you to apply a small fix to the following commit in your pwm
for-next tree:

3ad1308 pwm: tegra: Add device tree support

The pwm node is added in the wrong place; the nodes should be sorted
numerically by address in the reg property, which would put the addition
between serial and i2c, not between i2c and pmc.

If you're unable to rebase that branch for some reason, I can send an
incremental patch to do that.

Thanks.
