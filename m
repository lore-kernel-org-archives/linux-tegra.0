From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] drm/tegra: sor: Disable runtime PM on probe failure
Date: Fri, 31 Jan 2020 17:59:09 +0100
Message-ID: <20200131165910.3443936-2-thierry.reding@gmail.com>
References: <20200131165910.3443936-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200131165910.3443936-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

If the driver fails to probe, make sure to disable runtime PM again.

While at it, make the cleanup code in ->remove() symmetric.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/sor.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 96cd89bb2e82..aa4e1695b537 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3926,13 +3926,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
 				      sor->index);
 		if (!name) {
 			err = -ENOMEM;
-			goto remove;
+			goto rpm_disable;
 		}
 
 		err = host1x_client_resume(&sor->client);
 		if (err < 0) {
 			dev_err(sor->dev, "failed to resume: %d\n", err);
-			goto remove;
+			goto rpm_disable;
 		}
 
 		sor->clk_pad = tegra_clk_sor_pad_register(sor, name);
@@ -3943,7 +3943,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		err = PTR_ERR(sor->clk_pad);
 		dev_err(&pdev->dev, "failed to register SOR pad clock: %d\n",
 			err);
-		goto remove;
+		goto rpm_disable;
 	}
 
 	INIT_LIST_HEAD(&sor->client.list);
@@ -3954,11 +3954,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
-		goto remove;
+		goto rpm_disable;
 	}
 
 	return 0;
 
+rpm_disable:
+	pm_runtime_disable(&pdev->dev);
 remove:
 	if (sor->ops && sor->ops->remove)
 		sor->ops->remove(sor);
@@ -3972,8 +3974,6 @@ static int tegra_sor_remove(struct platform_device *pdev)
 	struct tegra_sor *sor = platform_get_drvdata(pdev);
 	int err;
 
-	pm_runtime_disable(&pdev->dev);
-
 	err = host1x_client_unregister(&sor->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
@@ -3981,6 +3981,8 @@ static int tegra_sor_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	pm_runtime_disable(&pdev->dev);
+
 	if (sor->ops && sor->ops->remove) {
 		err = sor->ops->remove(sor);
 		if (err < 0)
-- 
2.24.1
