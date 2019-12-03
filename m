From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 25/26] drm/panel: tpo-td028ttec1: use drm_panel
 backlight support
Date: Tue, 3 Dec 2019 09:16:56 +0200
Message-ID: <20191203071656.GJ4730@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-26-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20191202193230.21310-26-sam@ravnborg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Stefan Agner <stefan@agner.ch>, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>
List-Id: linux-tegra@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Mon, Dec 02, 2019 at 08:32:29PM +0100, Sam Ravnborg wrote:
> Use the backlight support in drm_panel to simplify the driver
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> index 37252590b541..cf29405a2dbe 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> @@ -17,7 +17,6 @@
>   * H. Nikolaus Schaller <hns@goldelico.com>
>   */
>  
> -#include <linux/backlight.h>
>  #include <linux/delay.h>
>  #include <linux/module.h>
>  #include <linux/spi/spi.h>
> @@ -83,7 +82,6 @@ struct td028ttec1_panel {
>  	struct drm_panel panel;
>  
>  	struct spi_device *spi;
> -	struct backlight_device *backlight;
>  };
>  
>  #define to_td028ttec1_device(p) container_of(p, struct td028ttec1_panel, panel)
> @@ -243,8 +241,6 @@ static int td028ttec1_enable(struct drm_panel *panel)
>  	if (ret)
>  		return ret;
>  
> -	backlight_enable(lcd->backlight);
> -
>  	return 0;
>  }
>  
> @@ -252,8 +248,6 @@ static int td028ttec1_disable(struct drm_panel *panel)
>  {
>  	struct td028ttec1_panel *lcd = to_td028ttec1_device(panel);
>  
> -	backlight_disable(lcd->backlight);
> -
>  	jbt_ret_write_0(lcd, JBT_REG_DISPLAY_OFF, NULL);
>  
>  	return 0;
> @@ -334,10 +328,6 @@ static int td028ttec1_probe(struct spi_device *spi)
>  	spi_set_drvdata(spi, lcd);
>  	lcd->spi = spi;
>  
> -	lcd->backlight = devm_of_find_backlight(&spi->dev);
> -	if (IS_ERR(lcd->backlight))
> -		return PTR_ERR(lcd->backlight);
> -
>  	spi->mode = SPI_MODE_3;
>  	spi->bits_per_word = 9;
>  
> @@ -350,6 +340,10 @@ static int td028ttec1_probe(struct spi_device *spi)
>  	drm_panel_init(&lcd->panel, &lcd->spi->dev, &td028ttec1_funcs,
>  		       DRM_MODE_CONNECTOR_DPI);
>  
> +	ret = drm_panel_of_backlight(&lcd->panel);
> +	if (ret)
> +		return ret;
> +
>  	return drm_panel_add(&lcd->panel);
>  }
>  

-- 
Regards,

Laurent Pinchart
