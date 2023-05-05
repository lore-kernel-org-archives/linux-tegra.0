Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADCFC7EE2F
	for <linux-tegra@archiver.kernel.org>; Fri,  5 May 2023 11:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbjEEL2K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231931AbjEEL2H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 May 2023 07:28:07 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859CB1A4B8;
        Fri,  5 May 2023 04:27:56 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 63CE7320030E;
        Fri,  5 May 2023 07:27:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286046; x=1683372446; bh=ssN0NjSUC7Fmm2RZA88rarN77otxkYs5i35
        E/qet6Jo=; b=jVj9OArG92/9H3B21NKyNVvg7Ff2Sn9VuAqQOIf3XddNjf4wj6f
        yprvRXxsXN10+uLd45mdTjiCBAjaIIg41l0ZzPtg4ar6hTLc0kRXfQtpLeNooy1w
        KXRPZI0DAZy0tMlPhopKv3e+FkNXbZ17qpUv2ymYKaUqMzuIBQT4R0fgDS5epjqy
        3da84tFaiGsMmPcMIlkoHWMnL5uZ6GUKqH1DFA3Kt4nHipFGLMpa20kcBcQgcF1y
        OK18v8qPtKq4hXZYAdXxWux9FysdTb5HqSZyGtErXT+/azy/VmlcwQ7vGQo4J4gg
        Nme4FsEG45YL1Omed6CXXD45eHFYJTYYB7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286046; x=1683372446; bh=ssN0NjSUC7Fmm2RZA88rarN77otxkYs5i35
        E/qet6Jo=; b=Zl/rVZE+rk5v3PAdybtmG4r+6PhP+GhkpO9hJwon3OoPFey5Moj
        SxFPpXJWlNeQqCMfsCvNVNpWfgMEBhfVsC1C6juRAbwavE6wHF0K8a60wZlHRdZf
        dS5lMZ6lf94PDBVnweanmj6IfnXwoZXzq3fmuROWd2onX/yVojAJJnEa7zjgz7GW
        LAei6JrGkQoFowHdLXZQuWH+AcUTWFZitK/XB49xfkAqJ4FOEgiWOImO6VP1N3CI
        kpLCX1nHmKPNjiplbuW+2A/Tu7uc3Nm+09EDnwCPyiAdCXxkDqCkymsNbFIPRE7c
        4PXaqYT8bB5FnSQm8nILnbewfiLsSDJeA/w==
X-ME-Sender: <xms:HehUZLwb1XFacenPZHpgRmQD6UEhsC21FiCYByeN1LuRr5srWl9h3g>
    <xme:HehUZDTT7c9doQHZLY8VXC5M1RYZYFU97g4EkwzEjCuzedY_3aG8Rc3nielz8NFpG
    kP-_DaP7pS2Magp4-M>
X-ME-Received: <xmr:HehUZFX9U_cNmQYKKJwv0DNcPbNMgQPX4jwYEZsAy7fNjLFolkA37wED_LaxaFthjIYGtlb9X3CdCKiFd24bhnbr9W4kOJY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HehUZFinnElUVV2BzxLA_-2l067Hua4MGqpEooJBoc5_xAdJHtZM2A>
    <xmx:HehUZNAUcOc_pjAImB4FDWlmIPNEl1T1jdjIXUHd4kwWaC6YcYT7AA>
    <xmx:HehUZOJYEk7TJaMYKMdNZVSChwCAMPPcXGDRqJbb6xWGGqvMlSqQlw>
    <xmx:HuhUZHCSAs1G_BomyreHh6wJqFSkWzoZcCm3LAQNDjZ9OgD8r3cahQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:25 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:36 +0200
Subject: [PATCH v4 34/68] clk: tegra: bpmp: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-34-971d5077e7d2@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2159; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=91kYDnAgQrHRLxckGlUeez9y2FRdmo60DMol1crV1K4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5ckXHBI/zU5cXVrxeYLvxV3adiGP3Dlinsavayl4dCX
 2P3vO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRjnCG/3UXVqRvUwlkKSuKf5fBOn
 PxR4Y5a1R2Tnx5dt+1s+eiW84yMnxUCTpdXFW0Vr7ziPD+HzVqqpdkr18pynx+TdhLOJV3Iw8A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra BPMP mux clock implements a mux with a set_parent hook, but
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
 drivers/clk/tegra/clk-bpmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
index 0ecdffaa6b16..a9f3fb448de6 100644
--- a/drivers/clk/tegra/clk-bpmp.c
+++ b/drivers/clk/tegra/clk-bpmp.c
@@ -286,6 +286,7 @@ static const struct clk_ops tegra_bpmp_clk_mux_ops = {
 	.unprepare = tegra_bpmp_clk_unprepare,
 	.is_prepared = tegra_bpmp_clk_is_prepared,
 	.recalc_rate = tegra_bpmp_clk_recalc_rate,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.set_parent = tegra_bpmp_clk_set_parent,
 	.get_parent = tegra_bpmp_clk_get_parent,
 };

-- 
2.40.0

