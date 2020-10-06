Return-Path: <SRS0=wvja=DN=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA29C41604
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 10:12:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD7182068E
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Oct 2020 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601979122;
	bh=KdBab2rVcqL7Xh3txawY1tJaeOZK5A8lg9puSwqNKjc=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=IPxVAF4dkFjTcbSEQM1c/cTak1Q1CJmNKW858OnG+hS26Qxio7WJSenN33rT6MubF
	 eRpEWCJ+jw7smiWnwilp6Kp4Y4zKAGGwNIsEEplDdVcJXkb1N9hi2/uE+HLkAeqFw/
	 +4SQUcEGd3MKYsGbbzozQXJ2q8/qkLQwAxNuRh+w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgJFKLo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Oct 2020 06:11:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:56780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbgJFKLo (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 6 Oct 2020 06:11:44 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5018A2068E;
        Tue,  6 Oct 2020 10:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601979103;
        bh=KdBab2rVcqL7Xh3txawY1tJaeOZK5A8lg9puSwqNKjc=;
        h=From:To:Cc:Subject:Date:From;
        b=Lzqko109S/s/wLdQew56BmInwGcqWmj62XNt/hTrrgrCmwW7FtUV9RraydlyQw7JH
         /fi+AE1r4wi+sGNKfB9h56wyeLtwbU+W6kf/hnGridtX+BImvV4SrI1QDAYUo10RSd
         WFoYPdkaT2P4pzaoY8qj69QlXE23iIuWf16JAR3k=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPjwb-0002Qo-8J; Tue, 06 Oct 2020 11:11:41 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: [PATCH v2 0/4] soc/tegra: Prevent the PMC driver from corrupting interrupt routing
Date:   Tue,  6 Oct 2020 11:11:33 +0100
Message-Id: <20201006101137.1393797-1-maz@kernel.org>
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

This is a respin of the initial version posted at [1] (the cover
letter describes the rational for doing this).

Jon, Thierry: I haven't applied your TB tags as the series has changed
significantly. Please let me know if they are still valid.

If everybody is OK with this, I'll stick it in irq/irqchip-next.

* From v1:
  - Moved the hierarchy trimming part to its own patch, living in
    irqdomain.c
  - Reduced the PMC irqchip patch to the bare minimal in order to
    reduce the risk of merge conflicts

[1] https://lore.kernel.org/r/20201005111443.1390096-1-maz@kernel.org

Marc Zyngier (4):
  genirq/irqdomain: Allow partial trimming of irq_data hierarchy
  gpio: tegra186: Allow optional irq parent callbacks
  soc/tegra: pmc: Allow optional irq parent callbacks
  soc/tegra: pmc: Don't create fake interrupt hierarchy levels

 drivers/gpio/gpio-tegra186.c | 15 +++++-
 drivers/soc/tegra/pmc.c      | 89 +++++++++++++++---------------------
 include/linux/irqdomain.h    |  3 ++
 kernel/irq/irqdomain.c       | 56 +++++++++++++++++++++--
 4 files changed, 103 insertions(+), 60 deletions(-)

-- 
2.28.0

