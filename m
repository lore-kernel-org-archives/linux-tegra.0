From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier
 API
Date: Mon, 19 Aug 2019 11:38:44 +0200
Message-ID: <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
References: <20190814104520.6001-1-darekm@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Neil Armstrong <narmstrong@baylibre.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Hans Verkuil <hverkuil@xs4all.nl>, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org, David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>, "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>, linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, Russell King <rmk+kernel@armlinux.org.uk>, Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi all,

The patches in this series can be applied independently from each other.

If you maintain one of these drivers and you want to merge it for v5.4
yourself, then please do so and let me know. If you prefer I commit it
to drm-misc, then please review and (hopefully) Ack the patch.

I would really like to get this in for v5.4 so I can get the userspace
bits in for v5.4 as well through the media subsystem.

Dariusz, can you post a v7.1 for patch 5/9 fixing the typo?

Thanks!

	Hans

On 8/14/19 12:44 PM, Dariusz Marcinkiewicz wrote:
> This series updates DRM drivers to use new CEC notifier API.
> 
> Changes since v6:
> 	Made CEC notifiers' registration and de-registration symmetric
> 	in tda998x and dw-hdmi drivers. Also, accidentally dropped one
> 	patch in v6 (change to drm_dp_cec), brought it back now.
> Changes since v5:
>         Fixed a warning about a missing comment for a new member of
> 	drm_dp_aux_cec struct. Sending to a wider audience,
> 	including maintainers of respective drivers.
> Changes since v4:
> 	Addressing review comments.
> Changes since v3:
>         Updated adapter flags in dw-hdmi-cec.
> Changes since v2:
> 	Include all DRM patches from "cec: improve notifier support,
> 	add connector info connector info" series.
> Changes since v1:
> 	Those patches delay creation of notifiers until respective
> 	connectors are constructed. It seems that those patches, for a
> 	couple of drivers, by adding the delay, introduce a race between
> 	notifiers' creation and the IRQs handling threads - at least I
> 	don't see anything obvious in there that would explicitly forbid
> 	such races to occur. v2 adds a write barrier to make sure IRQ
> 	threads see the notifier once it is created (replacing the
> 	WRITE_ONCE I put in v1). The best thing to do here, I believe,
> 	would be not to have any synchronization and make sure that an IRQ
> 	only gets enabled after the notifier is created.
> Dariusz Marcinkiewicz (9):
>   drm_dp_cec: add connector info support.
>   drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
>   dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
>   tda9950: use cec_notifier_cec_adap_(un)register
>   drm: tda998x: use cec_notifier_conn_(un)register
>   drm: sti: use cec_notifier_conn_(un)register
>   drm: tegra: use cec_notifier_conn_(un)register
>   drm: dw-hdmi: use cec_notifier_conn_(un)register
>   drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
> 
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 13 +++---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 46 +++++++++++++------
>  drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++----
>  drivers/gpu/drm/exynos/exynos_hdmi.c          | 31 +++++++------
>  drivers/gpu/drm/i2c/tda9950.c                 | 12 ++---
>  drivers/gpu/drm/i2c/tda998x_drv.c             | 36 ++++++++++-----
>  drivers/gpu/drm/i915/display/intel_dp.c       |  4 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     | 13 ++++--
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +-
>  drivers/gpu/drm/sti/sti_hdmi.c                | 19 +++++---
>  drivers/gpu/drm/tegra/output.c                | 28 ++++++++---
>  include/drm/drm_dp_helper.h                   | 17 ++++---
>  13 files changed, 155 insertions(+), 94 deletions(-)
> 
