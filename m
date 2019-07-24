From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 14/23] drm/tilcdc: Provide ddc symlink in connector
 sysfs directory
Date: Wed, 24 Jul 2019 10:51:01 +0200
Message-ID: <f051455a-3559-8f8e-cc76-1a6388b102b5@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <d1d415022c598fb7acd033f0f322dd67250adaa9.1562843413.git.andrzej.p@collabora.com>
 <20190723090532.GA787@ravnborg.org>
 <3ad60be5-49cf-4017-4b74-53a2d6272deb@collabora.com>
 <acfd895d-ab59-0190-e25c-1827bd8d214b@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <acfd895d-ab59-0190-e25c-1827bd8d214b@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Jonas
List-Id: linux-tegra@vger.kernel.org

Hi Thomas,

W dniu 24.07.2019 o 10:01, Thomas Zimmermann pisze:
> Hi
> 


> 
> I think this echoes my concern about the implicit order of operation. It
> seems too easy to get this wrong. If you don't want to add an additional
> interface for setting the ddc field, why not add a dedicated initializer
> function that sets the ddc field? Something like this.
> 
> int drm_connector_init_with_ddc(connector, funcs, ..., ddc)
> {
> 	ret = drm_connector_init(connector, funcs, ...);
> 	if (ret)
> 		return ret;
> 
> 	if (!ddc)
> 		return 0;
> 
> 	connector->ddc = ddc;
> 	/* set up sysfs */
> 
> 	return 0;
> }
> 

True. I will send a v5 soon.

Thanks,

Andrzej
