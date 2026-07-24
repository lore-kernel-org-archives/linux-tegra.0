Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84253EB0EC
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883862; cv=none; b=LCuhippqR+nbObjqY96t6ttICFRXZ1FPYC66YC/9Ki9FkTr4tFvIbvV3rAC7Rlrhl3LdN54Py80GpUBJHCRDKL29LsjBmoTDEakSks9Rbr+zxKlbFzwZY+28OQUpumqZllT9heOtNvOE2y2RH5zVd2Of4FtHWlOEx6iDhGFjABw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883862; c=relaxed/simple;
	bh=i4qllS4+L+pREPH0T4wiXzxc5q4nTV6C2Q3lI6XF9y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oCI7I2PAZLFJU/ql53p1klwVoZCLW+xCHI98U/tMUqBFXRQ0YyVw1ltpREJkZDFQ90dqmzS6jc/rUmQmRY1VnqpE0Pz29vtaf5ubmirsoSUDBXeja5EIzrTLWT3OxT1JFmXR3226m611K8Xw7yZQ3bEaEJWHQLyljovQip5d1z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TJQJXebt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TJQJXebt"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f6609c657so119740f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883857; x=1785488657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLV7Kh0UK364ekQydmUokZhdiy99pnn6pB+Tv4eP+3c=;
        b=TJQJXebtndoDHifWZk4L+YPtIt7ZMTnQKpJLdeiIW59NfDFtu55xcbF5pWkXwELeTs
         mPViOzD9d88aGV4yVXRFKEFzMRoGMH+/0FacxJewwrahoJtxCj1GHR1KR6voOFb7pvCP
         Fwn+1ZupPY5pFN1YUtF5/wB/xzDMSaGzd4TjH4JJ9WTbA/305avXm84GQK9u+xz6BLNg
         KPAwe968H9ILkXB4JIn/+SX/XKJV2dOXV8M44c9kIoLUh6H9LzjHjXNn9mAwegfT7haq
         maptLeE3lHrZghQMZQ2r9vW9Q+dqYgUclewPMq/BRgze9wts5dznHFJaOuHatYUPFW+F
         +h2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883857; x=1785488657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLV7Kh0UK364ekQydmUokZhdiy99pnn6pB+Tv4eP+3c=;
        b=g7kRgzJoecIMVg9QkKnV4G9dOjKq5IwxoN2VZkQUt5g8XjeMD90DqqMSMlstpXBufG
         TJEZrhc59upeVlh2FfQSSg9nWaHwc5PB5GFxQNwmrxxeJiwvtTtyrpvYRfb22D6OrzJ5
         NczqzzjQQSAQdBuFp6f2LCjcFu1PevvsoaH7Vd3NArw+347COawj8OFIyj8ScQRvpk2x
         9tTLC7Lr+S0pet87ZhpxwRvisMNohH5nXzZfbDw7p1ACvpgKWgaF6IuRpkJ+I6JbfQ0+
         jPzMmtYnIdtCPna4XRnJUsfUpcrf/mfByob5uS+hOESXwIIYb+p1NZtq8cFFpXWlQfGu
         neig==
X-Forwarded-Encrypted: i=1; AHgh+RpVlOXm178TWMtBTTujpDBUa0oKkz1G0XlA5eSZTVJy2EiykGu0GVTvuGR7GFxrN2aXKxf9gn1sDiP2hA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9NSSPGXycLRi3kh6CHE3jeY1B/TXwYq/0xPnclWMm/JOVo+yN
	B4atXg1iErO1fQSajzHmhbU5SY+1X542ywq0jd7kb2mYiv5TXVpnSOIw81JSyLudMfE=
X-Gm-Gg: AR+sD133/qf+T17NRTODvPWn1ZaFtILMOaATkZ0Q3czFmVU2HsrdqPkDWR0PZSCgRBR
	74xhbLkL5i9I6JoQAMUqRXfSl3awDlK0EfyO9wfchpiCvAyjxCpvO3QSq14kvJc/p07wW96KLa2
	Zk96v74vJB5fBkeNV6Ty/qht/AFbWqYbO+pvk5tZzJ/IwEMpSrrGOeoXEPgOSaK9l7J5FmGtBx7
	ax5UYRldvZ5cai+LIdpL8isNiGD5+HYKSeA+doM29kHmOmCl56QQOSLT5Da//bxFhkQzeMBf9W5
	OSjN6mw3SYnKEDh1dj+TwaAp6wLaE9Rv3GBJHbh4PT968t9MnkKztpRGv8Dee8lvsyynwEO1kUW
	UnU63kSk0M5bclm0AyVBnUlS+PrvZPuhOnIwKk026PJtSbtbI21w2L/xYc8pANU6YEtIOGeUeIh
	pZ
X-Received: by 2002:a05:600c:3508:b0:495:5f00:9497 with SMTP id 5b1f17b1804b1-49573cd9427mr73102445e9.18.1784883856862;
        Fri, 24 Jul 2026 02:04:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957af6b10esm57168825e9.5.2026.07.24.02.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:54 +0200
Subject: [PATCH v2 3/7] clk: renesas: clean-up simple provider misuse of
 the consumer API
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=i4qllS4+L+pREPH0T4wiXzxc5q4nTV6C2Q3lI6XF9y4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqAHjrBMlLbsRDUuljqrEYPOyeyYAPzg/SXk
 jNGwdlpTaaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqgAAKCRDm/A8cN/La
 hSkyD/4pUoLziZUxxkpmbPY/qvTAcrEdq7SBbVU6GpskFU5ov07moRfgR+6L+QnROKwYTiacIiV
 j1Id4mbcJS4lTGYyfhQHnpCpE6g4Ty5AOA5LGOh4j4/JBxdHL+gSrPGt14RoF6Yj4XQkhA1UHUu
 PUEYCZKL0dJtmaJtG+j9xQ1n8J5fLTJ4yYwDhVGPC0gFBub2VC55exg1nLw9H/BA9QuYfH/R6jB
 1gRBMy3ki4RKKZlrSF/HE+vSq17ymWXfrS3FSS34wfEJBVX61mFRwB0GHvC4MH3rUyoibQ+VXyT
 fxhDd8LpNOnsg4bjNSbln23x9I7vCg5gIqqxj3bytRpFG6vWz/hwCe241843XOXyP8UZXor57aU
 yCUv+ewWTn7vvtq/y0V8EFxe3K77GZ5obxj3nS1lws92lwHu5LoB7SmbeRYj3c8n2Cw4DJ4BP04
 aDLst1r0KfbFdesTIeiNVRM7Pj3uVdpGPq95OarAzPWMQ84Rw9b01YxXpPr4Qt0BO8crTXNH5bT
 9maeRb1sc1HL6+ksttwt1yZ9bpD0WzEbL1UOkKEbpdhQGM+2M9RzZzmlK0wbO4TnJ12TqHh5iWx
 gOM1ryGczqr/oYKu/yudM5d+TlB4vMwCZUy579E3zBPTZJJ6qG11DkD5DCSjYDdD8Ew2ujwzSo0
 pwxjz05NaJ3Z5Uw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 076f587dfd39..1da25e4fb4d7 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1014,7 +1014,7 @@ r9a06g032_div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 	if (clk->index == R9A06G032_DIV_UART ||
 	    clk->index == R9A06G032_DIV_P2_PG) {
 		pr_devel("%s div uart hack!\n", __func__);
-		req->rate = clk_get_rate(hw->clk);
+		req->rate = clk_hw_get_rate(hw);
 		return 0;
 	}
 	req->rate = DIV_ROUND_UP(req->best_parent_rate, div);

-- 
2.47.3

