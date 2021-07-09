Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D632C07E9C
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5442F6135F
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbhGITcJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 15:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGITcJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 15:32:09 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995DDC0613E5
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 12:29:24 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id f17so13567756wrt.6
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 12:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wqKuapy9SSK1BNEtt7I3vm19kWoM0u9dRsDQpIz91YE=;
        b=KZ/5ng4lI18PjBq8JWbfWGmgy39CNUaVOfbHQdGrs7D2XZlurUnpamIntEfKPvAzhP
         RgfC+5X7r6yH1h0txtO9UbokDtVLQL182MHeLSGXZgnAF7A6IeoV1wQn6McNWmdVRC9U
         JfuFaDx7n2hBIKPGKKQImW9XWx3dzjpmoZxSARp7ErQv1RyhWrapjjvE39ar0PiS2eCQ
         e+xTCBlbfdpuS8S5vhEeM/KwvEw1l8JFCcdHwMEZZBoQeMteJrSbq8g606GVyl0DXuxa
         9mLFrdJZzLOIomlCg2NCWr4pqSjDoIjlNvoWitRwHSJLdQlRec3rujF/dwr4/1dlIf6c
         q/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wqKuapy9SSK1BNEtt7I3vm19kWoM0u9dRsDQpIz91YE=;
        b=TrKovQcMxYUjcQkykciXrqKwlBuDTxikdQ+Lp54OuTV5jfF9ZJ+Lxd70fqdG9Ibc8I
         Lgw9U/8IY0JYfBRnCczdTkbl1MNaVaTnU84sT/HhnqrKhyvBArEv3r7XiiAOs5u/T1uo
         jW/bHZ1KxSnWw8Z1ey7oV3XenPeGloe2PDsR25vyprON7SK1mjbcyzWq/vNW4X4Ruofp
         t51Nrm7dV0w5MANsKGifRonEZra9HjeyEicuFWU5SQIrZxx1SmI2MZdlifRZ7mq25ggS
         fICFn6+hi3ayGyK6OU5sn07tTgGy8DiGpl6Oky0XZ+IXTXx0QGHLRDlcaaBSKwpSMXuI
         uV0Q==
X-Gm-Message-State: AOAM532XXf2CA6UnhajQz1wMRiDvre2yUIH1LkZaJmJj+Nw1vlEX1XaJ
        S6eHwxiwizpQMkikAT++Mgo=
X-Google-Smtp-Source: ABdhPJzpKOb3/gITc4oC81kG3kO9WX6j6UMKXAlwMta+4QKqXBJFjpGOWJAzVj4CkvL/baoaLG9ffw==
X-Received: by 2002:a5d:4e08:: with SMTP id p8mr43710096wrt.425.1625858963283;
        Fri, 09 Jul 2021 12:29:23 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c8sm6084190wri.91.2021.07.09.12.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 12:29:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 03/14] gpu: host1x: Add job release callback
Date:   Fri,  9 Jul 2021 21:31:35 +0200
Message-Id: <20210709193146.2859516-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Add a callback field to the job structure, to be called just before
the job is to be freed. This allows the job's submitter to clean
up any of its own state, like decrement runtime PM refcounts.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/job.c | 3 +++
 include/linux/host1x.h   | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 8f59b34672c2..09097e19c0d0 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -79,6 +79,9 @@ static void job_free(struct kref *ref)
 {
 	struct host1x_job *job = container_of(ref, struct host1x_job, ref);
 
+	if (job->release)
+		job->release(job);
+
 	if (job->waiter)
 		host1x_intr_put_ref(job->syncpt->host, job->syncpt->id,
 				    job->waiter, false);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 5fc12db94ca1..7eecb0aa2519 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -269,6 +269,10 @@ struct host1x_job {
 
 	/* Fast-forward syncpoint increments on job timeout */
 	bool syncpt_recovery;
+
+	/* Callback called when job is freed */
+	void (*release)(struct host1x_job *job);
+	void *user_data;
 };
 
 struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
-- 
2.32.0

