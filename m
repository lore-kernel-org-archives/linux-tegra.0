Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541122E1EFC
	for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997978; cv=none; b=lDxNw5WAoCoAbK76fVkkNOC9aC/uvAyukYH5kmtI78y8Vr1ozXPQPRw1DarQD1SUO7OD8AYDS0yObrXc03n6pyXyenDCbUL+1QdqnWta5Hi8tn1VNkJ6lHBEBe604vzLeDawUBaLS2GM+ncv3rSAn5znVXCNFQmzy4zPLtciN1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997978; c=relaxed/simple;
	bh=WURkIoNSx7cpBfeNmDjEHI4iCOu0FPGWs5wvUfkxOAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iauJKT/6S03KB9QJ+UTgS2AQzFl+pPlDTYDaHq7xkmC6TxLjHH9DsATa6ciVaAKB5bfrX4yIX8uyBMM88Nsa5l/ZkOqGdymRoLB6GeJvlH1coE7jCDDC2tUU3E5+z5M8iq74ojHr/lqwv/h0/OZhkVL91/ZXZkrv0vzdFLA6L0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIMImiAc; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIMImiAc"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dcd9061b1aso1256398a34.2
        for <linux-tegra@vger.kernel.org>; Sat, 16 May 2026 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778997976; x=1779602776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6gmKXteedUEtXr055uhX+38a7zvo9Ud/r154o82WzWM=;
        b=IIMImiAc9SmgDDNHeTbyU1ntqTW1QxtZbysBDtFPjgyXCONWy+HAuBXLxLGx+xYMfN
         xxJK5OXd8VUKi9UAF7gZeRPNYHM6C/HtlO+JKN3k7kLlPypcTj7GN9YkjUO6RdntjljA
         awtTF2aFqkTLj4NtbhZaTQLadDKT9lSufPPR74xKjGHT2Q6gOnAbVF67Ot2HgDdBADIr
         wjl5jjTvDkw6QnYiPYODpYgv74MpXftiznwk7bYLQqRCAEWDUM3C1QZt3/qAnzXVTjbK
         sfQJ/uyQ1GCXLoXHaMwCh51IaeG4vxmnRxkBPGFoXt84i0iJ3o5JKK6qf7h/mYUoCdux
         tanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778997976; x=1779602776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gmKXteedUEtXr055uhX+38a7zvo9Ud/r154o82WzWM=;
        b=VjPI03q0p8FzTWfYpqRm78BgicurzlYQGGewyDAkbfD4a/jXYWRju9pbnkKuWVfl2s
         6/K2i40deCkZH6zITNAvfSMMloECaPmoCPWBkfC3tbTVp8PyBmJRsJmasZRBOBoJte8c
         Pi8miftb638y/BXS+4cB8t3iJ1JUxnvM0S4BGuZkZSJU+ubLIyEwE2RzNsBIqslvNY2R
         s09aViJmtTRNTfdJ8T+1nGf8sHEB30wfCCGMJPM8uwvS3ZNSpR8Lun6ppBY4NjX3RRSr
         UtqnLjsAisC1m+6AM7sH6pYiTx5nCR2k436UOyDOPhp1H4eSp2+TF6PdjEtJWAQE+3+f
         MO8g==
X-Forwarded-Encrypted: i=1; AFNElJ9a4DpfhC6Q0Dwrn6xSPPGHh5EITah6SDCU5iR4AxSeqaJdxpre+cWSaiDQE8VvmYzdJ/OFSkoFNp7ZAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz90OL4LT4d9sNteKyO3juwcfW0HygJ5aHqfcRv5KAoXlds8LZJ
	68GUoykyVDWUYazplJAYzhprOdrcXusxNLZnXKNiHKetbjd24TcfQxT2
X-Gm-Gg: Acq92OH7uplt6d8SiIc/QLcXNpQTAOiiEUGw9UOzmQjDV8GL5/RSh14Pe+qqMENHKS9
	sDnN6RUqIiy6koHnGrlRJ9xeoNbxMT4ge5cClsnShuMa0e+LWAy2/FnawqCHKI08nTV01N3DA4l
	siGnQLAPXF0P4PuaLjQro4LBbVzFt4aWREyBAVgves10u2qP9pL8VvSk1nAaV3XcH9UNPeGwfU2
	mI6K9Kh0rz8te/6WW0dZwZHmpiZwVTST+i5Z0f3kmjzE97ef1xp6uB233tupN11WCpkUCYwyaff
	NwtVWq+DOcqXKgcNhVY13H8ZvfgwcsoQMJ9MnvE1mu1oE8YvkehqvJjEWwG1Aw/tX3TfGpy/Ua8
	/AsjWAbgrl1gMDT7vWQWr0CFRXMKealCty6K1bQZv5MM4E84zX2xc3PiMBsUyPYWweOZ0HzmuA4
	3I4mqXkMCiYp9EMwESwIEMHpuwsdkQprcfDu1/0ooaMwjIACxQAQ/7
X-Received: by 2002:a05:6830:d01:b0:7d7:ed69:81b2 with SMTP id 46e09a7af769-7e4ea071959mr7144526a34.5.1778997976305;
        Sat, 16 May 2026 23:06:16 -0700 (PDT)
Received: from pop-os.. ([2806:264:548c:885a:a314:9972:40f1:1f4d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b7cd6c0sm5550998a34.4.2026.05.16.23.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 23:06:15 -0700 (PDT)
From: =?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
Subject: [PATCH] staging: media: tegra-video: prefer using the BIT macro
Date: Sun, 17 May 2026 00:05:11 -0600
Message-ID: <20260517060511.231437-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace open-coded bit shifts (1 << 28) with the standard kernel BIT
macro. This improves code uniformity, matches style guidelines, and
prevents accidental signed overflow issues.

Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb..08fa234af 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -177,7 +177,7 @@ enum tegra_vi_out {
 #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
 #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
 #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
-#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
+#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
 #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
 #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
 #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
-- 
2.43.0

