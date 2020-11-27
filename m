Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B4CC2D0E4
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:53:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 343DE21D81
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Nov 2020 14:53:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDOU0FBb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730966AbgK0Ox1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Nov 2020 09:53:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730868AbgK0Ox1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Nov 2020 09:53:27 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440D2C0613D1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:53:27 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id z5so1208240wmf.1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2020 06:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QSLIhPoSzJ8v/zeWOZ+q40NwwHppqFUPh/1r9R00iuM=;
        b=IDOU0FBbGISgX76xSKKRc47xLJ6nqzIfNtUPRKJU8e4TiQki1Qritlz9Er+zAXKSUf
         n6giqCfC9ilY3xlMDFA7Z/TX7HNCXIhzSBadPp3UufgbJrXQIbavVPoCe7pmG0Gc4iKU
         Hdo8m/IQLlCu9bgRmnFqrpaLdapt8BD2QBsS7NqQV4TVEKBhAIwo2A80DB4WvFMWWhCx
         eCaJbaSzTovrwnnhvomfzPcSq9M7o18uuWlsM0lDc0RBkt1bcqw4RWY+menhbh/fBw7L
         7mPxH0X/yYxeQCMw3/Le8zv+cdchog/fOkEYEo2XRmazrZ7zr27p0P0VNM8fQq5skGoU
         6QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QSLIhPoSzJ8v/zeWOZ+q40NwwHppqFUPh/1r9R00iuM=;
        b=T7rssb57zVjxyrb2FNaHD6fp+/D1Ol0YkoC22r05e7zad07S2JaqiG3D9fbvJeR0yG
         AFb6s+2QWcWZCG7u+DfT454RPfwtkAN3NUjy940q9UOIre/DHQOWyU25ak3Qf7aPo6EE
         JUwDUR2cIDolk9iFHT/54APnYUaMVa/KQrJrqN5cvwHmBn8Ip0YXqac+md1DNyyBHMbM
         rws2imU/wXBQnOK2osacugYPq2n1DaO/Yle5+YNEGzG83sK4ZmX+HbeUXEBpxPKDOK1Q
         IINAP+xZ049bFcKOAZG6mzVb3fedjLOz2rwgFlMBpB7nekD5k34S7GlKTWIBhlhigC14
         B6jA==
X-Gm-Message-State: AOAM531YEpiyrVTsq14Iz+bvqtSwfhHaoe5pJqlSQq+tLYGulVQLLQ/B
        e4ubUGHXNt8JhXdGYmw9hSnjtsvpaRU=
X-Google-Smtp-Source: ABdhPJxQvWeN0LvLzyUkDiYSvT11qEthbU1xvhOrzeoKmVz5xEy54BEjZaJ8wNguLQEcrH3bjckH5g==
X-Received: by 2002:a1c:a185:: with SMTP id k127mr9810130wme.23.1606488805904;
        Fri, 27 Nov 2020 06:53:25 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n9sm13410275wmd.4.2020.11.27.06.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:53:25 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Fixes for v5.10-rc7
Date:   Fri, 27 Nov 2020 15:53:24 +0100
Message-Id: <20201127145324.125776-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.10-rc7

for you to fetch changes up to bf3a3cdcad40e5928a22ea0fd200d17fd6d6308d:

  drm/tegra: sor: Disable clocks on error in tegra_sor_init() (2020-11-26 18:44:48 +0100)

I don't have a feature pull request for v5.11 since nothing really on
the Tegra DRM side that was ready. The only thing that I've had in my
tree were these couple of fixes for minor issues. They are mostly for
non-critical bugs, so they don't necessarily need to go into v5.10 if
you're not comfortable with it. However, they're all fixes, so they
qualify and I didn't see a reason why they shouldn't go into v5.10.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.10-rc7

This is a set of small fixes for various issues found during the last
couple of weeks.

----------------------------------------------------------------
Deepak R Varma (1):
      drm/tegra: replace idr_init() by idr_init_base()

Jon Hunter (1):
      drm/tegra: sor: Don't warn on probe deferral

Marc Zyngier (1):
      drm/tegra: sor: Ensure regulators are disabled on teardown

Qinglang Miao (1):
      drm/tegra: sor: Disable clocks on error in tegra_sor_init()

Thierry Reding (1):
      drm/tegra: output: Do not put OF node twice

 drivers/gpu/drm/tegra/drm.c    |  2 +-
 drivers/gpu/drm/tegra/output.c |  1 -
 drivers/gpu/drm/tegra/sor.c    | 76 +++++++++++++++++++-----------------------
 3 files changed, 36 insertions(+), 43 deletions(-)
