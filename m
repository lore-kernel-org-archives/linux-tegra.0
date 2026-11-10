Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314360;
	b=st2AGKBJ9DqoJ2mrCeDe7N1bIiIj14HfDYe59+qv/GoqhOOn6iA41ssmA6SWYLRwwSwg
	 3CpjqVhv5FhHFwqRzp80kGFsuY0xX3WHhHLih2aZyU10bz+wUBgVxl5P2I91XE6XIjKxj
	 +e7dq/nl11ayxi9oF4zzOg3EstguATTDcGjZGq3ndHlw0bmV0i+KtwHVxC+zoxcfhOAXX
	 F0TwSOHeq/BvKF66HVGnysLIxbyl8oVW/5V0nhqWQeZZCUiY6B9PrEmkg2WWULPDeYzBZ
	 pkvHi8I1qLs5M3CflnvU1MCozl51rWMwtY67LU0GhUtPgh8n8BS3PijjZdBFLEI2bwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zEh9TUI1DT/5Pb9w5RL+1KRr9W5nPaYLjrCqPNIyvBY=;
	b=w3KsYKRqmOIjESTfEKlFjMV28vicLvXLWv7SLq709Wtx8kaOB863Zn3vnbwvOOsj2j8G
	 Dx4Y1rbls5n8i2nJ1920yBQMD9sins4NJGjxRJmTa6n6Gf9IF1CvUqbYzC4HiOqkQ74Y6
	 OIpxz8mqLnnXIKbf/Y2WHR9oOEFFNZpOyUeihiLKlXDtrAZg7zPmF5zKcVT0GM4XfCmrh
	 ZWEEmWgzfyDooq4KQQIp62rkrKr1YGmNArC+j8tgOU0Y5upfumYzMHPibhiYQxQcU+aCU
	 0Y+CuAudWFxQfgQqxZz8JFeCRDH/x/26X1kKWXADTaVLphjyubVLBXWbgisv0uyEeBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9bIZY3r;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C75F606A339
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 12:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C75F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9bIZY3r
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b001cd92bso976575f8f.2
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 04:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314358; x=1794919158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEh9TUI1DT/5Pb9w5RL+1KRr9W5nPaYLjrCqPNIyvBY=;
        b=a9bIZY3r/0kIw4LRbHpWsqgbVQUtMOP0I0hJgtqA5g3HvzPWMIHc0fBqcqygTGOYvY
         r9cgs2iOy46z4D2wZq74ibhSOuTzqKXxhfZMedMltRXeMb1VxzXA1jseAYEdovA6ny3f
         dcBrDDS5fWZZdpvyJpPpOK2h+J0esGMJCsABCT4KR3p/5nhve9Rns7REwKjX34zRW7/4
         HMZl0gw1iW7TNgQcynwpQyBJsvENJRSg44TLIPV7Fonw7a6jhc0ptlcakVHj+v76dWq1
         tCVyE+2hLxb3tkHxA8SXQ+p3sGUWFW3TEsGys1umnN0+yyyJl8Rssnt/IRhLoyrrbwzB
         N3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314358; x=1794919158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEh9TUI1DT/5Pb9w5RL+1KRr9W5nPaYLjrCqPNIyvBY=;
        b=WxwEHzd4KatRBlWcuDoZOgH2NWEscqpcWdgwZ9pdzzHnXPvIvNT36NE+kWxcFPajkk
         lkuJLWhBVzWGXE+2tfvekQ3EW3I4sJRrG5I+PABLJpHcpg+Gw5JGlLRvexc0TvWMwaFn
         K7YxPY+s4KUA3V2j98eVAXH0RsZ8AUasKdHA3RgIVP9pvR22N2TG/nIZ7lBnxsengmt0
         E0q4Ppx0my5Fc0BOTWayat1riChQjGXiUAPsy7KvTAM8SOq/Y/ReCR/pfpXAQSs2w15l
         78TsdSv0vs2VNOFbnfhNsJlTTP9XAzoPLlezpu/RWEpA2mr5NxEYl6hHIFYrQOeL+nnK
         Rjgg==
X-Forwarded-Encrypted: i=1; AL+hErELIbykWcKvOKKAjK8uHT5wTbiXPP2rZbriuEC708YwraWBDTgj4UPgfxRl0PuNLFCb0zd5a3JNXq0UfQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8FnDOCxFyPWUMkTPWxz4TH92usK5BWa1JVhGLbsAoe8Q5SFexG
	3C3b8Gdx+V6+Cu95SiW69ekESEC7losxr44Mjrucn6KL7MHniUCgIu0f
X-Gm-Gg: AYBFou2o8dvJs8OjDz4Jso2OtP5y7+xk9E98BTk2jqLjf0lIPwpb0PjyHLDvivfk4R7
	q12Yz+zNCoMD+M9uGKTf0UQ8Mnsxyc9B+BjQJKnZU2ix97d0iGlLRGcaAY40D5ZizdOGWDYZJHL
	w+0YEskndvxhtJycassP9abfWy87JxWfhG6kBeMM2a9E6IMxzz+fS0RKUN7/Q4S9Q97VIxCeqBB
	93mVjlCjQoKFz5lpJZdzT6FVYeZ8UL1Fz3forB4NNMGfr1hZ1upaVp8IRbZkre5/nOiw0sWQ3xA
	CffoxycXmW0bWTZjjhpYMJHMlkw96D5EZp/VDDDNjS0/qHQk6UTuTbgsaYQG6W9SS5O/O8XEhUr
	DsQ6+0KIwW2xV/AP5s/1vUKT13U2/h/8ZwkAawsRXHghOD7zIQEyvNrYgwpNEoMswCuoq5TQbOA
	rKBeWjtwbE/1ICERlCcC01qUZMd3kvs40PW3wopasOuDV64/PNmoYD0msDbYayE/WEDZhYvzt0z
	/y8Kf3u8NOeCYLvYwzetvN/H5NjqJ30+RK8mPHW0uqxfY5/WYg8hXrFxdfA6A+P4vFq2KWPKDsp
	Ed42vy+k+EiJlUf4XxoB7Jts5ymLlgRNoQYgWsmI
X-Received: by 2002:a05:6000:18a8:b0:48d:f3f8:f910 with SMTP id ffacd0b85a97d-4982f1bff16mr5087805f8f.34.1794314357838;
        Tue, 10 Nov 2026 04:39:17 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363e0019sm5050033f8f.38.2026.11.10.04.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:39:17 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 10 Nov 2026 13:39:06 +0100
Subject: [PATCH 1/6] clocksource/drivers/timer-tegra: Keep Tegra20's
 watchdog timers free
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-t20-for-upstream-v1-1-5923449951fe@gmail.com>
References: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
In-Reply-To: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5044;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=Etu/NoLu3WruVoZPzD/Ywq8Sk7DCe6Ijb/ULtQBJ5v4=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQ9ZngcL7L79FeBWs8feY9O+8qJKg34L9Pos/JxWY3d5rk
 rHuhPbXjlIWBjEuBlkxRRazh0JfeOZ5vd/wcmsnzBxWJpAhDFycAjCRuycYGf7MW5tvwzmnUvJy
 ite/gzsNdm2+LrVIhpffddvHI3O+HJ7JyDDz5tGoxFPuQR8XXmL1nf7HM4OPYZtZUb5BfHTgs71
 8FzgB
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

Tegra20 has no watchdog block. Instead, the clock and reset controller
resets the system when the interrupt of TIMER1 or TIMER2 fires while
the previous one is still pending. A bootloader can start this watchdog
and leave it running for the kernel.

Since commit f6d50ec5f85c ("clocksource/drivers/tegra: Support per-CPU
timers on all Tegra's"), the driver uses TIMER1-2 as the per-CPU clock
event devices on Tegra20, where it used TIMER3 before. When CPU0's
clock event device takes over TIMER1, the clock and reset controller
still resets the system if a timer interrupt fires while the previous
one hasn't been handled yet, which resets about half of the boots
early. If the system survives that, the watchdog stays enabled but
never fires, as CPU0 keeps clearing the timer's interrupts.

Use TIMER3-4 for the per-CPU clock event devices on Tegra20, leaving
TIMER1-2 to the watchdog. Tegra30 needs TIMER1-4 for its four CPUs and
its watchdog uses TIMER5, so keep its mapping.

A watchdog left running by the bootloader is then no longer disarmed,
so it resets the system unless it is pinged. That needs the tegra_wdt
driver, which gains Tegra20 support in the following patches, built in
or loaded before the watchdog's timeout expires.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 40 ++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 35b6ce9deffa..0f63bf8bd706 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -208,10 +208,15 @@ static struct clocksource suspend_rtc_clocksource = {
 	.flags	= CLOCK_SOURCE_IS_CONTINUOUS | CLOCK_SOURCE_SUSPEND_NONSTOP,
 };
 
-static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20)
+/*
+ * The timer used by a CPU is TIMER1-4 on Tegra20 and Tegra30, starting from
+ * @first, or TIMER10-13 on later SoCs.
+ */
+static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20,
+					      unsigned int first)
 {
 	if (tegra20) {
-		switch (cpu) {
+		switch (cpu + first) {
 		case 0:
 			return TIMER1_BASE;
 		case 1:
@@ -226,10 +231,11 @@ static inline unsigned int tegra_base_for_cpu(int cpu, bool tegra20)
 	return TIMER10_BASE + cpu * 8;
 }
 
-static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20)
+static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20,
+						 unsigned int first)
 {
 	if (tegra20)
-		return TIMER1_IRQ_IDX + cpu;
+		return TIMER1_IRQ_IDX + first + cpu;
 
 	return TIMER10_IRQ_IDX + cpu;
 }
@@ -248,7 +254,7 @@ static inline unsigned long tegra_rate_for_timer(struct timer_of *to,
 }
 
 static int __init tegra_init_timer(struct device_node *np, bool tegra20,
-				   int rating)
+				   int rating, unsigned int first)
 {
 	struct timer_of *to;
 	int cpu, ret;
@@ -297,12 +303,18 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
 
 	writel_relaxed(usec_config, timer_reg_base + TIMERUS_USEC_CFG);
 
+	if (tegra20 && first + num_possible_cpus() > 4) {
+		pr_err("not enough timers for %u CPUs\n", num_possible_cpus());
+		ret = -EINVAL;
+		goto out;
+	}
+
 	for_each_possible_cpu(cpu) {
 		struct timer_of *cpu_to = per_cpu_ptr(&tegra_to, cpu);
 		unsigned long flags = IRQF_TIMER | IRQF_NOBALANCING;
 		unsigned long rate = tegra_rate_for_timer(to, tegra20);
-		unsigned int base = tegra_base_for_cpu(cpu, tegra20);
-		unsigned int idx = tegra_irq_idx_for_cpu(cpu, tegra20);
+		unsigned int base = tegra_base_for_cpu(cpu, tegra20, first);
+		unsigned int idx = tegra_irq_idx_for_cpu(cpu, tegra20, first);
 		unsigned int irq = irq_of_parse_and_map(np, idx);
 
 		if (!irq) {
@@ -376,12 +388,13 @@ static int __init tegra210_init_timer(struct device_node *np)
 	 * after CPUPORESET signal due to a system design shortcoming,
 	 * hence tegra-timer is more preferable on Tegra210.
 	 */
-	return tegra_init_timer(np, false, 460);
+	return tegra_init_timer(np, false, 460, 0);
 }
 TIMER_OF_DECLARE(tegra210_timer, "nvidia,tegra210-timer", tegra210_init_timer);
 
 static int __init tegra20_init_timer(struct device_node *np)
 {
+	unsigned int first = 0;
 	int rating;
 
 	/*
@@ -398,7 +411,16 @@ static int __init tegra20_init_timer(struct device_node *np)
 	else
 		rating = 330;
 
-	return tegra_init_timer(np, true, rating);
+	/*
+	 * Tegra20 has no watchdog block. Its watchdog is driven by TIMER1 or
+	 * TIMER2, which the bootloader may leave running, so leave both to it
+	 * and use TIMER3-4 for the two CPUs. Tegra30's watchdogs use TIMER5
+	 * and later, and its four CPUs need TIMER1-4.
+	 */
+	if (of_machine_is_compatible("nvidia,tegra20"))
+		first = 2;
+
+	return tegra_init_timer(np, true, rating, first);
 }
 TIMER_OF_DECLARE(tegra20_timer, "nvidia,tegra20-timer", tegra20_init_timer);
 

-- 
2.56.0

