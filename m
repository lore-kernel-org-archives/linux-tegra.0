Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5259AC7EE22
	for <linux-tegra@archiver.kernel.org>; Fri,  5 May 2023 11:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbjEEL3F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 May 2023 07:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbjEEL3E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 May 2023 07:29:04 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF983A88;
        Fri,  5 May 2023 04:29:03 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 767F63200A44;
        Fri,  5 May 2023 07:29:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286142; x=1683372542; bh=nKrqpPCXplHWiVeuJcD2aJlBhjZEi2n9Wkl
        pu/yNhp0=; b=e7NRm1F4/hukl3yBCLBjzrQQoe7u2WFLiYmYwZP0Ea4OkGlyzPA
        yClmTwUK+JFSMSvpOijDDNI+rVvYIHzvMd70VwtOzUcIq/+OYz4AzHzN9wSGXzeX
        lXhGFmbpcdsCDinfENakdXVAnA/OcavyqZJqjamDOol2W7wa23hBjKxXm3rd2YT6
        wlTtUJKKkSir9m2zWI6qQ/y9AgxVdXEn3QzzsJi9KlL9jaIw9sbzbSU5Tf8NsOCU
        S4+t2XgXrJGe4kCUKxERLZEJbllRDYk5oJW9x6SwHPwpjix0p4RvoPBItQ9p2PM/
        1psawCdLdkQjNKW/Jll/lixANJoWl1S7edw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286142; x=1683372542; bh=nKrqpPCXplHWiVeuJcD2aJlBhjZEi2n9Wkl
        pu/yNhp0=; b=QQmQGkZaLCQJ64Vj5EwzPsDK/HZxa2yv53pHet8WXXFSyt7yZ9d
        ZOZL+Ykvv79EpL8Y8uPCnH+PpZ0e/JTi03j65puCIexZVUQVYYJ1lOEqL0I4buoQ
        RkPXspXXg/0vVpnWt6VoUknWbD02VnvULKGSuoxrcMD4hzrmPLygt/lnPeE5gCQM
        T2tmZ/70fLKY0XZl1lSUkfVHOpDnp+mx8VvhkKvQJMS6vdtJI/DFNX9aNzPtkrmy
        L/cgvr/FTd7uoexDw+YEWGqLhAQm4fVaOJmkEPRD2MeGxXvQTEEOpA03YIk6j5ol
        /RIpD9qpZFHmusGCFSQaDUhYuV2EoifUoEA==
X-ME-Sender: <xms:fehUZO6O909K6WHLKIOjHCl9SCZCyMn7i28NTl3Hxffum4jpLdw3IA>
    <xme:fehUZH7LL-aPSYu50Pn3j1A1dE0aLTLs5KT2eSHuX4MKoVS0L6nCHDNap2-YN01F1
    x5ayizEiehxuMnX7go>
X-ME-Received: <xmr:fehUZNcwtcbxyKyTBcyMxv6tHVNVXuV0wjMME97JBnOM79HhAzazZXmDIzBKJZ7eo7M0OqmMBHFDyarMU8o-vpywMZUXJB8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fehUZLJhHiLFKiQ4SrByaab4Kti6FvyUhTphIDVcx3DB-OTc0Blzig>
    <xmx:fehUZCJJEXs6H8PQjuSy_-KpgD6swlBvDSuuHD8Y5ikAqKgsEiL10g>
    <xmx:fehUZMxLT1arBSb_KzcyjjO0QkWLLXrq4b18dCWrJTxm-5FYcF4hxw>
    <xmx:fuhUZDoxOznZxnlTlVrtVdtVBouK_8JUAyhAeTaVxz7pzAn9GNxYww>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:29:01 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:26:07 +0200
Subject: [PATCH v4 65/68] clk: tegra: super: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-65-971d5077e7d2@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3039; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=MugLLXsoryE1kaMdYcgTsz8hHT/FUkSGKo5Wp/zT9CM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5farntdpfHtutkHU4X6xfOUj7F86XH/8eyTwlTWbL0X
 ItM4OkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCR/s+MDHPLZRjNi05+ytu0bEbzuW
 V7pe6mSG4rFK9f4+ftePJxtxUjw8G/Kt9bS7b0qss+OOO0KP4aT6/4zpyrlzrl2gRmP5z9gQkA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra super clocks implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/tegra/clk-super.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 3f3a7a203c5f..7ec47942720c 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -142,15 +142,22 @@ static const struct clk_ops tegra_clk_super_mux_ops = {
 	.restore_context = clk_super_mux_restore_context,
 };
 
-static long clk_super_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int clk_super_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
 	struct clk_hw *div_hw = &super->frac_div.hw;
+	unsigned long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-	return super->div_ops->round_rate(div_hw, rate, parent_rate);
+	rate = super->div_ops->round_rate(div_hw, req->rate,
+					  &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long clk_super_recalc_rate(struct clk_hw *hw,
@@ -193,7 +200,7 @@ const struct clk_ops tegra_clk_super_ops = {
 	.get_parent = clk_super_get_parent,
 	.set_parent = clk_super_set_parent,
 	.set_rate = clk_super_set_rate,
-	.round_rate = clk_super_round_rate,
+	.determine_rate = clk_super_determine_rate,
 	.recalc_rate = clk_super_recalc_rate,
 	.restore_context = clk_super_restore_context,
 };

-- 
2.40.0

