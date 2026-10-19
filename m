Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32B7501280;
	Mon, 19 Oct 2026 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415429; cv=none; b=QiPaXjKvdHqbyhsLnz7ZQDTr4DAp2SWUtkBQcZWuMgg9ohEf9YZKgIONCyxZBNBiU5vzT2u0tLkO2ZkHPHoSJ6vzsJ4mWD6ObfPYFWI4JZAbb/Ld9+hkHoFhOrYpBuM1xutfuRL8S+7iVkoZPwIYSolOtbKkRW8gZi0ajq0Kl3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415429; c=relaxed/simple;
	bh=uif8PT5tEvCG6rwn1Vktr0k6x1pfXsbOJFzkYRACYkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mj/lEjeWIyWofom/i27UWbfMlKhpcQ7FLU8JD4UpOp048EF23TbVLw4I9uN4jDH4wUMzp6dW1lnZtHC5GlXLviqjm1FDVvtZ5KtQBAjgcaqPlBAvxYze9RzkGCe1LYff8KSXs23BeMbDoGG0QVdY2KLTlM9aEcM2t3q7c/7Irv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2EskNi2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2EskNi2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961871F000C5;
	Mon, 19 Oct 2026 13:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415427;
	bh=bG6NEh8JAP4sj5vYhjog3QoeV7vcUi3tTO8Y/Lh2DHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a2EskNi2MF6dghPW+V7nWJaC14Gwn6PwL8SfJXbacESB81hKvB/+RdylsyRPy47D0
	 qm66EGDmJHJz4r9rDTy4SBrZXwIAROSQ8jsLpUTc0mocF78t/JItk73lB70+lUh5Ls
	 eLbiT7xx9jS0qMJ2Y3Qu7kBK+eNFPwq6GHsOf/ihnfLyz/Ah9ZvNbqBv+yab3gtDCS
	 hxgnDJTjUvvdvffDK2DKT0oRgLwzvqPmHaL/ZsYBm7vKEpIPMW8X82HhFsGghnzcyL
	 KO3dnRBu110oPj/vPizuTHqAl0cxOBJxIkYv0Gjw072FA0jeW8Q5tBKljZRpkgvFea
	 40AZcwOQX0qyw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-tegra@vger.kernel.org
Subject: [RFC PATCH 29/49] clocksource/drivers/timer-tegra: Move CPUHP_AP_TEGRA_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:36 +0200
Message-ID: <20261019130856.49711-30-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index ba90e385d31f..6377149f6a5e 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_QCOM_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_TEGRA_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_QCOM_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_TEGRA_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

