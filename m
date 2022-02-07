Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8FCC433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Feb 2022 16:56:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354700AbiBGQzo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Feb 2022 11:55:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344552AbiBGQkw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Feb 2022 11:40:52 -0500
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB1FC0401D1
        for <linux-tegra@vger.kernel.org>; Mon,  7 Feb 2022 08:40:49 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 333BE5801D9;
        Mon,  7 Feb 2022 11:35:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 07 Feb 2022 11:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=Vq8s0JyC8s00ltpimMwBVyZ8K4H9T1
        h5mMPTBQXsouk=; b=YwVrjrzjdg53fsuxylT7gBbhDk7VZKP/pYcPCtqPqYP+Oa
        VVXKTkEgrtUGMA9e/fJlacXkXsvDCwQZ+VTiAJo/lCiwf2Znu3CguLSf9Wud4xOf
        BIPwYxyVkI3aVB9vwhRQgzManxEUmCG950FBo5w/i9rswob+G+VqjnCmw6zvVzcd
        oB9bOKXxegjMsdE25R9eTlTVRbnaxwo3pywMtjY5rhcvo9rJcZv7g1XbM4+tJ5ha
        ZDIkn6BV/N9xaEAbmchAMaZCXhHYBTV8Rb34Pttln6kxbJoQFWNSTHOW/Ou5G96D
        +mBK677LnsPkFV+nx6o7ebv1vqP7MVJ9SBCs5zeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Vq8s0J
        yC8s00ltpimMwBVyZ8K4H9T1h5mMPTBQXsouk=; b=SfkXjYjTuAfwmZ7sgCb8Ih
        3VQyzb+bFVo3SzriD54qnjX6HnG5rcCHvbZitBLm3/WY0NDf3ozmL8i+e9dawCWw
        ilPpLpQPQif68fjb+JHn33BTdqSvC92nNykCtfn4koBUjeP1YS4NlZYgBhasg9ti
        kHXxNVp7Kszj/7cDH7eMH+CPllEeUh+XID5jBAD7qG9OVPXRXKSqn+3YEmF2y1hb
        Kz9kpoJXnGBTa1PaQPWP4ZthMDz1XLN04ysUJlihdjoIVNTFkTdABYxNly6zfdQa
        k5TKHe7jtWl+A4IgB/FAe8fAzNByOFdSiD23O9abZg6bj2i/9n4z63vVjLmMK8Qw
        ==
X-ME-Sender: <xms:TkoBYlNIaOl85tUWiN_cIfwakQGuYvMdVrqNEJaJhTEGIt0yEUPZzw>
    <xme:TkoBYn952wB8ATR2yQMezAZaRJg9MISyJDLUo-ltp2uvnWNrhCTUA9KfxsdDMXKBP
    m8x37vLZgVDyL6Bza4>
X-ME-Received: <xmr:TkoBYkQtD6dbnh40RT9CGGWrjw1m0ZPm7s-pmrH6zX_D49J4MCRFawpda8caqr5DBYpPf1yXd--OM8MqaPkxRKBr00pE0PdGEbzutiE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TkoBYhvKtLtZBhRDj-QevElvjmUPDpR-DM8_SK6n4a-dBfdsYGIEbA>
    <xmx:TkoBYtcTtlAszQOmZVbrnoNpaKJAbRQYOoF_w_0BjiZtifZzRZsPRg>
    <xmx:TkoBYt04dDDVKGS2ZAVtxPUD8YsW5hWlAHKdXgpKYIbk_04xsHgZsw>
    <xmx:T0oBYt08rhh8E6v0Id_g6me6hUkax0IABPo4VmuM6l2vlatS7ymlRA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:26 -0500 (EST)
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
Subject: [PATCH 03/23] drm/tegra: hub: Fix zpos initial value mismatch
Date:   Mon,  7 Feb 2022 17:34:55 +0100
Message-Id: <20220207163515.1038648-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

While the tegra_shared_plane_create() function calls
drm_plane_create_zpos_property() with an initial value of 0,
tegra_plane_reset() will force it to the plane index.

Fix the discrepancy by setting the initial zpos value to the plane index
in the function call.

Cc: linux-tegra@vger.kernel.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tegra/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index b910155f80c4..7f68a142d922 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -788,7 +788,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(p, &tegra_shared_plane_helper_funcs);
-	drm_plane_create_zpos_property(p, 0, 0, 255);
+	drm_plane_create_zpos_property(p, index, 0, 255);
 
 	return p;
 }
-- 
2.34.1

