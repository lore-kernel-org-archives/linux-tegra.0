From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: throw the unique chip ID into the entropy pool
Date: Sun, 15 Sep 2013 11:24:33 +0200
Message-ID: <CACRpkdYTD4i74U-pAY1eq6FXiBwh-sw9U4N5PobBmpSKiTEVwA@mail.gmail.com>
References: <1378394938-1551-1-git-send-email-linus.walleij@linaro.org>
	<52333E56.8060204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52333E56.8060204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 13, 2013 at 6:33 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 09/05/2013 09:28 AM, Linus Walleij wrote:
>> This adds a hook at common late init to extract the 64 bits of
>> chip-unique data and throw it into the entropy pool to make it
>> more device-unique.
>
>> diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
>
>>  void __init tegra_init_late(void)
>>  {
>> +     tegra_random_init();
>
> Looking at this further, there's already a tegra_init_fuse() call made
> from tegra_init_early(), so rather than adding a second init function
> into the fuse code, I'd rather just augment that function, unless
> there's some reason add_device_randomness() won't work at that time?

This seems to be possible, due to the comment above
rand_initialize():

/*
 * Note that setup_arch() may call add_device_randomness()
 * long before we get here. This allows seeding of the pools
 * with some platform dependent data very early in the boot
 * process.
(...)

> If that will work, I'll supply an alternate patch that replaces this,
> since I also want to remove the tegra_chip_uid() function, and need to
> make the add_device_randomness() call not use tegra_chip_uid() on
> Tegra30 or later, since the set of fuses for the chip ID changed radically.

Sure, go ahead.

Yours,
Linus Walleij
