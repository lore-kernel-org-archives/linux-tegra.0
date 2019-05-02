From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 0/6] Add support for Tegra186/Tegra194 and generic fixes
Date: Thu, 2 May 2019 18:25:11 +0530
Message-ID: <1556801717-31507-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, dan.j.williams@intel.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Audio DMA(ADMA) interface is a gateway in the AHUB for facilitating DMA
transfers between memory and all of its clients. Currently the driver
supports Tegra210 based platforms. This series adds support for Tegra186
and Tegra194 based platforms and fixes few functional issues.

Patches in the series are classified into three categories,
  1. Add support for Tegra186 and Tegra194
  2. Add DMA pause/resume feature
  3. Fixes common to differernt Tegra generations

Below change log describes the patches in detail.

Change log:
=====================================
v1
----
The series can be classified into 3 categories,
  1. Add support for Tegra186 and Tegra194
     [Patch 1/6] dmaengine: tegra210-adma: prepare for supporting newer
     Tegra chips
       * The support was there only for Tegra210
       * This is a preparation for adding support for newer Tegra chips
       * chip_data is enhanced to support differences between Tegra210 and
         Tegra186/Tegra194
     [Patch 2/6] Documentation: DT: Add compatibility binding for Tegra186
       * New compatibility string is required for driver to work for
         Tegra186 and Tegra194. Hence new compatibility is introduced.
       * Tegra194 can use the same compatibility as Tegra186
     [Patch 3/6] dmaengine: tegra210-adma: add support for Tegra186/
     Tegra194
       * Populates chip specific information for Tegra186
       * There is a difference in the way ADMA CH_CONFIG registers are
         encoded for Tegra210 and Tegra186. Added helper fucntions to
         support different versions of burst size configuration

  2. Add DMA pause/resume feature
     [Patch 4/6] dmaengine: tegra210-adma: add pause/resume support
       * Adds support for ADMA pause/resume, otherwise audio loss was seen
         during continuous pause/resume of audio playback.

  3. Fixes common to differernt Tegra generations
     [Patch 5/6] dmaengine: tegra210-dma: free dma controller in remove()
       * Fixes kernel panic observed during driver reload. DMA controller
         needs to be freed when driver is unloaded
     [Patch 6/6] dmaengine: tegra210-adma: restore channel status
       * Fixes resume across system suspend. If the channel state is not
         restored, the transfers won't resume from the state from where it
         was left during suspend entry. In this case, audio playback did
         not resume properly once system exited from low power state.

===============================
Sameer Pujar (6):
  dmaengine: tegra210-adma: prepare for supporting newer Tegra chips
  Documentation: DT: Add compatibility binding for Tegra186
  dmaengine: tegra210-adma: add support for Tegra186/Tegra194
  dmaengine: tegra210-adma: add pause/resume support
  dmaengine: tegra210-dma: free dma controller in remove()
  dmaengine: tegra210-adma: restore channel status

 .../bindings/dma/nvidia,tegra210-adma.txt     |   4 +-
 drivers/dma/tegra210-adma.c                   | 232 +++++++++++++++++----
 2 files changed, 193 insertions(+), 43 deletions(-)

-- 
2.7.4
