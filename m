Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038963876DF
	for <linux-tegra@vger.kernel.org>; Mon, 13 Jul 2026 11:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941354; cv=none; b=FNHVypIv6Jtb+Nt+R9Bcza/A5MG+AHXGztpF0GfW6OQ6Dn3YCFQNy9l9/BCSXbocVDRD7TqD2fTHez4x3a32vbUS860B06MhBFotj5RoD74RQ2rc4GYTrvQYknjNLox4xi1Q2XtptRhcaVI64W7JcAKoBMWWy2cZtDb6rIGzWQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941354; c=relaxed/simple;
	bh=cBx1EEL+CNvz6d4aM5+hJilvgtigJnSGqH4PY33enU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMtcH0z7lm1HKVq28lYsS9CI4UsbFTL+4fdj1U19BWoZb3hEWnVQMuG9Ys9HWeDNTxhTz2qCFr/XqtwY+Zg/MB+3b+kSeRzPI8B/O0ioq/4GgC30HpT0VR6TVTfhNPskzRS2KSuzA/8ThcQPMSbSEwvnBfFHqFhfTj0coPud7kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9IxelqL; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9IxelqL"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c62764c7cso33073811fa.0
        for <linux-tegra@vger.kernel.org>; Mon, 13 Jul 2026 04:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783941350; x=1784546150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FzDrRG60vMmalVmM4BYOfa6FjIC2MZZeKx4nlMzZts=;
        b=c9IxelqL0d2MTnm0ZjDA/S2tnAquSFiWsAGOciFj7mv4tjHL65z2cI29CV5DJjUveM
         CAviILT6sjMfgq2wSrU7g0pxeilxhDHcxRQD1Rpfibs7xeht8NMLah9dAt75RBRTKUsK
         NV7OoYVNF4ORgycr2RWvVEypi3nNpwXLxbqoAlPSdetqxAEBOzy9M2o4BOXuxkHH8z7+
         thOIvHvHMRFvqN97zdpsQIkBumpA7d7n+ks1xzSzMD4Yy0U4hUEBObHD9XSqX0ot26UI
         tZK7oBwvsPuE7W9gOZohBDojNwP42VmSL0I4x1f+Bf5dtx2MYlio0O1mYTSDZkfRslR0
         KqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941350; x=1784546150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FzDrRG60vMmalVmM4BYOfa6FjIC2MZZeKx4nlMzZts=;
        b=aEdN9SzF/feD+UrAFBYpC5fka+w0kdaM97COKv//p7f7TX9rXsjAUcJYNPRjj8GtK4
         hYKUOGpa+UFi0PcJC9apGKklcR9n+fWSAYpAeKKQL32X1YFvgJhbS8rN7DEZSPe2fJan
         nw4ZHO4JgAJE6DfbavBht8tBJy0yNuZeNf+tsj6SXFODXWLgUKNE+vXZ9GSOsQ2x0ayz
         PTDXilKRLmcEggXMlVzZYN83d0QuhbIybyuhJbgPQkA2QSd6ZTU977ZY8mnNf3lCRjnr
         Dfgu54lDXzc9Ps3YHn3p8kbHAenai9DUXl1usTVVyj/cIXLqFAj+yhoLJDFt+CF3dVtz
         j05Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr97YKlLdmTQpIdeaQ1UDNBCeYUwytNOr2jS09dY0N+8zEXPe3ckIQ8DiZN7+LF5/lNAzAi59+ii1cqFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlC+SYdInDbVrHRSe266M4TqZwBfEWq5NUxYnev9w3EUBIPZ60
	X5hs6nHqjiEb0zaUclkGpyjmQUJ4ta1qlARa8Bfv55aNaK/3ypJ5ZEDa
X-Gm-Gg: AfdE7cmvwgSgrQ42jAN6063V8MfKYCfMZ9PpSAWvFGhx2ZhyaQMMyLbYDCRKw51XteY
	zGliAI2+EwkCss8yY4Qk9SfOu2Ft57yrVJmacN13R566tkha8YR9gNKsE4yp6T8k8DhTXHVbjbU
	DSP/1Gg3/IznFe8mMZzApo0N+gBcIBekS0DQNIIW/k6VKrAmLo1z+hvybGSq1QIvNYUFCaubnSy
	3qgQDE5crWIdBn01ur8zLtLKFntogWPMqTGSNzy802C60KOd9k80rpELJPlOTCpFjV/j0M0m+Ey
	eGI/bn2+qp7P2GA7jqvLIcXqb4JdvhUwf1sivjvbluYkwL6ET/EYjDLz7CKytQjVyTUCZd0zatH
	V5w6h2diBYYc1IGlSqDEYbQDGCHXicTlh+qf4zHiFW2gnfsRT5hXHlex0irFuicg8NnjDqiU9/t
	3uCeXIpVzYpbKH7lU8QYraK6wdYgCMmLR4aPCiQPcUcOEywpodiZ7V6Uvcvwl6HAuhrODgf0Hrz
	kmsuVuRAd9XpszhSqyULeOH43jDWSoLkGptvsDEUm3B95FksdP0aJ/BKV5JpZ+5B+M8YjmY1Q3d
	CQxllO2+61Vg
X-Received: by 2002:ac2:4bd3:0:b0:5b0:22e1:3452 with SMTP id 2adb3069b0e04-5b023d0bbc7mr1923590e87.9.1783941349910;
        Mon, 13 Jul 2026 04:15:49 -0700 (PDT)
Received: from ola-desktop.tail7f4623.ts.net (184.89-11-176.customer.lyse.net. [89.11.176.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b023b59381sm2009339e87.41.2026.07.13.04.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:15:48 -0700 (PDT)
From: "Ola Chr. Vaage" <o.c.vage@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	linux-pwm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ola Chr. Vaage" <ola.christoffer.vage@scoutdi.com>
Subject: [PATCH] pwm: tegra: fix doubled output frequency due to divider truncation
Date: Mon, 13 Jul 2026 13:15:41 +0200
Message-ID: <20260713111541.473547-1-o.c.vage@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Ola Chr. Vaage" <ola.christoffer.vage@scoutdi.com>

The PWM_SCALE frequency divider is computed by rounding down

	clk_rate * period_ns / (NSEC_PER_SEC << PWM_DUTY_WIDTH)

With dynamic clock scaling (Tegra186 and later), the driver doubles its
clock-rate request when the provider cannot meet it. The provider then
typically grants slightly less than the doubled request, the exact
divider lands just below 2, and the round-down truncates it to 1: the
output runs at double the requested frequency. On Tegra234 the BPMP
grants PWM clock rates as 408 MHz / N, so nearly every requested period
is affected: requesting 40000 ns produces 20078 ns, 100000 ns produces
50195 ns. The duty ratio is computed independently and stays correct,
which hides the problem from duty-only consumers such as backlights;
frequency-sensitive loads break.

Measured on a Jetson Orin NX board with the 45334 ns fan period used in
NVIDIA device trees:

	required_clk_rate = ceil((1e9 << 8) / 45334) = 5646977
	clk_round_rate() = 5589041 (408 MHz / 73) -> request doubled
	dev_pm_opp_set_rate(11293954) grants 11027028 (408 MHz / 37)
	divider = trunc(1.953) = 1 -> output period 23217 ns, 43.07 kHz

43 kHz is outside the 21-28 kHz band that 4-wire fan PWM inputs are
designed for. The fan on this board cannot start below duty 110/255 and
stalls below 88/255, so closed-loop fan control oscillates between a
stalled fan and full speed.

Round the divider to the closest integer instead. This bounds the
period error to half a divider step rather than a full one, and
restores what this configuration did before commit 8c193f4714df
("pwm: tegra: Optimize period calculation") switched the rounding from
closest to down: divider round(0.99) = 1 on the undoubled 5589041 Hz
grant, period 45802 ns, +1.0%. Between that commit and commit
5eccd0d9fabc ("pwm: tegra: Ensure the clock rate is not less than
needed") the same request failed with -EINVAL instead. Verified on the
Orin NX with this patch applied: PWM_SCALE reads 1 (21.54 kHz, +2.4%
period), the fan starts at duty <= 50/255 and sustains 80/255, and
closed-loop control is stable. There is no round-closest variant of
mul_u64_u64_div_u64(), so compute twice the quotient and round up the
halving.

Fixes: 5eccd0d9fabc ("pwm: tegra: Ensure the clock rate is not less than needed")
Signed-off-by: Ola Chr. Vaage <ola.christoffer.vage@scoutdi.com>
---
 drivers/pwm/pwm-tegra.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 172063b51d4..a5adc4f3ce6 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -163,9 +163,15 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		pc->clk_rate = clk_get_rate(pc->clk);
 	}
 
-	/* Consider precision in PWM_SCALE_WIDTH rate calculation */
-	rate = mul_u64_u64_div_u64(pc->clk_rate, period_ns,
+	/*
+	 * Consider precision in PWM_SCALE_WIDTH rate calculation. Round to
+	 * the closest integer: there is no round-closest variant of
+	 * mul_u64_u64_div_u64(), so compute twice the quotient and round up
+	 * the halving.
+	 */
+	rate = mul_u64_u64_div_u64(pc->clk_rate, 2 * (u64)period_ns,
 				   (u64)NSEC_PER_SEC << PWM_DUTY_WIDTH);
+	rate = DIV_ROUND_UP_ULL(rate, 2);
 
 	/*
 	 * Since the actual PWM divider is the register's frequency divider
-- 
2.54.0

