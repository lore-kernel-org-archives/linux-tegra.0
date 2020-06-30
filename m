From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH SECOND RESEND] MAINTAINERS: adjust entries to moving CEC
 platform drivers
Date: Tue, 30 Jun 2020 22:30:39 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.2006302228320.4753@felia>
References: <20200525142946.8268-1-lukas.bulwahn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200525142946.8268-1-lukas.bulwahn@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, Kevin Hilman <khilman@baylibre.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <narmstrong@baylibre.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Ettore Chimenti <ek5.chimenti@gmail.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md
List-Id: linux-tegra@vger.kernel.org



On Mon, 25 May 2020, Lukas Bulwahn wrote:

> Commit 4be5e8648b0c ("media: move CEC platform drivers to a separate
> directory") moved various files into a new directory structure, but did
> not adjust the entries in MAINTAINERS.
> 
> Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches F: drivers/media/platform/s5p-cec/
>   warning: no file matches F: drivers/media/platform/tegra-cec/
>   warning: no file matches F: drivers/media/platform/cec-gpio/
>   warning: no file matches F: drivers/media/platform/meson/ao-cec-g12a.c
>   warning: no file matches F: drivers/media/platform/meson/ao-cec.c
>   warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.c
>   warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.h
>   warning: no file matches F: drivers/media/platform/sti/cec/
> 
> Update the MAINTAINERS entries to the new file locations.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Mauro, please pick this non-urgent minor clean-up patch on top of the
> CEC platform driver moves.
>  

Just a short ping for you, Mauro. Can you pick up this minor clean-up 
patch?

Lukas

> applies cleanly on next-20200417, next-20200505 and still on next-20200525
> for this second resend.
> 
> v1 send here:
> https://lore.kernel.org/lkml/20200418093630.6149-1-lukas.bulwahn@gmail.com/
> 
> v1 first resend here:
> https://lore.kernel.org/lkml/20200506050744.4779-1-lukas.bulwahn@gmail.com/
> 
>  MAINTAINERS | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a442b48f24b..bf5cb149101b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2403,7 +2403,7 @@ L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/s5p-cec.txt
> -F:	drivers/media/platform/s5p-cec/
> +F:	drivers/media/cec/platform/s5p/
>  
>  ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
>  M:	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
> @@ -2548,7 +2548,7 @@ L:	linux-tegra@vger.kernel.org
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/tegra-cec.txt
> -F:	drivers/media/platform/tegra-cec/
> +F:	drivers/media/cec/platform/tegra/
>  
>  ARM/TETON BGA MACHINE SUPPORT
>  M:	"Mark F. Brown" <mark.brown314@gmail.com>
> @@ -3969,7 +3969,7 @@ S:	Supported
>  W:	http://linuxtv.org
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/cec-gpio.txt
> -F:	drivers/media/platform/cec-gpio/
> +F:	drivers/media/cec/platform/cec-gpio/
>  
>  CELL BROADBAND ENGINE ARCHITECTURE
>  M:	Arnd Bergmann <arnd@arndb.de>
> @@ -11146,8 +11146,7 @@ S:	Supported
>  W:	http://linux-meson.com/
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
> -F:	drivers/media/platform/meson/ao-cec-g12a.c
> -F:	drivers/media/platform/meson/ao-cec.c
> +F:	drivers/media/cec/platform/meson/
>  
>  MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
>  M:	Liang Yang <liang.yang@amlogic.com>
> @@ -15212,8 +15211,7 @@ F:	drivers/mmc/host/sdricoh_cs.c
>  SECO BOARDS CEC DRIVER
>  M:	Ettore Chimenti <ek5.chimenti@gmail.com>
>  S:	Maintained
> -F:	drivers/media/platform/seco-cec/seco-cec.c
> -F:	drivers/media/platform/seco-cec/seco-cec.h
> +F:	drivers/media/cec/platform/seco/
>  
>  SECURE COMPUTING
>  M:	Kees Cook <keescook@chromium.org>
> @@ -16249,7 +16247,7 @@ STI CEC DRIVER
>  M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/stih-cec.txt
> -F:	drivers/media/platform/sti/cec/
> +F:	drivers/media/cec/platform/sti/
>  
>  STK1160 USB VIDEO CAPTURE DRIVER
>  M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> -- 
> 2.17.1
> 
> 
