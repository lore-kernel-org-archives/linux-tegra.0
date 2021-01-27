Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34574C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 09:13:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB0BC20756
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 09:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233361AbhA0JNH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 04:13:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235034AbhA0JKs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 04:10:48 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28B6C0613ED
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 01:10:05 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id r38so1120645pgk.13
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 01:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rRKTArZOg1KrGjFi8d6fGv/HZF1EOkxq/275M+KtPoM=;
        b=Uwi3vAvNi1s+fF28WE+kMRQKlLALPib/vLCh98PitSRYo0RLK7BJNXcZJY8kJfdfCh
         QjPJy/jOQUcOTSfmLC6YooQySA/r8sREjF1KpI3tE578WpmdEf8+mpMrlWzPcWZEMQlw
         ptgUiPaZ1OQ3Pv9jjp/E5Gl3S1o7exI3S8p/HVlwxOPrCgS9qCuCrAWZ3TLLjKL3oScy
         h1Sb8WbTzWSzfIv0X6HOXnjoB6I6Btf1Pw24B7aUgx60k/1+jxsPK9luftsez9AZyVhm
         JM3bhBiTpL1BWmN1LpNlu8Ribeqp5zezKYgK26eKERrW5NIWZ1OwT6vtgwmOWZxlmERM
         HtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rRKTArZOg1KrGjFi8d6fGv/HZF1EOkxq/275M+KtPoM=;
        b=poS82KlZHPpOoYfqbKtmStTM4X3oJ94KUj7JgJmGtOf26k6eh6Y8B3iu9Tjquev53l
         FH4DRZEJHWhCn112Si4/+G/xdt7LGHAOqsonbB2h2Clr7CP/I/sE9+jW2WYrsswYO8q4
         zUpRaiQ0FfEonYbdHhITt2kHHPgeAj2k0v32EYMVBM5X5mJGOb+lP06C17F7J/4VBHmf
         mi5pB0iYUz4KzP6bXME7xkaokLQbM30eO5KgoEH//z7ETKtC0eeUbbUAqqS7/FdHOkNt
         rMCO32M6QXZY4VX1FeOVVoqmt7A0lSAYrjfFFMwY5cO2rwPa8081lkwD7gcTrHx05zh4
         eXew==
X-Gm-Message-State: AOAM530FGXu4REVOAj6/CI2FF8Fk0cczDmdz0y29nsJFfngeMMleYKMg
        KZPFkvffxOwhLnL9ZvsbQgLZ6A==
X-Google-Smtp-Source: ABdhPJx4mOZlZshf0Ls4berDrkhQojnQ+aWFvIpMsiPBN5+BkSj7Yadrh1anDfjDbpXvp3ejj1Caog==
X-Received: by 2002:a62:144c:0:b029:1c0:d62d:e16e with SMTP id 73-20020a62144c0000b02901c0d62de16emr9544172pfu.25.1611738605363;
        Wed, 27 Jan 2021 01:10:05 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id p64sm1574652pfb.201.2021.01.27.01.10.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 01:10:04 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 11/13] devfreq: tegra30: Migrate to dev_pm_opp_set_opp()
Date:   Wed, 27 Jan 2021 14:40:00 +0530
Message-Id: <f0341655361aa0107266ed9c838aa8bcfe50a3ed.1611738418.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <3345fd49f7987d022f4f61edb6c44f230f7354c4.1611227342.git.viresh.kumar@linaro.org>
References: <3345fd49f7987d022f4f61edb6c44f230f7354c4.1611227342.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

dev_pm_opp_set_bw() is getting removed and dev_pm_opp_set_opp() should
be used instead. Migrate to the new API.

We don't want the OPP core to manage the clk for this driver, migrate to
dev_pm_opp_of_add_table_noclk() to make sure dev_pm_opp_set_opp()
doesn't have any side effects.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Dmitry,

This is based over the patches sent here:

https://lore.kernel.org/lkml/6c2160ff30a8f421563793020264cf9f533f293c.1611738228.git.viresh.kumar@linaro.org/

This should fix the problem you mentioned earlier. Will push this for
linux-next unless you have any issues with it.

 drivers/devfreq/tegra30-devfreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 117cad7968ab..31f7dec5990b 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -647,7 +647,7 @@ static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
 		return PTR_ERR(opp);
 	}
 
-	ret = dev_pm_opp_set_bw(dev, opp);
+	ret = dev_pm_opp_set_opp(dev, opp);
 	dev_pm_opp_put(opp);
 
 	return ret;
@@ -849,7 +849,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = dev_pm_opp_of_add_table(&pdev->dev);
+	err = dev_pm_opp_of_add_table_noclk(&pdev->dev);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to add OPP table: %d\n", err);
 		goto put_hw;
-- 
2.25.0.rc1.19.g042ed3e048af

