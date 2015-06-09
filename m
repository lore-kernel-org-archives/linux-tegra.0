From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] pinctrl: make pinctrl_register() return proper error code
Date: Tue, 9 Jun 2015 09:29:59 +0200
Message-ID: <557695F7.6050907@st.com>
References: <1433822476-26531-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1433822476-26531-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Uy <jasonuy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rickard Strandqvist <rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-rockchip-IAPFreCvJWM@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Masahiro

On 06/09/2015 06:01 AM, Masahiro Yamada wrote:
> Currently, pinctrl_register() just returns NULL on error, so the
> callers can not know the exact reason of the failure.
>
> Some of the pinctrl drivers return -EINVAL, some -ENODEV, and some
> -ENOMEM on error of pinctrl_register(), although the error code
> might be different from the real cause of the error.
>
> This commit reworks pinctrl_register() to return the appropriate
> error code and modifies all of the pinctrl drivers to use IS_ERR()
> for the error checking and PTR_ERR() for getting the error code.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
>
> This patch is based on linux-pinctrl/devel
> (Commit 7164873e7c69d6bab74726debc3b495a86332b1f).
>
> I think I converted all of the pinctrl drivers, but just in case,
> I'd like the driver maintainers to check this patch out.
>
>
>   drivers/pinctrl/bcm/pinctrl-bcm281xx.c        |  4 ++--
>   drivers/pinctrl/bcm/pinctrl-bcm2835.c         |  4 ++--
>   drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c     |  4 ++--
>   drivers/pinctrl/bcm/pinctrl-cygnus-mux.c      |  4 ++--
>   drivers/pinctrl/berlin/berlin.c               |  4 ++--
>   drivers/pinctrl/core.c                        | 17 ++++++++++-------
>   drivers/pinctrl/freescale/pinctrl-imx.c       |  4 ++--
>   drivers/pinctrl/freescale/pinctrl-imx1-core.c |  4 ++--
>   drivers/pinctrl/freescale/pinctrl-mxs.c       |  4 ++--
>   drivers/pinctrl/intel/pinctrl-cherryview.c    |  4 ++--
>   drivers/pinctrl/intel/pinctrl-intel.c         |  4 ++--
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  4 ++--
>   drivers/pinctrl/meson/pinctrl-meson.c         |  4 ++--
>   drivers/pinctrl/mvebu/pinctrl-mvebu.c         |  4 ++--
>   drivers/pinctrl/nomadik/pinctrl-abx500.c      |  4 ++--
>   drivers/pinctrl/nomadik/pinctrl-nomadik.c     |  4 ++--
>   drivers/pinctrl/pinctrl-adi2.c                |  4 ++--
>   drivers/pinctrl/pinctrl-amd.c                 |  4 ++--
>   drivers/pinctrl/pinctrl-as3722.c              |  4 ++--
>   drivers/pinctrl/pinctrl-at91.c                |  4 ++--
>   drivers/pinctrl/pinctrl-lantiq.c              |  4 ++--
>   drivers/pinctrl/pinctrl-lpc18xx.c             |  4 ++--
>   drivers/pinctrl/pinctrl-palmas.c              |  4 ++--
>   drivers/pinctrl/pinctrl-pistachio.c           |  4 ++--
>   drivers/pinctrl/pinctrl-rockchip.c            |  4 ++--
>   drivers/pinctrl/pinctrl-single.c              |  4 ++--
>   drivers/pinctrl/pinctrl-st.c                  |  4 ++--
>   drivers/pinctrl/pinctrl-tb10x.c               |  4 ++--
>   drivers/pinctrl/pinctrl-tegra-xusb.c          |  4 ++--
>   drivers/pinctrl/pinctrl-tegra.c               |  4 ++--
>   drivers/pinctrl/pinctrl-tz1090-pdc.c          |  4 ++--
>   drivers/pinctrl/pinctrl-tz1090.c              |  4 ++--
>   drivers/pinctrl/pinctrl-u300.c                |  4 ++--
>   drivers/pinctrl/pinctrl-zynq.c                |  4 ++--
>   drivers/pinctrl/qcom/pinctrl-msm.c            |  4 ++--
>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |  4 ++--
>   drivers/pinctrl/qcom/pinctrl-spmi-mpp.c       |  4 ++--
>   drivers/pinctrl/samsung/pinctrl-exynos5440.c  |  4 ++--
>   drivers/pinctrl/samsung/pinctrl-samsung.c     |  4 ++--
>   drivers/pinctrl/sh-pfc/pinctrl.c              |  4 ++--
>   drivers/pinctrl/sirf/pinctrl-atlas7.c         |  4 ++--
>   drivers/pinctrl/sirf/pinctrl-sirf.c           |  4 ++--
>   drivers/pinctrl/spear/pinctrl-spear.c         |  4 ++--
>   drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  4 ++--
>   drivers/pinctrl/vt8500/pinctrl-wmt.c          |  4 ++--
>   45 files changed, 98 insertions(+), 95 deletions(-)
>
> <snip>


for

  drivers/pinctrl/nomadik/pinctrl-abx500.c      |  4 ++--

and

  drivers/pinctrl/pinctrl-st.c                  |  4 ++--

Acked-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>

Thanks

Patrice
