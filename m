Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EC72C86D
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777296308; cv=none; b=dkzjHz8t1l/hr9U/kG4i2MjKBPqwejLpsmKYktWtFRpfQJQWLyJo+ZDOZltWflTy/dsUwVwZAEdCURGS21oaHCf4IlCAt0zjeY8+tn6m4aXy5cd7peeGsG8sviNIAXG9iJatK+ICo3GCh3+JJJISdmCiWFV8tAOhbCLYb/ZG/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777296308; c=relaxed/simple;
	bh=BNG/Nt3+CmK9Hyh4BW3hQ4JifMYdLAzHQ5ZifotMSIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RegPCWPMJ5/iojLku+6TzB0VLRiWmzoErsOdI0ugWOQ8NvggqSCLJGDt0eJt0OLxyeknvycp8TaKLOKP9Qsm/fG96usvDDLrnfNbTi9VQ1ZzRouug9MG3jyQuHQXsGUIWwf8ygbeOrjesiNQ8pxqkD5LFrc5YLOx6OVZZj3UsMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quqNynFJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quqNynFJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso84440025e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 06:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777296305; x=1777901105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tIxTISlKz5zUY/5EeJFoGXkyj7v9D4tIsE5w4iprCUU=;
        b=quqNynFJM1olmalJk/97D8eVqMRlx/yzJwk61qZeOpyXWaGIP7SJnVomWFEFbmBAqd
         0M3lghHLLtE9tGq6xDRPkIigFhXItcvFGcW769IhXw82YNAue5iHDnjVQyUtSeCZtdx+
         +nWsxKcf0LzOpRrzYbJb1D3Pqsy79yJ0ooLfF73pu9JMEq1UYzIqX6n1w1ncPlpnqirU
         hnLT1L63Jo5jNI1qz4HU1NnDagDrfQlD+p7kxPGgAdrMehe+tO09DuSR8uP6LBlVgUpA
         QkT84oThv4tg2Un380yWzTTeO1Lu3BhgJOrGnxFFuX0YyRArV99Z0CgQsvLcxy/wt14e
         1xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777296305; x=1777901105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIxTISlKz5zUY/5EeJFoGXkyj7v9D4tIsE5w4iprCUU=;
        b=kr7t4kDgZjybbyYoYpnUR9GxxJON0EiW+bczFrqEkd2ZJDbC9se5QwpvlV0unAoiEo
         EltrwQyD1MzDAajZvZaUZJ2QTBJ7m/SxDsp+Fc1fF7lpqicKaWtqJiuTKZ04OrlwZzOV
         jpvgWfkPTE1RsVARy7lyqcQkSRSqBrFDd17qiO+RUSaWHzZUzxU8YET1KUxSSPN/uj62
         YoEZ/sTbQk0TmYB812E8nfxOtvOPGjJ1aMKVNx/fepMRx73MpRNRoapUIeBv3PMqczUc
         gMfMpxom/aXNU8ZfNz6SVsYIi3Zp5isd2gg4tVlD5ykUCTg8+vCTvB1SzUc6LWK4V/ER
         XuWw==
X-Forwarded-Encrypted: i=1; AFNElJ82asP+GpC9xKXbv7Zk4Xzo6EDQ63vLtLM8p2mEil6xoIdxy+EOHB+COHUcYQcLWsVxgnai9TYDRpSECQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbO49B3TVlEMWA4U80GL0xxtFIxSRxjhyUJA/owd5KPufWjfaX
	2sJjXuY35KTDuoGDL/Zu0TqW+n763JrC9MUBl39fwiZi9IP9v/58P9WR
X-Gm-Gg: AeBDievuPZXHxq0hg0K4ggYsCCQKh+53ReE3U52LoF7UaXTK2/CPDIVa5LQWXpdKDQr
	gKxW3w+dFlq9hbVkmwpvHN2RSG9QKB2DQqqrlcsDO4rwb+3QvJZrPcmtp+H/SoSfxmUl+RZmju/
	RK8xlUv1bvZv28cFt2pEBfaAVVbh0uOZWEEQ1OTOQO+QuJM6HBbzrttPqJb7JbkvDR9MmC4BN7S
	12g2IOhOLZ+dkfyEJYpsLhonX/q/g9ptT5pYXwx92/K86UkZFl2MRMYa17nNEonTMBwUkLnjrnT
	vsthp5PdsOpFbL/Qh6yRFF54GT1ERNaI3sGURHHFIJ+tM79pOvUHVcEAZv3IKmgWrZMc5Q4ATka
	vVx8v1gqIGAfRo3musL8YiOmukqtF41ZB8n3//80n0sUb1UtWx74NvDCDbZzF/8EGTqNUqN8HXZ
	jK+GxvXpGCx982cl/YksHsqao=
X-Received: by 2002:a05:600c:3b11:b0:48a:525b:e148 with SMTP id 5b1f17b1804b1-48a525be2f8mr399514185e9.4.1777296305018;
        Mon, 27 Apr 2026 06:25:05 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a166sm79933901f8f.19.2026.04.27.06.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 06:25:04 -0700 (PDT)
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
Subject: [PATCH v2 0/1] clk: tegra: support 48MHz clock for pll_p_out1
Date: Mon, 27 Apr 2026 16:24:46 +0300
Message-ID: <20260427132447.118272-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UEFI on Surface2 sets pll_p_out1 to 48MHz which is not supported
by kernel and causes BUG() early on. Fix this by adding 48MHz
clock support for pll_p_out1 along with 48MHz support for pll_a,
main pll_p_out1 descendant.

---
Changes in v2:
- aligned with downstream 3.4 kernel for tegra114 logic
---

Dmitry Osipenko (1):
  clk: tegra: support 48MHz clock for pll_p_out1

 drivers/clk/tegra/clk-pll.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.51.0

