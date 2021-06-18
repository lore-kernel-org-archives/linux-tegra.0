Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA64C48BDF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A398261078
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:55:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234703AbhFRV5n (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 17:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234725AbhFRV5m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 17:57:42 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6911CC061574;
        Fri, 18 Jun 2021 14:55:32 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i13so18897053lfc.7;
        Fri, 18 Jun 2021 14:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dunyvVNRQ1R3zIAJXeBPGY4CZ8iNnLCGi0re9gaV3Dg=;
        b=VBl9GYl9mHr5mEdIkwJQx1kGY2u/4QY9eGjoqpgB4CqiYe3ZQwlwBXHnn97LSFW+xO
         HgSxR05ROcgdPTwHnROqU5VnD/9Ftkuhdw9KSNvOoLUdJayIFDVmnMMMX/6zVgQtmFni
         3AObCtFAtX6Kn8V1v9cZ3U7Zgz5jTOJ3gM7nNDbKRyb/oEpfCueG73a7B3SNu/oGPuGU
         Ywlb4ptkvxjAXlBSWdhSFwnJhV1mzsGAFZYv02IGVrh+0ZieC9bpCm+rkyBiHa9IOmZe
         7PiZaCkhGcQEZ4tTSaIcepF6O9nlI1mFcyWOWSlAfQMYfc/ggrJUJQtnjaZKoVSQIzbJ
         q6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dunyvVNRQ1R3zIAJXeBPGY4CZ8iNnLCGi0re9gaV3Dg=;
        b=if+9v0Z9cL8oqGcgLtvKpD873Elcs7TmINR6OtyxbSs1UZluN59RPHPOLWN0REEttp
         CSpUYT5VNz6lfrK7GGjDSnqqi0PY7oFFhHepiI5d1jIFHvPsSOTYxsHjDs1kiwvFGOwg
         hrlGdGsicKIdoFjcVhJ6r82JRICUrxXjLNyBpcUHYbviszb4NPlX/ARb15LtAEse6Lay
         lmtsq/FWC6fQ//gUsq28Pe0bKo0Iqyy1lqfGkszmNmWn1hFRHPQU82AwmJfAxPrAuLZ0
         ECVTcViT5pTz4uGKWL2k/zQ/oxV0bzdpkcWYiG16ud2lv1QoByOqmLb6NcG11V/GeCIM
         ZqnQ==
X-Gm-Message-State: AOAM5319ZutPGEstMRMVoxsEjCL6xoGmdugyGbU4A3GGV/Fdo/y7vNV7
        tPhtRZGZVkiXFyBq0z5lZWOKgXXKq4U=
X-Google-Smtp-Source: ABdhPJwo4CxSyphA2X67NqlLW93+K2kL5drweGvuy0CTXK47vEFmu2TuQd0wxM5Q0n94A8eog1K9tQ==
X-Received: by 2002:a19:5d53:: with SMTP id p19mr4856561lfj.581.1624053330854;
        Fri, 18 Jun 2021 14:55:30 -0700 (PDT)
Received: from localhost.localdomain (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
        by smtp.gmail.com with ESMTPSA id b20sm791773ljo.138.2021.06.18.14.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:55:30 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 0/4] HWMON LM90 interrupt fixes and improvements
Date:   Sat, 19 Jun 2021 00:54:51 +0300
Message-Id: <20210618215455.19986-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

This series makes interrupt usable on NVIDIA Tegra devices, it also
switches LM90 driver to use hwmon_notify_event().

Changelog:

v3: - No code changes. Added changelog.

v2: - Dropped "hwmon: (lm90) Use edge-triggered interrupt" patch
      and replaced it with "hwmon: (lm90) Don't override interrupt
      trigger type", as was discussed during review of v1.

    - Added these new patches:

        hwmon: (lm90) Use hwmon_notify_event()
        hwmon: (lm90) Unmask hardware interrupt
        hwmon: (lm90) Disable interrupt on suspend

Dmitry Osipenko (4):
  hwmon: (lm90) Don't override interrupt trigger type
  hwmon: (lm90) Use hwmon_notify_event()
  hwmon: (lm90) Unmask hardware interrupt
  hwmon: (lm90) Disable interrupt on suspend

 drivers/hwmon/lm90.c | 79 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 13 deletions(-)

-- 
2.30.2

