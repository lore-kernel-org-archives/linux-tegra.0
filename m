Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F673F8231
	for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498088; cv=none; b=fGeCvQPB2c2CaXVmWwQ/nim4PGlfltc577TzToZWGq6IXm8OA6FEi1OoMuNjVLtww5ZBu59E3beQX9sMUsbAqTgdpqvxMUkxqO0MneF7wVR/xTY0Yxjk05Pc9wDwvhhxMXZOQWhvJbQbvm7g8M2QPqlkmz9WPqBPFdOAi9ILt6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498088; c=relaxed/simple;
	bh=SdPia3Wk/M4L3/GoETxNmypkYl87Us1TqT7WMu6QyRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnQLpgO9frF46Wbaonkb0hLWIzlJFGBNZ+6PBMRG1nRgUEztwlXHJXwhEP16XH48NKjEfoKp0iap0olg7nvGRE+vnL9XKHAUG/MNUSj/GJGgTjTf454T02MrrrwUr2b2c5gZxgI+F30pdruaUMfn2PGOm9EjadRoTvXnzMC4lsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/d2MIyj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/d2MIyj"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47de008b020so597044f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 04:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498082; x=1786102882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJlaZVqU9d/kVsfcIjb0Td1tgBgRm/rDWbTGe5IqEMU=;
        b=a/d2MIyj2uwAgaWB48EQ1qR/6eMPuJ2hx6FUMOJL+ahahPAD8OFhnejclI3ZGb5z1f
         lwptcFn+i5Os1Xx1D+G5HvrRMc6mZhAvLSnQ+RubUNl4LElN+8fjl3Nfy7Duo+LUw/pV
         Zuf/XwrToc0JavJsSPDqPlP/BwXTSu1ctR6we7F0tVg3V/3TVFNP3gyw69Vh7WIBETG8
         MMymXRS+wUbAAWXHV1ZUOGIHPaNNZKdQbwfJgqfvgAcNnWZ3EAu9WxQ9DwtAspJ7qvkD
         xNg1OIuXEKu8UIvdv4FaHej4atxuAPRshFDve1T/NsWEzG5JrymvUACwmk25QEzeyYVh
         z6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498082; x=1786102882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJlaZVqU9d/kVsfcIjb0Td1tgBgRm/rDWbTGe5IqEMU=;
        b=GCTRfndTNZcDVeWUvmjls9+AeZ0P7/N11Wiyn7GnJ0UprzsoRA8+NQXx32sJF51RSO
         iS6tG3u2z81jFSVzLPGZYO2+NI/e7DW/6gV4MsxeoTrOt3nwGLnfm3CPyvw/llAUb2v4
         XaPxztG2brVm6+8N7lARnO/ChCTLOnCdpvcWLDghrxNbinbXHkl9HWY5Fvvp4X9ha3kU
         7JZqurUvxC2JdUN5d00GTecUHDiMQHeL0N/Tucb7ZSMRxqPHgdtShJw7W/uUgoVCa3PT
         wt7z/KgYhKXaSIPN975rdAenucN9Q1/3pz0CvlDJ0tskICPOEILn39lqatCOS1HcFx3F
         2G2A==
X-Forwarded-Encrypted: i=1; AHgh+RoURaF+ZRrimEfa7h7oL8le6/TciAKGrPi6AYZDIbLgohYF8pROkNLpR5ePIS2/9Z4QHbgm1Yj3CM9f9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YykcGMgK8Zfhx9UIFARW2TO+HN9+q2bwDYQEkp53BVAU25arLKn
	zrlREMYJp4AnlaDirZhUra1l5utS60FSFyW+pQ76r/+kCZjeMbt/Tecf
X-Gm-Gg: AR+sD109VQU6np8xwOo+obwh4ET4W+IjcpB2yinf0pw5onDsoPzjbxzLMy6NbIwRCqE
	/qHrpf15beLiypNVzbFTgYR9thQ4gf2VJCBtWItrzuVQg41mMr5wTpIizrX5WQoFwbPuOt1Xltp
	5/P7oLQUymiCRbJeJOBV3Ve5NucDZewk58JeQKdBg37Jw21wqXKakNvi0PLfp8gBZZhuxvBk8GZ
	T32xgleCZJr4bjCR4y/R1ClqK5Uw/LiAa1flMn4caV2xfaDnp3eBsueBokVVP2GH3n7WpgRTiLg
	3rQ2tAiBQR6ZdklXrUICY3x5SoHINbMLPIxRgVG1aH62FU8UP6a9525Vbn5W54VnJ59cJUw8gh/
	36Oy4tvR6yZPu/CSr9Ork+vv4fQIqK5xpXqy4Gkwi3hDStGwhX8WIoK+9oZeRL2GH/+J5XDOQeR
	0R8BoVHcM2j8/c5EoqJ+Xm+oH8cY6Jpp7UazgQZsqL8wApTixetCE5rvubXmj08Sg6fVSxRRn10
	qm4OjCBaw==
X-Received: by 2002:a05:6000:40cf:b0:47f:8603:a879 with SMTP id ffacd0b85a97d-47fd338ccf4mr3178102f8f.11.1785498082238;
        Fri, 31 Jul 2026 04:41:22 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/10] ARM: tegra: tf701t: Add core-supply to PMC node
Date: Fri, 31 Jul 2026 14:40:58 +0300
Message-ID: <20260731114106.169398-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add required core supply to Tegra PMC node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 5358cdb6efc10..55e9256e80f33 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1599,6 +1599,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <2000>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 
 		/* Clear DEV_ON bit in DEV_CTRL register of TPS65913 PMIC  */
 		i2c-thermtrip {
-- 
2.53.0

