From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v1 0/3] support nvidia,thermtrip property
Date: Fri, 7 Dec 2018 18:10:04 +0800
Message-ID: <1544177407-20203-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, edubezval@gmail.com, srikars@nvidia.com, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add "nvidia,thermtrip" property to implement HW and SW
shutdown.

Wei Ni (3):
  of: add nvidia,thermtrips property
  thermal: tegra: support hw and sw shutdown
  arm64: dts: tegra210: set thermtrip

 .../bindings/thermal/nvidia,tegra124-soctherm.txt  | 20 ++++-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 15 ++--
 drivers/thermal/tegra/soctherm.c                   | 99 ++++++++++++++++++----
 drivers/thermal/tegra/soctherm.h                   |  6 ++
 drivers/thermal/tegra/tegra210-soctherm.c          |  8 ++
 5 files changed, 124 insertions(+), 24 deletions(-)

-- 
2.7.4
