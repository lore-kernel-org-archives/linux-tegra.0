From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 2/4] Revert "drm/tegra: Move drm_dp_link helpers to
 Tegra DRM"
Date: Tue, 10 Dec 2019 23:51:58 +0200
Message-ID: <20191210215158.GA13051@pendragon.ideasonboard.com>
References: <1575957299-12977-1-git-send-email-allen.chen@ite.com.tw>
 <1575957299-12977-3-git-send-email-allen.chen@ite.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1575957299-12977-3-git-send-email-allen.chen@ite.com.tw>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: allen <allen.chen@ite.com.tw>
Cc: Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Pi-Hsun Shih <pihsun@chromium.org>, "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>, Sean Paul <sean@poorly.run>
List-Id: linux-tegra@vger.kernel.org

Hello Allen,

Thank you for the patch.

On Tue, Dec 10, 2019 at 01:53:40PM +0800, allen wrote:
> This reverts commit 9a42c7c647a9ad0f7ebb147a52eda3dcb7c84292.

Why ?

> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 128 ++++++
>  drivers/gpu/drm/tegra/Makefile  |   1 -
>  drivers/gpu/drm/tegra/dp.c      | 876 ----------------------------------------
>  drivers/gpu/drm/tegra/dp.h      | 177 --------
>  drivers/gpu/drm/tegra/dpaux.c   |   1 -
>  drivers/gpu/drm/tegra/sor.c     |   1 -
>  include/drm/drm_dp_helper.h     |  16 +
>  7 files changed, 144 insertions(+), 1056 deletions(-)
>  delete mode 100644 drivers/gpu/drm/tegra/dp.c
>  delete mode 100644 drivers/gpu/drm/tegra/dp.h

[snip]

-- 
Regards,

Laurent Pinchart
