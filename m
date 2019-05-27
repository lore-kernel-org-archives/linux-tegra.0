From: Gen Zhang <blackgod016574@gmail.com>
Subject: [PATCH] tegra-hsp: fix a missing-check bug in
 tegra_hsp_doorbell_create()
Date: Mon, 27 May 2019 21:04:30 +0800
Message-ID: <20190527130430.GA5367@zhanggen-UX430UQ>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jassisinghbrar@gmail.com, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

In tegra_hsp_doorbell_create(), 'db->name' is allocated by 
devm_kstrdup_const(). It returns NULL when fails. So 'db->name' should
be checked.

Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
---
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 11fc9fd..b613c46 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -292,6 +292,8 @@ tegra_hsp_doorbell_create(struct tegra_hsp *hsp, const char *name,
 	db->channel.hsp = hsp;
 
 	db->name = devm_kstrdup_const(hsp->dev, name, GFP_KERNEL);
+	if (!db->name)
+		return ERR_PTR(-ENOMEM);
 	db->master = master;
 	db->index = index;
 
---
