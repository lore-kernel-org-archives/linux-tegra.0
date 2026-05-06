Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21123E0C54
	for <linux-tegra@vger.kernel.org>; Wed,  6 May 2026 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054286; cv=none; b=gt3MFr3hWABjx8KF+giT91+veFmbfxKqnm+6DB65X2XvXn0jq0PMYk3GaCa1ZTMbWPcZ7sAkmWRTCem+gOq84ZCrR/+SKTLX7ksXQ9VqIMthebj5OCeCkeweIvgKWSspi8RSP6nmwacZSq1SCqikfvRIfjMtbDvMjQDHabL8QQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054286; c=relaxed/simple;
	bh=NxDn3Yx28HJtPbWuriUuKQ1bU4FkzVJ+n8JDBIb0o2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VUabYYm8+LNODiqO1zCEY4qB5ioVMV4lTki4PpnnkIoXIeLub1xcvKPVyDrPAHolAJ55JG8WFXpA4H2xLPvNhFqsTH0/4ljL/h0PE0GcrTZDBXBPaXvJpEtQA72TGDSihY62i9pwkaarDQ7hdIuD9WoLgRcJE9f/RKE3NZPT/n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9hTC8TI; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9hTC8TI"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2ee990e8597so6472577eec.1
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 00:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778054284; x=1778659084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yP+mwFYhjefiJc9HNwtug4g60Bu6O6itewJ8verryo=;
        b=q9hTC8TIg2Uvbz2B18ecXgVKwj25Tc1ez3DbAA9ZeizaGQbAhnSZPHqZ+i/8y0ESDI
         buKGBdTKEh2sYMjk+S5W+Emb9Ym0mqd6jC0Y2+9QTdIcPM37JYx3W8iKSQrAMtNLGc92
         3lFgH12Lx7OPV2B2ag5Wz6Tk8ZLWYMK/PCOpS3CeP+D999I0eWUnKXF4KO+QotjxcfMC
         qcjkUlZdRe0pTroYJcgY7RudcaXFfy0EH6dzggPoDOEURHKlrGvhZZPvTR0vFd/wK6dm
         OBtlu2bnQ5f7y4BIpQgDgiace6IqL4YYQM6LOAgTijVtd/qI53S8qdqpAQMebfdkIVJS
         i38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778054284; x=1778659084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0yP+mwFYhjefiJc9HNwtug4g60Bu6O6itewJ8verryo=;
        b=iBCb0Wcu7TkM6Upit1ZMV8ntXJtrCzb6v9NpuusTIRDHJ8XoiDaI3ZA2BmUZLCxfym
         U15KtntOp0OGpvDAS4Ca/SMeY+V9qBAF1gZXMAgwmfysi9Ow51wSbs6Pr96gpA/zdJqv
         ge3YMFPiAsEKRNWUC/lRUH/F91J7O1LqLQRue+ledwR+KERdhC09Hft3Li5u0PHBuWeu
         mkHGC1k4Fa2vcCfV4T97g7jcl6UlfoKPsskmqTvfm1YPwpL990SxXTB04Igpw9ZNVisd
         f8X1akqqDRUVWcMbI5JIVb7SOgaAppk/NhB/JxoQewOt40oPtr+pfcgIfrbLyITLi5/u
         gKqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NvAERYukKSIGd98i//mXBs1UCkgWPdWotfeGH0VhlGPyyY9VY10kPrS73RvGBwlZOj03sUygQw2aR/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz55PFKevdGe6Hw3X5ksUH6n9ocT21EgUNAJtXpvc0mmn1qaR6o
	F8b2fkKoU0dXSOYuQODOhW5RJYATF2K6asy4YJH98d8mu1RYUYQegl1I
X-Gm-Gg: AeBDiety/rwVHRuMpvyE5Jz38BE/EExLV3XH/9TWlS1JnzE6pcwFhdEcYD9NV1cGOZa
	ECqWVUWbjwh07iLp3FD3+kZQb181Bn/og99UMDaQN2Kf4Orqv1U44i2ZSj98Hd8UT5ZX3iI6Cni
	xhR3LjZ8JrQK7PUfdSdQeUbtoYi6LJgTy4tw8RFNkxhdVJBCvADLKnFhrxAhFbbUhH92EMhqkd9
	/YtirAFF1KeQ7Ft70qdg4nc6xSv97u8Mnc82hdSJHz9Rq970Yus6oMKO6qCqxN4dQbvfNT8NQEv
	3Sck1P//weUqrnxvdeXn+ACTvNmBZ+7Zp6Rn5Io3t5I1DMrNCpwXN9JB5yDpePGZMrGdCgh8iO+
	GxlMxfUN+4a6IqUN9iyoJceEzGfyCU5JOy4c4NdnOklDtGkTf1NZ/Lp+hzl57LcBOY7fW6xa4ho
	jya3rutnUoS8OrvLrc3XffksVExCzw6X8FdYCnzwtMzkutbl8g8rQSbVQrxG4mbcmH7w==
X-Received: by 2002:a05:7300:4794:b0:2f2:5726:db4e with SMTP id 5a478bee46e88-2f54ac74abcmr1120763eec.18.1778054283787;
        Wed, 06 May 2026 00:58:03 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56d4cf2fdsm2416561eec.8.2026.05.06.00.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 00:58:03 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: hverkuil+cisco@kernel.org,
	dan.carpenter@linaro.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 1/1] media: tegra-video: vi: fix invalid u32 return value in format lookup
Date: Wed,  6 May 2026 07:57:45 +0000
Message-Id: <20260506075745.28574-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506075745.28574-1-dennylin0707@gmail.com>
References: <20260506075745.28574-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
signal an out-of-bounds index. This results in a large unsigned
value being returned, which may be interpreted as a valid fourcc.

Returning 0 is not a valid fourcc either. This condition should
never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
access and return a valid fallback format instead.

Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index f14cdc7b5211..456134a9e8cf 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -80,8 +80,8 @@ static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
 static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
 					  unsigned int index)
 {
-	if (index >= vi->soc->nformats)
-		return -EINVAL;
+	if (WARN_ON_ONCE(index >= vi->soc->nformats))
+		return vi->soc->video_formats[0].fourcc;
 
 	return vi->soc->video_formats[index].fourcc;
 }
-- 
2.34.1

