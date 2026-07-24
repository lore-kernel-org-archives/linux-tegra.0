Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B346F3EB0EA
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883856; cv=none; b=nzU2GBwSZ3Vcvv8hkEv3Lck9JJCVos0iz2sAQj9N8GPIILWXRFcp98/tuKrljrAXSbJA/6v1v1q5YvASq6Rvvf6gt/dlE6Jru9A2e+EdyqprW9FnlIV6DtWh7iE+CLCrLmMBA15VvQt1mVESEwLpoj/zq7lnYjo5LtTo6rzQjVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883856; c=relaxed/simple;
	bh=ngZbu7qrPPUnt3qz5v/OxI6wrSNHJGvbM+okq4uzzqA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dmKSRc951tEN7dGavPpYKe6jTT6a8xPHE14toZGw3eK0PL6+CIIyPxYovLpz+zdMYRTnnVy9Sg1FjThZ3iFy+SgmJUu4qtqn97tP3XsT66UI3jaNTiU7oQZhwELFGz4phGvIE9C4PCv8FIZ8AtF02CufGVG0wkNFhayeb3fhIms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=k4pSPGX/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="k4pSPGX/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954d29264cso1169745e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883851; x=1785488651; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q/Jg1vL6WCoKWmNIVSdaiN+VbT2b9Zn9L0z1UYJ+buU=;
        b=k4pSPGX/obxj3O9ZiFfQsR60IbBTGOAHi5mRPxyWMZWLU77g/TK2nb3BirBJbOKJLw
         q7jGhqSIdS7I23L2rPBztLr+XlLT6fGy8kCai+jM3f4//CS7SANpG38bevXnKsSCAVrY
         1Fcp/lUfNwjpLR84R6Z6JUQOIV/AMGbf7YhnBVZBYl8Mj5+97RUTtENgyo0mUNdcQQzc
         YLujdHuJ6WYyPWqkqbRHiHP26MDEKMIlUGj17EuglJwSSnhUQ3HAEto8z9iJ3EqvoiCo
         00snIpKl5CYIsIr+pCY17LHCoZjJDZVCwldK4WhpQ1ScHwAOTGeGz0pba3H5eE2EvZAL
         J5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883851; x=1785488651;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q/Jg1vL6WCoKWmNIVSdaiN+VbT2b9Zn9L0z1UYJ+buU=;
        b=Z3oB0EGDcUq1smfY7UyWUWxOJjEAd+UcjI835WrVDV1tQKShhvG5cnuAppR300D0qe
         qxjm6fNZTbPYm5xy6+bf7oR3ojco1bnDC0iioBHZxTlM0wFSvD1QNwP3f66c4tKD+79d
         X5JKnh+7KzEpRa+2SiveZxchyoZk7WqT1ewVbModKp0h6VdNCmnN2MzZy3Gy475W2MF9
         cZOXsQ42ui/QhfQQYTmJjda2z3GFzMv1TEi5tVhOUpenLrQTELbPU73iFWEomKE402iA
         onclAh+8vHxVawtSwqDhvEi/bdUA8jbuxEdUCDbNu74OrI1hjHAVRSO2/rh2t+0fya8f
         YBXg==
X-Forwarded-Encrypted: i=1; AHgh+Rq50rTrVJ56NdRj5hikzOofaEkSypsr2Lb2YHzGWMas3b4EbTHBIU5B179uqb/F/WWTywLx2AGmCCPbjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Vu15VGaDaWHZ8zOtkh5cIUCJ8xk+UYODI3Pid3X9MLiHzM23
	+rnsjJUbUN2SBEqTW9BJBwup+wVuWCL7e0e2lKeReZNmR+zVPjIoloLLSzQTS9OpneA=
X-Gm-Gg: AR+sD13rMsUB41Ai4A4cS1NRCrflASRta0NEc51bmUlzGGp1UgYWAc+UMRwUHCDJ0cG
	nwa8RGuoE+1fw3sRJCUWqK2jSb1nNynmf03Ym9wTXIfGLXlk/8Q8y5FcSW+pLf3QujfIWw5wtZ1
	r9Y9eIRwT4qLF3UWd1O2PjhM2G7KRGvkwoM18xuEli1PeGlxVokJFrYlTtoXc+OyGXd9wxWqZWj
	tIcWMLv9SvibvXTgLJZS5ZsVRZMY0Mz2eGfNDHoXSpadiEEkgB/3o/Lh09toVyPelCExTWPoL5t
	qWxDCnyTcCi+iUMARB0ux67imufT9ZrHJx0hUSclTF2aPLrrjaEVaS/wW+F6rll9X8CuCqGiD3l
	R2wpg1jjPXiz/ydvVJwZgMXp6NV1MZ9ox4KVrdw4F2Xci3t+087S3vcOKhyMW8hqzBQoHZjQwQo
	CnyxnFALcjyfk=
X-Received: by 2002:a05:600c:6d04:b0:495:52dc:73a9 with SMTP id 5b1f17b1804b1-49573cc6d0emr50329905e9.11.1784883850753;
        Fri, 24 Jul 2026 02:04:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957af78a02sm52350385e9.7.2026.07.24.02.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/7] clk: clean-up simple provider misuse of the
 consumer API
Date: Fri, 24 Jul 2026 11:03:51 +0200
Message-Id: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHcqY2oC/42NQQ6CMBBFr0K6dkypWJCV9zAsyjDKKFDSYiMh3
 N2CF3D5fv7/bxGeHJMXZbIIR4E92yGCOiQCWzM8CLiJLJRUWubqBNi9YHQ2cEMOPPdjRzEjM4A
 pmjMiZoRKirgfHd35s3/fqh/7d/0knLbDrdGyn6ybd3lIt94/npBCChIvWhcqk5nOr7WZO64dH
 dH2olrX9Qs5b7Ao1wAAAA==
X-Change-ID: 20260723-clk-provider-simple-clean-a8d5ccc4ec20
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2761; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ngZbu7qrPPUnt3qz5v/OxI6wrSNHJGvbM+okq4uzzqA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyp6PPnWrA0DSJ4UJ6CstsYSqMPhVc8i6ZcbD
 Bp8my0uaVqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqegAKCRDm/A8cN/La
 hYzUEACbbA9uvxujp8Cmfa3PzoTZ5cGEuPTX8RpG+NIB9lOpZWMoa1fR+25/AnbklP6EnRNPt+u
 mo8vWsoNfpYFAb8+oigyEE+UnaDdY2RNM2IpaXdUHdlmUXX36sAkdpuw9PlrKiuWdJALla4BjfA
 vpi9rQ+FceaCxa6CVs5+w+RXlougTYlBPouzG+njfSj1WEYb5/rpTwD2c48q0A0SjiOXbL/3T1s
 uDYBpb2rN7LYB2YvxshiaLkaEOpb+5QGIRDHwHyoHwrn8E1hIvyrIo1HDtT8C+fm1rbtfce0iEH
 2q1UNJD27j9cnfxi+9ShMnnkhlIRhbpMG8V5eNDlp9zxpdzl/J31H1H0FUDK2kg9Pe/hZRt88y6
 xDgnulPPOR3YwraARkMAe0tmhYidPptJsBhVv59yAiZkZTgzX49HLrHFNazof0ZS250Sj5AtsT7
 yHIwPN8P+O7YLcwV5nqpad5lXpDi3YOJSqhJRlB36fglCpGY7+MMJap5EsulmSGu323+2LqsIXk
 b4vgUzy99hr4oRBEh/cmQjNPnN4/4l4TQZaFmeNm1ysWPv/eQ9PXyFexmj6AZwzC1ue6qALz4vA
 qsjEHdWeIoMJKf6sFWEIgUm42wjc0Q3Dr8dWMkUFSCdFPc09zJkJXNtt20TC8kc3Qg9Z/vEkbiH
 rEW8+SG6UGURodA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist:
* __clk_get_name() -> clk_hw_get_name()
* __clk_is_enabled() -> clk_hw_is_enabled()
* clk_get_rate() -> clk_hw_get_rate()

---
Changes in v2:
- Change split by platform for the different maitainers to pick it up
- Link to v1: https://patch.msgid.link/20260723-clk-provider-simple-clean-v1-1-0c9668240467@baylibre.com

To: Andrew Lunn <andrew@lunn.ch>
To: Gregory Clement <gregory.clement@bootlin.com>
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Heiko Stuebner <heiko@sntech.de>
To: Prashant Gaikwad <pgaikwad@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

---
Jerome Brunet (7):
      clk: mvebu: clean-up simple provider misuse of the consumer API
      clk: qcom: clean-up simple provider misuse of the consumer API
      clk: renesas: clean-up simple provider misuse of the consumer API
      clk: rockchip: clean-up simple provider misuse of the consumer API
      clk: st: clean-up simple provider misuse of the consumer API
      clk: tegra: clean-up simple provider misuse of the consumer API
      clk: ti: clean-up simple provider misuse of the consumer API

 drivers/clk/mvebu/clk-cpu.c            |  2 +-
 drivers/clk/qcom/clk-hfpll.c           |  4 ++--
 drivers/clk/qcom/clk-krait.c           |  2 +-
 drivers/clk/qcom/clk-rcg.c             |  4 ++--
 drivers/clk/qcom/clk-rcg2.c            |  2 +-
 drivers/clk/renesas/r9a06g032-clocks.c |  2 +-
 drivers/clk/rockchip/clk-pll.c         | 24 ++++++++++++------------
 drivers/clk/st/clkgen-pll.c            | 20 ++++++++++----------
 drivers/clk/tegra/clk-tegra210.c       |  2 +-
 drivers/clk/ti/clockdomain.c           |  2 +-
 10 files changed, 32 insertions(+), 32 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260723-clk-provider-simple-clean-a8d5ccc4ec20

Best regards,
--  
Jerome

