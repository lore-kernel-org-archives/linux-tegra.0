Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E448213E9C
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 02:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778120560; cv=none; b=WBJaaHFKatYt9YjFlNAnd8NMdSTaAmry6NYV0bVbzjEZFFlNRVCssEct1YeicIl9A/2ubBSu/IHzHMgfTZNlDZXmoC7AoRwoI3qtbULS4fF4Y4pR19bON81L267f+riIAss3YUl+PFCIooXP1+/hDT0Ds2V5L4FfpnGi/275jS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778120560; c=relaxed/simple;
	bh=8nxz7b6pzvptsxQavYhry6DOMizBSXb5xpuCPsJbSSI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e6GxPu0HbCdqdZAikTAylCIhejWudrB6FmIhiwdr29uhCyOTqsgEHg+xX1gwvCYUZeid4D3VGffhpdjVgqK03sEhe7tEnQOXahyWrByaapfBgf25OOwPzoWn+OV7ZKMZ+Lj3xmzej6QWky6fEUkDpEiatQTh/s34NXSDtWFYifU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXL7iKDB; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXL7iKDB"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2f33ae12f97so697499eec.1
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 19:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778120558; x=1778725358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hU7xl+fV6UprDQvL7p9kbzsKjs2HsXfsZSPYvXWsgDY=;
        b=IXL7iKDB0VAln7oWx9BLx6gCL21FmnOvj7eQR6XPlj3nyBHQuwSe+52UA466qVx1vQ
         wLetNoPHSaA30Mc9W4zmK5nItVtIKTbevmgGUkZjJRpXb+RxWoqegMg/694FiClchc6K
         gywBiBoFbwTd41QaiQpmPjane4TLda0B/W0M3ATCCyhq89juDsGkzV+aVcJSOom5lV1e
         yUyP05FV0RP2TW/bjLK7WFjx1QschSK+2lq1R7D8GniksQA1ABI+n3lhnAOzlFeL4E1s
         036SoEG+S494w46wTb7b0WFUyjCcMI5xzCYmptNcGPjSYutvP6915FKSrhXMlZ+Zv51J
         2Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778120558; x=1778725358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU7xl+fV6UprDQvL7p9kbzsKjs2HsXfsZSPYvXWsgDY=;
        b=PFPmM3vT/8jiTeIwm5gl5+h4cUrsdUQ8Srm8ZDcOc5vUTbFqrQj/jhHIqR7L/CjCKw
         zaeAuvb4nkjV/1JpDpSe587IjxjJT/8ctcFKv6FsNFf28ky39OArd8skAnhR2xewd/wJ
         ptOpH9TuWs4x72ZKQNoVFQNFK9mGKnA02q0xybSbLHU02D3xnuOUBs4J52Zvvx/eeLRo
         m4i+1xWDPp1GPBwHphcvqP8AEPr2bNaKZDToXGlxW1XqauJES6g+0+O1H8pS6de3oEgK
         3RUHRGLOS9ON2auMTy56p6+T/bsa+6mETzE9g0mqnhOY+k7Pthob43akRaIInK6R0WPy
         Mrsg==
X-Forwarded-Encrypted: i=1; AFNElJ9eAtIT3WYHKCfDHHm7Gi2bFyrxPk2gxA5ahTeHd6TmbhBKGvoI/LjWfTP2C7P0oPfT7zQg6FL6CjQEiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdyxvayVuxnyXMEX3RFqgCQ63D6D579AEc+e56z4XYxPwpTu9q
	w646Aem+o0wS/kknAhlaFjZomqGhkDqIpu0/R8uVQbsjr0gUwv5DMX/NrysvBasKSKA=
X-Gm-Gg: AeBDietqND0ZKLxP5s+LBYWxib99cdQyZSn1BQMG3xx45mFnZ3sX1BmkuPri3QiDBWt
	nLH+3RXm78YgisCngbfZyDxb4cU6xyTa5GKhiJHATX+5hm+9i2taMHRfa8cbD/srfKlpGsDp37i
	Suz6YP4DdlQNNaGGOk5cqEYywGiPBvzNP0HAjoHUBU1gqpjWr3qmYhaucsw/xbUBuC/4uGdbwG0
	q9U34WuUun4iyrevHMvETwf04UJDKF+bicMyimrAOj3tACsEBnpv3spm8ccvGF7xDOCqeIVDNtI
	E2rpTy+WG5L8uQ12wN7fTrE1JPRL4PFvkiLOF5D2XNThYb5PX+xaBi5J6knAjccqY3Zen+OmqK/
	o1JJwMk26jFoGeaCc1cWuuh9i2MDxMy35iB5qJioOv4cHZerYF010oMTZPw12Jf2L80l1EYUN5A
	Hu9PBBNt5INQD+eKxzb0dpBC9HMU0zA9oGP4EpF3CWKRe8SJSZh6WS+YR0jbqoGYyWec75bkZu8
	8HH
X-Received: by 2002:a05:7300:7492:b0:2c5:ed1b:ca9 with SMTP id 5a478bee46e88-2f548e95b2fmr3359388eec.1.1778120557733;
        Wed, 06 May 2026 19:22:37 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f570384e46sm6658192eec.26.2026.05.06.19.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 19:22:37 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com
Cc: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	digetx@gmail.com,
	hverkuil+cisco@kernel.org,
	dan.carpenter@linaro.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 0/1] media: tegra-video: vi: fix invalid u32 return value in format lookup
Date: Thu,  7 May 2026 02:22:12 +0000
Message-Id: <20260507022213.29290-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
- Add Fixes tag and Cc: stable@vger.kernel.org as suggested by Luca Ceresoli.
- Add Reviewed-by: Luca Ceresoli.

Changes in v2:
- Follow Hans Verkuil's suggestion to use WARN_ON_ONCE()
  and return the first available format (index 0) as a safe fallback.

Hungyu Lin (1):
  media: tegra-video: vi: fix invalid u32 return value in format lookup

 drivers/staging/media/tegra-video/vi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

