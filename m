From: Mark Zhang <markz@nvidia.com>
Subject: [PATCH v3 0/4] Add max77620 charging & low battery support
Date: Tue, 12 Feb 2019 14:43:49 +0800
Message-ID: <20190212064353.7451-1-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch set adds support for max77620 backup battery charging and
low battery monitoring.

Changes in v3:
- Add unit suffix to backup battery charging dts properties
- Reduce/optimize the low battery monitoring dts properties

Changes in v2:
- Add devicetree binding documentation

Mark Zhang (4):
  mfd: max77620: Add backup battery charger support
  mfd: max77620: add documentation for backup battery charging
  mfd: max77620: Add low battery monitor support
  mfd: max77620: add documentation for low battery monitoring

 .../devicetree/bindings/mfd/max77620.txt      |  34 ++++++
 drivers/mfd/max77620.c                        | 115 +++++++++++++++++-
 2 files changed, 148 insertions(+), 1 deletion(-)

--=20
2.19.2
