Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385E812B14A
	for <linux-tegra@vger.kernel.org>; Tue,  9 Apr 2024 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712662861; cv=none; b=rbVr7RWCQpGR7II8cnQucAGBf9M/mpng8IxcOGLVGN1KKwFwX/Ic/411Au//c88izXPU2BBM/CRYT/mvjgSqFIpu4sITBpQ7P56ctJ6ZHSKxcwBgMGxX3ETsWFhPZnVsMW7wwRd6cDSwnVOs121cemsmeqCUxwdLMYmuqPAm/WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712662861; c=relaxed/simple;
	bh=rkgQpPAjwBulfGsgEC7S06810blh43cxTegTVfjicmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=knri40lku+tBZyEO909bJu/ODp5vIjXOf+VMTDOAfHf5LXg/5cSwUwH1IIq3GAoD8qJs2Q1k0Bl6w8XB9xHrdVpctiNbdpLttTYzXeg+t9tjgYAHgQ+UVuXTED2bpjwNuFFglLkaeTUf1ATguYfrMamky/0OoaF8JxFSWPX52eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=v3+SeUt0; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="v3+SeUt0"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-1e0bec01232so44412165ad.3
        for <linux-tegra@vger.kernel.org>; Tue, 09 Apr 2024 04:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1712662858; x=1713267658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nj69Gf9AC1113GLKMXeajOz51G86hh4wvGeZBblnNV0=;
        b=v3+SeUt0tthzwOK2BfAl2qYleI0rlyIz9JEziQKb9bZIJINjVqJ90cbu5770NrwoGz
         CkwDibUtqHp1s7W/HVIo9Aicd6IR0ejQOIqns1HDAq/9aXee7ve03ugofwvyUdfcbKYD
         ZZnT//QzMJRwzMDgRilW+3SOgOQEjC3Qc8rfWZmETQz8PmZ/yGH+Zy4tX/w4XmWHPEJS
         N3KTTNqIAJ/bdALZnj0XBA+KZ+TNCeyGD6SeFvjB+zuRt6Z5r4nbC0g3itm0oRNfK924
         J6hYDqGLCYd7eEYsjSO4hDmJSabvY6RayFwS0JO9NppYnw8NSC4JuXIl/RZ4S7Nc+Yar
         hwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712662858; x=1713267658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nj69Gf9AC1113GLKMXeajOz51G86hh4wvGeZBblnNV0=;
        b=SoYwzRWYDAS/TB9bmdGMHRYkFlfvxcstD5vt0rOAa8lxpW1BJvHzYqLK2QSdQ0kRBa
         NoE4RYZXUCbPjoEzjI3/jAF2adXHlWrhZTlZw+qdLjs0DTYd8w7kHW48jXjnxuNYIOTD
         CK2DiDPlsBkoDKDKN+k9jDW7c4h6KeakGw17WTcP3F6Oy6FHJdmME2stFm3B8u2wyqix
         bid9S+djJRuN6bRE2ENzoGtcaX++IwqYm3MlxB5jloxUHnqQQA+9b9UTGqEW8OjaCjt7
         Dx/2UFM6QbBGtyqYbzoJ1kYl6PvE7v11i3ZtQl0Fo7DepDUSwJSAkWvKH/T7hkFpqDD5
         tP9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVr+MdGyStJe2PVAgI44/31W54JpJd6m3hI4WGITDFNaVNtcB/BP5XOaziYInt1PuPpNFJ3x//CQYG2f+huh/N81ybB9nxQzASlJLA=
X-Gm-Message-State: AOJu0YxKubt3uwfAmIdkQ1eWgbfLnw4lPobzc1lOMd0wIDl1bDV5duyC
	/igazGV7GUPYUXbqhTaxdUv3AKe4cvdm6M28IQgqHGsKunEpjm1RUx2psaib1pg=
X-Google-Smtp-Source: AGHT+IEuUOF47jKaqXVe/uBd6Zq5NWnJYAKUjbTQwvwDQJ2Yh5Jgk6dEzXqV81OERcXTuKz1rxopmA==
X-Received: by 2002:a17:902:d386:b0:1dd:6ce3:7442 with SMTP id e6-20020a170902d38600b001dd6ce37442mr9487167pld.39.1712662858534;
        Tue, 09 Apr 2024 04:40:58 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:18bf:c025:fe8e:1e4e:c180:47a])
        by smtp.gmail.com with ESMTPSA id kp4-20020a170903280400b001dddbb58d5esm8617530plb.109.2024.04.09.04.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 04:40:57 -0700 (PDT)
From: topcat <bfonseca@ime.usp.br>
X-Google-Original-From: topcat <bfonseca@ipt.br>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: topcat <bfonseca@ipt.br>,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Fixed spelling mistake
Date: Tue,  9 Apr 2024 08:40:45 -0300
Message-ID: <20240409114045.13872-1-bfonseca@ipt.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 282a664c9176..b4485b10beb8 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -712,7 +712,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	 * TODO: replace the udelay with a read back after each writel above
 	 * in order to work around a hardware issue, see i2c-tegra.c
 	 *
-	 * Unfortunately, this change causes an intialisation issue with the
+	 * Unfortunately, this change causes an initialisation issue with the
 	 * touchpad, which needs to be fixed first.
 	 */
 	udelay(100);
-- 
2.43.0

