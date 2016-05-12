From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] mfd: max77620: Fix FPS switch statements
Date: Thu, 12 May 2016 13:45:04 -0400
Message-ID: <1463075104-26924-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When configuring FPS during probe, assuming a DT node is present for
FPS, the code can run into a problem with the switch statements in
max77620_config_fps() and max77620_get_fps_period_reg_value(). Namely,
in the case of chip->chip_id == MAX77620, it will set
fps_[mix|max]_period but then fall through to the default switch case
and return -EINVAL. Returning this from max77620_config_fps() will
cause probe to fail.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/mfd/max77620.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index 199d261990be..f32fbb8e8129 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -203,6 +203,7 @@ static int max77620_get_fps_period_reg_value(struct max77620_chip *chip,
 		break;
 	case MAX77620:
 		fps_min_period = MAX77620_FPS_PERIOD_MIN_US;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -236,6 +237,7 @@ static int max77620_config_fps(struct max77620_chip *chip,
 		break;
 	case MAX77620:
 		fps_max_period = MAX77620_FPS_PERIOD_MAX_US;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
1.9.1
