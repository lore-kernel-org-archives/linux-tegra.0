From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 1/4] media: staging: tegra-vde: Balance runtime PM use-count on resume failure
Date: Wed, 24 Jun 2020 18:08:44 +0300
Message-ID: <20200624150847.22672-2-digetx@gmail.com>
References: <20200624150847.22672-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200624150847.22672-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The RPM's use-count is getting incremented regardless of the
pm_runtime_get_sync() success or fail. It's up to a driver how to
handle the failed RPM. In the case of VDE driver, the RPM's use-count
should be restored if runtime-resume fails. Use pm_runtime_put_noidle(),
which is the most straight-forward variant to balance the RPM, confirmed
by Rafael J. Wysocki.

Link: https://lore.kernel.org/linux-i2c/CAJZ5v0i87NGcy9+kxubScdPDyByr8ypQWcGgBFn+V-wDd69BHQ@mail.gmail.com/
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index d3e63512a765..803e5dda4bb5 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -776,8 +776,10 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 		goto release_dpb_frames;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
 		goto unlock;
+	}
 
 	/*
 	 * We rely on the VDE registers reset value, otherwise VDE
-- 
2.26.0
