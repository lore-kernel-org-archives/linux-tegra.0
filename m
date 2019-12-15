From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/3] Tegra VDE: Minor code clean up
Date: Sun, 15 Dec 2019 21:07:49 +0300
Message-ID: <20191215180752.5408-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This small series just makes a minor clean up of the driver's code,
addressing COMPILE_TEST build problem that was reported sometime ago.

Dmitry Osipenko (3):
  media: staging: tegra-vde: Select IOVA unconditionally in Kconfig
  media: staging: tegra-vde: Sort headers alphabetically
  media: staging: tegra-vde: Use __maybe_unused attribute instead of
    ifdef

 drivers/staging/media/tegra-vde/Kconfig | 2 +-
 drivers/staging/media/tegra-vde/vde.c   | 6 ++----
 drivers/staging/media/tegra-vde/vde.h   | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.24.0
