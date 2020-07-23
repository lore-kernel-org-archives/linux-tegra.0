From: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
Subject: [PATCH v2 0/4] arm64: tegra: Xavier SDMMC changes
Date: Thu, 23 Jul 2020 23:09:28 +0200
Message-ID: <20200723210932.8076-1-tszucs@protonmail.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, JC Kuo <jckuo@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
List-Id: linux-tegra@vger.kernel.org

It turns out uSD card detection on the Jetson AGX Xavier is not working and
I/Os are limited to 3.3 V. SDIO is supported but not enabled. Also, the
on-board eMMC module is using HS200 only.

Changes in v2:
- fix board name in commit messages
- rebase on for-next

Kind regards,
Tamas


Tamás Szűcs (4):
  arm64: tegra: Enable signal voltage switching on Tegra194 SDMMC1 and
    SDMMC3
  arm64: tegra: Fix CD on Jetson AGX Xavier SDMMC1
  arm64: tegra: Configure SDIO cards on Jetson AGX Xavier SDMMC1
  arm64: tegra: Enable HS400 on Tegra194 SDMMC4

 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  4 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 46 +++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.20.1
