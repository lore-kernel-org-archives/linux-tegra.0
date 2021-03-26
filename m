Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0E2C433E4
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7699561A4D
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhCZOwI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhCZOvu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:51:50 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675A7C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:50 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id k8so5934513wrc.3
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3U/NAbihKjPec78yWr69VR7pI5Ujcbfohjar0SwT5eo=;
        b=AaLyS3Qergrq9129uVi7KloKnhBed8aEvtOSdu1Uwcx6cGMumwd1dkZqNRXHBVlZUe
         VMzUFkNborSwg7jJFBFwxlQj7cK60QVHVTXdvWJPaol29w/e/x0SuEhkCvcwSkU+M6OP
         Qa/p/iG3A1Itl+nJkFmVN+i52C3BMpcrE6MzPrjGWvnTYbdP+Db0aA99zbOr1ZwwVI5D
         hBWlwd93u1hldS2DuQ/Ad8gNf/GBPh0RpwxnVvbQnX7Qg/S7WUx97sYApn+xraGDW/Af
         a8SxC8s6k38SDRzPqdoEI0cqKcJMLxps2692fgCk1xOHzDNLWJI/19zHIfLLAI+AuyBY
         PWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3U/NAbihKjPec78yWr69VR7pI5Ujcbfohjar0SwT5eo=;
        b=YkF/zSyQO5urWTF7t/xeUHQ142lzIq50yhnUeb6Ggtp3pKGHTtagOINzZW5iOh4xDl
         f+M6PpGnV5UwKEbwcRV1m8cFeyEy6Z621xe2NAMamzasCZxiyzEj+Ah+Tr0RvVmbWdft
         d8WH8QKZ27SRyZhectv8RcizP1CBNSKCIhmHszcmm9zgHGeYltKaZ9Hg4GbC5gfOr7Ko
         CjRWG6uSEI4f54fecA+TyizA5rFejMfuV6hRRe92WU9Sw9nAK1RfP1y5W8kCxYdeWHnq
         egqv1Dydbs59OT64Hg7e0DcOauQzK42+DfUWPof318ftunBiAMj1R7pxaeIrkGUTkbL/
         7tXA==
X-Gm-Message-State: AOAM532+4jxYIPlEuOxiSkxrWyB3w934EdT2EAh0mYxQQNCT9EZAzH81
        /rqcGlHMu6rASg5bPoOZ+Og=
X-Google-Smtp-Source: ABdhPJyNOUsrKleJ3gngSpSoJQRwShk1gTga+j6VbqpxGeASJGdgTyuCBEMJgqLpqvGYd3jBCmSZNA==
X-Received: by 2002:adf:8562:: with SMTP id 89mr15015871wrh.101.1616770309209;
        Fri, 26 Mar 2021 07:51:49 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g5sm13622621wrq.30.2021.03.26.07.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:51:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        James Jones <jajones@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 08/10] gpu: host1x: Add early init and late exit callbacks
Date:   Fri, 26 Mar 2021 15:51:37 +0100
Message-Id: <20210326145139.467072-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These callbacks can be used by client drivers to run code during early
init and during late exit. Early init callbacks are run prior to the
regular init callbacks while late exit callbacks run after the regular
exit callbacks.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 31 +++++++++++++++++++++++++++++++
 include/linux/host1x.h   |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 4c18874f7c4a..c9077cfbfef9 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -196,6 +196,17 @@ int host1x_device_init(struct host1x_device *device)
 
 	mutex_lock(&device->clients_lock);
 
+	list_for_each_entry(client, &device->clients, list) {
+		if (client->ops && client->ops->early_init) {
+			err = client->ops->early_init(client);
+			if (err < 0) {
+				dev_err(&device->dev, "failed to early initialize %s: %d\n",
+					dev_name(client->dev), err);
+				goto teardown_late;
+			}
+		}
+	}
+
 	list_for_each_entry(client, &device->clients, list) {
 		if (client->ops && client->ops->init) {
 			err = client->ops->init(client);
@@ -217,6 +228,14 @@ int host1x_device_init(struct host1x_device *device)
 		if (client->ops->exit)
 			client->ops->exit(client);
 
+	/* reset client to end of list for late teardown */
+	client = list_entry(&device->clients, struct host1x_client, list);
+
+teardown_late:
+	list_for_each_entry_continue_reverse(client, &device->clients, list)
+		if (client->ops->late_exit)
+			client->ops->late_exit(client);
+
 	mutex_unlock(&device->clients_lock);
 	return err;
 }
@@ -251,6 +270,18 @@ int host1x_device_exit(struct host1x_device *device)
 		}
 	}
 
+	list_for_each_entry_reverse(client, &device->clients, list) {
+		if (client->ops && client->ops->late_exit) {
+			err = client->ops->late_exit(client);
+			if (err < 0) {
+				dev_err(&device->dev, "failed to late cleanup %s: %d\n",
+					dev_name(client->dev), err);
+				mutex_unlock(&device->clients_lock);
+				return err;
+			}
+		}
+	}
+
 	mutex_unlock(&device->clients_lock);
 
 	return 0;
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 5890f91dd286..74970681ecdb 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -31,8 +31,10 @@ u64 host1x_get_dma_mask(struct host1x *host1x);
  * @resume: host1x client resume code
  */
 struct host1x_client_ops {
+	int (*early_init)(struct host1x_client *client);
 	int (*init)(struct host1x_client *client);
 	int (*exit)(struct host1x_client *client);
+	int (*late_exit)(struct host1x_client *client);
 	int (*suspend)(struct host1x_client *client);
 	int (*resume)(struct host1x_client *client);
 };
-- 
2.30.2

