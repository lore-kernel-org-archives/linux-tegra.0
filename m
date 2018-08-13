From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 06/14] staging: media: tegra-vde: Print out invalid FD
Date: Mon, 13 Aug 2018 16:50:19 +0200
Message-ID: <20180813145027.16346-7-thierry.reding@gmail.com>
References: <20180813145027.16346-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180813145027.16346-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Include the invalid file descriptor when reporting an error message to
help diagnosing why importing the buffer failed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/staging/media/tegra-vde/tegra-vde.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c b/drivers/staging/media/tegra-vde/tegra-vde.c
index 0ce30c7ccb75..0adc603fa437 100644
--- a/drivers/staging/media/tegra-vde/tegra-vde.c
+++ b/drivers/staging/media/tegra-vde/tegra-vde.c
@@ -643,7 +643,7 @@ static int tegra_vde_attach_dmabuf(struct device *dev,
 
 	dmabuf = dma_buf_get(fd);
 	if (IS_ERR(dmabuf)) {
-		dev_err(dev, "Invalid dmabuf FD\n");
+		dev_err(dev, "Invalid dmabuf FD: %d\n", fd);
 		return PTR_ERR(dmabuf);
 	}
 
-- 
2.17.0
