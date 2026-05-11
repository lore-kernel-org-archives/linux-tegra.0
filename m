Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A365C3A963A
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485780; cv=none; b=LKJ6sMuWK9iw1nbkI44+3PeNaaKiXCO6gC8jfvWGd97PUw1fhDhvZRk0sjAleDLk6KVVuK3HY0MDxVNt3AZ0zgevyvd9nWMfL/cOpapWtlW3YkCQm3cN9YIL0gHpQCI8UyDNFXUUblj0GRUuhwVsXcQQbLEU4Ge8JHRhL6GvGpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485780; c=relaxed/simple;
	bh=Mc8Dcste8PiXZn5dDJtZZd+nBmIxHxlDzT2m4LkONQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1DJR1tnv662zCZ3lQ3TOZI+qRdwwQpN+FvXd62QeCF6qlBwEJiai0qI5omSW3+MrVUkBFf4Kd8GvvoVLf8XbMugRS0zXQZu3OfUWt9z4i+BX2cwinMDeW0QrQsdt/tg0UgwyR9RtqIuylEMgK3ROTY1DZDoMI4W1uzbMnuvPb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpLjmyiJ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpLjmyiJ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a887ebb416so3722558e87.2
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485760; x=1779090560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jzq0svM/CyVwYnCMdFf4d9/HiEVgTFbm0k3312KAqU=;
        b=NpLjmyiJ/Tk8Q5+Xbtrt7Mg+NTTDZJrZXgDg7RNkXMx1HenVqQXF7YeSi7nRujvTKl
         V7tZwSnfHq/XE+UUxJhyRaa56ovdT9NCm6GT1rMW9O1phez51hWUN9NkrBz9n2FuyXWn
         1H30JyehgBRRPt6J6Vh1KsxKq4iWSGU3NLFtWoADQup7e7uDLfXod/7rFnRX+MF/sc9e
         JwbXHgUsM9wzelpRYeRlwVPxEDwik4FaDMWJ57nJ0RtzQgh4lEtscwRcujg/4cKV4yz+
         oBitmTTwum5fePHqemjjuAJj3qjowGZTj4qaox1716rGJcM9L1E1cGGMkEG44BfsWyse
         ihPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485760; x=1779090560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5jzq0svM/CyVwYnCMdFf4d9/HiEVgTFbm0k3312KAqU=;
        b=MMsYwhh9MEegpqtwnOckPsgSHY0d0D2dSCJZByfDuHbi7jOWOeQG7lETXTKzNyCgOE
         2NIZGxwYnyYcKlNV6jSt2jU1YbW1Iix0/q1EwIWYNo33NFlUdedcabs8BrPe/BJ2eolj
         q675xiwBMmifCHIaesBW9Kesu+ugVVcVAcsNTZYrMXvpEbJtuzukdrBfKKoQA61AiRT0
         FmwOOkApBkK0jvtl56XQEBv/6H2Vcehq3pAjKY41N3fomU3oJGp90Tg8A+22nkaFboio
         MvhUpVTEjbVEOG+4hmlzZFijaxiIxvC4tfrV6zLFLgRlR+Wv7SrOaQOXfr4AUBrsjCeR
         nUbw==
X-Forwarded-Encrypted: i=1; AFNElJ+GBkt/f6QxtW6wJXT14PrCT7Ep95CM8RdvTBsBbBw998MS691wFa7NXPXIEHR0GdKGxqTlN9kHfKI8vw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg11+A8aa6gsOueKZHUtEgBkfgQlObKMVLvYCbdW8j/CY6w7nH
	MCRuIGcVNEHqDc/Frqgb/NQ6SU1Emg38yCWVlG/4X7msrdrgcMV0cwi2
X-Gm-Gg: Acq92OErxrKcfW4HAH89KA7FGdYXqbd0X/yG415Ig9vU226HqSbcP7gsAJu8vpl4JHq
	f0tg6dmn3gOVApSHpCh/ZaLnQt/LrKjieF/XgRZWk5Qrva+nRmd9XJ8tgchTxQtTdQSGGq+E9VD
	ICL39Ca6rXAOTCDTr2nl5L0cmZu9VWH80CTYjdCvWj6jIR0EColKDjiNvy5Rnvmv+Aova9oeoKu
	FBI/Wjr40/YusH/Oz+kfOH1KuGzcb0aVFZLMntK6GP016gPTbT+ELOt3LoTR1LJrSzhAQ0UoZho
	MHJlftiKdR1wDY5vKPoW/KOPQpJoUOK05xAAD8RHD/PEH7/nd2e1kHce3d4j0cGhSd4MgmG80TD
	JIS3NDWP+/d1zqUZqxDj5E9TH48fMo3sn217FGPj+WrjJH8kUtPED0c0OhjQxiuHoTsizYPUYcE
	FPMr2NnrdGM6s5
X-Received: by 2002:a05:6512:3dab:b0:5a4:1198:5016 with SMTP id 2adb3069b0e04-5a887ae01b0mr7442575e87.11.1778485759791;
        Mon, 11 May 2026 00:49:19 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/9 RESEND] ARM: tegra: p880: Lower CPU thermal limit
Date: Mon, 11 May 2026 10:48:53 +0300
Message-ID: <20260511074859.24930-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ion Agorria <ion@agorria.com>

Lower the CPU thermal limit for the LG P880, since its chassis has less
thermal dissipation capability than the P895.

Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index 1b21d7628c8c..6b30e17459ac 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -537,4 +537,17 @@ sound {
 
 		nvidia,int-mic-en-gpios = <&gpio TEGRA_GPIO(I, 6) GPIO_ACTIVE_HIGH>;
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			trips {
+				cpu-alert {
+					/* throttle at 60C until temperature drops to 59.8C */
+					temperature = <60000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+			};
+		};
+	};
 };
-- 
2.51.0

