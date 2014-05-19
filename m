From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 0/5] drm/nouveau: platform devices and GK20A probing
Date: Mon, 19 May 2014 12:04:28 +0200
Message-ID: <1400493868.8467.26.camel@weser.hi.pengutronix.de>
References: <1400491450-19223-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400491450-19223-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: gnurou@gmail.com, Stephen Warren <swarren@wwwdotorg.org>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 19.05.2014, 18:24 +0900 schrieb Alexandre Courbot:
> This patch series is the final (?) step towards the initial support of GK20A,
> allowing it to be probed and used (currently at a very slow speed, and for
> offscreen rendering only) on the Jetson TK1 and Venice 2 boards.
> 
This seem to still need external firmware. Any chance to get this into
linux-firmware?

Regards,
Lucas
> The main piece if the first patch which adds platform devices probing support
> to Nouveau. There are probably lots of things that need to be discussed about
> it, e.g.:
> 
> * The way the DRM device is created, especially with respect to the ongoing
>   changes to the DRM framework,
> * The fact that the same drm_driver instance is used for the PCI and platform
>   drivers,
> * Whether we should have only one platform driver capable of probing all
>   platform devices, or one driver per GPU (in this case, where should all these
>   drivers reside?)
> 
> So there are still some rough edges, but we are getting there. :)
> 
> The first patch should go through the Nouveau tree, while the 4 others are
> rather intended for Tegra.
> 
> Alexandre Courbot (3):
>   drm/nouveau: support for probing platform devices
>   ARM: tegra: of: add GK20A device tree binding
>   ARM: tegra: jetson-tk1: enable GK20A GPU
> 
> Thierry Reding (2):
>   ARM: tegra: add GK20A GPU to Tegra124 DT
>   ARM: tegra: venice2: enable GK20A GPU
> 
>  .../devicetree/bindings/gpu/nvidia,gk20a.txt       |  45 +++++
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   8 +-
>  arch/arm/boot/dts/tegra124-venice2.dts             |   8 +-
>  arch/arm/boot/dts/tegra124.dtsi                    |  15 ++
>  drivers/gpu/drm/nouveau/Kconfig                    |   8 +
>  drivers/gpu/drm/nouveau/Makefile                   |   3 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c              |  33 ++--
>  drivers/gpu/drm/nouveau/nouveau_drm.h              |  21 +++
>  drivers/gpu/drm/nouveau/nouveau_platform.c         | 191 +++++++++++++++++++++
>  9 files changed, 315 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
>  create mode 100644 drivers/gpu/drm/nouveau/nouveau_platform.c
> 

-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |
