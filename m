Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC017C48BE5
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 10:44:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CF2D613BA
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 10:44:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbhFQKqX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Jun 2021 06:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbhFQKqV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Jun 2021 06:46:21 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078A3C06175F;
        Thu, 17 Jun 2021 03:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=IohCMyCwLQNiwDAEmAYJzQsgursOeE+GX9lSyPBU/Mo=; b=BLktE7PiCNGwZTg8bAJT9JCE52
        e1+/luEIBf0ZS8nKmxMHeargCS49jzZ4Q2/OXsab9fKD/uGFoD1HLos7NwILTyURYdG+mJmWWXwzh
        cbSgrCDWydLlkxvQoN/twtU8fVz5T5dTmES+dqd1fCoshWyxYnLp3iiP//Z9GR9PcK45Wt9o+8LXv
        tvVULDOm+A3JBiwVi2x3G/xWnJv8H4gSfbRg93ZUykfg8vr61thKT52HaFU0HUcCetbwni7UlVW1j
        4Qdc6srEWBc17mvAhspYeolFGUmSCTxZ2JOYbuvrdQwK1sMHFIsPR8bqc0CsTZmzPxBSGEBKq2PgJ
        I42+6qrQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1ltpVH-0006tB-Kc; Thu, 17 Jun 2021 13:44:07 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 1/2] arm64: traps: Support for registering SError hooks
Date:   Thu, 17 Jun 2021 13:40:52 +0300
Message-Id: <20210617104053.765434-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the ability for drivers to register SError hooks to be run
on a fatal SError interrupt. This allows printing of system-specific
error information to aid with debugging.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/include/asm/traps.h |  6 ++++++
 arch/arm64/kernel/traps.c      | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
index 54f32a0675df..054fecfa22f0 100644
--- a/arch/arm64/include/asm/traps.h
+++ b/arch/arm64/include/asm/traps.h
@@ -22,8 +22,14 @@ struct undef_hook {
 	int (*fn)(struct pt_regs *regs, u32 instr);
 };
 
+struct serror_hook {
+	struct list_head node;
+	void (*fn)(void);
+};
+
 void register_undef_hook(struct undef_hook *hook);
 void unregister_undef_hook(struct undef_hook *hook);
+void register_serror_hook(struct serror_hook *hook);
 void force_signal_inject(int signal, int code, unsigned long address, unsigned int err);
 void arm64_notify_segfault(unsigned long addr);
 void arm64_force_sig_fault(int signo, int code, unsigned long far, const char *str);
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 273066279bb5..02dbaab71ea3 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -890,8 +890,23 @@ void panic_bad_stack(struct pt_regs *regs, unsigned int esr, unsigned long far)
 }
 #endif
 
+static LIST_HEAD(serror_hook);
+static DEFINE_RAW_SPINLOCK(serror_lock);
+
+void register_serror_hook(struct serror_hook *hook)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&serror_lock, flags);
+	list_add(&hook->node, &serror_hook);
+	raw_spin_unlock_irqrestore(&serror_lock, flags);
+}
+
 void __noreturn arm64_serror_panic(struct pt_regs *regs, u32 esr)
 {
+	struct serror_hook *hook;
+	unsigned long flags;
+
 	console_verbose();
 
 	pr_crit("SError Interrupt on CPU%d, code 0x%08x -- %s\n",
@@ -899,6 +914,11 @@ void __noreturn arm64_serror_panic(struct pt_regs *regs, u32 esr)
 	if (regs)
 		__show_regs(regs);
 
+	raw_spin_lock_irqsave(&serror_lock, flags);
+	list_for_each_entry(hook, &serror_hook, node)
+		hook->fn();
+	raw_spin_unlock_irqrestore(&serror_lock, flags);
+
 	nmi_panic(regs, "Asynchronous SError Interrupt");
 
 	cpu_park_loop();
-- 
2.30.1

