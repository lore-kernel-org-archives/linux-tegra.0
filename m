From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/4] Tegra Video Decoder driver power management corrections
Date: Fri, 15 May 2020 00:08:43 +0300
Message-ID: <20200514210847.9269-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This small series addresses a Runtime PM issue that was discovered during
of Tegra VI driver reviewing by balancing RPM usage count on RPM resume
failure. Secondly it fixes reboot on some Tegra devices due to bootloader
expecting VDE power partition to be ON at the boot time, which wasn't
happening in case of a warm re-booting (i.e. by PMC resetting).

Dmitry Osipenko (4):
  media: staging: tegra-vde: Balance runtime PM use-count on resume
    failure
  media: staging: tegra-vde: Runtime PM is always available on Tegra
  media: staging: tegra-vde: Turn ON power domain on shutdown
  media: staging: tegra-vde: Power-cycle hardware on probe

 drivers/staging/media/tegra-vde/vde.c | 45 +++++++++++++++++----------
 1 file changed, 29 insertions(+), 16 deletions(-)

-- 
2.26.0
