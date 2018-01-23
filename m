From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 00/15] drm: More plane clipping polish
Date: Tue, 23 Jan 2018 18:15:52 +0200
Message-ID: <20180123161552.GN5453@intel.com>
References: <20171123190502.28449-1-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171123190502.28449-1-ville.syrjala@linux.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>, Ben Skeggs <bskeggs@redhat.com>, Brian Starkey <brian.starkey@arm.com>, CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, Mali DP Maintainers <malidp@foss.arm.com>, Mark Yao <mark.yao@rock-chips.com>, Neil Armstrong <narmstrong@baylibre.com>, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, nouveau@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sinclair Yeh <syeh@vmwa>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 23, 2017 at 09:04:47PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> This series first unifies all users of drm_atomic_helper_check_plane_state()
> to populate the clip rectangle with drm_mode_get_hv_timing(), and once
> everything is unified the clip rectangle handling is sucked into
> drm_atomic_helper_check_plane_state() away from driver code.
> 
> Entire series available here:
> git://github.com/vsyrjala/linux.git atomic_plane_helper_clip
> 
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: freedreno@lists.freedesktop.org
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mali DP Maintainers <malidp@foss.arm.com>
> Cc: Mark Yao <mark.yao@rock-chips.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: nouveau@lists.freedesktop.org
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sinclair Yeh <syeh@vmware.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Hellstrom <thellstrom@vmware.com>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> 
> Ville Syrjälä (15):
>   drm/i915: Reject odd pipe source width with double wide/dual link
>   drm/i915: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/arm/hdlcd: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/arm/mali-dp: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/simple_kms_helper: Use drm_mode_get_hv_timing() to populate plane
>     clip rectangle
>   drm/imx: Use drm_mode_get_hv_timing() to populate plane clip rectangle
>   drm/mediatek: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/meson: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/msm/mdp5: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/nouveau/kms/nv50: Use drm_mode_get_hv_timing() to populate plane
>     clip rectangle
>   drm/rockchip: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/tegra/dc: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/vmwgfx: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/zte: Use drm_mode_get_hv_timing() to populate plane clip rectangle

Everything up to here pushed to drm-misc-next. Thanks for the reviews.

There have been a few new users of the clip helper so I'll have to
take care of those and respin the final patch.

Also armada looks broken to me since it has started to use the
atomic version of the helper without actually being an atomic
driver. So I'll have to figure out what's going on there as well.

>   drm: Don't pass clip to drm_atomic_helper_check_plane_state()
> 
>  drivers/gpu/drm/arm/hdlcd_crtc.c            |  6 +-----
>  drivers/gpu/drm/arm/malidp_planes.c         |  5 +----
>  drivers/gpu/drm/armada/armada_overlay.c     |  2 +-
>  drivers/gpu/drm/drm_atomic_helper.c         | 12 +++++++-----
>  drivers/gpu/drm/drm_plane_helper.c          | 11 +++--------
>  drivers/gpu/drm/drm_simple_kms_helper.c     |  5 -----
>  drivers/gpu/drm/i915/intel_atomic_plane.c   |  8 --------
>  drivers/gpu/drm/i915/intel_display.c        | 12 +++++++-----
>  drivers/gpu/drm/i915/intel_drv.h            |  1 -
>  drivers/gpu/drm/i915/intel_sprite.c         |  8 ++++++--
>  drivers/gpu/drm/imx/ipuv3-plane.c           |  7 +------
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  6 +-----
>  drivers/gpu/drm/meson/meson_plane.c         |  6 +-----
>  drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c   | 14 ++------------
>  drivers/gpu/drm/nouveau/nv50_display.c      |  8 --------
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  8 +-------
>  drivers/gpu/drm/tegra/dc.c                  |  8 +-------
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c         |  8 +-------
>  drivers/gpu/drm/zte/zx_plane.c              | 15 +--------------
>  include/drm/drm_atomic_helper.h             |  1 -
>  include/drm/drm_plane_helper.h              |  1 -
>  21 files changed, 35 insertions(+), 117 deletions(-)
> 
> -- 
> 2.13.6

-- 
Ville Syrjälä
Intel OTC
