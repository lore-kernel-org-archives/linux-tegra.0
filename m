Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AA5C47080
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 22:43:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1351661076
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 22:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbhEWWpA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 May 2021 18:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbhEWWoy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 May 2021 18:44:54 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C15C061574;
        Sun, 23 May 2021 15:43:18 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id q3so7768096lfu.2;
        Sun, 23 May 2021 15:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K1XQI/qjzn21ZxtI41zUbzZcpl3PUoE3tDyiZw+xX6Y=;
        b=HxFLb8mxN9PGqyyfYFPaa7oKt6JzoRNcbnC7jS+6cdXtbiBGk1z8b2dcceaEWNRkmi
         yD/PUS1mPz2CCDTP2XRzN0NyYFFRpqq18hF1VgnndiwRd2e4418G1bpXjCl9s7X5ZSB0
         7V8cpj0nLPz64jetVkVnBNcNjwb1kDWqQ2xWavCkuvSc+sD0tJhwOnr4DlK6c2zmYcdX
         Ua1otT1VxL2qeWorBn3T/qGhCxmdD98LYgndYpQTBI/1TbtjSAqpNEN+Yw4VEOMZmE/B
         ICFFGNEOjzgWSwSCWDl7+XwqvM9PSIhqQYByUV8MktgYq0Y/AguWAxO4sCdkQW/R1lzE
         HJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K1XQI/qjzn21ZxtI41zUbzZcpl3PUoE3tDyiZw+xX6Y=;
        b=l4fge861mbrQn+2mUdimu3gj5GgbwLi/r9xIqFW3/u7DxuOyrhWhsRc4qySF+YNwy+
         SAGPrIy25D4wPZc0qEoC69aIyrlpD9Kk2DUHiH+IgAip4k7tfWTB/EqhK03gSjZzwSBV
         +l3Oj+1PzF84yZMoPj9KQSL9sQz3qjgM4ldqX714/2JTUjbxSiPX7n/JfsEuHFX5RasJ
         GLJ3gRa3iVBTl7UCkDslXBrKX0jrNQfsb41E7PPOu3KtWL8QLv1tuscFIwxzTdI8wmxk
         64ySh2lBnckconfuxgvx55C2s/mtBIkU3TxU4d/+6wvVcO+fUax5Zm/1GCrwkhvwOPi1
         CcCQ==
X-Gm-Message-State: AOAM532Bed5pR0cnSS+KyoHidL12qSZvmIv1SfW3bHs1J1SbkhU59C36
        igd2XDwYPSbuLEuPAguYN/I=
X-Google-Smtp-Source: ABdhPJyeyaFJQ5ed/FfD2IOHWuyLYZJglIh6aelKY0D05lS5nU94xdEct5Qb9Nhh9PMazEQ+I8918A==
X-Received: by 2002:a19:85d7:: with SMTP id h206mr8925158lfd.277.1621809795780;
        Sun, 23 May 2021 15:43:15 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id m5sm1531622ljg.118.2021.05.23.15.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 15:43:15 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/2] Fix MAX77620 regulator driver regression
Date:   Mon, 24 May 2021 01:42:41 +0300
Message-Id: <20210523224243.13219-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

The next-20210521 started to fail on Nexus 7 because of the change to
regulator core that caused regression of the MAX77620 regulator driver.
The regulator driver is now getting a deferred probe and turned out
driver wasn't ready for this. The root of the problem is that OF node
of the PMIC MFD sub-device is shared with the PINCTRL sub-device and we
need to convey this information to the driver core, otherwise it will
try to claim GPIO pin that is already claimed by PINCTRL and fail the
probe.

Dmitry Osipenko (2):
  regulator: max77620: Use device_set_of_node_from_dev()
  regulator: max77620: Silence deferred probe error

 drivers/regulator/max77620-regulator.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
2.30.2

