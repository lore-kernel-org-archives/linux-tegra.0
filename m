Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEB4C77B7F
	for <linux-tegra@archiver.kernel.org>; Fri,  5 May 2023 11:29:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbjEEL3C (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 May 2023 07:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbjEEL3B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 May 2023 07:29:01 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F23B10DB;
        Fri,  5 May 2023 04:29:00 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 61F0E320030E;
        Fri,  5 May 2023 07:28:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286139; x=1683372539; bh=UcMR4Qi1F7HgsFetT6JKGzLZgiXQ52BxV7B
        xmP1Dnlw=; b=h0vxWMkHv4pIQHXjofY5SJXQJ8RWy3L+40g2o4+3LFopj2Mbpy4
        GD4Csp6FrsZXLhSdzZ11oSANEXN/EJx4JidapMG3wnEmPCKhvc0Ho1HmnXJkOeOi
        /XPvsIc57EXw7ZmfaLXV6R0q42HrIx/+8kHSi+lX678i1JAOoNlooNs9LYZqZTzq
        NoIdW0ug8r+z0pYFhxAeS6JtSOovjPQFCHllEovSXryjLO5c0UpNcYt0JlGLouot
        FnzckJ/dQTZtSFPD9o1wQvlKlnzATORs4/0j85zHnqdOq1s6ghEzY1m/NDhFLQDA
        fBusIbc/h7q+Tpe/zGRkTp0KlbLHohTWFFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286139; x=1683372539; bh=UcMR4Qi1F7HgsFetT6JKGzLZgiXQ52BxV7B
        xmP1Dnlw=; b=J4FL0dM3saeAmrPV8VmvxycVsL69GC+ahlb71qJv9zS94EpPAYw
        OJEhWdiZLHaJVIHuE44tDodzWULvtxHhKcZyT9HS1M/xGsiH6BXAxQIqQufd5QTb
        dPdl59/Asp+6zoI6Kl9iOHlnF01suUMMpdI2J4hz4AKiD4f2NN8tN+zmpa30rSTJ
        lZiBDy07KI/0UgIUM2dmlOtPrTOliatepb24izsdHFm0Qhiz82W9med8pbhg6QZa
        xJXT+x9119O6VeZzSE/nF+jaeIRuKWByZBFeoVZM4bIciIIYZDIv0J1C45Rnh2UD
        qFNf46Gop67SdwD+isIVORI1ZPQ05JWMLtQ==
X-ME-Sender: <xms:euhUZOjVQoDYRWRdJmc6W-AEz7pjWQ6SxJujePe5DXjWE4yibgjqOA>
    <xme:euhUZPCfeVI_-v9rKQIFR7lYWCP-7jOjQsRf0OiGTpOgbO0ctP0kh7p20lHbboWj1
    tjDF69H-W9ZfWAjyh8>
X-ME-Received: <xmr:euhUZGERG-zHOSME3ZqnMAgcPFQBKVqUeyvivNbL8dgUCjRC833RjA53t4k3BhKFSHg47GNmCN-HX9xZNQEGfw3Fvq1FphE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:euhUZHT4ckHEEoiJ3tYk7JaA_NL-PV7F6ZmEWJFlOmDHKLx5UpjNUw>
    <xmx:euhUZLzFXwhY3K-bI873fqtLCQSP9qBvGv5JQC4VGWLDHoRLIiAvHQ>
    <xmx:euhUZF61pG7wq4YABkpth_o_64pS4M135yjIXqGanFkogXeAhUIFPw>
    <xmx:e-hUZCwGS0-ryVhJC_UtK43E1izdVoop7FZJSGu59ILujCqgW5jKIw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:58 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:26:06 +0200
Subject: [PATCH v4 64/68] clk: tegra: periph: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-64-971d5077e7d2@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3482; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=c0XrwBttDb+hpqAiFhQ+kcVqgDektInAeVW17Cq+pmw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5dOPrLBStg2XiNh4pLztToJ7un//35049vquCKz/NWN
 2j0vO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARlcOMDG0vG51cFVu155ed9RR0K5
 6W/kTnvozPvu03fMtCS61k1zAyfFRsdLTUbfGrFeJ6+EZDPU7oIFPhq6ZQqW21BbsmSBfyAwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra periph clocks implements a mux with a set_parent hook, but
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
 drivers/clk/tegra/clk-periph.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index ea443366e972..0626650a7011 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -45,16 +45,22 @@ static unsigned long clk_periph_recalc_rate(struct clk_hw *hw,
 	return div_ops->recalc_rate(div_hw, parent_rate);
 }
 
-static long clk_periph_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int clk_periph_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct tegra_clk_periph *periph = to_clk_periph(hw);
 	const struct clk_ops *div_ops = periph->div_ops;
 	struct clk_hw *div_hw = &periph->divider.hw;
+	unsigned long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-	return div_ops->round_rate(div_hw, rate, prate);
+	rate = div_ops->round_rate(div_hw, req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static int clk_periph_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -130,7 +136,7 @@ const struct clk_ops tegra_clk_periph_ops = {
 	.get_parent = clk_periph_get_parent,
 	.set_parent = clk_periph_set_parent,
 	.recalc_rate = clk_periph_recalc_rate,
-	.round_rate = clk_periph_round_rate,
+	.determine_rate = clk_periph_determine_rate,
 	.set_rate = clk_periph_set_rate,
 	.is_enabled = clk_periph_is_enabled,
 	.enable = clk_periph_enable,
@@ -154,7 +160,7 @@ static const struct clk_ops tegra_clk_periph_no_gate_ops = {
 	.get_parent = clk_periph_get_parent,
 	.set_parent = clk_periph_set_parent,
 	.recalc_rate = clk_periph_recalc_rate,
-	.round_rate = clk_periph_round_rate,
+	.determine_rate = clk_periph_determine_rate,
 	.set_rate = clk_periph_set_rate,
 	.restore_context = clk_periph_restore_context,
 };

-- 
2.40.0

