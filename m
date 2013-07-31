From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: DTS: tegra: Add USB entries for Tegra30
Date: Wed, 31 Jul 2013 16:13:59 -0600
Message-ID: <51F98C27.40904@wwwdotorg.org>
References: <1375292543-7896-1-git-send-email-ttynkkynen@nvidia.com> <1375292543-7896-2-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375292543-7896-2-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/31/2013 11:42 AM, Tuomas Tynkkynen wrote:
> Add device tree entries for the 3 USB controllers and PHYs and
> enable the third controller on Cardhu and Beaver boards.
> 
> Fix VBUS regulator entries on Beaver. The GPIO pins were wrong.

That much is correct.

> Also, a third GPIO is required to power the pullup resistors that drive
> the VBUS voltage switches, so add an regulator entry for that.

That is not true. GMI_AD13 / PH5 / 61 is a signal that pulls up all of
USB1 VBUS, USB3 VBUS, and GMI_AD15, which as far as I can tell is
entirely unrelated to USB in any way.

This part of the change should be removed. I know you mentioned that
downstream does this, but that means very little; there are many
mistakes there.

Aside from that, this patch looks fine.
