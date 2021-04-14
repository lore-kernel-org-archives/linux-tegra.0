Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48BBC43461
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Apr 2021 18:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1E7160234
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Apr 2021 18:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352291AbhDNSMZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Apr 2021 14:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351858AbhDNSMV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Apr 2021 14:12:21 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC86C06138F
        for <linux-tegra@vger.kernel.org>; Wed, 14 Apr 2021 11:11:58 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id g5so26115417ejx.0
        for <linux-tegra@vger.kernel.org>; Wed, 14 Apr 2021 11:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3eBmEmpP5nedaT6CF0cYxLZdFZnV0xaT/BIYm+Gr+8M=;
        b=MThzkmFRUKDd+ogWiZzUk8lDEkg7NsRlEYWvEnrWnb0Zs6Gc9MF/AZa2ux8C62W8jS
         aEfPcWANf3ThicXSK/pVqLhuQRR1lQpOw7uP4eFFmx9AqNjIhCaByMoA3ubCPXpvEaZP
         mWgXJUR9wg45fW+0k8ohM050sXN7p6AM7YL46+FVoKvRnsvyvVN/LHbq61VZAk7nJNOA
         kvd3Hz2TIh+PJfZ+PIlWMngTSQPle/9+Milvo8gcmAjQfcQf6Qp6tpkc5Ld4PKHRG8Wt
         xvpbAthJ+t/LG7vpJUeeDZq9r5wuPhpHzF5RSpaL+LvVPBk3xZf2o7c+yE+pstQnJAk2
         UrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3eBmEmpP5nedaT6CF0cYxLZdFZnV0xaT/BIYm+Gr+8M=;
        b=O3wPXneRKZ+UjY5EJTsUdVlALB8cmv12G7mk5VhChe0gveOakv1pqAqL/rUO8uPWzp
         Y8ANY0o+ray5+Pvlf1Fr6enEKYg3J8i2gz6WCjP9uKdYDV2EHrvWWu5fNWyJ9htWP4hH
         Ih77ht2zagQmkXmHEMIVY7I7u8NcmJ/EA5/OjFxZ8fFhQCrnVoR+arA0sHhC6Igo7nrg
         xyfrirlULthmoH36MTkSpySWacgjQd5TilvuVRLDlgAzK8XhcAz+ogrw7wV35iHWwb2w
         h4Kka+B76Vbd+sgfxP500oXv898o79OpGtzo/fO6GzCltLlW3QVLVTxXq9Q0zY/91saD
         Ulzw==
X-Gm-Message-State: AOAM5311Exi/zrLtKcRsKjlnuqbMWjbr1iNg3Z+tXkxbU7L0XNRd5MXS
        Fd2Upw+Smae0AO8J3asjb4bWg8kuTSj84w==
X-Google-Smtp-Source: ABdhPJygdTpgHp3pXjzAhLc6YhLq0Ki/wwMWnheGqcHudUmeychnb2EIkRDoRhl16hCtZmXVv42O2A==
X-Received: by 2002:a17:906:b85a:: with SMTP id ga26mr160390ejb.366.1618423917558;
        Wed, 14 Apr 2021 11:11:57 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:57 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Marc Dietrich <marvin24@gmx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kernel Team <ac100@lists.lauchpad.net>,
        Pierre-Hugues Husson <phhusson@free.fr>,
        Ilya Petrov <ilya.muromec@gmail.com>,
        Andres Klode <jak@jak-linux.org>, ac100@lists.launchpad.net,
        linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 22/57] staging: nvec: Fix a bunch of kernel-doc issues
Date:   Wed, 14 Apr 2021 19:10:54 +0100
Message-Id: <20210414181129.1628598-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/staging/nvec/nvec.c:109: warning: Function parameter or member 'events' not described in 'nvec_register_notifier'
 drivers/staging/nvec/nvec.c:136: warning: Function parameter or member 'nb' not described in 'nvec_status_notifier'
 drivers/staging/nvec/nvec.c:136: warning: Function parameter or member 'event_type' not described in 'nvec_status_notifier'
 drivers/staging/nvec/nvec.c:136: warning: Function parameter or member 'data' not described in 'nvec_status_notifier'
 drivers/staging/nvec/nvec.c:358: warning: Function parameter or member 'ev' not described in 'nvec_event_mask'
 drivers/staging/nvec/nvec.c:358: warning: Function parameter or member 'mask' not described in 'nvec_event_mask'

Cc: Marc Dietrich <marvin24@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Kernel Team <ac100@lists.lauchpad.net>
Cc: Pierre-Hugues Husson <phhusson@free.fr>
Cc: Ilya Petrov <ilya.muromec@gmail.com>
Cc: Andres Klode <jak@jak-linux.org>
Cc: ac100@lists.launchpad.net
Cc: linux-tegra@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/nvec/nvec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index a80996b2f5ce4..990d15c31a13d 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -99,6 +99,7 @@ static const struct mfd_cell nvec_devices[] = {
  * nvec_register_notifier - Register a notifier with nvec
  * @nvec: A &struct nvec_chip
  * @nb: The notifier block to register
+ * @events: Unused
  *
  * Registers a notifier with @nvec. The notifier will be added to an atomic
  * notifier chain that is called for all received messages except those that
@@ -125,7 +126,7 @@ int nvec_unregister_notifier(struct nvec_chip *nvec, struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(nvec_unregister_notifier);
 
-/**
+/*
  * nvec_status_notifier - The final notifier
  *
  * Prints a message about control events not handled in the notifier
@@ -343,8 +344,8 @@ static void nvec_toggle_global_events(struct nvec_chip *nvec, bool state)
 
 /**
  * nvec_event_mask - fill the command string with event bitfield
- * ev: points to event command string
- * mask: bit to insert into the event mask
+ * @ev: points to event command string
+ * @mask: bit to insert into the event mask
  *
  * Configure event command expects a 32 bit bitfield which describes
  * which events to enable. The bitfield has the following structure
-- 
2.27.0

