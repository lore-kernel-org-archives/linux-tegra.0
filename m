From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1 1/2] regulator: tps65910: Add regulator info for RTC rail
Date: Wed, 18 Jan 2012 20:46:56 +0530
Message-ID: <1326899816-14436-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lrg-l0cyMroinI0@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Adding missing regulator info for VRTC rail for device
tps65911. The regulator voltage rail index start from
VRTC which is defined as 0.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/tps65910-regulator.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator/tps65910-regulator.c
index 5c15ba0..6742418 100644
--- a/drivers/regulator/tps65910-regulator.c
+++ b/drivers/regulator/tps65910-regulator.c
@@ -175,6 +175,9 @@ static struct tps_info tps65910_regs[] = {
 
 static struct tps_info tps65911_regs[] = {
 	{
+		.name = "VRTC",
+	},
+	{
 		.name = "VIO",
 		.min_uV = 1500000,
 		.max_uV = 3300000,
-- 
1.7.1.1
