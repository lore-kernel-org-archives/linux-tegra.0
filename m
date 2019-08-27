From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm/arm64: defconfig: Update configs to use the new
 CROS_EC options
Date: Tue, 27 Aug 2019 18:12:28 +0200
Message-ID: <CAK8P3a2h2gUhxcVgD5JhR1Uo4qUSuG5yp4RCrAxevNmyD4ZRTA@mail.gmail.com>
References: <20190827154851.10486-1-enric.balletbo@collabora.com> <20190827161045.GC26807@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827161045.GC26807@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, SoC Team <soc@kernel.org>, Gwendal Grignou <gwendal@chromium.org>, Benson Leung <bleung@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guenter Roeck <groeck@chromium.org>, kernel@collabora.com, Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Leonard Crestez <leonard.crestez@nxp.com>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 27, 2019 at 6:08 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 27 Aug 08:48 PDT 2019, Enric Balletbo i Serra wrote:
>
> > Recently we refactored the CrOS EC drivers moving part of the code from
> > the MFD subsystem to the platform chrome subsystem. During this change
> > we needed to rename some config options, so, update the defconfigs
> > accordingly.
> >
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
> > Tested-by: Gwendal Grignou <gwendal@chromium.org>
>
> Can we make the entries in the generic arm64 defconfig modules?

Good idea.

Actually I would prefer to have all of them as modules for consistency,
if at all possible.

       Arnd
