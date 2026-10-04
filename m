Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6067A3C0A00
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128760; cv=none; b=HvuO6h+wZ8yDuJ0alEcueBs20zIqMQHW+TPAuCZj4gQYHSd7C5qKDCk3gbJ28r3r8e1OGRLzLHZmS/T6Gft8uBRNb3J/mg3Yt+0RNQOhNp3UvKe0d/ts9/XOWuoo7onSOW16CfNozZ7ly9A5fpCgPFfvCdMsr3YZzT6sZpe6734=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128760; c=relaxed/simple;
	bh=XZS61d0mcO7GLkdtlPlyL2kzE68bvmUYKNf3f7TrgJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IyQR3sVq5/hJSFr6m7c6Nf+tDZ2t1yu6F4Gc/Aox7arrK1hYZ3gBK3rZkWKZRka+ThYJo4UZMGUlfCdLVHIM8I09TLDhwW7PmeB6epRdCa1oBftx0epbrf30MTgyhB1aatMV6t2joCeZRTNWWSUXEa14oKtYqltM56BLMG+YXAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqNkdAAW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqNkdAAW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso9379375e9.3
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128749; x=1791733549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VMd5ocy/TAqsRdGEQmPxImtWVq/jP2X2lBRDaNKz1k=;
        b=sqNkdAAW+XdbqaRT5HvubBsfFNg0bIjKznp8PYCPiTwOzGgKdo0053Bz2d6Ylhf6Gv
         O88qVjviAyVwtRIpKhAPTHdUu0x2q2MhmiNs4h+/t71S0COeX/xt6IlaEDHQKHieWX/k
         qzujEamRWUnk89gBiqWzjdBkzoxc7nbWQuuqaURtBQThR73tJVFFDStKqW7Ms6CVdPJQ
         3FxM3iEHgiIBRY/AHqh53iJPWj8eN9s/xtvxZh3HnxTjHmIZ+jcHrs+NhCNqMV8TZlJV
         383ZePCEiPZUgawe2B/8T0/Cp+EYWpyonyfgZ9JmFSnvlo5ujYMOj0titSvyMTf+XhQg
         VObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128749; x=1791733549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+VMd5ocy/TAqsRdGEQmPxImtWVq/jP2X2lBRDaNKz1k=;
        b=Fd29cLKjV33PId+b9FyduoaJWczC51gqi+6uxi3N9ym+7pKezWShxVHAwSDcb++OZG
         hUgV9ueBnI62TweEFsHgajI3LkZhDFuJIzleLxVikhhQlk0DTDP+/Rl6MAYlk88p73cQ
         mslzT5rkYKFZoaNtUmGpTobuZNgmnGcIAP2XNa9dqNqc/7Uih3LVxGQEfGVWRJadmEnU
         6pgdU1zYC3H6uyyVEWneEpqcImk9QIpWnOFvdIkdpn3se4Ae7+X6bkQrQHNA0G7X3O/V
         H/9mqJQnrRMMi4auzm3wucRl0l+ur6BbQFjSibhXxue6TjD6WpNixdV/TyXq0sKaBEE+
         5KoA==
X-Forwarded-Encrypted: i=1; AKwUvBzet1bzdpVroGfUyhkq3xFyvO31eC5r9+G5a7zdaf18+jmLaAFvDAhL4i92QUspv8veNcg0wnSGQ5sFiw==@vger.kernel.org
X-Gm-Message-State: AFuF++mdRNWQsTyebWOSDuH62f8tsmdNlKFmSg6AKigNzYUFJDx4Q7+I
	JYuYQ0kcQ+OKpXWzo5I+lzZ0UrcqdEd34vHdJ9X32ayC0s3yOy9oP2er
X-Gm-Gg: AYBFou0E4CT7kqMsWK/vxCVtT6NLZ7Q7hJiRPmIbWgo7/t4uXI0voMZ/3FMx+KQfsZj
	Ie5bpO3/xkcJT/J8ZepzwATg2Yo64dTY+UpQUko+SH4hPtm6TFS36Sgh1Hc04r0uzu/6SM19HVX
	lAu3D1VMsAGYLd/Iuyc5cDUIOK3rl1ZXEakCqe5TfmAU+u3L2DVWQp2LHfa4o0uuXskWyZBAyv5
	lKe7FsDCWKmcrtgqZ2TXWjWDvoDaE+dw//nBQAu5AiZT5/MEh0lrOE5XQygCo0g6cft6E4yyMEf
	nk2jQIcBALpXoaOrX18eX5c4pNiBh/Oqz22sdYbQ0DAqjvprjRFjnSwdg5DXbLg61XobK0pq48B
	Y9hK5hbCISGEQ3cLsxnNVj9QjLYYIzlHDec6jyb+KSCbuCLFfNp7FPutzzzOhTMgfoa0Jb2XsqR
	VLTFl2knhFaGMPjEudBPXtw/qhJ3/9YzSRKMufHI5jsevHqzrJ+FYCZVu+hWfn84lGDERPbtdJp
	dVZ1i4edXvDVSULGBUsdi7ZD16QZg==
X-Received: by 2002:a05:600d:82e4:b0:4a1:71af:cbc7 with SMTP id 5b1f17b1804b1-4a171bc2193mr13724975e9.13.1791128748595;
        Sun, 04 Oct 2026 08:45:48 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] ARM: tegra: p895: Update power LED trigger
Date: Sun,  4 Oct 2026 18:44:56 +0300
Message-ID: <20261004154456.145362-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous "battery-charging" trigger was unreliable and slow to update.
Since LG X3 devices now have a charger driver, use
"max8971-charger-online" instead. Tested on the LG Optimus Vu P895; it
works much more reliably.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index 0d56fd25ce178..f2b527dfbabd4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -552,7 +552,7 @@ led-power {
 			label = "power::white";
 			gpios = <&gpio TEGRA_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
 
-			linux,default-trigger = "battery-charging";
+			linux,default-trigger = "max8971-charger-online";
 
 			color = <LED_COLOR_ID_WHITE>;
 			function = LED_FUNCTION_CHARGING;
-- 
2.53.0

