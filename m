Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB47C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F4C0619D0
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbhCWPzL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 11:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbhCWPyk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 11:54:40 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6455C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:39 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id bf3so24057340edb.6
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3U/NAbihKjPec78yWr69VR7pI5Ujcbfohjar0SwT5eo=;
        b=sy4n4+1TM0XlVQslw9IgO6D7RvHtx4wynTfDCpH4T1aQR7DI23WFQU2hojcCY0ppbr
         sUlab9mwouLCO0I39prMIjhw2mBiwc9L30dElLATHbYHTZh1uWz8q/cHJFy6Y/FnwQ61
         rFYRd1n6VV50W3J0c/t7rBA5ECCgs21TQ8gcEM/rhs8xeVse78D2zxVI3BCrgXkx97Kl
         JQ5CQQLmIsvpvhTww08W9zQo8qdU+m8yaUd5MWCYHZlN0ImxpnSwwJrsjmXcRhUWVNaf
         zAYf7bAoGgs6cq3S4WJrL3OdMBr6LryHOrZIGHGBlblu3E2ZPI1G4u7NcXIh78UgehXU
         nsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3U/NAbihKjPec78yWr69VR7pI5Ujcbfohjar0SwT5eo=;
        b=ZiJadXd7ORi+eWeeA0O3mRxLtMyiVEU33ANi92+HyJ3L3oxhKOuGmLc1Nu2s0ZbDJE
         XX0VimN/4knF8wIyold+0NOPhEbhgj54uQo7sdODrvNmdl5dzxISZF3KT2HYk4lqgsY4
         JFV8AxQW+/kdEYv/NzDyhnXPTU/Xnt/zrynJRVGLEX/5f/p3qGdmUvQX9L2LVdAy3hGj
         uIbw2VrfeKPdL5fUHSaKv+CXnP6yL1vWzAXvi5DQpcIYk1E6vn4xcAuGOQksWFglMef3
         EtU0M7/IqcraTlrc87F9YArf7bKoM020MGZKZRpdbECAZirubkyQRoYhwhAIZQVCh36Q
         z4lQ==
X-Gm-Message-State: AOAM5311ZmilPBhAkIvNj/G28g3Om8S5c5RMy21Hgl1wKGmo4VpS75uH
        ZJ+E/Kw3Sy9ZyHCX0JaHbhA=
X-Google-Smtp-Source: ABdhPJyu4OyK/kp7Lwj7uhRyH/8+phKPaM1g5aYEW20nwAimVyXWHfNuYsPv5sGZ5X4EZPsf5kKlVw==
X-Received: by 2002:aa7:c1d5:: with SMTP id d21mr5122128edp.167.1616514878542;
        Tue, 23 Mar 2021 08:54:38 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z20sm13005016edd.0.2021.03.23.08.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 08:54:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 7/9] gpu: host1x: Add early init and late exit callbacks
Date:   Tue, 23 Mar 2021 16:54:35 +0100
Message-Id: <20210323155437.513497-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
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

