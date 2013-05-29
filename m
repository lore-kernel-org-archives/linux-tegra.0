From: Arto Merilainen <amerilainen@nvidia.com>
Subject: [PATCHv2 1/7] gpu: host1x: Check INCR opcode correctly
Date: Wed, 29 May 2013 13:26:02 +0300
Message-ID: <1369823168-5396-2-git-send-email-amerilainen@nvidia.com>
References: <1369823168-5396-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1369823168-5396-1-git-send-email-amerilainen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: tbergstrom@nvidia.com, linux-kernel@vger.kernel.org, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Terje Bergstrom <tbergstrom@nvidia.com>

The firewall code used a wrong loop condition (pointer to a
structure) while checking INCR opcode. This patch fixes the code to
use correct loop condition (number of words remaining).

Signed-off-by: Terje Bergstrom <tbergstrom@nvidia.com>
Signed-off-by: Arto Merilainen <amerilainen@nvidia.com>
---
 drivers/gpu/host1x/job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index f665d67..2974ac8 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -330,7 +330,7 @@ static int check_incr(struct host1x_firewall *fw)
 	u32 count = fw->count;
 	u32 reg = fw->reg;
 
-	while (fw) {
+	while (count) {
 		if (fw->words == 0)
 			return -EINVAL;
 
-- 
1.8.1.5
