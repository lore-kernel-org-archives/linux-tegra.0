Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DA0C47095
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 12:45:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EADBE212CC
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 12:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602074759;
	bh=SQtVP+8f1KfVqOEVuHUJHQBMLIpKu5oYibHyjTN7fBg=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=vZMDeyIaDdvAge6OT5bPLt1JhHML+V1S07CX0zjHz0NawXCySY4HlGiPcN7BfkDjX
	 qVuL+8Xroc6CFwOZwLGXmIJkqnpS28d7E7ULasWlXYn/rLgCNYQ/jxlz140azcrKaB
	 /VNt4cXSrq/qksxtZhzNs5/hMbZW+ntoFFc+pxZ0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgJGMp6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 08:45:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:58214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727253AbgJGMp6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 7 Oct 2020 08:45:58 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 181D120789;
        Wed,  7 Oct 2020 12:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602074757;
        bh=SQtVP+8f1KfVqOEVuHUJHQBMLIpKu5oYibHyjTN7fBg=;
        h=From:To:Cc:Subject:Date:From;
        b=GAI2Lniq7V7EDRJTGTBlD6b6oBzqr8DHnPpPcVZ8TUBCyWU4hNsNHjv33gWUr1TtE
         7Y1oL8E4RRr5wmIkkFWcaWkuBAx+rl48gP5kfTp+GLcJNXFedzD0y3Hxqy+740H9Sw
         wQqQGZf705dB8POglB2NvaztT1a5EZNxfxsinj7c=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kQ8pP-000M8V-1P; Wed, 07 Oct 2020 13:45:55 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: [PATCH v3 0/4] soc/tegra: Prevent the PMC driver from corrupting interrupt routing
Date:   Wed,  7 Oct 2020 13:45:40 +0100
Message-Id: <20201007124544.1397322-1-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, skomatineni@nvidia.com, vreddytalla@nvidia.com, tglx@linutronix.de, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is another respin of the initial version posted at [1] (the cover
letter describes the rational for doing this).

Jon, Thierry: I still haven't applied your TB tags as the series has
changed significantly again. Please let me know if they are still
valid.

If everybody is OK with this, I'll stick it in irq/irqchip-next.

* From v2 [2]:
  - Made the hierarchy trimming an internal functionnality, not
    requiring any intervention from driver code
  - Spelling fixes

* From v1 [1]:
  - Moved the hierarchy trimming part to its own patch, living in
    irqdomain.c
  - Reduced the PMC irqchip patch to the bare minimal in order to
    reduce the risk of merge conflicts

[1] https://lore.kernel.org/r/20201005111443.1390096-1-maz@kernel.org
[2] https://lore.kernel.org/r/20201006101137.1393797-1-maz@kernel.org

Marc Zyngier (4):
  genirq/irqdomain: Allow partial trimming of irq_data hierarchy
  gpio: tegra186: Allow optional irq parent callbacks
  soc/tegra: pmc: Allow optional irq parent callbacks
  soc/tegra: pmc: Don't create fake interrupt hierarchy levels

 drivers/gpio/gpio-tegra186.c | 15 ++++++-
 drivers/soc/tegra/pmc.c      | 86 ++++++++++++++----------------------
 kernel/irq/irqdomain.c       | 58 +++++++++++++++++++++---
 3 files changed, 97 insertions(+), 62 deletions(-)

-- 
2.28.0

