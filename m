From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] OPP: Fix crashing when current OPP has unsupportable voltage
Date: Sun, 23 Jun 2019 20:50:53 +0300
Message-ID: <20190623175053.26167-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Marc Dietrich <marvin24@gmx.de>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Fix NULL dereference caused by a typo in the code. In particular it
happens when CPU is running on a frequency which has unsupportable voltage
(by regulator) defined in the OPP table and a custom set_opp() callback is
being used. The problem was spotted during of testing of upcoming update
for the NVIDIA Tegra CPUFreq driver.

Cc: stable <stable@vger.kernel.org>
Fixes: 7e535993fa4f ("OPP: Separate out custom OPP handler specific code")
Reported-by: Marc Dietrich <marvin24@gmx.de>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/opp/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 9fda9a0ec016..89ec6aa220cf 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -685,7 +685,7 @@ static int _set_opp_custom(const struct opp_table *opp_table,
 
 	data->old_opp.rate = old_freq;
 	size = sizeof(*old_supply) * opp_table->regulator_count;
-	if (IS_ERR(old_supply))
+	if (!old_supply)
 		memset(data->old_opp.supplies, 0, size);
 	else
 		memcpy(data->old_opp.supplies, old_supply, size);
-- 
2.22.0
