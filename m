From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch v2] staging: nvec: potential NULL dereference on error path
Date: Thu, 7 Nov 2013 14:25:32 +0300
Message-ID: <20131107112532.GA18980@mwanda>
References: <CAEA6rAzT2eZ-VGUP8gSjNbooKCdkxnixO-nEFA_hPcrUjWR4UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEA6rAzT2eZ-VGUP8gSjNbooKCdkxnixO-nEFA_hPcrUjWR4UQ@mail.gmail.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Julian Andres Klode <jak@jak-linux.org>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-tegra@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

We assume nvec->rx can be NULL earlier so I have added a check here as
well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: print 0 instead of -1.

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 3066ee2..c64e069 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -681,7 +681,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			dev_err(nvec->dev,
 				"RX buffer overflow on %p: "
 				"Trying to write byte %u of %u\n",
-				nvec->rx, nvec->rx->pos, NVEC_MSG_SIZE);
+				nvec->rx, nvec->rx ? nvec->rx->pos : 0,
+				NVEC_MSG_SIZE);
 		break;
 	default:
 		nvec->state = 0;
_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

