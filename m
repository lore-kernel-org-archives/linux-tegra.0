Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDEA21ABD5;
	Sat,  6 Sep 2025 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757140196; cv=none; b=a9Kw1Ii3MVCSUwHfkJpJMQPzYtTNsNpxdl2+Or1ApnPO+4lCDx1rp8KdJfTz/dG+VMzrWbCkiaoWDRZOMQ3IY/Pt2okwNixu/zxjUMj6R+9+GLsqF+MXAVWbwTP8t7itq5nsdx9GcNaJQzvj9r/WWP9lgs9h+DObKcAPKoxI/Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757140196; c=relaxed/simple;
	bh=GYxMBl862Qi+bRX435NBFVVh8NbQucMhQ2/d02NP/yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MPdjv9JHNAjMjWl4Gjs86L31jCon8svU9V2d7KBXcDUwItr+S1PkcJp+/I76C3kOwP1ts1EUk7jOCho4VgTpqTTTxoSzSyZYt5OtYV2gFDaRot6NhuSYrKWowSeyZ6vjWiESuJZTUso6xloEztRaIVqfO6Ffm3DkLQmeQiYLmgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmhYIe5D; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmhYIe5D"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f6507bd53so2854597e87.3;
        Fri, 05 Sep 2025 23:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757140193; x=1757744993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzOXQl2+3pKRg90/qgnHKGbQz6w0BmMPdQwqcreDOFs=;
        b=MmhYIe5DQ7K4Cp6OXqxwa5v/ua/djVcrsy2XvBzKVSq5WS2bC6N13hylZB2Y2qtNRd
         ME/UhkJIh7DCWL/K3FwNwlcQ4Quvk6o6PxcssuMgSuHnRF2jXjspjAIcXKDlBCxUJ3+0
         OUgmcRiiVLLyLpAVNoiqKdcYWPR8X2gdudX8ImjVYtg2+d50tTx3o9H0T+0JudjgubHG
         2aLM9AiQQ9s2uMME2NMzjIQWam08FIdbiqpiwmkMnYrw31inOC7FzOrL64f6uwns14YV
         FpTZ4ONk98ivyVjGlbEJUoY910mRzfo97QiGZJgtOEBDgtR3e66R0J/y9q+OAqGtdaHu
         XhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757140193; x=1757744993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzOXQl2+3pKRg90/qgnHKGbQz6w0BmMPdQwqcreDOFs=;
        b=C4sM+kVngbx8LhEPWbnaOXuXz3uF+5+H5YHvCjS/h9LCScETUvJ826idFsTrAnpS89
         ihXEox2jPAVWpkTEm9vYsFcVt23/svb3+Bs4VWaR966mrzT5bKGKbDzOdMecc/zBqz9g
         y3e3sdZkTWzTRmv1HAcR0NGUdAG4cGE5+hzx6lDLXpohL1arlA9xiQohW0HfDkM2l7pf
         sfDaF81PSVOz8EIorAsUDVUR1NLrcEDskQl78g5DSpQwKIPzocqU7Fuc3bC3ny8iKrhu
         8YTUzah1of76AEM+v1qKAejZdyMxQqmXzjCB4UDSrbd8zjwB9eG9SoZ5Cxni9o+AIZOq
         Ws4w==
X-Forwarded-Encrypted: i=1; AJvYcCVOZ/KbmuU4SJfnNUtYwpwhSJqCRfsmK0EhEOgeVblmSCcCrdiwzU1WLBWJW1HThCAdx/8/x5FAqgmeDho=@vger.kernel.org, AJvYcCVpt8Qh4dn0XlvNlGXw1Egzn048PQQQzkrBU+RWPgzGepE9NlUCv1DpjGKdlBgr2XClRK0fcTLWDVT9CRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxZ082BVhEm+e8yOFmcQMAg88P4HcQ4rroSd7R+Cpdw387zjok
	0yzFdYnSTei8veH2wEaUD7G6wurP/XC4AK/gNCOZne8wa5jJ/25RVSgW
X-Gm-Gg: ASbGncvlfeGA+O0+2l2UKEAaL8eH9//jDekLHjVFjZkx7s7C+tPinDTA0g0VnCHPfoA
	nFxOk67Wr4rmoLAPvlDcc3hCV1ws5GiVZorr7FkMSuF9ZbMDAyYQ9Ignwdq2fSOrmIMURyNmNU2
	uB2D71g9LVilQsFU7c3zKz77HOeYtNwEj9k4tBW6AFYj6MNz9aucO9qX49w2qfjbp8I5L+hutUZ
	Wnt26sDS5UxVSP2oVeQ4XhI5YdGS0dcCtePS9v5G5SnyakiquAeZ+4lzbvvLOqzNsduQH8ykhWq
	yzfD12XntezKU+/7v9LUyF9krbWJwxzfdPEOS+RkNb7BZhfo7NwQa0UGCIzYX20QCpVfTRw92GW
	LczdSBnbEGk3XUUNCmX7dmevR
X-Google-Smtp-Source: AGHT+IE3385lk/yh5gWv/dKcHvq7epH10STpRX9m/2VAMyXaKSH/CTRGgXa3mVX+fyZiAbI1pXWTQw==
X-Received: by 2002:a05:6512:6404:b0:55f:6902:c9f0 with SMTP id 2adb3069b0e04-5626310bdccmr319729e87.43.1757140192433;
        Fri, 05 Sep 2025 23:29:52 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abb7c74sm2178737e87.54.2025.09.05.23.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 23:29:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] ARM: tegra: transformer-20: add missing magnetometer interrupt
Date: Sat,  6 Sep 2025 09:29:31 +0300
Message-ID: <20250906062934.6637-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906062934.6637-1-clamor95@gmail.com>
References: <20250906062934.6637-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing interrupt to magnetometer node.

Tested-by: Winona Schroeer-Smith <wolfizen@wolfizen.net> # ASUS SL101
Tested-by: Antoni Aloy Torrens <aaloytorrens@gmail.com> # ASUS TF101
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
index 67764afeb013..39008816fe5e 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
@@ -502,6 +502,9 @@ magnetometer@e {
 			compatible = "asahi-kasei,ak8974";
 			reg = <0xe>;
 
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(N, 5) IRQ_TYPE_EDGE_RISING>;
+
 			avdd-supply = <&vdd_3v3_sys>;
 			dvdd-supply = <&vdd_1v8_sys>;
 
-- 
2.48.1

