Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC84C7EE2D
	for <linux-tegra@archiver.kernel.org>; Fri,  5 May 2023 11:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbjEEL2J (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjEEL2H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 May 2023 07:28:07 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85BEE1A613;
        Fri,  5 May 2023 04:27:56 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 821C53200A81;
        Fri,  5 May 2023 07:27:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286049; x=1683372449; bh=q70o0WF6BfPt6BaN/01tO1E9nwsVg1Ia0t2
        wtAQxJRk=; b=QT9uAoF3NSLY79JsSvKeGtkFAVzfjklGSpiEmJ17YoqKQ92RFwo
        qj3MgzNnOiiHWhjT435+gNfDpHtRKyld4IGMh90VyUhvV9Shqt24S2VP84jMvoe3
        dkoAz9uKxw668UcOga2xkwWUguSRuz4dHoBFU6mcwhlhnq9x7AoCp+WT9ZJ1GN8y
        GKul6yQiC3PBvndeXn0nEQ9muXxbNP1u1Z6C4aBA9qgMoF5WTPr8O6/1uoMNSgYn
        6z4bg9NKdVbMRA3+bQD0vF8ovOMM1l+AM9mZm+ZZrKy7poGAMbvK2ALjS1Lqow/P
        HzSG5Amw9dLZQFQ62UbGhlSUuXPaUbvNKWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286049; x=1683372449; bh=q70o0WF6BfPt6BaN/01tO1E9nwsVg1Ia0t2
        wtAQxJRk=; b=aTEhWl1IUmI768837kQ2Z3LiiTvSYKnGRqu6WjOEVAFNreE6xMq
        eVahA1whLQGwcHH8NziQ86cKYU4NruhNImjsweYsgiLHUb4bO6uWhHOGV4U423n5
        SCXM1JETM/DvzFWiQ8AYkb7aTLjYUq8IEPX5DzKLGV3nzLUOY+BNPzfRudBAiEMb
        SYczr8jt3JqME9N0Pb90UdXv90/14iF3A7FxK4JOEefpbTdV9hpuxM8CYPITH/MM
        DHQI773fCncMHnJotowaLiAvgeR6ljHF/Z2+iFuac6GO9jqpvK448ToDxBFW8L/z
        9md1NyDFIfpKUPk6ZizxJR5tTiszct+QoPA==
X-ME-Sender: <xms:IehUZChFKfhQG3U6CCEj84wzEzItY6dF8dMV7m9IBAdIw7mxhaHgnQ>
    <xme:IehUZDB-inbvSAwqTCPpFfDgg55JslBzJO4ZQVcQkrA8zI712QpF7ekE1L3T673VP
    wahZl2q--llmmU0IMU>
X-ME-Received: <xmr:IehUZKEy99FZBr9zox3NDmB-nsJPqIWa9_CVEIz6-Ku-mHEQkF6W3qwe7CFQoT1DAnKHkaKU-f4YhCH7YiVwQuZ24vxqDAc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IehUZLSgDA39EtY2nuaC9-Rn5J7S1e6z6qRYsfJErgvFova4XUM5GA>
    <xmx:IehUZPzo9WAUWNulzFz6rhW8qGG7tYnHFtFxVp3oyH4HegCxEaw25Q>
    <xmx:IehUZJ43PQnZ2uLdFaUhvdvQYFHZuMPthT9AK-H_VJTYmtjayvg0iw>
    <xmx:IehUZGz0T04ML7gVaJ7QcDKX6FSRd87_qzTUeoCivxCG7e9qoRUMwA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:28 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:37 +0200
Subject: [PATCH v4 35/68] clk: tegra: super: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-35-971d5077e7d2@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2140; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=zOMkcOOtE4uat3PA5tfy+7gzs+yxnY0tvmb+4dzoRFE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5cknlzXuItfLj3I7Q2vdtOlpc5e6RkKLP0tttGcqivn
 Je3sKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwEROhjIyvN048e7mgiOecuWXH+/UeC
 k+4fuuCz7+y/Y1qGjUnNwwPYmRYXvm2fc+8ok20wT7es4IMfaecd/qKtEiFcizrWe/+7tSVgA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra super mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/tegra/clk-super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index a98a420398fa..3f3a7a203c5f 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -136,6 +136,7 @@ static void clk_super_mux_restore_context(struct clk_hw *hw)
 }
 
 static const struct clk_ops tegra_clk_super_mux_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = clk_super_get_parent,
 	.set_parent = clk_super_set_parent,
 	.restore_context = clk_super_mux_restore_context,

-- 
2.40.0

