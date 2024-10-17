Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C1E1DF985;
	Thu, 17 Oct 2024 16:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183867; cv=none; b=dsj+aUT0PIuY4kKtMzc1fWHNjcTs9wYB3gM5cyNE/+t+38OqrxPYh0Sn+VgMGvD2oUYxV+kbCFwmkrpT/RjKmk1CCwXVV9saNpa3Me4p3xss0diB0zb4JHTVfFYlocqcLqq8TOLvhNohH3zRkthgMzzg5f5TJ914y/YHfapb3tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183867; c=relaxed/simple;
	bh=qWttzDemKi/gYPJZ/lRMbh7Bi4m3BbF9VbCZIpdWK8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ndp8tWqAknIVXFXZn8gFyiksRQAGxuanK2d/f6i13i4RZ7PrsdbL2d6CFNMCsPmlch6bPtJkm/3PFXrtHg6SmHCKktfgZVDSK9KbiBco2aaewoRMM9EyBWp7w+WDfka8v+Y1dM9hmJOoqOA3NlO0Vv32dlA0Ht2KT3m+6Mvrvvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIsCIWEv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIsCIWEv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287F3C4CECE;
	Thu, 17 Oct 2024 16:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729183867;
	bh=qWttzDemKi/gYPJZ/lRMbh7Bi4m3BbF9VbCZIpdWK8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KIsCIWEvkznDlw5q5sG62VX0pnuqPxncDE+0xrbEQ22SAc+DdQp/m9KysEfAzMGvE
	 uq/H+HAIRs29EHnwZtffWCz8RsNLOkbgVqiNEGV79xVC43GXrkdzluhy+KPkDU3iNY
	 bHp2uC/N0BhK7IGPJqBkpLVmYBDtlTcbAbpdiN2yPv75hay+ap0HeHXG6v1RlQixEH
	 pY2B4Sz9pi74MSIThIOIUIXUaaK1eFErtGkh+F/Yb9GGk7vUgZkstFR8I1QBPJphMw
	 q/t2h07bx5J94OvPjqIcIGO2PfHA6nUrJh2TZpy/bWJJDFINbCsYrlLZujBFIzlEc1
	 qbqtxRkatBlNA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH 10/10] drivers/clocksource/timer-tegra: Remove clockevents shutdown call on offlining
Date: Thu, 17 Oct 2024 18:50:41 +0200
Message-ID: <20241017165041.6954-11-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241017165041.6954-1-frederic@kernel.org>
References: <20241017165041.6954-1-frederic@kernel.org>
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

