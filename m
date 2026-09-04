Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A217747D473
	for <linux-tegra@vger.kernel.org>; Fri,  4 Sep 2026 12:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523635; cv=none; b=Di8Fj3FY6ana8hbLyXIljZcwiPUY2O5e27A85bZ3mgYYb3YsmyH0W6fTd+exgBIC/1CWGpfVGekA8BitG4YU2aoDmIn9PPL9l0dNYcWvhM1Au8czSsZIL6vV7N1ad0cL7k30YI+2rzqc5r6AYQ4Bgh/suNdsLZz5mbBXjYsEo8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523635; c=relaxed/simple;
	bh=p041shYqEXyPJjXxrMykdC7eo44mMrAeTw3kmazrmG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mz8z59/7fdApvK1ScUHbbrGOBz1xMocrVM+deZ6dgnsDO3GMypWfT2/mjxnivBs2WLwt9LhurG4akaKIdKlhKt4XxgbsLVNO1d7tzSridViHbhnmHIqu7X8vEnwbaW30IvlvIAxhq834KZBA3h8dmQHGj0PCNBLDV++rF7wHtJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZuTnYHU; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZuTnYHU"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6aca0f482e5so888928eaf.2
        for <linux-tegra@vger.kernel.org>; Fri, 04 Sep 2026 05:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523632; x=1789128432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRzwySIKet2vXTJydQDUqffQLNKueIf8/ii+qy4BsUc=;
        b=hZuTnYHUlmfEAHfIupPovGfTtiVnX3Hr0t3UOorF0zbrAxrDh0brlGmMBuq2HFmhud
         7bdA1bD/qyYiROlwPb++0eN/3QOdizU0YFdSPsJUD5/WKSbgfu6owSrwzPpJh7hPb88U
         OFWhubkCgD0ycRBBeTGlOkkztJCjsY/UEPELiCKAfoJtMES5xPsOCMpsfDMV6RX88STw
         mtebscNaSD0VoYsUwZLz9WFDhZU5cq8O6Aym1rlHi6CUWCpF6s7BIVysW93VQE9TkvPj
         jnXeVRXg88I+TAvqjy8RPsvxqHx8LbsZ1a+X8cr5SJzcYieGhaKAt8/TdgdnwnGk4Ril
         cX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523632; x=1789128432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRzwySIKet2vXTJydQDUqffQLNKueIf8/ii+qy4BsUc=;
        b=IIAD79X0HymrBWGObbOKcit5dr+/z00vRdNM0JebUsOkhdJlbDuUumve5IGvsjSgcJ
         WI/prUkR4C3vcpWzwZKG3t0X2waNz/4LyPBVSBBdCQWE513RhW7zttGOHhQFpi3CmCnx
         PuyIEkIjVVzO8VpB2Zlu6D2rDl2madHLdwpxKOUMKHWXga9BXWzlb8e4OEzln9DlDcz/
         T7drpVyDT+8Jw7jL1U3q3DPWCJ0IS+niZylkSkBxu1/xtseVijpxc/Yj1sxcsR8SbCRg
         ydj/1rT3aAPnP2ou0wfLxQ6sQJalJaxQ6aVGUD6uhKJISyTUBhnp2r4p1MwBJh5/HJmQ
         Xc0w==
X-Forwarded-Encrypted: i=1; AKwUvByijiEi1uqiWJWwo54n3IqHWX+wGeg/Tbf2UWUNAXP/5PQW7jsp4T3m5j8HB7oOOFN3iwcGPA0DXUlW2g==@vger.kernel.org
X-Gm-Message-State: AFuF++nduJG0UU6bU4n9Joi5BuLtwl64Cbfp7c261l2WJCy0gJkUHolK
	goCVLA1yI/2ulprAgNHYI3bghBnLT2CPA4qldeBPMz9nUjtEo/LUytgP
X-Gm-Gg: AYBFou3KqwR10L4rtjzPYU4vVW7h4iS+DR2y6Mz1U1treAt/M4QjmcOzFqoxXcgj+JJ
	X1DIQ9SgXtSsskjGbWiwNQmayFD3xuYHIOWPFOcAJFsBuuRb+qfDIBAt5nakt7V6tc7Fati+Cs2
	a4rJyzE3SXNRY+W/JZWRnOpjVCyRIgvwcIG7LT2ASWw4SZTFTsj6DsMYT6Cpf5Yq7E/whC6Auf0
	frQBmyqnBE7DVcYXXUXvkne8WG6keLxzzlLNtW6nOqzc/95Xz1xcPfB2GuTxu2OcMWRS4exvcnX
	ygnlELS/D4r1L9i9hAk/M1kuIwQZDP3Othl/plNbQJoT3RpoBT2qS20OrGTZcoceXGcWITUpoQC
	jPjXzsPxaWWqGMi+y2gufS6sHRMWu6tjaLulFiCcJLCyfg0a2RElB5O8ROO/le5gY972F9Md+VQ
	58pVD2yAYbfXrPfF7kvPI+dX/2+Liz6pso1NWy8AALBsFnj8SUA1zWcvBZAugDMmcI7kJeSEu0H
	DbryivG2TaQKy0=
X-Received: by 2002:a05:6820:4c09:b0:6b0:5bd1:4722 with SMTP id 006d021491bc7-6b6faee256fmr3944633eaf.13.1788523632473;
        Fri, 04 Sep 2026 05:07:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm9247100c88.2.2026.09.04.05.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:07:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] drm: fix typos in comments
Date: Fri,  4 Sep 2026 17:37:05 +0530
Message-ID: <20260904120706.19154-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c    | 2 +-
 drivers/gpu/host1x/hw/intr_hw.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0d2c0ab0a63e..d69c0153739f 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -520,7 +520,7 @@ static int tegra_hdmi_setup_audio(struct tegra_hdmi *hdmi)
 
 	/*
 	 * Tegra30 and later use a slightly modified version of the register
-	 * layout to accomodate for changes related to supporting HDA as the
+	 * layout to accommodate for changes related to supporting HDA as the
 	 * audio input source for HDMI. The source select field has moved to
 	 * the SOR_AUDIO_CNTRL0 register, but the error tolerance and frames
 	 * per block fields remain in the AUDIO_CNTRL0 register.
diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
index bd5b5ef62f35..afb68e47ecf6 100644
--- a/drivers/gpu/host1x/hw/intr_hw.c
+++ b/drivers/gpu/host1x/hw/intr_hw.c
@@ -93,7 +93,7 @@ host1x_intr_init_host_sync(struct host1x *host, u32 cpm)
 	host1x_sync_writel(host, 0, HOST1X_SYNC_IP_BUSY_TIMEOUT);
 
 	/*
-	 * increase the auto-ack timout to the maximum value. 2d will hang
+	 * increase the auto-ack timeout to the maximum value. 2d will hang
 	 * otherwise on Tegra2.
 	 */
 	host1x_sync_writel(host, 0xff, HOST1X_SYNC_CTXSW_TIMEOUT_CFG);
-- 
2.48.1

