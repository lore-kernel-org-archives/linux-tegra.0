Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615C3C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Feb 2022 10:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354934AbiBUKh4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Feb 2022 05:37:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354936AbiBUKhg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Feb 2022 05:37:36 -0500
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C48C39691
        for <linux-tegra@vger.kernel.org>; Mon, 21 Feb 2022 01:59:32 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3C0B0580259;
        Mon, 21 Feb 2022 04:59:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 21 Feb 2022 04:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=e9llmULFBZir3x1yh/t3kAZB5vKeMJ
        hBlkDfaXXh7+g=; b=tZJaMQ5IqqG9VHFIwSmSgtTPd9Efbhejg9lvbZZChsqToU
        PrK787pX3H3t/nFyQSt1lIHU1q39qxEV338ESTfSSHV5PpCBn9ikti2LM3CzmZTR
        KRecNfpadlRimbm9V9ivlZupVbeEQP6tgtNiRhOgR5neQh2Qy0JTNFDmMSwnPzmb
        Yv+YitxXpm8ZbQOGHctbNsgMhYDx0Y1Amh4bJYr7rQcf5Zqe+xxhJGEi2OSEcgJ7
        9ROY7CmCOvoguyAzkXqpqDJapjxKmHC0+5lzFP37r59MCZ3x/I1Uha8y2J3xBAmO
        3hlYs3569K6QM0ipqnwCFMJNRXVqpYwFjJtGM3TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=e9llmU
        LFBZir3x1yh/t3kAZB5vKeMJhBlkDfaXXh7+g=; b=dJ/uW5aCkbx7uFYdHl1tjq
        9nf16ekfnzSKRbTof6oKPpWLqnrXeoYg6RZEPZAYT/HDgFyZYGIArWpx9/x/sDgr
        xwvDPdxf78gI8I2j3a/IbtOkVpf/gpMjZwcRCXBjXVRr9VvR/Y6MP5M5NhZ65WB2
        HWjyIJ23QdF/kvL43h7/woUXfmDYhbX9yawG0rMhZz6gF39vGYKhE2ec1O70rumy
        XMyadIUXQ1tkisYt6YBsbuAZFOoOe73qsh0xjqr4r+42pmN2zwCacWeqZD3rF17o
        BA10r5sDUF07zRNfiOnqssxLXAXFcBza2JD64UQSVkOC2Hd5kkNn3T8LIEfdyOYg
        ==
X-ME-Sender: <xms:fWITYu7hmE8u7aAgO1tuAMdLpTEPxMyCtOuhyqPFAwOfiPzMXcNgAw>
    <xme:fWITYn4icjLh7Yl7J1hY6RXOslgJh0ja_DKDY3_OGWaSh_UDdrPB8HhZk_HtYkLgD
    fZ4iDYNSXYzcdjkq4Y>
X-ME-Received: <xmr:fWITYtc7Hg1hTQ4CrjxeY2qh8EqZmYUaQ3V0DdEZ0LVzCVj61dct-rIvVKkinMW1bCHKWH789aD-MTwPpzB02QrLV4s0KZuUOHf2SPo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fWITYrIQuqA0WzaRpfAq8k-dxG1-QmzDtihj18iaEGhbvLsJDtqa7w>
    <xmx:fWITYiLMlJZl9ZFYcnyB5Cr4wDbMSQWTjTsf-wZAEargIrVkJUrkeg>
    <xmx:fWITYswSAPlaOPepykxDKLlnyPCFzMX-Z10-TCfhAVKg1XLP-2TNSQ>
    <xmx:fmITYoxwMHwYw4f58lPSy6NiVR44h0B7NxcP969evTzQs3qe_IztSQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:25 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 02/22] drm/tegra: plane: switch to plane reset helper
Date:   Mon, 21 Feb 2022 10:58:58 +0100
Message-Id: <20220221095918.18763-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

tegra_plane_reset() does the state initialisation by copying a lot of
the code found in the __drm_atomic_helper_plane_reset(). Let's switch to
that helper and reduce the boilerplate.

Cc: linux-tegra@vger.kernel.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tegra/plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 321cb1f13da6..ec0822c86926 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -37,8 +37,7 @@ static void tegra_plane_reset(struct drm_plane *plane)
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state) {
-		plane->state = &state->base;
-		plane->state->plane = plane;
+		__drm_atomic_helper_plane_reset(plane, &state->base);
 		plane->state->zpos = p->index;
 		plane->state->normalized_zpos = p->index;
 
-- 
2.35.1

