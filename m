Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4280A30E826
	for <linux-tegra@vger.kernel.org>; Fri,  2 Jan 2026 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354369; cv=none; b=nG+nQUH2s0kxDhQPlX17+6IuFeL/sSJDQbrNXPU+44DJQ5wy3dKpNogzL32gS4JYiVDAZBGCm+pqgIEIzrgvjROoKdJgcoWHM9iJp1pi4IaWtPJxgbtWCtvTop7BCLrNl8vJ/xCyk92e6AGCJrw0lXLIAFqp5wbarbq2olJSX00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354369; c=relaxed/simple;
	bh=DnZtX8FMWL3xUvEx9ZwEljqS0Zqi/7F7spPDPYn9XhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBcbE/tDmg5OLmA+41c4f5Sz1Lol9JvltcrMYcMEG2HM1cAviBlZxzMJ8S2Ca7w8a23Y0T2gPW+LuQMaq2MmhLEBCWi+bLzUEkuId7Q2CKpvKpcFryxLMLBjF8kZAx0yiWu7zqniqKZ9zwCAzaQbiu9Pq7DmiLoMDy3xh1zMggY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQ62hbJG; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQ62hbJG"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78f99901ed5so104488727b3.3
        for <linux-tegra@vger.kernel.org>; Fri, 02 Jan 2026 03:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767354363; x=1767959163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASzrwnWe1LPCoc7Xrbs0jLsSOmeBARD1j4LP7Uc0+4E=;
        b=QQ62hbJGFfl+VuQWrR37xmbhIN8ynp/Z/DAtnb7pIDTA9+GIHbYnsJeh2DXAhaJS7e
         fcSmirTjnZ7DuC8AhqtQF3aWwV7O/1VWsASSlVy3jua4xzBD7XtdRr8CmZTIyy9pdrdg
         x4I2w0Ts/n1JMHsG3RNAzqhRZJQvts+6bNRoe07TewXohnHpmLYn0f6uf0inGMz40f1I
         GHCE3BH8E6IX7pgE9I2q1raWZSwwyUYgC+Td3556I3svAgPLuzdz6AwGRs0LYIvz84WY
         siEZiyp/odu5HPSYfVEgVwCaJwauDiAPdneZWRrUfwytGUfz5knTTyn0rYWnzgogoOHU
         D1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354363; x=1767959163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASzrwnWe1LPCoc7Xrbs0jLsSOmeBARD1j4LP7Uc0+4E=;
        b=bhUeKjE9k8nro0aPGoNpuxY0JMXsNztAmvVEvXrKbo2wB8iY9Kj9hgGQmXTv9y/jsR
         QL29y179e6G9pAiMoJY5NSNopaISqUBj3sEZ5FimlF/cvHx+8vv1ex12MZYx/SLB3Ebs
         aqSCsbo+u7MeT9lfBJTE/8PHizPQPfDCV1xQG6YrdM6yu46PYcs2J3X4PNrvFuRm+puh
         pAvcH+6EOARllWFVhyeG7wxFfPEdA6OHkzYEClrcGX7vd6x5f13H5zdmjOjMxFxlv1HV
         pLItA6Ug17vtuBqEKg7ugF4M0jI703Pex22ZJnwieDdmOIPIvJSLeyslWkvijAgjPDsi
         Vq0A==
X-Forwarded-Encrypted: i=1; AJvYcCVu0hqcmPEQXtA5fyOcqY1zaSPn0ylDzyxlTUqT3sQleQ8rAaz6tXKNa1NcsiAAIoc7Dr7UikERIaDGEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzNk6+VFUU8rRxZ4ve3cKE5WANHt0RO0HIl++2WHKxpT59rB9u
	glTzbHSHnBdVjlD7Mmy6PnCKZtWnRbcqPnNSSHp6Rw0c57r5Tv2EzMSh
X-Gm-Gg: AY/fxX5w9HK5OobpD7pQnfCiPrTORCjBBGwuXjjyVAHBC37Sn6Yts8BeoAIkH+ihdvx
	sdghUOM7E23RRAEYRiVSumBPLRfpvj4cqHVuuWBuQJyyGzTH0UZhfX6VlYDQkaV0QoXX8nPUzI0
	BiEK5QF062tAkSFPnrxGrWV9ltr/erlFsL1dIjwhtoUdgBYm9Iza9ZjvFhLGCdnCrYdkxL2Y1Qz
	tQJ3aeOaP+OHT08dFeWquFjQRUacbkbhsl0wBC9J6TMK5Bfq+/1FcUqBX47fVc6UQ5+AK9LMERu
	xCazMsvzky3pqMG7U5r+J8H+ex3pn++4Om2CLMI9THv3MKgkp25LmGtemKiMyLwQTkXQ+9R1QTZ
	0h1EYXxtY+mVzXTD76l4irITliA3247cXbdVs8toDvriUpXUc91J/fjRjRAEx/Zms2v/RNpppXw
	DHGgIoGIcIkwQMEpkCMG0iEgFK45LK8R7H8Gqzz6/IiM73ui/pxmqFBUQzJIcrPduSaBmg+AUj+
	SQhrgA=
X-Google-Smtp-Source: AGHT+IGAb1LvYCKPkrw6Jp7sMEujxcREGH2IZa4Xr5bo9nugfnsGpFXZASy+0aYsNgKqGokZhA8vng==
X-Received: by 2002:a53:a9cd:0:b0:63f:bb1d:e529 with SMTP id 956f58d0204a3-6466a8f31e2mr23590058d50.48.1767354362981;
        Fri, 02 Jan 2026 03:46:02 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4562df4sm156230587b3.55.2026.01.02.03.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:46:02 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v3 2/2] staging: media: tegra-video: move tegra20_vip_soc declaration to vip.h
Date: Fri,  2 Jan 2026 19:45:01 +0800
Message-ID: <20260102114501.42312-3-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102114501.42312-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20260102114501.42312-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra20_vip_soc is shared across translation units but is currently
declared via an extern in vip.c. Move the declaration to vip.h so users get
it via the header and we avoid extern declarations in .c files, matching
the pattern already used by tegra20_vi_soc and tegra210_vi_soc.

Link: https://lore.kernel.org/linux-staging/DFCAOR6T9DPE.2MOL0K9O3HP1N@bootlin.com/T/
Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/media/tegra-video/vip.c | 4 ----
 drivers/staging/media/tegra-video/vip.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 5ec717f3afd5..80cd3b113125 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -263,10 +263,6 @@ static void tegra_vip_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
-extern const struct tegra_vip_soc tegra20_vip_soc;
-#endif
-
 static const struct of_device_id tegra_vip_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/staging/media/tegra-video/vip.h
index 32ceaaccbba2..fdded00447e4 100644
--- a/drivers/staging/media/tegra-video/vip.h
+++ b/drivers/staging/media/tegra-video/vip.h
@@ -50,6 +50,10 @@ struct tegra_vip_soc {
 	const struct tegra_vip_ops *ops;
 };
 
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+extern const struct tegra_vip_soc tegra20_vip_soc;
+#endif
+
 /**
  * struct tegra_vip - NVIDIA Tegra VIP device structure
  *
-- 
2.43.0

