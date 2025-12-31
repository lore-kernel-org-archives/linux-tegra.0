Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B81DF72C
	for <linux-tegra@vger.kernel.org>; Wed, 31 Dec 2025 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184814; cv=none; b=Yyj+McM5Y45z+b0MYSb2dzGxE0lEF3xpLX4BAyOt94VLmoBxdbIXql5UA7Uvl2j6ryhAKQRpoT3MjfuvBdpE6i5Er2PUR+hyp6pWGEhKQKyNOYCkP8VqQuMwL99DAYRozwUGfTXL53tk+IufYc5wubcgrN63/26YZpoyabkEi7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184814; c=relaxed/simple;
	bh=QeOzoma0bEwKJTmy78B7HhWmFn2PQZkre2zLCJd9faw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haQCrA0ssvjazW1SLUgJG98aKMIBP+s92lq4Kh1DhXj4OhEHpjvEveXczu7ulpewnwCefF1+uD3yLAChshY1agVWPijla3eY06219irLVS2DfWq6i960HASCT3K7FxVhrsDFIvAprMkZ38btNZVNbcLi04cXRnXQyb+OfN6TwnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ijs1SRiR; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ijs1SRiR"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78e6dc6d6d7so93027177b3.3
        for <linux-tegra@vger.kernel.org>; Wed, 31 Dec 2025 04:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767184812; x=1767789612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xO5H5t3OeipHl8rga8srT12DcrRvTCrCfotIF69iAAk=;
        b=Ijs1SRiRqjPK8XxiOOU/0HE30fg3eh+xa9AHpcRJb0DjflofVbJij7WwoH6rwAEKC8
         LT9I/2a/EiEkKExo8Mc4cu9nv6FtBnAWy4VbzXKCFSG74IKlDtTVsKlHPvTA0Znm2XHT
         gbjC0vshFnOTldB7Bd3Hy8yaFsGRE/Ibd+TZvZY5v3obkIAiQc3SGeDmSfljiEGA8F68
         HXIv/xzaw3rozXirPf+l4QWcIOqVV3Z8EDibmiBNwCJPndTcSsSlHH5UFvN4QjkaUuuk
         XUBoDsIECQLVC8X0lX++EEdLLPbDVpPINjFvc/2YoSRjMejU3JUoqzu6uqPVnnhOBRd7
         i7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184812; x=1767789612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xO5H5t3OeipHl8rga8srT12DcrRvTCrCfotIF69iAAk=;
        b=p5W7+svrbEdVHOxBMbt9RKt0By8/aYnY0y8opPNe/0QgL8dfu+Wf2T45S0T59FcxDq
         X4+uTxBksXTbe2rbADatPYZfKhrHYMSmgI9TsMU273YNgLb07FBTzKofE/oqGy3YrMsL
         SiskRi01gRsVBLlzWKQ9pXPs2od9Ue3rvGH93zrg+DRhwfGQE0lPDnE4xoUAyAT2/y9m
         UctXjRXl6IdN8YKPF/RB1jik+uOT1ozB33PsGT0to5COMbg6G+fwDA1tiJFEtF9x0uAh
         qVHCJSLHe7ok0Yoay2SHqx854f5Wio/QfEmoXgaJSZsn8wovwl9yi6Q6bSHxHYluHXAN
         LrRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX9fe1TrVPEeAPV76tojaMGGqcAQWxy0O8YOZlteW2DXG0Pk6SSgrE+/daw9raPq/sH4tWXdZDOMeWsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybPIAcQCdVKBV1FZK7/x94wjNx1+b0mszNiJVqLNgIZRY/4ryS
	QSNkH7i1BaI+GaY6FOxMjC5K1e+ydbAWMhZ6WIneBaPgNSixTaZiLNp9
X-Gm-Gg: AY/fxX5IxukIj/mv6/tiHwIYuq/NHw6S5HAT59W7Pt5EuUh1CXV0m4gABs4M+mGxygA
	+P0txdI4i+4oIYnev9Cgi/vk/0blzAFLNVETwh94ktk6pBwijUp+Sr3LSzSETRzaGKuH5jt6mJ6
	QhNZgW3LQFYNg9GvaLJ6m8mF/THAxwDvNRTeiNfbPs+ZlDUpzeuBHk9Q0+szeMbc6Qbz9KQ+oFl
	tVuhdJx3OOYpe9yC7AuRElaIZgdnJtyX1NuzzQeB4mBmnlFRUh0tao8vqHUTPI1RkKDPalyKb1p
	sv+1ODnuQ2nnGoYQsjFZaiRJtzCQwG5jGE+lnmLhZ03+9Lg+jgRuu6ycfW/uhLvhURGX1tFv3Ug
	1iRzFV4iUwOPpk3OVplPOAgzpNZgv6sh9GblMzPGb56WSc6HrtxmUQYORVJR9gGyz9f27rY/vry
	pUJRPv0Ukhye4RM22rNUIzt7X7xPo851oYYS+nOV3QRTMGz3fE2ke5f9ccnmZvQ3ORBIYSAfzUE
	GDZNFk=
X-Google-Smtp-Source: AGHT+IGJFWHmis9CdJXj7mgYsSVBx6L8ZVMm9aBmS3lTkz+kX5H35E381Fw8LrQh+Ej4t0OC3yedUg==
X-Received: by 2002:a05:690c:64c4:b0:78d:6254:d162 with SMTP id 00721157ae682-78fb3f517damr306846497b3.31.1767184811814;
        Wed, 31 Dec 2025 04:40:11 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb43b2690sm137555257b3.18.2025.12.31.04.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 04:40:11 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: linux-staging@lists.linux.dev,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	mchehab@kernel.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 0/2] staging: media: tegra-video: clean up shared SoC declarations
Date: Wed, 31 Dec 2025 20:39:53 +0800
Message-ID: <20251231123955.277384-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up tegra-video SoC data declarations shared across .c
files by moving them to the corresponding headers.

No functional change intended.

---
Changes in v2:
  - Add exact sparse warning line to patch 1 commit message.
  - Add patch 2 moving tegra20_vip_soc declaration to vip.h for consistency.

Changes in v1:
  - Initial version.

Sun Jian (2):
  staging: media: tegra-video: move tegra210_csi_soc declaration to
    csi.h
  staging: media: tegra-video: move tegra20_vip_soc declaration to vip.h

 drivers/staging/media/tegra-video/csi.c | 4 ----
 drivers/staging/media/tegra-video/csi.h | 4 ++++
 drivers/staging/media/tegra-video/vip.c | 4 ----
 drivers/staging/media/tegra-video/vip.h | 4 ++++
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0

