From: Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Input: gpio-keys - update to devm_* API
Date: Sun, 15 Sep 2013 01:22:23 +0530
Message-ID: <1379188343-18904-1-git-send-email-badarkhe.manish@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Update the code to use devm_* API so that driver core will manage
resources.

Signed-off-by: Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
:100644 100644 440ce32... b4db721... M	drivers/input/keyboard/gpio_keys.c
 drivers/input/keyboard/gpio_keys.c |   18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 440ce32..b4db721 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -588,7 +588,7 @@ gpio_keys_get_devtree_pdata(struct device *dev)
 		goto err_out;
 	}
 
-	pdata = kzalloc(sizeof(*pdata) + nbuttons * (sizeof *button),
+	pdata = devm_kzalloc(dev, sizeof(*pdata) + nbuttons * (sizeof(*button)),
 			GFP_KERNEL);
 	if (!pdata) {
 		error = -ENOMEM;
@@ -618,7 +618,7 @@ gpio_keys_get_devtree_pdata(struct device *dev)
 				dev_err(dev,
 					"Failed to get gpio flags, error: %d\n",
 					error);
-			goto err_free_pdata;
+			goto err_out;
 		}
 
 		button = &pdata->buttons[i++];
@@ -630,7 +630,7 @@ gpio_keys_get_devtree_pdata(struct device *dev)
 			dev_err(dev, "Button without keycode: 0x%x\n",
 				button->gpio);
 			error = -EINVAL;
-			goto err_free_pdata;
+			goto err_out;
 		}
 
 		button->desc = of_get_property(pp, "label", NULL);
@@ -647,13 +647,11 @@ gpio_keys_get_devtree_pdata(struct device *dev)
 
 	if (pdata->nbuttons == 0) {
 		error = -EINVAL;
-		goto err_free_pdata;
+		goto err_out;
 	}
 
 	return pdata;
 
-err_free_pdata:
-	kfree(pdata);
 err_out:
 	return ERR_PTR(error);
 }
@@ -699,10 +697,10 @@ static int gpio_keys_probe(struct platform_device *pdev)
 			return PTR_ERR(pdata);
 	}
 
-	ddata = kzalloc(sizeof(struct gpio_keys_drvdata) +
+	ddata = devm_kzalloc(&pdev->dev, sizeof(struct gpio_keys_drvdata) +
 			pdata->nbuttons * sizeof(struct gpio_button_data),
 			GFP_KERNEL);
-	input = input_allocate_device();
+	input = devm_input_allocate_device(&pdev->dev);
 	if (!ddata || !input) {
 		dev_err(dev, "failed to allocate state\n");
 		error = -ENOMEM;
@@ -768,8 +766,6 @@ static int gpio_keys_probe(struct platform_device *pdev)
 		gpio_remove_key(&ddata->data[i]);
 
  fail1:
-	input_free_device(input);
-	kfree(ddata);
 	/* If we have no platform data, we allocated pdata dynamically. */
 	if (!dev_get_platdata(&pdev->dev))
 		kfree(pdata);
@@ -796,8 +792,6 @@ static int gpio_keys_remove(struct platform_device *pdev)
 	if (!dev_get_platdata(&pdev->dev))
 		kfree(ddata->pdata);
 
-	kfree(ddata);
-
 	return 0;
 }
 
-- 
1.7.10.4
