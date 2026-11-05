Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896345;
	b=siwkpzyQdLAj3yf0+eeBO1oCWbrBmI4rlxlaLbHyxetAqNYBjOsxuXTpoUaIRgs3T23f
	 hHs7fqWTV2/h/k6/vBdAcxiKwwp2407tv4hfqOj64TGTnPuMI/lShJnoHH/85PwGlGNlv
	 aiNxGq4LrHP8e9mdZDU0w9wUGHwwd8tcQiCrM4KYTVqOavlc9eA1LvyK3jdsRKJRHBDYz
	 EKY/8IwtpkVS2kblMISvZCH6PHzN+pOCM3Xszpb1sSESrMCkap+adjZxeHXQ9mO4T80nb
	 KK4WjWQDCYQjYHuU1C5MThAC8Z9fg1nN9ubZp04NE3IWBGAZJT58DNG9lk7dN5LIYIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896345;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kB1qSrsq9dL9glQ48Dry9Uw0Rw0rIyUB1Th14BJXpTQ=;
	b=HzxJB/ecGvmbv6cmQ8wvvHC3BDd9fm3vBJZMay3Eu/AoqPTaTWem+xll9uAuSbZT4Skk
	 9izjDM9Gt2MlNR/3ZyxRhogqeyLyXIM6kNnu7/T5lsz4R01rE8XNRMT2BVi2Rco3jowJS
	 mhzNyWNQYqWhRt6tL/4y5Z0AGkkD8eyS1menIREVfGT/q7Z4wE1rpsG1oPOs5i9inC4OF
	 04qBZ1eYuqhT6TVlXb0iC0Q9Qwad584ls7M3jckwa6owP2eKOZaXeCA6zoSfETuKck22m
	 pnYQx4OnV0ATulhWOWP9Zc/ys13zu9Gb95nRE7CvQi4CcWtyLZSXpIGXn/RDxFOUe7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AnKFXgO1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698E8606B3D1;
	Thu,  5 Nov 2026 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AnKFXgO1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F091F00919;
	Thu,  5 Nov 2026 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896345;
	bh=kB1qSrsq9dL9glQ48Dry9Uw0Rw0rIyUB1Th14BJXpTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AnKFXgO1ig/vppU6chuVjQe28C2jBvepgkgfBTiO9OWXpT/3jcFN+MDOX7VO1Xx0G
	 pwg6wdZqh33e0emipvTXTshuXVxFVRLuQ7xOovCq9AeCO7V9Z5oolr76abFznCDSdt
	 Upf99qiUYgo1RV1oSgbV1CSmfqvtQ2M6NqGCSCIWePRywKF2/CgfJU8d7ggqa3WXTk
	 9dbpyvh/KtS4iFoQ2lDdV6S9THuh2hntiZ6/ILmr5KQppYay3MHraOY2h0kADtDuBl
	 qBkvkCtyPi0aOTihXZAxke0qmlceed/EkdeKb5Oy6GNB/TfYAwfvMCD+LCaRT2IYry
	 /uDg/eryysgUw==
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
	linux-tegra@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 29/47] clocksource/drivers/timer-tegra: Move CPUHP_AP_TEGRA_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:27 +0100
Message-ID: <20261105163045.38862-30-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
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
2.53.0

