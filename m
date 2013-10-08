From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv4 1/5] drm/tegra: Fix gr2d initialisation clean up
Date: Tue, 8 Oct 2013 09:27:24 +0300
Message-ID: <1381213648-5931-2-git-send-email-amerilainen@nvidia.com>
References: <1381213648-5931-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381213648-5931-1-git-send-email-amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

gr2d initialisation clean up had missing steps (i.e. host1x channel
was not released if we could not register gr2d as a host1x client)
that could have lead to weird issues. This patch reworks the
initialisation sequence to do clean up correctly.

Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/drm/gr2d.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/host1x/drm/gr2d.c b/drivers/gpu/host1x/drm/gr2d.c
index 27ffcf1..60150ad 100644
--- a/drivers/gpu/host1x/drm/gr2d.c
+++ b/drivers/gpu/host1x/drm/gr2d.c
@@ -282,13 +282,15 @@ static int gr2d_probe(struct platform_device *pdev)
 	}
 
 	gr2d->channel = host1x_channel_request(dev);
-	if (!gr2d->channel)
-		return -ENOMEM;
+	if (!gr2d->channel) {
+		err = -ENOMEM;
+		goto err_channel_request;
+	}
 
 	*syncpts = host1x_syncpt_request(dev, false);
 	if (!(*syncpts)) {
-		host1x_channel_free(gr2d->channel);
-		return -ENOMEM;
+		err = -ENOMEM;
+		goto err_syncpt_request;
 	}
 
 	gr2d->client.ops = &gr2d_client_ops;
@@ -300,7 +302,7 @@ static int gr2d_probe(struct platform_device *pdev)
 	err = host1x_register_client(host1x, &gr2d->client);
 	if (err < 0) {
 		dev_err(dev, "failed to register host1x client: %d\n", err);
-		return err;
+		goto err_register_client;
 	}
 
 	gr2d_init_addr_reg_map(dev, gr2d);
@@ -308,6 +310,15 @@ static int gr2d_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, gr2d);
 
 	return 0;
+
+err_register_client:
+	host1x_syncpt_free(*gr2d->client.syncpts);
+err_syncpt_request:
+	host1x_channel_free(gr2d->channel);
+err_channel_request:
+	clk_disable_unprepare(gr2d->clk);
+
+	return err;
 }
 
 static int __exit gr2d_remove(struct platform_device *pdev)
-- 
1.8.1.5
