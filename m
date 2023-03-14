Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440C9C6FD1D
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Mar 2023 13:21:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjCNNVr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Mar 2023 09:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbjCNNV2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Mar 2023 09:21:28 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A40AA8C72;
        Tue, 14 Mar 2023 06:17:53 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id d36so19969706lfv.8;
        Tue, 14 Mar 2023 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678799871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qFrp6mNEmGMQ8XFqlpuxBB/MWI7MG2f0UoJdue3eE3E=;
        b=Pd38mR+Co6Z+QfV/zdxM3InYiPPvSWTHyvwOAdcSHK15xy7dXM7E5QYeowkEMYt8DN
         GebXMK9DuljKlfhC3hwaW+dLHGsaE5rISpfQ+cPIJ7FhatGeeFBGnQdS5CwgkvJ2RVgy
         ubXuW3AYiUfzvdFBjcjXhWd/L5UvoSDPsdAvwIIQmWOzrXZrupQqkYaNmtOByarKOvU6
         EiRsNdNhPvFPAGw5GJ75lvikGGnb4YtUiZ1d8ljIGfddWmHjrVMktSZRU5xmbFjqG7k2
         FARK/m9/VHkvz3fQPwfwrmgAeAJ8bRinfHUKc2Fe1KeAjy/6wkTc5nS2eu6khEIFs5m/
         PLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678799871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFrp6mNEmGMQ8XFqlpuxBB/MWI7MG2f0UoJdue3eE3E=;
        b=4TrOx3T/md3p+gMxz7eB+oMi6aPYvteOBrdR/vGhXBGTvt9cGGH4oepzunhalfgyOk
         RhjU7Y1q2wYUfUEUBQym5jDMu23acEA/KLtFPh9GyUEJJz7T+K/iUFDkdIpPcQbDdGHI
         kgXHR9b1bThmj0HSDQrve1LDeePiTN8AhYar+11DEhqPfWzBux64g4o05I6gPfwCO6Qe
         8MBEoseoFX8VZ7M68vf3pjXMi+eLMZLIAFL5gMLlDSPwDNjhTGYqpgwSavSUXQwq8FYz
         zisxtpSCyS5aYmcnIowbkYnqE4daWLtOSVh4njQ4Vycy0l7JVzhJ9ELrb3s5QOd0tw4r
         ZgCQ==
X-Gm-Message-State: AO0yUKX/fA3WN9vXRmFvjmr5XU+hiq8p0VjrGWGYBV+VPQov/E3UMGJG
        zzmlajPT0R1Xri0yoEEFRA==
X-Google-Smtp-Source: AK7set9Q+E1S+jof5ejuZA8hQbHWrMrCUVEZyDFM7ls6gK5sbqzaJzvH+lDQZW22ER01+/ftLQ7Dxg==
X-Received: by 2002:ac2:596d:0:b0:4d8:4f53:37ad with SMTP id h13-20020ac2596d000000b004d84f5337admr722945lfp.7.1678799870792;
        Tue, 14 Mar 2023 06:17:50 -0700 (PDT)
Received: from cphcirce.. (80-62-116-106-mobile.dk.customer.tdc.net. [80.62.116.106])
        by smtp.gmail.com with ESMTPSA id o15-20020ac2494f000000b004a2c447598fsm399865lfi.159.2023.03.14.06.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 06:17:50 -0700 (PDT)
From:   Alfredo Cruz <alfredo.carlon@gmail.com>
To:     mturquette@baylibre.com, pdeschrijver@nvidia.com,
        pgaikwad@nvidia.com, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     Alfredo Cruz <alfredo.carlon@gmail.com>
Subject: [PATCH] clk/tegra/clk-tegra124-dfll-fcpu: Add check to 'regulator_list_voltage'
Date:   Tue, 14 Mar 2023 14:17:18 +0100
Message-Id: <20230314131718.27031-1-alfredo.carlon@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Signed-off-by: Alfredo Cruz <alfredo.carlon@gmail.com>
---
Hi,
I'm not entirely sure if 'regulator_list_voltage(reg, 0)' will never return less than 0.
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 5e339ad0a97c..745bb828e53e 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -543,6 +543,8 @@ static int get_alignment_from_regulator(struct device *dev,
 		return PTR_ERR(reg);
 
 	align->offset_uv = regulator_list_voltage(reg, 0);
+	if (align->offset_uv < 0)
+		align->offset_uv = 0;
 	align->step_uv = regulator_get_linear_step(reg);
 
 	regulator_put(reg);
-- 
2.39.2

