From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/3] drm/tegra: Support PM QoS memory bandwidth
 management
Date: Mon, 6 May 2019 14:15:59 +0300
Message-ID: <e1dc16d2-db9e-6869-81dc-8ffe5d5fd6fe@gmail.com>
References: <20190505173707.29282-1-digetx@gmail.com>
 <20190505173707.29282-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190505173707.29282-4-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

05.05.2019 20:37, Dmitry Osipenko пишет:
> Display controller (DC) performs isochronous memory transfers and thus
> has a requirement for a minimum memory bandwidth that shall be fulfilled,
> otherwise framebuffer data can't be fetched fast enough and this results
> in a DC's data-FIFO underflow that follows by a visual corruption.
> 
> The External Memory Controller drivers will provide memory bandwidth
> management facility via the generic Power Management QoS API soonish.
> This patch wires up the PM QoS API support for the display driver
> beforehand.
> 
> Display won't have visual corruption on coming up from suspend state when
> devfreq driver is active once all prerequisite bits will get upstreamed.
> The devfreq reaction has a quite significant latency and it also doesn't
> take into account the ISO transfers which may result in assumption about
> lower memory bandwidth requirement than actually needed.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c    | 216 +++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/tegra/dc.h    |   8 ++
>  drivers/gpu/drm/tegra/drm.c   |  18 +++
>  drivers/gpu/drm/tegra/plane.c |   1 +
>  drivers/gpu/drm/tegra/plane.h |   4 +-
>  5 files changed, 245 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 41cb67db6dbc..8c5b9e71ca6f 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -514,6 +514,107 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
>  		tegra_plane_setup_blending(plane, window);
>  }
>  
> +static unsigned long
> +tegra_plane_memory_bandwidth(struct drm_plane_state *state,
> +			     struct tegra_dc_window *window)
> +{
> +	struct tegra_plane_state *tegra_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct tegra_dc_window win;
> +	unsigned int mul;
> +	unsigned int bpp;
> +	bool planar;
> +	bool yuv;
> +
> +	if (!state->fb || !state->visible)
> +		return 0;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state->state, state->crtc);
> +	tegra_state = to_tegra_plane_state(state);
> +
> +	if (!window)
> +		window = &win;
> +
> +	window->src.w = drm_rect_width(&state->src) >> 16;
> +	window->src.h = drm_rect_height(&state->src) >> 16;
> +	window->dst.w = drm_rect_width(&state->dst);
> +	window->dst.h = drm_rect_height(&state->dst);
> +	window->format = tegra_state->format;
> +	window->tiling = tegra_state->tiling;
> +
> +	yuv = tegra_plane_format_is_yuv(window->format, &planar);
> +	if (!yuv || !planar)
> +		bpp = state->fb->format->cpp[0] * 8;
> +	else
> +		bpp = 16;

It occurred to me that it will be much better to use the drm_format_*
helpers here to calculate the bits-per-pixel because the above variant
isn't really good for all of possible formats. I'll switch to the
generic helpers in v2.

Thierry, for now I'll wait for awhile for yours comments. Please let me
know if you'll want to see anything else changed in v2. I think there is
a good chance that we could get everything ready in regards to memory
bandwidth management basics for v5.3, please help with reviewing and
getting the patches upstreamed.

-- 
Dmitry
