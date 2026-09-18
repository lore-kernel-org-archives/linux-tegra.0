Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B780495526
	for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742048; cv=none; b=kf0iZ5kJO8XV/ARoOqKEuZ+ys8E2mB7s4H/ufXD3/74tI4lS00o/Ghfrx8i0UOd8tJGGYoZ5lk0RaRrqLeIMXQ9rqCDOIncYKV4MIsu0ZVa41MimTP5KrLhCR4d59bggiFt8c8Xx4b0pP3zKPVscF4W3AyFtEDklMc2cQiEahcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742048; c=relaxed/simple;
	bh=xWBZ1RSCOb2sPTHZ3/cPm3sP3q3od05A9jCMXfg09xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DpugLNw3adzU6fCc9uSMBJtifeY7Hgzl+Y2Nl1Wk4+S0P0s4s3FqMerPifSAw4bfHs/CypQZUo6vGXJriRfMAN1+S3D5fbFhuOEf/f9yRyGTBYEaR/1FoM1tYHiiLofn3Me0e1zuhSIdd7n1AhU//HmsZbCoYWG/znfHTW9t4Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mt+Y09Lz; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mt+Y09Lz"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso10589445e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789742044; x=1790346844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xqW5h3rRLnqhtoQ3APikYnZ226msCNVttggqavOp9CY=;
        b=mt+Y09Lz0DHRDJPhkWYmsNzpgQXD9a30qGPi8En1XGxlgvkTDOi6i++dkq3sWCD1+4
         eXZIYXM8jpluhvF+YvvP7jwwk8Oy5jne9xUm3TLowozVblvVQr1fULdWPZKErvpLV4iw
         TyoLrKPdCi95eR3dc+f1CCBg0hv1POkSySxkqIIerVVTpudsKeQLvWenzqWgy46Rkq3z
         bERwBsAL69yzZlFgCShjp9uRu/KQA7FjcteYfxSxZ1UKAfjc1ua6M0fh2HMKofhwGSWj
         WAtfFV6fMaHFcIP51XBMY2XM2yA08+6FM/y1NVrzZm55z8yY4N9n+t4l80+uPCTD3IVK
         H8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742044; x=1790346844;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqW5h3rRLnqhtoQ3APikYnZ226msCNVttggqavOp9CY=;
        b=lzs3XB5fqOju45QWk1OEvvD4GsD3jdr+jxXdULg2KWdNL4OIBetx+Q3XlD1hPWeKw0
         06lCdIF5+WSzetAfRH6M1lKxMKuQM8skqI2pbs/Cy5E+TMAKw5GKnjd/DmXKB8VBvmYg
         LJ/O8oP+jBZ+KcKyleOVsaehQUmPEXtbDctjf9tBX5nKgVx4d9JCCdUyHKpbCAEls2RN
         s3ZtNrXHmGKsfuuwAJ7oAi3gd4qFK2aVplZMdk9lgOsc3ER3AftMDlM2CcTIDU1EuJhA
         jgsWOc27SZgvHxn6wJ/fEIQDdJqFgE4a50M99V/DlaDqCoQPhrHwvLFQJiv+XWDtT1Ho
         gG6g==
X-Forwarded-Encrypted: i=1; AKwUvBzu86S63rNeX7HW8wPDRaBOA7drifC9xLO+yj1h5e8F/NbK5J0o8xMMB3AMXNFS/Zz4PDss5WGtVIoYwA==@vger.kernel.org
X-Gm-Message-State: AFuF++kuqy94IPCz4vQ5pBNvQCXR8TQrUfgzdTaITGorrlvqRxw7hqAe
	vcHei1YCl+a8oN69aci4vQNyn/gKQVknUGAwuXl+on66K8kEhEvEK6cwqUHWZ3mZnZ8=
X-Gm-Gg: AYBFou0smMWJgAX9+P1ua68YgYxUXcwYhTGmBWWiRbHCWl43YzLLHv3Mh2ZLkMUkhSM
	qebu+PuWhimDs5tch0Wn8ux1AKNBLuzkfWfTRpkeTFsayzxFsoZIVTn+bmEvGYMUm7b9f0RcWBM
	Mm0Lyshr/WAK0/DCRXHhfxNya5Lzu2pdONsIRxDvF4jMnEo2Bmd7sF2GyM+72QmdieT42GFeXx9
	Q5uNOONOlTiS3Iq1qQSu9nMJiKqz4W8aFnwgcizgJbEWTbdlxsJ5UcfSfY90fj3l1lLCAIE61kK
	AGp3t+27jYdf4OUcaYtxeUiRioomzJStALGhJPGxFFtFsool/QzXmiFSlUfSFDFhmdaFkSx4TAG
	Ibwgsn16qaXedP31jLPHKO+sM/L+1igBxEmC5oHt5JCqJda9172vtJuTM96Ew85f3EfCmOr2I9m
	c5mV+VBFQ11hynZawGTsT/ZAIgCQk530UpTfXHrdayKDF5XAzdNv0ws64sO5QuH+CfyLf+YXHIg
	hMWdzc0aUAyNuvjapZp6L4sZDP8UbOXKGaWPR98kZPlW+phQw9sIRIm8toWHQ==
X-Received: by 2002:a05:600c:8b8b:b0:49e:663c:c69f with SMTP id 5b1f17b1804b1-49fc56d170dmr31354845e9.15.1789742044127;
        Fri, 18 Sep 2026 07:34:04 -0700 (PDT)
Received: from localhost (p200300f65f19a90444c8989fe13f5be4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:44c8:989f:e13f:5be4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48720072efcsm4458883f8f.25.2026.09.18.07.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:34:03 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ola Chr. Vaage" <ola.christoffer.vage@scoutdi.com>
Subject: [PATCH v2 3/3] pwm: tegra: Implement .get_state()
Date: Fri, 18 Sep 2026 16:33:47 +0200
Message-ID:  <b72b16cf704aa662a1b49805db284379d4fa4050.1789741839.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789741839.git.u.kleine-koenig@baylibre.com>
References: <cover.1789741839.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xWBZ1RSCOb2sPTHZ3/cPm3sP3q3od05A9jCMXfg09xI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqrUvQk/+ohXgs+lRHunSsyku0trjD3CJV3pLrs FzIO5KtU/GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaq1L0AAKCRCPgPtYfRL+ TmCIB/9rvizxMyVjppYBSRwq+FlnCb8gCWROptuLc40bhFoK6f3ZCQJyRXKUXnpPnqaaf5uQHhr bzb+uleAxKPXxgltstGwYvAGn8SJDFDUAfkjkgXxpNAUSSg5qKD9T3p3mjo17Xbkjxi1WsFFmmX +r7O4gFFKpuFJXzoDLQYIFHXgT3pzb41I2+jXeU9P91qmiEiT5tGz5IR7LSfQ0NJOQ4nczMuMT9 Y5myRL2tIBOa5913212w1Z06twEHBMdloj6tJi1LMNzfuMh1g9n1jtRjve6T59rJsspyFG/8MsO pP8l0Pq1E4xACWk612IdxIptrnEoK1eondT1tuca8NFl5neP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The registers of the PWM IP are readable. Use that to implement the
.get_state() callback.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
Tested-by: Ola Chr. Vaage <ola.christoffer.vage@scoutdi.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-tegra.c | 48 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index b461d3877f43..0520d025c776 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -310,8 +310,56 @@ static int tegra_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return err;
 }
 
+static int tegra_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			       struct pwm_state *state)
+{
+	struct tegra_pwm_chip *pc = to_tegra_pwm_chip(chip);
+	int rc;
+	u32 val;
+
+	rc = pm_runtime_resume_and_get(pwmchip_parent(chip));
+	if (rc)
+		return rc;
+
+	val = tegra_pwm_readl(pwm, pc->soc->enable_reg);
+	if (val & TEGRA_PWM_ENABLE) {
+		u32 scale, pwm0;
+
+		if (pc->soc->enable_reg != TEGRA_PWM_CSR_0)
+			val = tegra_pwm_readl(pwm, TEGRA_PWM_CSR_0);
+
+		scale = (val >> TEGRA_PWM_SCALE_SHIFT) & ((1 << pc->soc->scale_width) - 1);
+		pwm0 = (val >> TEGRA_PWM_DUTY_SHIFT) & (2 * TEGRA_PWM_DEPTH - 1);
+
+		if (pwm0 > TEGRA_PWM_DEPTH)
+			pwm0 = TEGRA_PWM_DEPTH;
+
+		/*
+		 * scale + 1 is at most 1 << 17, TEGRA_PWM_DEPTH is 256, so the
+		 * multiplication for .period doesn't overflow a u64. With
+		 * pwm0 ≤ TEGRA_PWM_DEPTH, .duty_cycle is also fine.
+		 */
+		*state = (struct pwm_state){
+			.period = DIV64_U64_ROUND_UP((u64)(scale + 1) * TEGRA_PWM_DEPTH * NSEC_PER_SEC, pc->clk_rate),
+			.duty_cycle = DIV64_U64_ROUND_UP((u64)(scale + 1) * pwm0 * NSEC_PER_SEC, pc->clk_rate),
+			.polarity = PWM_POLARITY_NORMAL,
+			.enabled = true,
+		};
+
+	} else {
+		*state = (struct pwm_state){
+			.enabled = false,
+		};
+	}
+
+	pm_runtime_put(pwmchip_parent(chip));
+
+	return 0;
+}
+
 static const struct pwm_ops tegra_pwm_ops = {
 	.apply = tegra_pwm_apply,
+	.get_state = tegra_pwm_get_state,
 };
 
 static int tegra_pwm_probe(struct platform_device *pdev)
-- 
2.47.3

