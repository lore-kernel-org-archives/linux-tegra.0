From: Pawel Lebioda <pawel.lebioda89@gmail.com>
Subject: [PATCH 1/2] staging: nvec: remove unnecessary 'else' after 'return'
 statement
Date: Sat,  5 Jul 2014 22:30:55 +0200
Message-ID: <55d9b3cb9cf1c54d1fc87dd1d6a582f6067cc295.1404586529.git.pawel.lebioda89@gmail.com>
References: <cover.1404586529.git.pawel.lebioda89@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <cover.1404586529.git.pawel.lebioda89@gmail.com>
In-Reply-To: <cover.1404586529.git.pawel.lebioda89@gmail.com>
References: <cover.1404586529.git.pawel.lebioda89@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Julian Andres Klode <jak@jak-linux.org>, Marc Dietrich <marvin24@gmx.de>
Cc: linux-tegra@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

Fix the following warning reported by checkpatch.pl:

WARNING: else is not generally useful after a break or return
235: FILE: drivers/staging/nvec/nvec.c:235

Signed-off-by: Pawel Lebioda <pawel.lebioda89@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 90f1c4d..8a3dd47 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -232,8 +232,7 @@ static size_t nvec_msg_size(struct nvec_msg *msg)
 		return 2;
 	else if (event_length == NVEC_3BYTES)
 		return 3;
-	else
-		return 0;
+	return 0;
 }
 
 /**
-- 
1.8.3.2
