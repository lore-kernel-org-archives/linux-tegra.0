From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/3] Support regulators coupling on NVIDIA Tegra20/30
Date: Mon, 15 Jul 2019 22:45:00 +0300
Message-ID: <20190715194503.19100-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

The voltage regulators need to be coupled on NVIDIA Tegra20 and Tegra30
SoCs in order to provide voltage scaling functionality in a generic way.
All necessary regulator-core patches that added support for the regulators
coupling are already have been merge into mainline kernel. This series
adds customized voltage couplers for Tegra20/30 SoCs, paving the way for
a refined CPUFreq driver that will utilize voltage scaling and other neat
features. This is a resend of a leftover patches from a previous series
[1] that was partially applied by Mark Brown. Please review, thanks in
advance!

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=115626

Dmitry Osipenko (3):
  dt-bindings: regulator: Document regulators coupling of NVIDIA
    Tegra20/30 SoCs
  soc/tegra: regulators: Add regulators coupler for Tegra20
  soc/tegra: regulators: Add regulators coupler for Tegra30

 .../nvidia,tegra-regulators-coupling.txt      |  65 ++++
 drivers/soc/tegra/Kconfig                     |  10 +
 drivers/soc/tegra/Makefile                    |   2 +
 drivers/soc/tegra/regulators-tegra20.c        | 350 ++++++++++++++++++
 drivers/soc/tegra/regulators-tegra30.c        | 302 +++++++++++++++
 5 files changed, 729 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
 create mode 100644 drivers/soc/tegra/regulators-tegra20.c
 create mode 100644 drivers/soc/tegra/regulators-tegra30.c

-- 
2.22.0
