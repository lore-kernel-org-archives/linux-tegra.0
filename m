Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6B2BEFEE
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 20:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769459591; cv=none; b=RkvemhHLKoBLGmq8B1XSerVD6LGy4k0LIRg5f14tCffCaiQQVhdloF4NRQOOCF3AJ1yUo8TxSPt8plyR2BdWo11c89SFzd8aNTjnyqDVJsMywYCtn72AKIeXBS6DNkaNJX6HfTd5qcyt+yuTK0cdfCoX9TEraKaIEGeqXAggRQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769459591; c=relaxed/simple;
	bh=L9AP7K7IS/BQIX048gXZafEbvq5i3LmZ5GjfHPcHmZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ajHeqS6IWdgW244dA63RPlkXNRQq2Wg+VQGZ66XboGxORPAEcRdbbcj7g0L1P1t5E/V3YJrXYk6OJ57WbXQSspKYilwVIIRvClOeUrDb3fMSt1wXC/yneUPbhn2CwNRVVdnz08FAaT2SDSgCx1wyg77XqSzME2zLz0b10poYlKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxbBfoj4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxbBfoj4"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so7650555a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 12:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769459589; x=1770064389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=mxbBfoj4HYaPioD2zylAUYmVEzvd0jZFZ1dx793UMbqKyso1q3Otc/bm/29CUS6iuU
         2dnumHVPXNZ1v3ZXyzdiu13M0d8qPBtcZv13N5oPZksFmUNOWpDnVKo41fBQdJFp4bbP
         tOJO39FpaRqCPt1xKATlohvrFgtF4yFSvOJtAFoIh1uu/OL1rgklR2UN7HFCfN3FllrP
         0DihluXkFuyKiPYv2fiIsB1Lrp84mFr6fbpKMsYwqNZwBId74P6JGNxbSZzyu18Jf4WA
         dF5oKVF9MnY1/CszZ6jSYVBGLU2BTkYz+Zhtx+vmW9oXwXgZeH2hbcEDwxJEfihDV0Le
         NmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769459589; x=1770064389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=NBxCZPltRQsEhpnanqke5kEongu1dKn/5nC0tuf0W7VwdOZQY625WOiKvTp+uG3WP3
         0YQ+CNTcWaweIs5I8A2fqPwSMMUPBne064KHRBYDih5tN8LSZFuWXGqmVhe2mpr7Wbtd
         zwQOWY4h+DYgrmEHRP6r5yI/ni6RkANqkxnXDds9o+fwpQQ/9MLt4Ey/sKkz2PEwsjAF
         6cQdXkAdC//C9KjogOSKQVwRJ9S5N4acOQLecd4USUXjInLkOkSkWFidt9yJou9mrqkE
         QJQQ3t0sUPqj/zB7OllL7Nk7q3HIfsk3OTDn/MbwNZ9oVoV3YnHE7FiWBkDk6K9yLxy/
         eq8w==
X-Forwarded-Encrypted: i=1; AJvYcCVFCwYr93MaysR8Pov25lXG6GiOntR3JHTVCeCCjaaLVNHGxwxfZJswx0sAVC3BbPAAY3tWFme0H7HDYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTPlBCEdL8+TZYaqQAHb1zVihY/QbCBmRliSempshFwo3Lu6P8
	O4ilTV2H9JxIG6LVPJccpmkie7pVguV9Tpw1lc2alrW7G8j2cXDjNV27pAjlzA==
X-Gm-Gg: AZuq6aILdSvJm1AkbZpH/KMayyCP+ilImORRMLtxM4EGtA/RRlCEmWeQaZHy7TsGr2b
	v8IXk2UdYa2QM270i7GleFai2xu5NrL2irXR+YoPGmDOYNI87Lykd9uAlEP9CUGTpmOBjtGbsaT
	Dpyfxz12ONuXFVdrPazkMMcIQmPO1IWs5Tprz7l+Ao0zF5ImsRvrdoC21lzDYY91MYOT5x4pvA+
	qHyhR8/vMUaQMg0JdECGvCrct7xRNNCGOhb7B5k5qSBe238Oq2DF44lqiVOu48oICLAQKKm6D7E
	bVQ4y3AldHBKQPMx1CNRjWSv5rMls8bwsMYiqG2lOKJS6qR+nSOd0eRxwu/Uj1q2QhNfS8kd85R
	2d87Q7vS0fnM12m8yojs/Za8Z/jteTPjvpPV+wLtfHEBlUFN1OKpjkJX77t6vdB6/orbofvTYDp
	mc
X-Received: by 2002:a05:600c:4689:b0:477:55c9:c3ea with SMTP id 5b1f17b1804b1-4805d0690c7mr104124775e9.35.1769453909695;
        Mon, 26 Jan 2026 10:58:29 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c3732dsm7296265e9.11.2026.01.26.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 10:58:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Mon, 26 Jan 2026 20:58:17 +0200
Message-ID: <20260126185818.78003-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove current emc and emc_mux clocks and replace them with the proper EMC
clock implementation for correct EMC driver support.

Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.158860-1-clamor95@gmail.com/

Svyatoslav Ryhel (1):
  clk: tegra: set up proper EMC clock implementation for Tegra114

 drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

-- 
2.51.0

