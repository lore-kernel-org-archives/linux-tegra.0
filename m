Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04591C433E2
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 07:52:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEEAF619B1
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 07:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234267AbhCaHwR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 Mar 2021 03:52:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:52136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234197AbhCaHwB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Mar 2021 03:52:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AF75619B1;
        Wed, 31 Mar 2021 07:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617177120;
        bh=hVKNlarclBzCUbfvhagrqmrK6JPrD0L/KVobbdF2c+w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z0EFeSM+7hPsoGZ3QGL4NYGk3wYlOSGCf6w3ox+lEUvWha7wELVNHBgy3DHi9rGmV
         cw9Ulh3iIWyWpNPR2vt2sRmsMV6/c4TmamLUZmrdb78B7aJnaCmJp3KFG+tkBLf082
         FXTzVRDFR8FJKMPXC12h428XR0ypAUBv60iOjOWZmlBt0rGmCrqWD0PfUQgeariaHX
         MOx0vOib2dXTMaAvu6UWj+fitaKnc9I9wwhHA/x9RTvhygnweyijH8g/3LdBguBMi8
         RwuGuxokf0X1CaTR0rgmfvtIiv4fwfmskQd3+QBn5SqbpADPSxRcFfDvTOTgG6xBiS
         FtNOi6eGjcD3w==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFT 1/2] i2c: tegra-bpmp: don't modify input variable in xlate_flags
Date:   Wed, 31 Mar 2021 09:51:40 +0200
Message-Id: <20210331075141.22227-2-wsa@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210331075141.22227-1-wsa@kernel.org>
References: <20210331075141.22227-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Since commit bc1c2048abbe ("i2c: bpmp-tegra: Ignore unknown I2C_M
flags") we don't need to mask out flags and can keep the input variable
as is to save quite some lines.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/i2c-tegra-bpmp.c | 32 ++++++++---------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra-bpmp.c b/drivers/i2c/busses/i2c-tegra-bpmp.c
index c934d636f625..295286ad6d6c 100644
--- a/drivers/i2c/busses/i2c-tegra-bpmp.c
+++ b/drivers/i2c/busses/i2c-tegra-bpmp.c
@@ -40,45 +40,29 @@ struct tegra_bpmp_i2c {
  */
 static int tegra_bpmp_xlate_flags(u16 flags, u16 *out)
 {
-	if (flags & I2C_M_TEN) {
+	if (flags & I2C_M_TEN)
 		*out |= SERIALI2C_TEN;
-		flags &= ~I2C_M_TEN;
-	}
 
-	if (flags & I2C_M_RD) {
+	if (flags & I2C_M_RD)
 		*out |= SERIALI2C_RD;
-		flags &= ~I2C_M_RD;
-	}
 
-	if (flags & I2C_M_STOP) {
+	if (flags & I2C_M_STOP)
 		*out |= SERIALI2C_STOP;
-		flags &= ~I2C_M_STOP;
-	}
 
-	if (flags & I2C_M_NOSTART) {
+	if (flags & I2C_M_NOSTART)
 		*out |= SERIALI2C_NOSTART;
-		flags &= ~I2C_M_NOSTART;
-	}
 
-	if (flags & I2C_M_REV_DIR_ADDR) {
+	if (flags & I2C_M_REV_DIR_ADDR)
 		*out |= SERIALI2C_REV_DIR_ADDR;
-		flags &= ~I2C_M_REV_DIR_ADDR;
-	}
 
-	if (flags & I2C_M_IGNORE_NAK) {
+	if (flags & I2C_M_IGNORE_NAK)
 		*out |= SERIALI2C_IGNORE_NAK;
-		flags &= ~I2C_M_IGNORE_NAK;
-	}
 
-	if (flags & I2C_M_NO_RD_ACK) {
+	if (flags & I2C_M_NO_RD_ACK)
 		*out |= SERIALI2C_NO_RD_ACK;
-		flags &= ~I2C_M_NO_RD_ACK;
-	}
 
-	if (flags & I2C_M_RECV_LEN) {
+	if (flags & I2C_M_RECV_LEN)
 		*out |= SERIALI2C_RECV_LEN;
-		flags &= ~I2C_M_RECV_LEN;
-	}
 
 	return 0;
 }
-- 
2.30.0

