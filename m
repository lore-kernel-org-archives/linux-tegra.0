From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Tegra for-next branch status check
Date: Mon, 23 Apr 2012 15:21:13 -0600
Message-ID: <4F95C7C9.30205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Arnd, Olof,

Could I please ask you to take a quick look at Tegra's git repo:

git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git

... and double-check the construction of all the for-3.5 branches. I've
tended to mostly put stuff in topic branches rather than separating
things into the perhaps more typical soc/drivers/dt branches. Is this
scheme going to work out OK?

Note a couple dependencies in there:

for-3.5/gpio-pinmux-dependency is a copy of pinctrl's "base" tag.

for-3.5/gpio-pinmux depends on for-3.5/gpio-pinmux-dependency

for-3.5/tegra30-audio and for-3.5/usb-ulpi both depend on
for-3.5/gpio-pinmux.

Thanks for any feedback.
