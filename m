Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C93D33556F
	for <linux-tegra@vger.kernel.org>; Wed,  5 Nov 2025 16:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358729; cv=none; b=LW6z0QsnuGaMAPkZB04w0H2QDeIBLp4kBDncmrk4JoWbHyGcgdi5hNUM3ImLPZ+J4J6RH1wxawydN3gRDlUBpia/Aaf7YKwQ+myQvYmOzpO/cAxl+ETm3WDjvTvCIc+eyYTfnKJ9kFnftheADFag14qpHQVK6iqiZYU9UgDJXYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358729; c=relaxed/simple;
	bh=YjHRc0oCtToeXXdkxRbxY958tkY+Cnt6dMfLlntrybg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWy6r1TD5O5OsZ12uxC4g3rRPGPoWndGKooU/Q8kJx7FxlFJZOzJSCj5AmYEYV3lwjpr61rx9OQF2cq0oE9qpMrHU23daAXSryXrFLwAeePPQTC4Y9QbK/1JwVVaELPsPXS3O1VnzHw1sYk+xEx/jw4SlZj2w4nrLIXgnlgfxPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eF4IPgL2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eF4IPgL2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4775638d819so10669935e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Nov 2025 08:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762358726; x=1762963526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2ChPscr8oI1Jx6/MRLByZw5X39fgOVwMSewdYMEVlk=;
        b=eF4IPgL2zyET7OxmEwIHHMivksPUnoeNIrdb6v0phzuuCNexpsHRvqPYb16Csx6M/H
         wtcw9VJolBdGex2HAx+06ruiFC+WI/iFjBOkxsl+JesAhFIhm0cehrSzmTb2l4DaSr1N
         CV22a2frhiKLqlwVupngqEfKeiQNCppBu+w/jMMOWQjNHCCWGK90N1y2KCcOpDgX++TH
         R/1z0RPFWoHKzuvkYNMJi08YfIqeR2lypEkZmQ61gtVwPpJwtRIaYhsq46jLE9IlhbnW
         Okr6y+yoBH81dx4fuJKG0AEYtNKzPsygOc9vUmWLC6rJvA37iOekrpS7kWC7Sc6jNoRH
         sttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358726; x=1762963526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2ChPscr8oI1Jx6/MRLByZw5X39fgOVwMSewdYMEVlk=;
        b=KY7es+2VLFYa7rmh23QNN+4jDivuYrb4d59T69SLj8kx5aQCt15g2t6ZG1CbxMXXpa
         qCAoLNaiVGv66Ad3V5qarbTWPC21wGnEoVK0zk4XytFNIhxwCqvKn38lGq7HhZuw6LWj
         Z3Rqr3YHL3cT+1IUOVXkwMZSkxJ3PFxmShXzZfK7sCuBdflp+rAD5j0LOfnoKRcHu1fC
         n211y40UtQHl0HfosT9QjlwYdjD2tzzvXNW/XXQXd1Nk2fOdam2qZPy21z5Y8Xt9YmnG
         QlEU9qSY0hWPjByIEtHRrS5R6KL/x+7ICIUxa1Q/hyVJ8K6yxBujWSrQanUk03NqA1aE
         pPqA==
X-Forwarded-Encrypted: i=1; AJvYcCWlixE3DK5a1i1C5Nrv96kFZAnWcU7kgvExJSVFwKYI7fxhmAYLke1IJ+BwO1kPnhYX/mjjFnnva91NCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpBqEUupiOrjHYHbM8bmciKHFIfFTQEs/wRY1jlWWn1RtJlfEN
	luA3Bity20Nvt637cNqRgry6eICokPsGUXCKX97TdPmudQJqVdVEgRho7t0Jow==
X-Gm-Gg: ASbGncvek9U/bsL50zcn3jYcW6/fLKSzVszDd0XbVwZEevdA8RI8sUxEqVo41LdRhx1
	JPLvFBq+H1QX+bjSEuX1lq480uGV3KbdMM0OgefNgjDiGgwI6PnveD5iCajk7k67jWesJH4T1z9
	KdruV44BVXVNpYeRxzwvEkszm2Q4c/+nImO2S0G8NLr4Evl8ANA0VrY2Z7DdevYEZPm4WZMZOeQ
	tmZ9IfnCqE9nXmWNfBbqken7f1/KiKOV8PSJw1+WVm+ug4fLKd503mKsL9FlWF6qGCzvbaVAOsI
	/LJ7qFwXhb1kmW8adRDdNCWKFpwHEbwp4JMW7ciOhtYXhTtT0iIj9lfe+zH7BKiyOy3Qdkjyrrd
	SE7ulmanI1PTu2II/rtnLIMWYna0CXdPNAyGLbJA8o8KtbyE5LU0oLceaTlJIEyhgy0ZlACsnx6
	gI1qBkransv1xqtdAHQ80gsvNJfRXMjRIWGls/XINwzNEztJPB6XjhirlaJ5zw+QQaCx8M
X-Google-Smtp-Source: AGHT+IHHo5LWSngg035X6WtMrdJEdq+9xlzJ4IHYGfIEIo3Lex2JBtYdsWWNBZrMXE9pRoOpI97v4A==
X-Received: by 2002:a05:600c:3b17:b0:477:5b0a:e615 with SMTP id 5b1f17b1804b1-4775ce24d32mr39074115e9.35.1762358725681;
        Wed, 05 Nov 2025 08:05:25 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47755922591sm44926905e9.10.2025.11.05.08.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:05:24 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: tegra: Add DBB clock to EMC on Tegra264
Date: Wed,  5 Nov 2025 17:05:13 +0100
Message-ID: <20251105160513.2638408-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105160513.2638408-1-thierry.reding@gmail.com>
References: <20251105160513.2638408-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The DBB clock is used by the EMC to enable the data path from various IP
blocks to external memory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index c66ea12ef5a3..f1cf370f6363 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3444,8 +3444,9 @@ emc: external-memory-controller@8800000 {
 				reg = <0x00 0x8800000 0x0 0x20000>,
 				      <0x00 0x8890000 0x0 0x20000>;
 				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&bpmp TEGRA264_CLK_EMC>;
-				clock-names = "emc";
+				clocks = <&bpmp TEGRA264_CLK_EMC>,
+					 <&bpmp TEGRA264_CLK_DBB_UPHY0>;
+				clock-names = "emc", "dbb";
 
 				#interconnect-cells = <0>;
 				nvidia,bpmp = <&bpmp>;
-- 
2.51.2

