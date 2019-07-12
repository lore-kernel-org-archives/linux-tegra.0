From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v1] drm/modes: Don't apply cmdline's rotation if it
 wasn't specified
Date: Fri, 12 Jul 2019 21:54:29 +0200
Message-ID: <20190712195429.dlz5ofwoafciedcq@flea>
References: <20190711021313.29445-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190711021313.29445-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 11, 2019 at 05:13:13AM +0300, Dmitry Osipenko wrote:
> The rotation mode from cmdline shouldn't be taken into account if it
> wasn't specified in the cmdline. This fixes ignored default display
> orientation when display mode is given using cmdline without the
> rotation being specified.
>
> Fixes: 1bf4e09227c3 ("drm/modes: Allow to specify rotation and reflection on the commandline")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
