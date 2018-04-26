From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [Intel-gfx] [PATCH] drm/core: Remove drm_dev_unref() and it's
 uses
Date: Thu, 26 Apr 2018 15:14:53 +0200
Message-ID: <20180426131404.GP4813@piout.net>
References: <20180426102819.6985-1-vthakkar1994@gmail.com>
 <20180426123615.GA12521@phenom.ffwll.local>
 <1556510.Xu6NnhyFGZ@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556510.Xu6NnhyFGZ@avalon>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Vaishali Thakkar <vthakkar1994@gmail.com>, alexander.deucher@amd.com, linux-renesas-soc@vger.kernel.org, heiko@sntech.de, airlied@linux.ie, linus.walleij@linaro.org, stefan@agner.ch, hjc@rock-chips.com, kraxel@redhat.com, benjamin.gaignard@linaro.org, nouveau@lists.freedesktop.org, marex@denx.de, David1.Zhou@amd.com, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, linux-rockchip@lists.infradead.org, tomi.valkeinen@ti.com, linux@armlinux.org.uk, krzk@kernel.org, jonathanh@nvidia.com, z.liuxinliang@hisilicon.com, maxime.ripard@bootlin.com, kong.kongxinwei@hisilicon.com, kgene@kernel.org, bskeggs@redhat.com, linux-arm-msm@vger.kernel.org, ck.hu@mediatek.com, airlied@redhat.com, virtualization@lists.linux-foundation.orglinu
List-Id: linux-tegra@vger.kernel.org

Hi,

On 26/04/2018 15:45:44+0300, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Thursday, 26 April 2018 15:36:15 EEST Daniel Vetter wrote:
> > On Thu, Apr 26, 2018 at 03:58:19PM +0530, Vaishali Thakkar wrote:
> > > It's been a while since we introduced drm_dev{get/put} functions
> > > to replace reference/unreference in drm subsystem for the
> > > consistency purpose. So, with this patch, let's just replace
> > > all current use cases of drm_dev_unref() with drm_dev_put and remove
> > > the function itself.
> > > 
> > > Coccinelle was used for mass-patching.
> > > 
> > > Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
> > 
> > Thanks for doing this. Unfortunately drm moves pretty fast, so already a
> > conflict when I tried to apply this. Some drivers are also in their own
> > trees, so this might lead to more fun :-/
> > 
> > Can you pls split it up per-driver (just the directories under
> > drivers/gpu/drm/ is enough)? Final patch to remove the function might then
> > get stalled a bit ofc.
> 
> I requested a single patch instead of splitting it per driver, you might want 
> to blame me for that.
> 

Doesn't splitting the change per driver break bisectability unless there
is a guarantee that the change in include/drm/drm_drv.h is applied after
all the driver trees have been merged?


-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
