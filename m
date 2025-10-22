Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF302EAD16
	for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 17:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761155141; cv=none; b=ec6LSdawljTQIbNHqDPX0Y2EfJ/iYpZHE5PiUVMqcunHx5/Axg0PuZLU9fVg6NoulZI9BMbHBbMuYfXnJnvYwxk32IwJ3V27lpxJWqJsAwOo0XkmT6adUk2Ts6b0d4x13g3sksxsGQj5Zk2EWlr1BgvvYsEzeewuMpvaefAaIvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761155141; c=relaxed/simple;
	bh=hcgBLrm5AprMmq6STEBsvMEfTZaW4+SauQoocHKpEbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WCWXgCP+1hbSie9fedUl6IkrtOVcWTuHKIAGPxthFmhKii5EPi75XyRcUS9+rDW+Oe7N5/GRQYLelP98QgiTsaY9AlkILhnKkYdg8SuvpqaUE/HT36Vo7ORvtFvVQl4BoxMrUDcGOfMHLorfL2BrMSj6zyV4zRtnC3kZ4Q8TGjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6HqbWSX; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6HqbWSX"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a2738daea2so49351b3a.0
        for <linux-tegra@vger.kernel.org>; Wed, 22 Oct 2025 10:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761155139; x=1761759939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oM0pDJBRrStQb9KnLg+RsNAWtHLuWFkw3NawKCjlW2g=;
        b=E6HqbWSXGdqLfDADmMHoS8KW5wT0gm4gyfwgY/hv2AVZQRergTXpYCIBZe17NSe92E
         kpbHq8CD6uwDzLycMjKOpGbYsJAKODDmeEdIE5KQ+gxs/TAHOykG6EGT7OB/EtKoWtSE
         YTfxlGC+BMcVnyg/2lOQBhSp0cYTBUB5PJxF2i6TZ76G9GzzJ9NkEkqRjKT2r64Zv9zc
         KbeJU6WO8t+REq5ZUceQ2xuAG/zm9IJao0CmgUKXyy76jl0MIvLxrjkKcn5bpw7lCKeP
         3RhW98QRM3o0DlSl6LgrAwULMbRGqUeqtV50LW11c+BfZH20fuKhxczDgLxOG29frWEi
         WGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761155139; x=1761759939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oM0pDJBRrStQb9KnLg+RsNAWtHLuWFkw3NawKCjlW2g=;
        b=e0ERcV/B9NEO/Fm5ln0CgzcA59sVYJyPdhTncTrKOdzle8ApeLPkup7jjzXxuhvt1k
         Qu5suosP/LM8FQCuAeR3p1pSxNL6AlgbHf6hqC6rM0VNlLRkUHdNunLvkQt+T7Mj54t8
         vC2xQmg2eOqQtjS2yoJx3I3L0UGY6BFspHYu1Xn3XzfQDqVBGLMPtfsIjdfZ98sLmf9x
         78kh/4RKOjJiad3clqMH/OEkBCtgVNIOjCLG37sNDWsY9imeNEZkL+wlRqqYR1jC0qR6
         DTbIcrPe4KYMqPd391fk8w/gZqBrDpnGH+Y+NM42dmAH9tINNVR8FkK5srPO8983wcz6
         Enpg==
X-Forwarded-Encrypted: i=1; AJvYcCWLXze69asKKv9pg/iqmohBMxsMe+CgL3uLqwQvhcP6k4zuZ/gmb6aAmfhZ5LIY2T1zBOplKQ+qciCPFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWawWZ4XSPJK8tjgmPEMDWiWVyhLDXFlgPrfAGAM4w+g4Rp+F8
	uPKicyhoE27hsQSWVj5YqG/TxTo7CLkvhpgqZPRRTxzMtPWZYC1PGh/E
X-Gm-Gg: ASbGncs5DvrXIFeg8ecjNIpztmVpWf6mVqXLP/n9DQUa/m/KVaakMaZia1Iwwwgquj1
	V6GO45pHLRHhosnbQyoI0WrfNw9O/V+tL6bLUOCIcoD+k6FE01u/CNUDGJOcoQNexb9GqXRDpWI
	2Cg+GZMkD2pVReo8GyGAyC3utTkGWyVayhd0ekONwCk92DOGScx3cSS/eE2KveLaan2/eFqqkp3
	7A3D8e/0SW1m4Nw9oi0GT2t5JnHxAMHfGwhhT86yvk9UJGONACjeWpfmrrlDOstK8coDSWdBxWI
	uDQb+SEX/STCZhgpYzc+0exix92F2k9OxykLZAIy2oT33lRdUOwoId4NjrRIvsQvjsPATO9W7sD
	7bzxYh6j+pMr4tW40cJOelAo5BZ1BYITIUgkQe6HH7tmbgsLZ+Uhll+sP6EXQoTmm6GKB7WGgwW
	m/ajoVaAdIHpQn4EYx
X-Google-Smtp-Source: AGHT+IHb4UIqxNyAS0ncT48o4IKsYNim5/1u1ybLcIRuulzDwqqLijuUsEqmvETulRw3f1HrLT1irA==
X-Received: by 2002:a17:902:f552:b0:269:ae5a:e32b with SMTP id d9443c01a7336-290c9ca741bmr272886775ad.13.1761155138969;
        Wed, 22 Oct 2025 10:45:38 -0700 (PDT)
Received: from hilb.. ([170.254.111.1])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29246ebd7b8sm145298905ad.6.2025.10.22.10.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:45:38 -0700 (PDT)
From: =?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
To: 
Cc: =?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Gabriel Somlo <gsomlo@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc/tegra: Resolve a spelling error in the tegra194-cbb.c
Date: Wed, 22 Oct 2025 17:45:24 +0000
Message-ID: <20251022174531.1751-1-brunofrancadevsec@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, this commit resolves a spelling error in the tegra194-cbb.c.

Signed-off-by: Bruno Sobreira França <brunofrancadevsec@gmail.com>
---
Changes in v2
  - Really fix the spelling error
---
 drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index 846b17ffc2f9..e1deda188fdb 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -1836,7 +1836,7 @@ print_errlog1_2(struct seq_file *file, struct tegra194_cbb *cbb,
 }
 
 /*
- * Print transcation type, error code and description from ErrLog0 for all
+ * Print transaction type, error code and description from ErrLog0 for all
  * errors. For NOC slave errors, all relevant error info is printed using
  * ErrLog0 only. But additional information is printed for errors from
  * APB slaves because for them:
-- 
2.43.0

