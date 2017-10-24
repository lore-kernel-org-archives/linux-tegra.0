From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/2] drm/tegra: Use an error code directly in
 tegra_output_probe()
Date: Tue, 24 Oct 2017 19:35:23 +0200
Message-ID: <b42b5119-55af-88b2-055b-ce5d6a25a8d8@users.sourceforge.net>
References: <bfac49e0-8948-e62f-1876-567605f1e2c8@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <bfac49e0-8948-e62f-1876-567605f1e2c8@users.sourceforge.net>
Content-Language: en-GB
Sender: kernel-janitors-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 19:21:24 +0200

Return the code "-EPROBE_DEFER" directly in one if branch
without assigning it to the local variable "err" before.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/tegra/output.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 1e0915e213b4..a9b458f22de6 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -115,9 +115,8 @@ int tegra_output_probe(struct tegra_output *output)
 	if (ddc) {
 		output->ddc = of_find_i2c_adapter_by_node(ddc);
 		if (!output->ddc) {
-			err = -EPROBE_DEFER;
 			of_node_put(ddc);
-			return err;
+			return -EPROBE_DEFER;
 		}
 
 		of_node_put(ddc);
-- 
2.14.3

