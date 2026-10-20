Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503590;
	b=e0TeKdLig29MrMO25lcFdllRXPbGNCFH1zvSFj9RWuI/FpDpN6Wh8rncYknGXF/mMCx/
	 WimJy5jBaFur13Puoy1NyOrwPA8PODZWC0jJjxk+bM+oGzrmV6PqKNOdS6V3lCvn4ECux
	 b+0+W0qPWA+8BJ8ZtCS0rdmAwqR5SnOyya8XxU74orLTceA8OWvXfeY7m7ZVFpKAUzDix
	 tf0UPNEaIMhrZ2ZLJi83Z6q7xejfwkk3E2k50UItEudP9QBrrKXIUbciQCp80/UuYjBz4
	 jLqviTyDXeJADNojtlaLWJexu5Jo/6RbDorgUZh+BQAyZpLFs6kY5i2g3459FELUwTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=fPd42FbzcDsqeOTm9tqOXQCc0xvhBAIaWnzJDNk+m04=;
	b=Z2gafURfmM+lk76+CR8mMuC9IpQA1H3wSh++quiRKlXbS3P2Aygizl463n4NdEQXEoTZ
	 OE8Nt0MWUotviuCqlEmfeE+sVqi9VsSiTkCFLH/2vQV4A4L1S4AgIdXbXnuuwY7uENdZV
	 FUtvGfZiu0ewemUpAQHIuQS5fZ+C9aT1wp1+sC3Qy02BIUuaIhkpRctlEDHHT+AGvjW3U
	 zBmxmG4OmhgNV1wCBhDPMrzhLWlL6/WbJ9YiJKzSHlrUdjpwMmTK19vfObH4btyjkzocb
	 lb2qzdWtYJrz9SXU80kWAE/E73Yh5Njs17PzqAollwWgM4dfb6D1m32pjEVqoOQ6smA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KZ4om2Kq;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91D0606A319
	for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2026 13:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D91D0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KZ4om2Kq
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so17058725e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 20 Oct 2026 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792503587; x=1793108387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPd42FbzcDsqeOTm9tqOXQCc0xvhBAIaWnzJDNk+m04=;
        b=KZ4om2KqUEcys5s+O1UNEsqVtMNuidnoZ57SSnawdxluVd+x2YjhinVg1mEPAbb3z9
         aNHh0E6CgKnHFCZd+IFPLtCQW8yYlNplMFRU0nUljjCoNfdtz7gVbTunuRnLlVCDfOL3
         ihObkjgmhYeDVUC/QwtP6WRh3hI2q1dKtqrqyPkU+YhRJff5gMnHEOl5rqNOoxLmxwM4
         QM6BIes8RVNIZlx29eG2kOKGdSAjBFicRGyX7oaT0zZ/Yc/uUpDeCuD57B3XrpOx1ma2
         OK59qA1cDHERUs3gcDZXVzqVFo86bAJ1R6063xxG0+709V8GICHobK1UY6sFnHUsWCd9
         di7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503587; x=1793108387;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPd42FbzcDsqeOTm9tqOXQCc0xvhBAIaWnzJDNk+m04=;
        b=fXBh7RR/Lu4ucR9qstsPPTexc4OMzKIRdfHseFsaol2ErDk7zetLz4yLX607CX4yOx
         EGXYA5O2xw/Mbc0pZCJZYVMM4mxL7U0Gk8G1+Lx5JOhTNgOR6RUz1RMA4XzAaNav7f5m
         K0FoBqW1a24tZQUozEsaK+aKaxUS05V4jtsq/pMhstKfitu5NOxBR16P0AvSC0w2zqOx
         OKKsbjL7Uqej4/7JNQSCsSIoBvtRkWxmsbgq0qZfVsfmY3AreaT2CWPdAHj4Yi15DgV9
         21WBBZ+53M32jyvxV2rQ8/mQw2PJp1ofK9PXhIFukB0TviY0KMLJcMUFKgVCZZujomyI
         qskw==
X-Forwarded-Encrypted: i=1; AKwUvBxw3Pg7K5hR1IrH7NE+1Cqu14IiaRxR8ttliGzmulEDd9lCZBKdcJmnIlmIskYKNLSDi0/JwufEx8AD0A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIyjcFI10jzzsR/oYQ5VEEFZyM6PIutgNvtVbu6ugEBabUxmZNy
	gnlIICa5tJMWEg3hEVQqln2Tv/XFXaMgAArLkg+upTc84WwcTqrV+Nzbx/fV8nUV9Zw=
X-Gm-Gg: AYBFou0y32TklKzuWirfWsIoS/vJaQfdpKTrqK5Nr5EAQS+/XYJNsgOnuf7e+0taLhC
	VCKC8Da/zMaCMMeRqt6Q7+f10P1Ste+90MLaKAJ3P8EuhswzvCxzIIYMqdzROdf5kPo12ddbuVB
	i0sssyE1VYJY3o7tvSUl+b1oe+7HoW7nVraIxKo4O5La1RiMxfJJx5JKXO9gXs88bvMNpEFLCwE
	kKwH5cfx6KIEFTyNuVTh+oHiJLU+j0GvIHMeR4Ux8HFz2afuSZLdsMAyThMG19oAeq+6RmC9rOy
	W+QHyQoAtwp9Sud3stKR5+xnRjeuVK//h2AVuys6KautcUWVIfxgZmN9/ljYrAobz3tUtc5EPcE
	zBQGQ9eo7ipy+/u5TbofgSMRAdx4pnikSnLoWRzwXkJxHy7Fc7DuphRK7vEq4Y+vhu94CSdQIUv
	K1TufKRjRFPQVnRO6vi9uV5Yfd+rxS8qVvMqa9cbNJ0xaIPIgz6r/BjmLBHIFQ1e0XMIyxEDorA
	jj87yQsDGiCemSEKUpui+KvvvRKmtJC+vfrSp2WT66OdNCz4RWBWITUCGT08A==
X-Received: by 2002:a05:600c:1da1:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a1d76011ffmr256944035e9.19.1792503587131;
        Tue, 20 Oct 2026 06:39:47 -0700 (PDT)
Received: from localhost (p200300f65f19a90471524a26f3674b82.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7152:4a26:f367:4b82])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1f2d1e8ebsm67893825e9.3.2026.10.20.06.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:39:46 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-pwm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] pwm: tegra: Fix value discarding for duty and period
Date: Tue, 20 Oct 2026 15:39:38 +0200
Message-ID: <20261020133938.191013-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4083; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Nl+6vIshBZCO9BQQb0mvw8kKOz2qIzEe0X9VABTydcI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq128b/6o0ibcltl0JTKFBP5dpatRSfF5DuSu2e nlALrT35E2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCatdvGwAKCRCPgPtYfRL+ TqrxB/97DCHlDuHmJc11BAGDIY4S/WFvSLiOG4Hf9XRrOoNk3Pf+AU0KoZOlDiMCBvBK//xp0Ki v2POIzD4KuP3gqbPb3PiD2FFMigDlyWqNxoL+IYZfYDQWWzoioUnzE3dTDUT7HaUHkrU+nKuCPZ gQvd+HBhBf6aPRJTHPq8ecWBAXkbSTswfhoo2jBWE4yLNFeQ7lotFM18IVxhNVCnhbHyF5sXZ6s x+DCbHvE3nOLkrsbmlSdkROBnhMJq6Pr+vM8vY+hHMPmE0uK61Abh2nvUsbNquZC76qOxrsdlvk xKVN0WNkJmiYwwE+54ax1msMbXfc45sp5tAL+5pshHWYLcoi
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

tegra_pwm_config() is called with u64 values passed for duty_ns and
period_ns in tegra_pwm_apply(). Make these parameters u64 instead of int
to not lose the upper bits for bigger values. If such a discard happens
the values that are written to hardware become wrong, or (if the
discarded period value becomes 0) a division by zero happens.

Adapt the math functions accordingly to not let the now potentially
bigger values result in overflows. While touching these, also limit the
scope of the required_clk_rate variable.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/bug/linux-5c5b97d6-4da6-4d06-9dc7-957419dcd832
Fixes: fd3ddd4355c0 ("pwm: tegra: Implement .apply() callback")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

Compared to (implicit) v1
(https://lore.kernel.org/linux-pwm/20261015085336.4181137-2-u.kleine-koenig@baylibre.com):
this adds more adaptions to handle the bigger variable types, as found
by both Sashiko and Mikko. I didn't think a lot about the
required_clk_rate calculations, but I guess the saturating math I
implemented should be fine.

Best regards
Uwe

 drivers/pwm/pwm-tegra.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 5cdbe120ba2d..6d468a673ded 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -138,22 +138,23 @@ static inline void tegra_pwm_writel(struct pwm_device *pwm, unsigned int offset,
 }
 
 static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			    int duty_ns, int period_ns)
+			    u64 duty_ns, u64 period_ns)
 {
 	struct tegra_pwm_chip *pc = to_tegra_pwm_chip(chip);
-	unsigned long long c = duty_ns;
-	unsigned long rate, required_clk_rate;
+	u64 c, rate;
 	u32 val = 0;
 	int err;
 
 	/*
 	 * Convert from duty_ns / period_ns to a fixed number of duty ticks
-	 * per TEGRA_PWM_DEPTH cycles and make sure to round to the
-	 * nearest integer during division.
+	 * per TEGRA_PWM_DEPTH cycles.
 	 */
-	c *= TEGRA_PWM_DEPTH;
-	c = DIV_ROUND_CLOSEST_ULL(c, period_ns);
+	c = mul_u64_u64_div_u64(duty_ns, TEGRA_PWM_DEPTH, period_ns);
 
+	/*
+	 * The cast here is fine as c ≤ TEGRA_PWM_DEPTH given that we have
+	 * duty_ns ≤ period_ns above.
+	 */
 	val = (u32)c << TEGRA_PWM_DUTY_SHIFT;
 
 	/*
@@ -176,6 +177,7 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * dynamically (e.g. Tegra186 or Tegra194).
 	 */
 	if (pc->soc->num_channels == 1) {
+		u64 required_clk_rate;
 		/*
 		 * Rate is multiplied with TEGRA_PWM_DEPTH so that it matches
 		 * with the maximum possible rate that the controller can
@@ -187,10 +189,18 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		 * source clock rate as required_clk_rate, PWM controller will
 		 * be able to configure the requested period.
 		 */
-		required_clk_rate = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * TEGRA_PWM_DEPTH,
-						     period_ns);
+		required_clk_rate = mul_u64_u64_div_u64_roundup(NSEC_PER_SEC, TEGRA_PWM_DEPTH,
+								period_ns);
 
-		if (required_clk_rate > clk_round_rate(pc->clk, required_clk_rate))
+		/*
+		 * clk_round_rate() and dev_pm_opp_set_rate() both take an unsigned
+		 * long as frequency parameter, so cap required_clk_rate
+		 * accordingly.
+		 */
+		if (required_clk_rate > ULONG_MAX)
+			required_clk_rate = ULONG_MAX;
+
+		if (required_clk_rate > clk_round_rate(pc->clk, required_clk_rate)) {
 			/*
 			 * required_clk_rate is a lower bound for the input
 			 * rate; for lower rates there is no value for PWM_SCALE
@@ -201,6 +211,10 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 			 */
 			required_clk_rate *= 2;
 
+			if (required_clk_rate > ULONG_MAX)
+				required_clk_rate = ULONG_MAX;
+		}
+
 		err = dev_pm_opp_set_rate(pwmchip_parent(chip), required_clk_rate);
 		if (err < 0)
 			return -EINVAL;
-- 
2.56.0.rc1

