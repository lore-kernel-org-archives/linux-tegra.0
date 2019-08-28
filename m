From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm/arm64: defconfig: Update configs to use the new
 CROS_EC options
Date: Wed, 28 Aug 2019 14:09:10 +0200
Message-ID: <CAK8P3a3zYpgouGAibyMjDykZmy+ABnx6AD2cYpHnXq9Zsw2V=w@mail.gmail.com>
References: <20190827154851.10486-1-enric.balletbo@collabora.com>
 <20190827161045.GC26807@tuxbook-pro> <CAK8P3a2h2gUhxcVgD5JhR1Uo4qUSuG5yp4RCrAxevNmyD4ZRTA@mail.gmail.com>
 <2db6cde1-9e7f-8b1c-f2e4-80bdd2478d28@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2db6cde1-9e7f-8b1c-f2e4-80bdd2478d28@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, SoC Team <soc@kernel.org>, Gwendal Grignou <gwendal@chromium.org>, Benson Leung <bleung@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guenter Roeck <groeck@chromium.org>, Collabora kernel ML <kernel@collabora.com>, Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Leonard Crestez <leonard.crestez@nxp.com>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-so>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 28, 2019 at 12:10 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
> On 27/8/19 18:12, Arnd Bergmann wrote:
> > On Tue, Aug 27, 2019 at 6:08 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> >>
> >> On Tue 27 Aug 08:48 PDT 2019, Enric Balletbo i Serra wrote:
> >>
> >>> Recently we refactored the CrOS EC drivers moving part of the code from
> >>> the MFD subsystem to the platform chrome subsystem. During this change
> >>> we needed to rename some config options, so, update the defconfigs
> >>> accordingly.
> >>>
> >>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >>> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> >>> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
> >>> Tested-by: Gwendal Grignou <gwendal@chromium.org>
> >>
> >> Can we make the entries in the generic arm64 defconfig modules?
> >
> > Good idea.
> >
> > Actually I would prefer to have all of them as modules for consistency,
> > if at all possible.
> >
>
> It is very common boot Chromebooks from an USB device, the EC needs to be
> built-in in order to boot from these devices, otherwise you should use an
> initramfs. I'd like to avoid forcing people to build an initramfs just to boot
> from these devices if possible, in fact, my usual workflow is without initramfs,
> and knowing that with the default defconfig just should boot helps a lot sometimes.
>
> Note that, it's not the case for EC subdevices, these are already build as modules.

Ok, fair enough, let's leave it built-in then.

> BTW, Lee asked if this patch should be squashed with the patches that really
> renames the config options to help bisect ability, I don't have a hard opinion
> as I don't usually run the config option between bisection steps, so please let
> me know what do you prefer and I'll respin the patches ASAP if that's the case.

I'm not usually worried about bisection in defconfig changes, since like you
say most commonly one would not run 'make defconfig' betweens the
bisection steps.

If we really care about it, we could keep a symbol like this
in drivers/platform/chrome/Kconfig for one release:

config CONFIG_MFD_CROS_EC
        tristate "Enable ChromeOS Embedded Controller"
        select CROS_EC
        select CHROME_PLATFORMS
        select CONFIG_MFD_CROS_EC_DEV
        help
           This is a transitional Kconfig option and will be removed
           after everyone enables the parts individually.

      Arnd
