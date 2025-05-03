Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C901EA7DF;
	Sat,  3 May 2025 10:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746268223; cv=none; b=D5ohdULC+XhAL0JFxFatyV6eqai2nfrSYU/vfm2ItLRd+PdmPgTD++q6Qr+hkWH+MCuHRM+Rj+YE/7OGp0U+hwvOXfKpl+2qubqfd7Jcaobzy1i6Pddo0PLjhayTPanDAH4+rMX3p/DSnoljqAGY9HApsnsL8ZfG1x0ZwzsvkDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746268223; c=relaxed/simple;
	bh=z9SBRBX8b4+ojW55hIce9VP8Z5lZVe5JeFD0PbI5EVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1vFjeNmIUXb3Njwzc5JJ9GpYj18e4cZVCWjuP0RFqAcwKYjMbTQCNllNfsRC0uJ1aXLr4bum7ZCDciZRqUmeuCfK06MRSQRjRXVWrizS7fBTSiF8HneJ7Z3DrO7akMAEIemSwqIPItaLks+yCZgxFDo+khwU61I+booHL32HDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxRHGyNL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxRHGyNL"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acbb85ce788so689277666b.3;
        Sat, 03 May 2025 03:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746268219; x=1746873019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDfrVsS0he9UAHEVIXcpfdMMSDXpTya2/Ot77S9iQrk=;
        b=OxRHGyNLQ7jzDf4dhOt7ChnSTa6+nQgi3cbDmFtpdlirViPkGaxdylS3cUYFn604TF
         Fa27xy9O9dS0cB0ZpQM2aQeOVlahNczsFXVWaJJ/LpdMDuhryNTzPiQHNmsccUGNESrU
         hfYssuVk+d3nRW+kWCYSsbngR8cz3cYQiR9bjtjLRuN2EiYlArm39WswyLRvDOvCInBm
         w/fM7rkdN8mMBC1Sp6fzL9JA7QkGDbwrrSePZ5+xRgmkymBlzQWB55uGbVESBwJUkbJU
         wdYimE8a8pk30Qz0VNxaB0QyZfft0OdI9a7fl2zUcA3oArkYswOnsGLkG/cuiJJPR+l/
         r49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746268219; x=1746873019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDfrVsS0he9UAHEVIXcpfdMMSDXpTya2/Ot77S9iQrk=;
        b=dSJeHm6G9A6nz2fqCjp+xt2gB3LlLTFiUhTke5l7y1U3QFHKg2iRuasjmIEZnEjVAx
         CT3YKLZe+Lwz7gNlei1eyAjuGg+vQJUoObHkdSSgFSs+Nd6lfVEUFwzadQ9QtU0kEOLG
         gbpbOf+g/zRENdWO82cTWpAdXuL8Y/oQESKmwaRa2AZbeOF6THfuZI23TDdnXTABrABG
         Yrfxvo1itrkFhelK4d85PdpJmcIOSTn1VGpgna4fb8xwWi/bJ4DaJg7HfEfILbMLKqT4
         RV1Vo2kS0ZLqVGDW+q4nsVSw+lK713LRAmBTC2Y6f/iBOav6aU4KPT1qhHfI+bhais6B
         YPSg==
X-Forwarded-Encrypted: i=1; AJvYcCU51aX9bWUZUkHesrgo40kuA61ZPH7B489AX7gIskV2KEPWd6oiv/C7eP1lP0ck775E/9fJOgmtdb5xO+A=@vger.kernel.org, AJvYcCV6/vcECf/rXrzmhJxwkWsElxWkCNv7C2tI7htBwSXZGsTOUKLzXeUuMKepEysZHbTvcOgylw09oI4bELI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Sd8a7BTJE59phot0LOg6CoaHBl0ND1D+dpQQi8ej3ZCUhMOG
	W1FaSGHx/BQgL+w6KhZcIMidY++ncgLSbUolubtB6xe2UfhqufNE
X-Gm-Gg: ASbGncsKhJcFygm5FUI6hSPXOpJrLq+iWehjSHL4LzH2N1+KozuhXaHvw/wlyUphLmZ
	KEfiF9dfFUTOLoZ7tnMZ2jm5U1ldSkgpngEy2FxjWgtVb+HhwNbyfXZVo4mmi1ggRxUBYtYR09S
	RUV+dtTQjsHmiWjLFV873fEfabGxG9tkPif9B6PNEVvxjum/3fKEYcAIVkFkepwSyegOBSyQu1z
	3whEfhaVNSm2xZ8KcXlRTavg2GvPW0yW4XImGyZFtozlNTBeGMxCNmEadNORvjlEmyYUTohEsNt
	pJRQMzS3kgmQXKS0v8g6mgAKC00K+xhE
X-Google-Smtp-Source: AGHT+IGZGDXQHGaOeSM45fzne80kdICBT20CnTVJeB+vxyKIFRuhJaRBhpk1JbLRZZXBVIYNC83jJw==
X-Received: by 2002:a17:907:3d11:b0:ac8:179a:42f5 with SMTP id a640c23a62f3a-ad190654f3amr222727166b.14.1746268218698;
        Sat, 03 May 2025 03:30:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189509088sm177848766b.146.2025.05.03.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 03:30:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Brad Griffis <bgriffis@nvidia.com>,
	David Heidelberg <david@ixit.cz>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: tegra: Add Asus Transformer Pad TF300TL
Date: Sat,  3 May 2025 13:29:49 +0300
Message-ID: <20250503102950.32744-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503102950.32744-1-clamor95@gmail.com>
References: <20250503102950.32744-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the Asus Transformer Pad TF300TL.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 49021e940d3c..9cae3268a827 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -58,6 +58,7 @@ properties:
               - asus,tf201
               - asus,tf300t
               - asus,tf300tg
+              - asus,tf300tl
               - asus,tf700t
           - const: nvidia,tegra30
       - description: LG Optimus 4X P880
-- 
2.48.1

