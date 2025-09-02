Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFB62D5408;
	Tue,  2 Sep 2025 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828036; cv=none; b=a3/fQmHf0LmW0an9RpfCbHVVEoWbR6dsiN3tkutPNo9P8kkojBspy3b5PWcWo1CDyZSuMB9ONjBEigNDk0vALEJvNDa2USjgeBPU0itOGqHJ5ATsjBb5aN3LLZMo/P3Z4XVAXJRPInKbcTdfeqb38jpsihpak6H0QvXnVJZU0aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828036; c=relaxed/simple;
	bh=NCrB29odud055EsYjGwwHZ9dhxMj888qY3ZLF/Q5Hk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TFCiHoiDpvYfq9ftQu2uLOAYpgvhlTXgOHNFEx24TlOMJ6uxwubMRM3Pm1z1ylJQfiWVtlWEpWpfueMWEVS8wH+wxFdMP5YVJzsydwy+J/braVivJecSYn5U+TBlcRPOEusOw+xE6guGCWI8OfmuAtpHePQi1QNpTTrmDqnULJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZpBEuq1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZpBEuq1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso37673665e9.3;
        Tue, 02 Sep 2025 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756828033; x=1757432833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4ni6DYQQHBDySZ7UbEZ/7lnZ6pICpjz1prMHmfQhmA=;
        b=dZpBEuq1oXnUxv8mafDyOo/NtvH2+4upbGq3fFW20vkKo7rqdSsR9pOXjWRn8+qxUO
         Dtaf/d1GJLnYzrgPnJrIemdTR3+woDocvrJGyGikDo6YlWqlcCUF9h0ucg5yl00M5wj6
         Ufn3AztBal8hBsZZ1bQb7kCVdwP5nNZ8GO7fE5y8cawf0ntKcZrJYHPFWra2at2Pl/do
         h+dOSOz+1SyGZOKlR7txsEurU7dXot75/OedZToIZeCsOQEzD3vutpVG5MhmngbwhU7q
         vK64LX4aVSdagd/PT8AlVWX4QBbSYovs3eVMDvOwIBN8DYYhB5h4+LczCSL6KDt7nbgZ
         wa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828033; x=1757432833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4ni6DYQQHBDySZ7UbEZ/7lnZ6pICpjz1prMHmfQhmA=;
        b=akKDdUcBhvsWVitDL7pUOxwI1JyBH1vNggbzhIrw7miLyskhNdqwiFDkGrVFpxjQdZ
         UupGE3Ol2Vdm7Ty9Y9ATftQy/Zt7ZElA8BnSwsbwH9rnsFSVD7H7bzp63lFXlQadep3K
         e/F/GSsXPCurxPF+RlLESD8ml9tdQMJ3uJqV6R4asbVx0MdFJ10WfY0Mo8gJRT3PMfw1
         kDvJ2o+7f5RcOZwftmDneuW5oUw++s5EHooksFLAgOWjVxBFgmkO30MySqNPfOzkYlr7
         F2M4OQuvpB4cCA9RU4dSsaclxODXaBFgLk8GbUb4XVmRKAZMTUDbegBhjSUloPWmkEXv
         EhoA==
X-Forwarded-Encrypted: i=1; AJvYcCW+FUIK/XrewCGrjoYd6v6CM869qsByzfwrXXBYJdyBBTn5kk+XFfhrWv7bUCEZtgAsokFqB8WliwkW@vger.kernel.org, AJvYcCWYs7BpaFD4Su9egM/Vr+G0QFfeZn2ExDf1mUCvREFMt9TsgRSGwSSizxJRIVKhD81La93e2uQe5uk4ZKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4Ag/oHcVc6MiNSxlMrfFLJtYyDx31prCeXY7D1h3qdoLRYnn
	sSdM0voxmM/wqSNU4ZdGzyimQpeEZtU//eYDT78VKAtucveLQikhT7RN
X-Gm-Gg: ASbGnctt+jogRG4zkYWU5tFFUpGlHnrSnteHAeaf5lYPJkVAFO3jnMqapfSdRvFdSen
	SXZFhJvEDH+PvGN+RK7jZjU9NEg8vup7LN9LRpvHPL9P8YWtYzhvM/WNISLOFVI8M34km7Ywo3O
	UfHSgYtFXHuFcNNGvSi9ra9MvdllfG43YuoH4+gvMQoaKu0lPKYjIeCTuXITaIqTcwW5UFac9d1
	fSVwnfkEJpORFxw+t5LKURsD/z+/Dqo7YupRo7CEuWKNqEwnZCMJeJ2F241/crlvKeff7lRaDkf
	RxLxbKxUhO5W2s7HupmcCxyxDvEq/q3kYivJO4ZPi5/f7lKp97lRNcDMpl8TPJtTlQ++fr9C6ov
	c4h4O9xILYtT2Kl4uN61DGV5kS93t65VrZgQ2xlvwcbO5YUVhkfXmvQqr1kH+ENXn02rcVKn0sN
	j2xhZhqfQ0wuKk1w==
X-Google-Smtp-Source: AGHT+IF6uqhh0MoB6VhNHwPxlLM19ybnZxxGRDzHhQIuurCjTrk9XBgo1dEpxbne5cu5+x+vhkeceQ==
X-Received: by 2002:a05:600c:3b01:b0:45b:88c6:709d with SMTP id 5b1f17b1804b1-45b88c67339mr80656105e9.25.1756828033201;
        Tue, 02 Sep 2025 08:47:13 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b7e8879cesm201587945e9.12.2025.09.02.08.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:47:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-mm@kvack.org
Subject: [PATCH 8/9] arm64: tegra: Hook up VPR to host1x
Date: Tue,  2 Sep 2025 17:46:28 +0200
Message-ID: <20250902154630.4032984-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902154630.4032984-1-thierry.reding@gmail.com>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The host1x needs access to the VPR region, so make sure to reference it
via the memory-region property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 4f8031055ad0..0b9c2e1b47d2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4414,6 +4414,9 @@ host1x@13e00000 {
 				    <14 &smmu_niso1 TEGRA234_SID_HOST1X_CTX6 1>,
 				    <15 &smmu_niso1 TEGRA234_SID_HOST1X_CTX7 1>;
 
+			memory-region = <&vpr>;
+			memory-region-names = "protected";
+
 			vic@15340000 {
 				compatible = "nvidia,tegra234-vic";
 				reg = <0x0 0x15340000 0x0 0x00040000>;
-- 
2.50.0

