From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 16/23] drm/mgag200: Provide ddc symlink in connector
 sysfs directory
Date: Tue, 23 Jul 2019 11:07:52 +0200
Message-ID: <20190723090752.GB787@ravnborg.org>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <d32a6b1f0a3b79f1fbc8d0894080908526f6e61e.1562843413.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d32a6b1f0a3b79f1fbc8d0894080908526f6e61e.1562843413.git.andrzej.p@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
List-Id: linux-tegra@vger.kernel.org

Hi Andrzej.

On Thu, Jul 11, 2019 at 01:26:43PM +0200, Andrzej Pietrasiewicz wrote:
> Use the ddc pointer provided by the generic connector.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index a25054015e8c..8fb9444b2142 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1703,6 +1703,11 @@ static struct drm_connector *mga_vga_init(struct drm_device *dev)
>  		return NULL;
>  
>  	connector = &mga_connector->base;
> +	mga_connector->i2c = mgag200_i2c_create(dev);
> +	if (!mga_connector->i2c)
> +		DRM_ERROR("failed to add ddc bus\n");
> +
> +	connector->ddc = &mga_connector->i2c->adapter;
>  
>  	drm_connector_init(dev, connector,
>  			   &mga_vga_connector_funcs, DRM_MODE_CONNECTOR_VGA);
Like on other patch, assigning connector->ddc before
drm_connector_init() looks wrong.

	Sam
