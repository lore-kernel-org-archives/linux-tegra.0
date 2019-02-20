From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 3/3] ALSA: hda/tegra: sound card name from device tree
Date: Wed, 20 Feb 2019 20:43:24 +0530
Message-ID: <1550675604-14788-3-git-send-email-spujar@nvidia.com>
References: <1550675604-14788-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550675604-14788-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org, mark.rutland@arm.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

A platform can have multiple sound cards for different audio paths.
Following is the print seen duirng device boot for jetson-xavier,
  ALSA device list:
    #0: nvidia,p2972-0000 at 0x3518000 irq 17
By looking at above, it is not very clear if the sound card is for
HDA. It becomes confusing when platform has registered multiple cards,
and platform model name is used for card.

This patch uses "nvidia,model" property mentioned in hda device tree
to get the card name. Since property is optional, legacy boards will
continue to use "tegra-hda". Custom name can be passed wherever needed.
This naming convention is conistent with the way sound cards are named
in general.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index c8d18dc..dbd8da5 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -380,8 +380,8 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	int err;
 	unsigned short gcap;
 	int irq_id = platform_get_irq(pdev, 0);
-	const char *sname;
-	struct device_node *root;
+	const char *sname, *drv_name = "tegra-hda";
+	struct device_node *np = pdev->dev.of_node;
 
 	err = hda_tegra_init_chip(chip, pdev);
 	if (err)
@@ -440,17 +440,11 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	}
 
 	/* driver name */
-	strcpy(card->driver, "tegra-hda");
-
-	root = of_find_node_by_path("/");
-	sname = of_get_property(root, "compatible", NULL);
-	of_node_put(root);
-	if (!sname) {
-		dev_err(card->dev,
-			"failed to get compatible property from root node\n");
-		return -ENODEV;
-	}
+	strncpy(card->driver, drv_name, sizeof(card->driver));
 	/* shortname for card */
+	sname = of_get_property(np, "nvidia,model", NULL);
+	if (!sname)
+		sname = drv_name;
 	if (strlen(sname) > sizeof(card->shortname))
 		dev_info(card->dev, "truncating shortname for card\n");
 	strncpy(card->shortname, sname, sizeof(card->shortname));
-- 
2.7.4
