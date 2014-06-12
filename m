From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v2 1/3] kernel: add calibration_delay_done()
Date: Thu, 12 Jun 2014 18:58:27 +0300
Message-ID: <1402588713-18766-2-git-send-email-pdeschrijver@nvidia.com>
References: <1402588713-18766-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1402588713-18766-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Russell King <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add calibration_delay_done() call and dummy implementation. This allows
architectures to stop accepting registrations for new timer based delay
functions.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 init/calibrate.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/init/calibrate.c b/init/calibrate.c
index 520702d..ce635dc 100644
--- a/init/calibrate.c
+++ b/init/calibrate.c
@@ -262,6 +262,15 @@ unsigned long __attribute__((weak)) calibrate_delay_is_known(void)
 	return 0;
 }
 
+/*
+ * Indicate the cpu delay calibration is done. This can be used by
+ * architectures to stop accepting delay timer registrations after this point.
+ */
+
+void __attribute__((weak)) calibration_delay_done(void)
+{
+}
+
 void calibrate_delay(void)
 {
 	unsigned long lpj;
@@ -301,4 +310,6 @@ void calibrate_delay(void)
 
 	loops_per_jiffy = lpj;
 	printed = true;
+
+	calibration_delay_done();
 }
-- 
1.7.7.rc0.72.g4b5ea.dirty
