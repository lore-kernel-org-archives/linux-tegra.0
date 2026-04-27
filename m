Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB43B961E
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777296309; cv=none; b=gcb4zlhdLF1Qa7kUpcsDz0s/LO3qtoBECi8pd3L4nJKZ5jHePweMrXtBxrFZjyJxh3V69IrQLcXfVLyoPqzx9Y7QaikQsesfNSQ4g0nuPTM9/9S6fXa9Nnig/7qLI/h3hvr5600qU4k+7f3SBi5JvmBKxVJtn5OSs7rC9exJrOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777296309; c=relaxed/simple;
	bh=c3R/swjZY4AwoGs459klumnQ8ywJ7rDXnjScQrebkz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AieO+rzS7Ah17eoS7lFJnYkdLlG3f3g1RiU85Q7n5DLh5DrB8d0HFItwHKIUX/WlPSW2sGWPRGGkK6+IxzbD2ZuYhYo5lb3bUl90kNozJVIRW4chvfOtz7fUvL4TouzgUpiWf9Vy+4Hbq/PppgJxTqlzzBqK4mdhBe0TF5IyR0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNV/lT6w; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNV/lT6w"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d7645adbdso5620470f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777296306; x=1777901106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VgLNT+dcdf1dMnPDi6oMraw8/VencpOpP+MRjX9HkY=;
        b=VNV/lT6wEsOMYXa3LyIJ7HpYKryuT3Zr9xoeQRZlgLo0/9q6TNJ8lLSPuhHrp0yiwf
         ZGIn2R8YRQzQDPlJlimn/ygNUWezFG1PtgYh/uPWEebDFWXTLTPy558OjZE2C0MEg5u0
         fRbl0HeyR0an3eMIKm5PgL1UsiHbXXXsBblx+F9KGa7A4fLD2lBt8idhLiGmPxPFqMSX
         I9hJLqgE8JFeJQt/ByFyDFNg37sUolSFNsjFtyP9cLDVOqLb8BXw2iLFCcItn3gCXHfL
         PdzL0lvwRypGjRiOMSuNBBFMXfmNKNwbWqm9xRwrcZusdt1V01B51mFwTBMydM1r0yXK
         wxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777296306; x=1777901106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5VgLNT+dcdf1dMnPDi6oMraw8/VencpOpP+MRjX9HkY=;
        b=KMR+PyAE4b1MoL7EHhMpGiWljNp8scQJxTdfXPJpNJ/SP/nkH4TYbiy9KRJmOFkI9a
         9UTczbO/sxb8M7EB/LAzo5zyQ0yMQD82iK7TUI+Cpd9+fVz7JXunb8XJk0MhFSivKSbY
         P86y0OG7aW6+f9c8FZ6a/A3v0gnuenpzKJcwvsAwWR+PDQhm/yC5repCzj5QhFWmkHNB
         K4LWrJigN4Ipdlh3smnt4VhERzSZcCI2gtEzJmNxMULhIG+G65UoxSEqJbsFS33/ffKL
         taft8v2pFUEfzVbms57u28kJRUDFYMTsXMgxMqa8WbIGv1mFbHnYomEmmjekV0JOS+kr
         yyKg==
X-Forwarded-Encrypted: i=1; AFNElJ8n3K0zSEQgyE5LmCyp+KQGlkl1j/ppCE33ayObtBSbOM69WqpjeyWOZIjbN3hvW4a5PvEUrSowx4dPZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz71ioHtRzigCakK9S01CKBGxxPt3LuV4C979Bk+c9qLxftWtC
	/y2qED4ZQ58dz/uh+tmlYXcH5PCpeqriZJFFzUGQm9G16+oEeetDaNsD
X-Gm-Gg: AeBDievlcxkc4GIYTeNvYCO+Nc5i9YnEGVIoMFTi7LNXF5JQGCkh+Zm8rPh7G0Zuk9a
	sK2+tXgygYFCxjpd3CsuOs4ugaBIt5KJ/cgPm6LsYDIGCj++nO0moD4vg+oVYXcSDkgTG8wzlya
	BVcqHwhKd+vZQ8pOgXZNHAdc2JbhKS1Omb3eWEF1El9aJAU3s7azTOHQxqYFPfSvVTxZG5HaRqn
	06ehbwCCgR2oSp+h9f21ly9A8KbqcSjiXlPdlZ9oGo+TsX+cJYGxHSV/CeJX00Ntv3wpGhALSjP
	m5TjNyjAnXaCQWw9dDUmgZ+yaLjO68pctgym9QNRebbQ9I60zVtdgcVSb4wK37w06KS5l4OV+d3
	vowi41S3nF3gOJP+dQ2DMOuvLrmojAIOI0BuovbzepQtTrZ2mJ2iGNCGBC32luFwPr49H9cdjZl
	93EuZYuhdNjZQrNmARJGm8Icd22NtcuSUmkA==
X-Received: by 2002:a05:6000:1a8c:b0:43e:b0f8:66f1 with SMTP id ffacd0b85a97d-43fe3e0b86emr65122947f8f.43.1777296305936;
        Mon, 27 Apr 2026 06:25:05 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a166sm79933901f8f.19.2026.04.27.06.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 06:25:05 -0700 (PDT)
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
Subject: [PATCH v2 1/1] clk: tegra: support 48MHz clock for pll_p_out1
Date: Mon, 27 Apr 2026 16:24:47 +0300
Message-ID: <20260427132447.118272-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427132447.118272-1-clamor95@gmail.com>
References: <20260427132447.118272-1-clamor95@gmail.com>
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

