Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C084C4727D
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:15:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31E07206CB
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601896512;
	bh=byOyHb25XO6a9zA+76nGhRy3pYx2YIrog+eRA2qInos=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=ZapJhnweznVV6kNvwt3U1XFQMqXJvj1fJ79zkrjeSzMwNvJTED8U3CfLLP9M8G7cj
	 zMOHzX0bRm5GKCeiNXtKf6A53yZI2pEbICXyqmBpSXulEpRMLM4s+vFJffRmXWPwFV
	 0wKG7YirfrVJb++TKyOlRKWLa//4sboVVCJOZUo4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgJELPA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 07:15:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:57700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbgJELPA (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 5 Oct 2020 07:15:00 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B77C206CB;
        Mon,  5 Oct 2020 11:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601896499;
        bh=byOyHb25XO6a9zA+76nGhRy3pYx2YIrog+eRA2qInos=;
        h=From:To:Cc:Subject:Date:From;
        b=RqHUf71fPDWNNdPM2UDmRAP/Z792CVULi4OvJg714IhmVcTOQkI5FZ8W/EKn9f2Sf
         evBUFr0ErbGaFe0b//XLEgmNXvgSekNpIFA4wPM8PxL8JWgdW7qG813i2q4lSHSyTj
         8hAzK+Fl9c4wl5C99Ya2XtX8flfGU6VIbpwUcnOY=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPOSH-00HLMq-6C; Mon, 05 Oct 2020 12:14:57 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com
Subject: [PATCH 0/3] soc/tegra: Prevent the PMC driver from corrupting interrupt routing
Date:   Mon,  5 Oct 2020 12:14:40 +0100
Message-Id: <20201005111443.1390096-1-maz@kernel.org>
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

Jon recently reported that one of the Tegra systems (Jetson TX2, aka
tegra186) stopped booting with the introduction of the "IPI as IRQs"
series. After a few weeks of head scratching and complete puzzlement,
I obtained a board and started looking at what was happening.

The interrupt hierarchy looks like this:

	[DEVICE] -A-> [PMC] -B-> [GIC]

which seems simple enough. However, not all the devices attached to
the PMC follow this hierarchy, and in some cases, the 'B' link isn't
present in the HW. In other cases, neither 'A' nor 'B' are present.
And yet the PMC driver creates such linkages using random hwirq values
for the non-existent links, potentially overriding existing mappings
in the process. "What could possibly go wrong?"

It turns out that for the 'B' link, the PMC driver uses hwirq 0, which
is SGI0 for the GIC, and used as the rescheduling IPI. Obviously, this
doesn't go very well, nor very far, as the IPI gets routed to random
drivers. Also, as the handling flow has been overridden, this
interrupt never gets deactivated and can't fire anymore. Yes, this is
bad.

The 'A' link is less problematic, but the hwirq value is still out of
the irqdomain range, and gets remapped every time a new 'A'-less
driver comes up.

Instead, let's trim the unused hierarchy levels as needed. This
requires some checks in the upper levels of the hierarchy as we now
have optional levels, but this looks a lot saner than what we
currently have. With this, tegra186 is back booting on -next.

I haven't tested any wake-up stuff, nor any other nvidia system (this
is the only one I have). If people agree to these changes, I can take
them via the irqchip tree so that they make it into the next merge
window.

	M.

Marc Zyngier (3):
  gpio: tegra186: Allow optional irq parent callbacks
  soc/tegra: pmc: Allow optional irq parent callbacks
  soc/tegra: pmc: Don't create fake interrupt hierarchy levels

 drivers/gpio/gpio-tegra186.c |  15 +++-
 drivers/soc/tegra/pmc.c      | 142 ++++++++++++++++++++---------------
 2 files changed, 95 insertions(+), 62 deletions(-)

-- 
2.28.0

