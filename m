Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD637AA97
	for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2026 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376270; cv=none; b=UNTwzyaulEyBvyaN7fYGD46GR7DJScNVVtL8ptyivfWeeLMrYEOvKrME5uvRerNyUqWKD5WDt7owIujsRpVe6fluwM1EhZ3lcK/lsYyENYcI+I50g1K5xk89JXqWhFyXVY4LY3osktWjLYDs9uNCoBMHJsI9fp2hjPbr0D2B3Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376270; c=relaxed/simple;
	bh=YDcPrHkJi/CP0+hH5Z5P2PG3DE1JTmfY9E3YspgvTXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zd7OVJZdJTCQd34Ng396gE/kIv7k2xT6lHR3QO8gcqAe4snkaZFtLjFeDEkrDZm7UhlnFeQPyZt/gBJc73ZZi2N7xx6VBUjWpPGDOrdZqU4XMASAmQyUosdQmpobgQ08W1XCLQ76Cu73kZSPdSQm98b2T0ZA5xMXPjOpSDTHqLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJZ7FCKZ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJZ7FCKZ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39ac9ca9219so3378611fa.2
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2026 01:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782376266; x=1782981066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQyviYMg+aVt/DDakTKU2XMmEryhOoH3fsRqzwGPnVE=;
        b=UJZ7FCKZgaFz+JxiCuwIoyYeOw+iGM5s0s9o6g1PD9J7Fbnqga1AXZifmzpmsPsjeG
         NkJhoaSJ6ZqQ0rW7yME6BV0P6XZgl7iGMYpEsBurLh3uJmNVlgf0SO5WF3x19t9Ajw65
         AKILgnJgtMNvFppJLnWuq9GichTzdCR8fb491CyNMGydAWYb5BmG1aK6KeoPjPiobgZg
         kQq+LLaUc7J5ZqPhKA3zYLlfyRi/X+A5dHm8HQ1+TYPwGcuHjzT2c9sgkX5t63gXwY8D
         vZdJBZPq20AwJ9wjUQw3h2zasRkJU2amDA+IcWfRimXOD5n2zUBgkMstg2wrzJEoeVJV
         quLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376266; x=1782981066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hQyviYMg+aVt/DDakTKU2XMmEryhOoH3fsRqzwGPnVE=;
        b=gyB0X21vWAzPwJSs3LaFyyp0B68MUGXDR/ah5ozopoJNtUASgr3hMxeFfScgxTkMEK
         Zq/f+9Z5XaPJw9THf0ZyHSYoNuRrcXiD48X5lsye+nogxtwuK+hf4Q7Jnylop1394BJI
         M1HPpO+t4w0wcm7p6terF7AIrFMuqHW+xkORCR8xs5Wwj+uHMuFSJT9ENMRyeh3mXclN
         p2d4vMtSDeami8TggheFN4tXapvg88Cl98CUsyfyO/PUWAwQXdgooPzoEdQPuo61Z5M1
         XnERErl9qxsFz3dL6XwODQwL8RAl8FAuxCWGNK/J36IUdetSRjadH/UUy0ron8LCUjRB
         Mhwg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8iIOozAk3Uac/sR5+qF8gONvADbBQYDPlBA0Rhu7ez3n++9SIIgqOtJBBMxci7oamlicepqGmzB75Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn4max5QRiaPHpoX7aYnL4GRoAesU284CDs7AChfJg+d88Plui
	w0oTRYpzuO6X3tRPvaCdW3/RmK1pzWYMhaesGwZMP4Vvl+djjebGt3qExBTTKLPR
X-Gm-Gg: AfdE7cmA7liA9t0iT/o+MvVtEiD/nAZQKzAKW1iDghZFanPcEe2lU5iXOqXJmY4fHEW
	sGoqcgEIH9VJjSO0W4ZRWiBmSFW3Nb3fMUEEnb5pFQVFayVd1ujjj64YaasPRMnzzg2SJ5tlJGS
	USMUhIaXEVWya6p55eA7ihLXTyTWasAC2o8/NzJsD/2uJRditVxAyGog6uVOFhj73aES37UgEAx
	NDvDdb2Wcaa4HX6FxPf3jekUEFJf7d2vaT8SAQOiWCXs2tx4fLDtKQAi38tai+EOH9nzV8TfYtv
	QjpdKmBQXAm20iQuOuSFqsFrUzJa24wHtXuS1M001VqMBceyQtLFI+0KSjNHNVWKE8nSpsy7SCR
	k+3y/AN36yAzGBOjWKisSvj8pe8GxchOQJEgztMYlvzknJUDQFo0KORHumKQ3IvE/74cKZS0LdT
	2d/dXcrhE+VNGs0fdwNPc5TpjzO0LSHmWgow==
X-Received: by 2002:a05:651c:1588:b0:394:3b62:b6aa with SMTP id 38308e7fff4ca-39acb606ac5mr4252081fa.12.1782376265866;
        Thu, 25 Jun 2026 01:31:05 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ad317dfc3sm620731fa.31.2026.06.25.01.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:31:05 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1 RESEND v2] clk: tegra: support 48MHz clock for pll_p_out1
Date: Thu, 25 Jun 2026 11:30:52 +0300
Message-ID: <20260625083052.65405-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625083052.65405-1-clamor95@gmail.com>
References: <20260625083052.65405-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dmitry Osipenko <digetx@gmail.com>

UEFI on Surface2 sets pll_p_out1 to 48MHz which is not supported by kernel
and causes BUG() early on. Add 48MHz clock support for pll_p_out1.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index d86003b6d94f..adfb74f111ef 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -575,6 +575,7 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 		break;
 	case 9600000:
 	case 28800000:
+	case 48000000:
 		/*
 		 * PLL_P_OUT1 rate is not listed in PLLA table
 		 */
-- 
2.51.0

