From: Joe Perches <joe@perches.com>
Subject: [PATCH 10/19] staging: nvec: Remove unnecessary externs
Date: Mon, 10 Aug 2015 14:51:25 -0700
Message-ID: <d46fa6bcc8925583eb0d24741520fa8c3b6a283f.1439241825.git.joe@perches.com>
References: <cover.1439241825.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1439241825.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devel@driverdev.osuosl.org, Julian Andres Klode <jak@jak-linux.org>, Marc Dietrich <marvin24@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Using 'extern' is not necessary for function prototypes.

Miscellanea:

o Reflow alignments

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/staging/nvec/nvec.h | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/nvec/nvec.h b/drivers/staging/nvec/nvec.h
index e271375..2ec9de9 100644
--- a/drivers/staging/nvec/nvec.h
+++ b/drivers/staging/nvec/nvec.h
@@ -165,19 +165,18 @@ struct nvec_chip {
 	int state;
 };
 
-extern int nvec_write_async(struct nvec_chip *nvec, const unsigned char *data,
-			     short size);
+int nvec_write_async(struct nvec_chip *nvec, const unsigned char *data,
+		     short size);
 
-extern struct nvec_msg *nvec_write_sync(struct nvec_chip *nvec,
-					const unsigned char *data, short size);
+struct nvec_msg *nvec_write_sync(struct nvec_chip *nvec,
+				 const unsigned char *data, short size);
 
-extern int nvec_register_notifier(struct nvec_chip *nvec,
-				  struct notifier_block *nb,
-				  unsigned int events);
+int nvec_register_notifier(struct nvec_chip *nvec,
+			   struct notifier_block *nb,
+			   unsigned int events);
 
-extern int nvec_unregister_notifier(struct nvec_chip *dev,
-				    struct notifier_block *nb);
+int nvec_unregister_notifier(struct nvec_chip *dev, struct notifier_block *nb);
 
-extern void nvec_msg_free(struct nvec_chip *nvec, struct nvec_msg *msg);
+void nvec_msg_free(struct nvec_chip *nvec, struct nvec_msg *msg);
 
 #endif
-- 
2.1.2
