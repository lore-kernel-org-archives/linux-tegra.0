From: Gen Zhang <blackgod016574@gmail.com>
Subject: [PATCH] tegra_wm9712: Fix a memory leaking bug in
 tegra_wm9712_driver_probe()
Date: Fri, 24 May 2019 08:50:14 +0800
Message-ID: <20190524005014.GA2289@zhanggen-UX430UQ>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, perex@perex.cz
Cc: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

In tegra_wm9712_driver_probe(), 'machine->codec' is allocated by
platform_device_alloc(). When it is NULL, function returns ENOMEM.
However, 'machine' is allocated by devm_kzalloc() before this site.
Thus we should free 'machine' before function ends to prevent memory
leaking.

Further, we should free 'machine->util_data', 'machine->codec' and
'machine' before this function normally ends to prevent memory leaking.

Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
---
diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
index 864a334..295c41d 100644
--- a/sound/soc/tegra/tegra_wm9712.c
+++ b/sound/soc/tegra/tegra_wm9712.c
@@ -86,7 +86,8 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
 	machine->codec = platform_device_alloc("wm9712-codec", -1);
 	if (!machine->codec) {
 		dev_err(&pdev->dev, "Can't allocate wm9712 platform device\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto codec_free;
 	}
 
 	ret = platform_device_add(machine->codec);
@@ -127,6 +128,10 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
 		goto asoc_utils_fini;
 	}
 
+	tegra_asoc_utils_fini(&machine->util_data);
+	platform_device_del(machine->codec);
+	platform_device_put(machine->codec);
+	devm_kfree(&pdev->dev, machine);
 	return 0;
 
 asoc_utils_fini:
@@ -135,6 +140,8 @@ static int tegra_wm9712_driver_probe(struct platform_device *pdev)
 	platform_device_del(machine->codec);
 codec_put:
 	platform_device_put(machine->codec);
+codec_free:
+	devm_kfree(&pdev->dev, machine);
 	return ret;
 }
 
---
