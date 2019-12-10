From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH v3 0/9] drm/nouveau: Various fixes for GP10B
Date: Tue, 10 Dec 2019 18:15:30 +1000
Message-ID: <CACAvsv4NX7jvZb5_X5auU4-KKk9PfmtJvmnQNjY7ihqgXaRS6A@mail.gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 9 Dec 2019 at 22:00, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Hi Ben,
>
> here's a revised subset of the patches I had sent out a couple of weeks
> ago. I've reworked the BAR2 accesses in the way that you had suggested,
> which at least for GP10B turned out to be fairly trivial to do. I have
> not looked in detail at this for GV11B yet, but a cursory look showed
> that BAR2 is accessed in more places, so the equivalent for GV11B might
> be a bit more involved.
>
> Other than that, not a lot has changed since then. I've added a couple
> of precursory patches to add IOMMU helper dummies for the case where
> IOMMU is disabled (as suggested by Ben Dooks).
>
> Joerg has given an Acked-by on the first two patches, so I think it'd be
> easiest if you picked those up into the Nouveau tree because of the
> build dependency of subsequent patches on them.
I've merged all the patches in my tree, after fixing a small build
issue on !TEGRA in the WPR config readout patch.

Thanks Thierry!
Ben.

>
> Thierry
>
> Thierry Reding (9):
>   iommu: Document iommu_fwspec::flags field
>   iommu: Add dummy dev_iommu_fwspec_get() helper
>   drm/nouveau: fault: Add support for GP10B
>   drm/nouveau: tegra: Do not try to disable PCI device
>   drm/nouveau: tegra: Avoid pulsing reset twice
>   drm/nouveau: tegra: Set clock rate if not set
>   drm/nouveau: secboot: Read WPR configuration from GPU registers
>   drm/nouveau: gp10b: Add custom L2 cache implementation
>   drm/nouveau: gp10b: Use correct copy engine
>
>  .../drm/nouveau/include/nvkm/subdev/fault.h   |  1 +
>  .../gpu/drm/nouveau/include/nvkm/subdev/ltc.h |  1 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
>  .../gpu/drm/nouveau/nvkm/engine/device/base.c |  6 +-
>  .../drm/nouveau/nvkm/engine/device/tegra.c    | 24 ++++--
>  .../gpu/drm/nouveau/nvkm/subdev/fault/Kbuild  |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/fault/base.c  |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/fault/gp100.c | 17 ++--
>  .../gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c | 53 ++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/fault/gv100.c |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/fault/priv.h  | 10 +++
>  .../gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild    |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   | 65 +++++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/ltc/priv.h    |  2 +
>  .../drm/nouveau/nvkm/subdev/secboot/gm200.h   |  2 +-
>  .../drm/nouveau/nvkm/subdev/secboot/gm20b.c   | 81 ++++++++++++-------
>  .../drm/nouveau/nvkm/subdev/secboot/gp10b.c   |  4 +-
>  include/linux/iommu.h                         | 47 ++++++-----
>  18 files changed, 249 insertions(+), 72 deletions(-)
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
>
> --
> 2.23.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
