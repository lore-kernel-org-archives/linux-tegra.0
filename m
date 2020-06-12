From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] drm/tegra: hub: Register child devices
Date: Fri, 12 Jun 2020 17:01:00 +0200
Message-ID: <20200612150100.2419935-2-thierry.reding@gmail.com>
References: <20200612150100.2419935-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200612150100.2419935-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

In order to remove the dependency on the simple-bus compatible string,
which causes the OF driver core to register all child devices, make the
display-hub driver explicitly register the display controller children.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/hub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index a2ef8f218d4e..22a03f7ffdc1 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -948,6 +948,15 @@ static int tegra_display_hub_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
 
+	err = devm_of_platform_populate(&pdev->dev);
+	if (err < 0)
+		goto unregister;
+
+	return err;
+
+unregister:
+	host1x_client_unregister(&hub->client);
+	pm_runtime_disable(&pdev->dev);
 	return err;
 }
 
-- 
2.24.1
