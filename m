Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83A7C7EE30
	for <linux-tegra@archiver.kernel.org>; Fri,  5 May 2023 11:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjEEL2K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbjEEL2I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 May 2023 07:28:08 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2132A1A124;
        Fri,  5 May 2023 04:28:00 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 950D23200A6F;
        Fri,  5 May 2023 07:27:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286052; x=1683372452; bh=ymxSPdQl8cWZob12r9yUYXDcHuEQxU/QEkU
        E5OehpRE=; b=Z/ktcRUFHaoAc/pYCRxoSwcdfoS3Z+ChRigRO93INUGNI9OQOWz
        9UqYsQT07+9EkyngeCX6fc4OmwEk0RUMV8FraCcx6lS2eoyCyWGUxt4YOJDhDbIf
        DY+yQwmwf6Lrx44z1RU0baa+atIKBq9dYYLF77q7DvQZRGHwaxPF9++tmWMUBiQU
        YFykxF4C2HyFTQ32YAo7Qh5+o+/Fk/pkgnWL4dsVgcO5NPC76VzLkl5Q1zFk/hkB
        Elxp/pA5D0pvA5hxN2kUFBdAYIvbI0WQpZdH0o3ZFJGnYtxUC7emBBKexYnUlmsw
        cAmrLToaG847Dt5oHfjCbGV8nbEUxa6Sy4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286052; x=1683372452; bh=ymxSPdQl8cWZob12r9yUYXDcHuEQxU/QEkU
        E5OehpRE=; b=Y8DX6HYLBnFP2S9bldq1t8M/ZfJI7seZuVcGlh8xIUl3l9Hdyth
        GeeOzkP0KWmoDiTTLIQ8j2LKOq2AoDa6Q4Pg+zZPpwMwLgIBgl6MRGXoclfwwAms
        jhQscs2hlkJJokFq3GesExFwXP985EKqXQ1AtZs6PHKOHocyTBBf+AkYlS3KRD1I
        tJ7OajrjYPWLSik0ESvigt3ehBL1g/rObVXOlkJUB+ZUsLP/Uo2HV31O3JbWR0B3
        IHHWfedzd8rtgl3iyYFLegd8eQohfHdizwEmB7d+xJ5rOGMiPUsIV3XQtfOcmL4J
        k3rlOPmfRhTnpWuCW87vQSr08y39wtiF/BQ==
X-ME-Sender: <xms:JOhUZEFqY6ubmkunG3WOlxmvdj3KOXJBm5oQKoQpOh8RRjl0yv8jNg>
    <xme:JOhUZNW_rOSrR5tDIDQQPJRLUV0Bz39c1H5R9DA7gkWIpEKGQP-hv2kS_dNDa8Yyu
    mYT_qLvUaW7kNK2cCM>
X-ME-Received: <xmr:JOhUZOJjoxflC5VmyGFIxtpMFKLYmUlo8JD2EihFmHbNaIi4rmG9Wac60E8DYQOj4f71YNfk8yGw5xiILfPvSX9j2um0WwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JOhUZGH_iTGpL8oSH7ww3VrQWEWSHS3vl7aY8Qqlifjx4d5ZogdCHg>
    <xmx:JOhUZKWm4tqwDjVp2HgiuNyy0xtAxWSCYKuuUDmx5aSpVQct_IisZA>
    <xmx:JOhUZJPOOwvEe5N2_2N5ViFhGb501mpzE8WYt3GCjmFxBALVRPT6yw>
    <xmx:JOhUZFHpSSh1NWDJKu4PBphILKSRiPuavO3m-kz3dHC7aOhJ7NLACw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:31 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:38 +0200
Subject: [PATCH v4 36/68] clk: tegra: periph: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-36-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=cxoJgtX4So4bmPh0M56fxVCzJPBLLEFUvLjHWdQ3NZA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5cwXPHj0ZztlVOxf3ZpzgP/Wu6oNwceFRreVlrAZLZu
 qj5PRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDaEi1MAJnLWjJHh10Wp388+Pt7sInYwseXCm6
 sPL9U0rp101PqXU2z2y4xreowMF6/eeq69qfnJzEPp/xIK1nixv3Q3PrUk6VvC3Ve7+PR5WAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra periph nodiv clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

However, the upstream device trees seem to use assigned-clock-parents on
that clock to force the parent at boot time, so it's likely that the
author intent was to force the parent through the device tree and
prevent any reparenting but through an explicit call to
clk_set_parent().

This case would be equivalent to setting the determine_rate
implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
determine_rate implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/tegra/clk-periph.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 79ca3aa072b7..ea443366e972 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -140,6 +140,7 @@ const struct clk_ops tegra_clk_periph_ops = {
 };
 
 static const struct clk_ops tegra_clk_periph_nodiv_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = clk_periph_get_parent,
 	.set_parent = clk_periph_set_parent,
 	.is_enabled = clk_periph_is_enabled,

-- 
2.40.0

