Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645465;
	b=EfGn9bcXwmt1i+kFmuKtuj3e0b+ZOZqaEf8wyq4K+E+aUxeocyvBdNfq8Roh6ZGrGkaB
	 Pq6PiQNLxAIsquExAbgMKIacTtvtc5x6lXKfEhgrpud8I5eMASsjH9d8tqMO7wBC+ira3
	 MqoyVblt2aRYYEz0nBInIMERJEyn263Ds92qIC98//KZTDZ9pmZ01ETiTCmPRKjsm7ZL+
	 xZtcurb1suUGd3VNzhLKMVYeUsFAVhj3TxsF7hMtZnKZKNyRKqOFSSJp3+iFLwzCdDwlt
	 Vob56Ma0PQ/4a4r7n6q8YWTuh4L1+IY0U1pfnh76QBe06RLqFCh7y0vU9bL2YWliD1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645465;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1g3+XIdmqrnwOp9VyVcVBy6/pFcCdsbyu5huqCYHwpE=;
	b=PxkTbHy3ZWePjhcrqVxhsciCSRyiRu8zC1TwoG+TElPwucQ1WV1Gyb+U6cYehXxHwmNM
	 6jDvvuGGzGFQpW+SOisBmm8L0baAmbdKUY59MlFRO1KqZ7o/p2J7tAIxesJdgZr2o9ybZ
	 Jf4KsfIzuHn8iRT91E58+0MB5RJFAZ7qHw7MEuUvGhtFE8N1dCgf2LfOex4uuBXjOQ6tr
	 dvWIB9s/zs/8V/0NtaozmhgRaEJIRNlGRzMW0h38OLmklYXS3ZwPyYWzRl4SzZqhmhUxJ
	 zth2vKvUztetoVT70DBoxlb0nfWSV5mzNgdEoaZmPBJcDPwlvr+7AjJ0+afkCm5aN1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oyrhY7Nb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A767606A321;
	Wed, 25 Nov 2026 22:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oyrhY7Nb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5ADA1F00A3D;
	Wed, 25 Nov 2026 22:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645465;
	bh=1g3+XIdmqrnwOp9VyVcVBy6/pFcCdsbyu5huqCYHwpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oyrhY7NbZjXXvlmuTAexSr4d/2ZEfKFMymrizIaAY12hV2q5A0lgzZm/6ZHj9ClDm
	 w8TIYZTizGFhnPfgKGmql+nIbm5n11Xywe/EFDXq6+AJzdWkVJn3jUCG/78ZRGfJrF
	 t0Pt+bfQp4IdCj4aiCSs1axpfjpQOE6NwataK9ew7KAKqPRlCw2wxnvfyBcFTykeOX
	 pXBP8sru/lp3uzNHeHjpZm0sU35dZM2ORurfpcLJqEEaufKfhgFd2cNgTK4BJn0Exx
	 V0UyBWS4RAjuzR8iPJbc24rpZPSXIh87UTgYr82SXQGqXvH4nrxeWReWR4AjqZ0lwv
	 Z8j7ksLGDwATA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-tegra@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 29/47] clocksource/drivers/timer-tegra: Move CPUHP_AP_TEGRA_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:12 +0100
Message-ID: <20261125222230.22508-30-frederic@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125222230.22508-1-frederic@kernel.org>
References: <20261125222230.22508-1-frederic@kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while temporarily stopping/pausing all CPUs
in the system. This doesn't mix well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index fc29c33a03e1..27acdd9800cf 100644
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
2.56.1

