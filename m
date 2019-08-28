From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] arm/arm64: defconfig: Update configs to use the new
 CROS_EC options
Date: Wed, 28 Aug 2019 12:09:54 +0200
Message-ID: <2db6cde1-9e7f-8b1c-f2e4-80bdd2478d28@collabora.com>
References: <20190827154851.10486-1-enric.balletbo@collabora.com>
 <20190827161045.GC26807@tuxbook-pro>
 <CAK8P3a2h2gUhxcVgD5JhR1Uo4qUSuG5yp4RCrAxevNmyD4ZRTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a2h2gUhxcVgD5JhR1Uo4qUSuG5yp4RCrAxevNmyD4ZRTA@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: SoC Team <soc@kernel.org>, Gwendal Grignou <gwendal@chromium.org>, Benson Leung <bleung@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guenter Roeck <groeck@chromium.org>, kernel@collabora.com, Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Leonard Crestez <leonard.crestez@nxp.com>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Chanwoo Choi <cw00.choi>
List-Id: linux-tegra@vger.kernel.org

Hi Bjorn, Arnd,

On 27/8/19 18:12, Arnd Bergmann wrote:
> On Tue, Aug 27, 2019 at 6:08 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
>>
>> On Tue 27 Aug 08:48 PDT 2019, Enric Balletbo i Serra wrote:
>>
>>> Recently we refactored the CrOS EC drivers moving part of the code from
>>> the MFD subsystem to the platform chrome subsystem. During this change
>>> we needed to rename some config options, so, update the defconfigs
>>> accordingly.
>>>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>>> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
>>> Tested-by: Gwendal Grignou <gwendal@chromium.org>
>>
>> Can we make the entries in the generic arm64 defconfig modules?
> 
> Good idea.
> 
> Actually I would prefer to have all of them as modules for consistency,
> if at all possible.
> 

It is very common boot Chromebooks from an USB device, the EC needs to be
built-in in order to boot from these devices, otherwise you should use an
initramfs. I'd like to avoid forcing people to build an initramfs just to boot
from these devices if possible, in fact, my usual workflow is without initramfs,
and knowing that with the default defconfig just should boot helps a lot sometimes.

Note that, it's not the case for EC subdevices, these are already build as modules.

BTW, Lee asked if this patch should be squashed with the patches that really
renames the config options to help bisect ability, I don't have a hard opinion
as I don't usually run the config option between bisection steps, so please let
me know what do you prefer and I'll respin the patches ASAP if that's the case.

Thanks,
Enric

>        Arnd
> 
