Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD90231830
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772672971; cv=none; b=F9KxCjiBcxqEOk55Aav3o+YmOHw6A8iF1BOCUdPY/E1RkNFggg+uB1RLV5pqxE7zUls8gsA9QokKMy2FDcNfMycFwu1U+rzGhzYgPQ0aIxFaSrDUXlJtOxERlApWq1YczJ499Lfran6+mCZImpRW2ZNTcDfDe6ZvCk0Fl2N1GEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772672971; c=relaxed/simple;
	bh=LbtcQ/Ss8yqEo8OcFf87cZm2O+0qnQL71Oa9ALTRLFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xr7MjfKldP1Y62u05QngshJZ8vtd+l+Xwq/UIo1mkXt96fe1f1GJ9AVvbDoYIH6Ad+ZWD75nmpyzKHj2jbhrfRAdnhSpQV/F8EOQBeu+IJ0wnOYclrCaKbaQve2okf4CzHU2/0IcskKeJ29E/P01LMD90Nx5ox+RKdu6Hx8+CqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eliB95wi; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eliB95wi"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b936b85cc71so920389066b.2
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 17:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772672969; x=1773277769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2MWUrsUXFcwGOAac+qp/yjy4va2ZunaLxL5VCfPRVvY=;
        b=eliB95wiAXGoG35ssONcunQlQKovuuvWsxOL6j9BIh0W39mVsFlMD2q9HkkLcnHBt+
         RZU4t1oIJK2sPtHtGb/8hF3/5tXCIYFaB2LZeZaqvuuJ8zfG+LIVjRucaY0EpKxSc8tF
         U61u88OLvWNIu30kWAw5ALOqqpxqgv0Urbthp++PGZ+CNFMMRXgE4HyBpqiB7B4qEf//
         yJtQLGaLQFIufMMpi4KfGdth6fbD7Gdds1eDArp9whW9sjCdDQPY3h8P/DqfMCB+uG+i
         32T+ofsYyS0Zi4ZrYYhjNUTymLg3y3iaWYmV02ZFTSFava/nIZZq1L3RVdtFTIHXIkSO
         X9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772672969; x=1773277769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MWUrsUXFcwGOAac+qp/yjy4va2ZunaLxL5VCfPRVvY=;
        b=tvYlqfW3fnByIWTGeWiBvn0xYD5casagyKAgr9ZgqClaIiwbQUycDT6xhyGTTqjAoO
         B3GMVwrB5em076hQgF4abiiza3poAB+4jUIFCpdOCNZjEEXS98F7/+3Ne+IgJL+Ppfe6
         tGwpqzfAzZpY1aFpgboihAVZbyDtIWDqWoh/y1y8adYTpNtllDMpXUbkIlIZFmwfoduw
         tYKqHa3Y0yyj0ToaBLbM0pr2FRh1k5uDLMxQUt20fnan3CG2QRUmJhWfBQy3u5VmDEPR
         17+dG0+2G7kL4gwgqOFDptbJKUjhRbMz3HExMFZQ25w0Cr7Z3XAUb30AncBQW39X8ZhI
         YApg==
X-Forwarded-Encrypted: i=1; AJvYcCWQB318n0uNWwzmXdQvSSPNQ1DjlVIpJy/+B+txiFlwr4GMZ1NrJLqe77JQIEs7+u7cN+zKywNO9fF0aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznz3c8b7b2qa6omGNvU1kU7vd0GUUUR16tALYFZyPeM9ElHfeh
	fUqrKWGgRLSYO0tcW5GWgo5r34kot33LotO/UNrV4DCgOOiWK8AITU6j
X-Gm-Gg: ATEYQzzhfjM+gudRIAXaQVGQg2GsJNm76lmkeyD5whsxx/TmFNFQoTSu26o0O+WdV/6
	NbBA9MMEVlF+9iLC5ZUMpov4ShS2zfO2NY6vd2CxQud9zp5B3ItH7DOloi2u9v1RTrA9JrnLiv8
	p0VDAAv9LnlfeTunwn5Yo1BbDBe0oChK6qpLVA7jlj9iZsUI3PBeychuwKxiYx9A2GdcU/SuHm2
	+qh371jSB3gi8kVMq+L3ZD51o7MEA9qYSpUhlDJipotLWryXBliO/AZHCfXieFlF1IrXMKdVPvi
	P1OrOzV5pbYGnpiVFBwfQrXXps/E396MwuTEaNnvguvfOntrWLqGrRh80h/JfA7zov7oPpUftcv
	BoYKOq43g3Q1xQlIUrzsropcBcA8rI16uKv0UZIj6r1HMpqyb5UxK8pL+8hr2952Z921++Nq4uT
	qMz7zZNHCK1hgbUvCUxkhqcgGLkZH8+RRbmr3yVo0llPW30vB1VWX1u7yRGDyH70FZnjFby4xt+
	lki7jCAsgSy4qATSKP3/8y6L4/FMGfwc69fkH2U28zL8UrrdDHdEC4v01+uR7vGf0xcOMiD2Yq6
	v48qfdMGlSqcMDPe
X-Received: by 2002:a17:906:4792:b0:b7f:f862:df26 with SMTP id a640c23a62f3a-b93f116dcafmr247166866b.14.1772672968574;
        Wed, 04 Mar 2026 17:09:28 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab135bfsm841560566b.1.2026.03.04.17.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 17:09:26 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v2] staging: nvec: fix block comment style in nvec.c
Date: Thu,  5 Mar 2026 02:09:24 +0100
Message-ID: <20260305010924.40335-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a multi-line block comment to follow kernel coding style.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v2:
  - Add missing commit description.

 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..0e655f79e 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
 			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0

