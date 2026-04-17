Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFE137AA83
	for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 07:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411441; cv=none; b=akp6RrrlluYPtXz7L4eZIWqSv6AWLKZ9beZolutRygDhUtnv3SFsYooAUtJ1HrMSw1aXWn0HLrz1te6ZBLhxANcWQzWNW2K8JOs2qDPIR2enwrzPY3AlKQAWxXzzYFXtDaKtkOctbSjDUEsj/HBPlYknAnt5KkOW/PjpBeeL6Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411441; c=relaxed/simple;
	bh=ntjX0N5F41OJckwHhjFndO5tDkiyPj/m0ruzo3MkSbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cfh0OYZeiVQNvhxvelFhM+8RkFF0XvLJ3bmLLskWMhN5yiRXCWaVNHTXWjllvL6ctd8qjzpGw+pFQxarebP98Z8AtFkQlUJ6VxLOrvp59DjSupEbZRF50evg51ybf/XBq+D71rVhySI7oANKSgAdDGkxV60uTIAqUlRvn0edwuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9EEjVpq; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9EEjVpq"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38ce8a5bc20so4138501fa.1
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 00:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776411438; x=1777016238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pt779CeCGZE6QhsteVfBznH3GnAaSQgHdsYoK27GZto=;
        b=X9EEjVpq/Xq3yNvXcjBcjw95UpQ4maA8e2T7l4RfOKVJx3CoVyQtgIRDZbyWRVL6F0
         iH6XvhVEhzykk4AVWkBOW2GEEHaVIu+5mvvIXW1jNRUh2hJetJCAgXXbV0d8E23qfPjj
         /rDhVhZhw/h2o/FddR5RTIZA1r7kiLA0kd954iqU2e8TbO6UrTPNVrFeVoqtmDhKA8P5
         JFL9O6M0m94eyVuIo++scZKKUrbP2leezdCogVG8I92YHH8dIR+sFAI/dpXZaozCivgw
         bP66/PLaNpk7CEASzAzsv7DrTJd824jd8B+0IfSnWBaM0VsXbnTCzdSwFc+YGRD08PoW
         b2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411438; x=1777016238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pt779CeCGZE6QhsteVfBznH3GnAaSQgHdsYoK27GZto=;
        b=ebND2kCKAZjsww1pvlaadm+O04Dwf/jJLKg8tIBcvjwRCJ8uSOmM7mEmlx6JnEnoD0
         h15w45Y8t0gqwo6Efn8YNFwej//1fu+ea7jbPCSEZKsdCttvNX9+biNB45ixJcHHM6Kx
         EQC170ZMW13SBWFvtFE/L/BzNWdeLDFfUTnkL/kopSS4YPp5y0wLkVWf/SYvga68DHE6
         0GL4wkyZdX03UuQ6kUr9uXmr5fOrF66fZ0WRw79aVxni4TF/3DtHy5tGo2O78S6CbzMF
         8e2IIIYg7A2L0DuP+YLgUwrnxkupvftB/uVpY3VvTZTMvVSFNxTX51zGLm49MTLns9oJ
         N+Xg==
X-Forwarded-Encrypted: i=1; AFNElJ8e7W26DX6yxXhjEnBPVdzqgy7DoG3wdK49cWpRZWYflAJ6FZZt3SqsZWZWBrjfl7bXN9BObIm0VGacgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjwSsqR2cKItZFIwckzzYaG7HoUjIe0QU4+22IXUrasNQXYVUY
	lBmMw8QSWXG4IJmdjQdBqtEs5rvwpzCf3Y3CSa0BwQNXjJY0Ev5/vDgb
X-Gm-Gg: AeBDievBG8e9hfjFl9Om+UkHIHhvxpO7X7s5bHeNqx4ooQ0We6YFs6NueYqEShWkXe9
	cGXN4E/vflmVmlfI26Cx1dbLK0X/57Y0jtwmopHuoLDTUdRLag3FoYK5yYrmjww1rldncsYTwTo
	+DUjGr2pxkCMbN9hq+ooksPhc5fDtezY3l5RZYrIicMTHhLD8awH0x/6AnUS08mH/ZmK9zUxCCF
	5QZeMRfFdKn8FwV3FOpTBpTaVvlKIVLnu7mO6p1pUXfeRgX2ZQdoeta+Cy2AgWRW/yIavWNriG8
	ICccL+qXbHNSrZq6dPrtQ1FCVksL2JHnKdYX5ipsEjJoTX80v9BlyGDlNliwvry+kaFAt6Hp7wq
	59T90SK3DeX1wpFDEI9DBjKHHOEgg5cv5rPi/ZTTrAyUWktwX6NlvuD01nXz+8yLMgK0OobsXUw
	A0R77YZAlewjdmJrGCND8LVjY=
X-Received: by 2002:a05:651c:19a1:b0:38e:84e3:3476 with SMTP id 38308e7fff4ca-38ec7ac74acmr5569871fa.25.1776411437544;
        Fri, 17 Apr 2026 00:37:17 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f64ebsm1692661fa.10.2026.04.17.00.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:37:17 -0700 (PDT)
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
Subject: [PATCH v1 1/1] clk: tegra: support 48MHz clock for pll_p_out1
Date: Fri, 17 Apr 2026 10:34:52 +0300
Message-ID: <20260417073452.23342-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417073452.23342-1-clamor95@gmail.com>
References: <20260417073452.23342-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dmitry Osipenko <digetx@gmail.com>

UEFI on Surface2 sets pll_p_out1 to 48MHz which is not supported
by kernel and causes BUG() early on. Fix this by adding 48MHz
clock support for pll_p_out1 along with 48MHz support for pll_a,
main pll_p_out1 descendant.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-pll.c      | 1 +
 drivers/clk/tegra/clk-tegra114.c | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index d86003b6d94f..eae732320bec 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -564,6 +564,7 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 	switch (parent_rate) {
 	case 12000000:
 	case 26000000:
+	case 48000000:
 		cfreq = (rate <= 1000000 * 1000) ? 1000000 : 2000000;
 		break;
 	case 13000000:
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index a4f40533cc43..6a77742aaad2 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -363,13 +363,15 @@ static struct tegra_clk_pll_freq_table pll_a_freq_table[] = {
 	{ 28800000, 282240000, 245, 25, 1, 8 },
 	{ 28800000, 368640000, 320, 25, 1, 8 },
 	{ 28800000, 240000000, 200, 24, 1, 8 },
+	{ 48000000, 282240000, 147, 25, 1, 8 },
+	{ 48000000, 368640000, 192, 25, 1, 8 },
+	{ 48000000, 564480000, 294, 25, 1, 8 },
 	{        0,         0,   0,  0, 0, 0 },
 };
 
-
 static struct tegra_clk_pll_params pll_a_params = {
 	.input_min = 2000000,
-	.input_max = 31000000,
+	.input_max = 48000000,
 	.cf_min = 1000000,
 	.cf_max = 6000000,
 	.vco_min = 200000000,
-- 
2.51.0

