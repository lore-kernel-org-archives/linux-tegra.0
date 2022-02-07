Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7F6C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Feb 2022 16:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235247AbiBGQyz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Feb 2022 11:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345307AbiBGQkw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Feb 2022 11:40:52 -0500
X-Greylist: delayed 322 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 08:40:49 PST
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E983C0401CE
        for <linux-tegra@vger.kernel.org>; Mon,  7 Feb 2022 08:40:49 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6D93D5801E1;
        Mon,  7 Feb 2022 11:35:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 07 Feb 2022 11:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=EwNtqwTz4wJMKViqLw0g5DhuPbcVe3
        1YFuSiAGaRGSQ=; b=Csgb2OuGWPA1xTWxg6M7/jOB7wsmuAePCO/NlXwZUY2w/7
        lr/JxT95F8xpKzviHQlUt+dNxWKX2KIIlzcmJu4JIYH2fatmGoWNy849VR9jauva
        VNG4ECXwUYmJojraifpXCzErOKHiEtgD+2xFZO1VOUWfa33HtdC4TKtLrLNGdc35
        8sq6JiNd6oB3BR5un2vZSEK02SA8NS/x5ZlDMTTcNDrCYyzsfWJO1yxJcWor/1Uj
        pH4DJcVV9HNOyun9+iR5DnbBy9xzbh64dyu1MzY0X6pFSr/3mu16FWL4nvLDZYfE
        nEJn+iuQwnq8mTbgOiKWevb/JLbGj8DdEasQjkMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EwNtqw
        Tz4wJMKViqLw0g5DhuPbcVe31YFuSiAGaRGSQ=; b=S8SomocG97/Ygy0Scz6MSH
        wLPbOkw6LM0xcwddWLPyAwMLX/AB3SYju5xh9Tn++8e4ZgASipOxB0ASfXDvJliW
        KETZvVhyFayfB4aNyg0TkW4RbY/UtXuzXNSZa74gkEMxhQ8yrOxQDcmGSiXm85RS
        q/kUiPk8N0NDOJmGVXP2R2NWFjaLdwvG8rAONIlY/5+Flr4xrikImFnADVgnEHgA
        QjU2bxNr7O0e3LcGoDneON9uGSYSS9Osk3YZKNxopQ40Ww50XKBxL8psc4AiYoDo
        lZjiEAhL2Zp+QtrQIIrkEu26IN0jIyb0BwXbeOXtew8TmpeJ/qiMj0prSAWt9DkA
        ==
X-ME-Sender: <xms:XkoBYip6rzXjyllpJMhW5vbuA8AiIfsw55c-X1a-zhN8YHH4RFk2Bw>
    <xme:XkoBYgrcJtZ8-nrGsdfDZwgoSnyvzEp6yW-3MmFLPuQb6trbJ9d3FTe5GxpSz5v2K
    vFtYoE4fHTDzJxCbA0>
X-ME-Received: <xmr:XkoBYnME1ZT9dEGxl8MmU_liBoIE69s-sFkrvOohZeN3cuBoI_d0lpti4Htn5zuIho9aMdiiDlt7_Ax1bwB_2t07fiY6mbjuj491jV8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XkoBYh6jmdmTMO5pRtj7ICPsPTCiXHLgxUgz5lo9zlzhgqdGZ2Z5PQ>
    <xmx:XkoBYh4s407WNWqV4Yd0-ZYWhUeweZXUC5RsjleYc0h3G6qW43XlUQ>
    <xmx:XkoBYhhZ6-BUFOTVmwyio5Gy_JRPyLMRbm-l9ZmRvOEERfF0bGTC8Q>
    <xmx:XkoBYtjh6Y-QMlaJeTNT-zfplHojq21Qh-9KF-thLTvYju-orUW_jg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:41 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>, linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 08/23] drm/tegra: plane: Remove redundant zpos initialisation
Date:   Mon,  7 Feb 2022 17:35:00 +0100
Message-Id: <20220207163515.1038648-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra KMS driver will call drm_plane_create_zpos_property() with an
init value of the plane index.

Since the initial value wasn't carried over in the state, the driver had
to set it again in tegra_plane_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: linux-tegra@vger.kernel.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tegra/plane.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index ec0822c86926..a00913d064d3 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -25,7 +25,6 @@ static void tegra_plane_destroy(struct drm_plane *plane)
 
 static void tegra_plane_reset(struct drm_plane *plane)
 {
-	struct tegra_plane *p = to_tegra_plane(plane);
 	struct tegra_plane_state *state;
 	unsigned int i;
 
@@ -38,8 +37,6 @@ static void tegra_plane_reset(struct drm_plane *plane)
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state) {
 		__drm_atomic_helper_plane_reset(plane, &state->base);
-		plane->state->zpos = p->index;
-		plane->state->normalized_zpos = p->index;
 
 		for (i = 0; i < 3; i++)
 			state->iova[i] = DMA_MAPPING_ERROR;
-- 
2.34.1

