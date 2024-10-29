Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37101206055;
	Tue, 29 Oct 2024 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730206517; cv=none; b=TV5LOPLSRd0HlY2Io1awxR6qYo0mBL1x7aLnLUoTvaklaB7XeowiA5PPzOR6C8ljxKRmuTM20FJdvUv2oSz6WobtKHADiJ/kW3sVy21JL91MjqAw5b4GadSjpKW4HyEt36Qgnez3Ay0ruyvhw9vyQd8bsU1kUqPJl2u1MF0lOt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730206517; c=relaxed/simple;
	bh=qWttzDemKi/gYPJZ/lRMbh7Bi4m3BbF9VbCZIpdWK8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zo0lN7LNLqMk0RZbvwqoUTRDzAhuEaWiCRLS4b5LJJ+3WjTQhSEPwD+TsF5TWirFXEb11+Ok6syZuhjkRth7nOoiEh4kwsdpUbvCy1RvRUNoKT3p4G9mlOJr6KtD44l8v+qXxeigX4x18bCtdxpG51bJQDz045Aif7RetYi4gMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+vkkt84; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+vkkt84"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6BFC4CECD;
	Tue, 29 Oct 2024 12:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730206516;
	bh=qWttzDemKi/gYPJZ/lRMbh7Bi4m3BbF9VbCZIpdWK8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R+vkkt84iJt6qRU1rNq9Md6Ch1fRfLk62dlQlIcsfYMB7Bj4riaudTmGG1rAVHIvb
	 9j7zh90osaa9ghJz/f2R9CE4MYbY1+nFR+Zec2N/E2cPudPI7hXo1HsReI/Q0W8BTn
	 t6lrcWeu83IV++Wno0yoIED7UTehjPdHkfHlrigdX8qssLCI1DZsAWQZ+YVvbywYIA
	 lqjvJj/WVDzqGOfSQR230VUAivLxldmXko14Kbb9YLH96/BfMpK2BwtJh+wp5bZ0oh
	 Po2XsorQR0PcQv5FkTMVRuyzylRJTDVjOKwOohHSH3pVcv1sprsMVQMbfPgyaz4J3J
	 rjtd5m/dQMa5A==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH 10/10] clocksource/drivers/timer-tegra: Remove clockevents shutdown call on offlining
Date: Tue, 29 Oct 2024 13:54:51 +0100
Message-ID: <20241029125451.54574-11-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029125451.54574-1-frederic@kernel.org>
References: <20241029125451.54574-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clockevents core already detached and unregistered it at this stage.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/clocksource/timer-tegra.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index e9635c25eef4..35b6ce9deffa 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -158,7 +158,6 @@ static int tegra_timer_stop(unsigned int cpu)
 {
 	struct timer_of *to = per_cpu_ptr(&tegra_to, cpu);
 
-	to->clkevt.set_state_shutdown(&to->clkevt);
 	disable_irq_nosync(to->clkevt.irq);
 
 	return 0;
-- 
2.46.0

