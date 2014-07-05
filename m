From: Pawel Lebioda <pawel.lebioda89@gmail.com>
Subject: [PATCH 2/2] staging: nvec: remove unneccessary 'out of memory' message
Date: Sat,  5 Jul 2014 22:30:56 +0200
Message-ID: <df2e426106dbb1040fded1f2ae69cb88e6c8c5cc.1404586529.git.pawel.lebioda89@gmail.com>
References: <cover.1404586529.git.pawel.lebioda89@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <cover.1404586529.git.pawel.lebioda89@gmail.com>
In-Reply-To: <cover.1404586529.git.pawel.lebioda89@gmail.com>
References: <cover.1404586529.git.pawel.lebioda89@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Julian Andres Klode <jak@jak-linux.org>, Marc Dietrich <marvin24@gmx.de>
Cc: linux-tegra@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

Fix the following warning reported by checkpatch.pl:

WARNING: Possible unnecessary 'out of memory' message
811: FILE: drivers/staging/nvec/nvec.c:811

Signed-off-by: Pawel Lebioda <pawel.lebioda89@gmail.com>
---
 drivers/staging/nvec/nvec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 8a3dd47..d325048 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -806,10 +806,9 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 	}
 
 	nvec = devm_kzalloc(&pdev->dev, sizeof(struct nvec_chip), GFP_KERNEL);
-	if (nvec == NULL) {
-		dev_err(&pdev->dev, "failed to reserve memory\n");
+	if (nvec == NULL)
 		return -ENOMEM;
-	}
+
 	platform_set_drvdata(pdev, nvec);
 	nvec->dev = &pdev->dev;
 
-- 
1.8.3.2
