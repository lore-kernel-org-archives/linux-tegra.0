Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78820C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 09:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C94561185
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 09:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235886AbhIPJpj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236064AbhIPJpi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 05:45:38 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E5FC061766
        for <linux-tegra@vger.kernel.org>; Thu, 16 Sep 2021 02:44:18 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id u18so6705929wrg.5
        for <linux-tegra@vger.kernel.org>; Thu, 16 Sep 2021 02:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ObqEUP3qi14NyfW7JJbtv2i7uqDxPO9r8TYVpyd2ZDo=;
        b=W8fNDqpy6OlEHXP7oec3/cxIhHaTYQPgcbnUfR6f3SrAlYEkfMreGMFnFl3QS15OnZ
         cPZaF2axcSu+XduTF2MC7o0fkkfbkDlYmtRhgiwM0dC9bOwjQvcB6Dd2w8SLW30CMYkT
         6GeK6KtZKg9caUAMGmcmeIlO/zngu9fyqjXHYC/bjwEj1UCdOimtb9X+KA+oyI8YH70u
         hXSfPWOQ0jrxgE5LtI6xQ6CWSDATnOBMLZLmledvHvYWLId909EoA6ISD08j6Yf2Kl44
         yVPA9ZTXOTkBtr8WYevYwbdp7FRCc8Ax7+v6slqEsptl9qkIa+jPtZz3OyABAQU5S8dy
         HGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ObqEUP3qi14NyfW7JJbtv2i7uqDxPO9r8TYVpyd2ZDo=;
        b=5U9lo8XqWecpztqMUTHAiEddacJffAZv9SlU+851PfMfRS0IMC/DMc6B20upP1T0+g
         fFtvNiAJ9W2erq/pj6FJuM9rvSpizHl2+GOGJV7RWFYzuJXOBOqokT3WZpVyugDgGjej
         Q0jsf/jggIBtvsgwoJvwyzh6gne4/QPH8r8mhnW8L04Fa9iSDrlNPFHhryLKRC+IMPeB
         7cWfH6/JBkEKrA+bssQqHTj6IbkD4UnklR8xxqzpWRwvvQ5iWZYku05FudzASHvlWab4
         Pn/ffwMGmUFzh9hygPWByxmrQbEvAs8NzGoudwrJ+7SItZPcUcuz9uLVntjGunDAb3Op
         VdkA==
X-Gm-Message-State: AOAM530TP+VvYWnWzZUDZZClJW4m4QShRVeU2RlZzWdfv6N9UFyNFmP1
        OxtX6aB3s0Ag4XMosM0GT0UpAmI5yz0=
X-Google-Smtp-Source: ABdhPJzFIBV/AFPzv49Wbp2BXqvcU39J/We2bG7prD/rUYc/OzBlzrEEDg1d3S3r4/zB4uWxtUv9Ug==
X-Received: by 2002:adf:f185:: with SMTP id h5mr5042555wro.302.1631785457242;
        Thu, 16 Sep 2021 02:44:17 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id v8sm2872677wrt.12.2021.09.16.02.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 02:44:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 5/6] drm/tegra: Propagate errors from drm_gem_plane_helper_prepare_fb()
Date:   Thu, 16 Sep 2021 11:44:03 +0200
Message-Id: <20210916094404.888267-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916094404.888267-1-thierry.reding@gmail.com>
References: <20210916094404.888267-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Currently this function doesn't return an error, but that may change in
the future, so make sure to propagate any error codes that it might
return.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/plane.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index f8e8afcbcbf2..321cb1f13da6 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -200,11 +200,14 @@ int tegra_plane_prepare_fb(struct drm_plane *plane,
 			   struct drm_plane_state *state)
 {
 	struct tegra_dc *dc = to_tegra_dc(state->crtc);
+	int err;
 
 	if (!state->fb)
 		return 0;
 
-	drm_gem_plane_helper_prepare_fb(plane, state);
+	err = drm_gem_plane_helper_prepare_fb(plane, state);
+	if (err < 0)
+		return err;
 
 	return tegra_dc_pin(dc, to_tegra_plane_state(state));
 }
-- 
2.33.0

