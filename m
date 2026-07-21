Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594BB4499B4
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628180; cv=none; b=ZeJ4N/osPlcaiZdN6ZVwbwzice6tlOU2UL1W1c8nxjseWXvwKzNFTn3nlwITtnXuFTLB8MyPa3mGqZRIGBjtJqX/95MDEgwbW+jGfU6J5aPuqQM8dRSJW3rqoEigtjp9pqh8RxMWWkvLI2AVWC1e46gRjh9RnqEWgEuz5oo1TBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628180; c=relaxed/simple;
	bh=Z2XgFOuSe6nXicDn76xwkYeEVl4JseJ5RFl+2NV5sf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KV2Akjc058kAGN80YHX2rG8iNMNeJPWpPGQOEF2EFl2B/jQ1c5H9pCvnmO76Ouy2AZZEGeLF0eG6l3OMBjbsfKUKzRH2XgefoD/Xi6pnTHDtWJmM/o96GIcmJXKDi7E/pdmSmDLNV97B5StQw/aT62IxAzAyOaPmNKpMtUbwMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlmkkP/j; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlmkkP/j"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so24949375e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628177; x=1785232977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJYiS34CQ51FOLak9/lGd3NwJDvhA6ajR0EHYyZG81w=;
        b=AlmkkP/jxLFnagSyz22Nw3ncApVwkd0ejEYyVyaIBGfcJMt0Ls4CNOWQ4lEFRwZEUu
         pqkVoe8v4EzWlLXyA1EoCM7MJWOiD02v2bHlyONrMNftWiPiaky4xJElhoBqNRqj6yCy
         qAGxzzqrceCwGcfJfSHp4i1/1k+KQ/IhuwLJII8n2lbTvvsYNmWlp21Ij/jnHN1FFvdQ
         r943xVx9Uc7W1bPCFF/j+AbWppozjDZJTOQdRaJjxW7e4g3ieUMQUv8IuNouajun1DEC
         KmvnW4cZRAJSFncqfqIs94Wdzw2MPhA3thEXfkN3y7K0FFy2Oovf4Gid6s3XxHTQmvw8
         YlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628177; x=1785232977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJYiS34CQ51FOLak9/lGd3NwJDvhA6ajR0EHYyZG81w=;
        b=cmDd8Q4Mu+J6WO437U6mpC0jbCzQZpMBiaGvRVopPtaCRF/eSuiMkDLkWvGVK7hRpC
         u6AMjWgHQkVyXX7PcNjv7kuo0WqTKn4X6sfTuBgnrIcLMyuLNGNeIFeRqQSjEr0mbCW7
         gY1cxAV7DXfvBhzeIdk5gbMbdK/wIzDHbMdeeitMt5300sdTCAeWmsjuXf47G2AwqUnr
         rBAlQtZ1cmhekWCHVhvHvkpaq/GSQ/tYdWSrg61a8ao81XKcGMquM5t425STP2EWHeqt
         zr6ZNGisAJNviDsg3niOpaOHaYS4aqoAQkSwcj6ywvBNSciV67PuudgPt8fCzJP63z90
         KsOg==
X-Forwarded-Encrypted: i=1; AHgh+RpJQsw9Aple+M8mlXCCp29j0jllPlyhyEcVI9Hu51iJeNAOWbvEI/9j8w7GUJR3SgojfsxOxDKqAmMMnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzg/vX1Bu5vLhAvgMxMYimDItcKDJOJ/c3I1NZ8TwZgBkQyUkB
	aMnignCrYjW6kfQXK9f2sL8PG3Aa7nRmLWjPb2PkrdqWgq8GDG318+Gx
X-Gm-Gg: AfdE7cltv+15FLK21pEMw88+Y+QGpyMN8coocSHhOClLqtCJvDxN13GN6A856c4zhS3
	MxFnymldsMrqFu8oLscks6axw5vkDQ0KA3pfta203MvATJz3wH0kiu8bgHhCrGHE0TRFas32a0P
	LusxMpv/l7D2jx5dAfec/BGaSnN8hUBQ/DyUserUm+TnDvQ6qmZ1bPwzdW/H49tAVSKe7Uf5jL8
	ZWitm6cU2MiA5RXnHmcZ1FBTegPsghEsJ6+7rHdqqzYVmLcQMC5xgvG2Q3GEM4sTRC8KHt/bkK0
	t2Cgd6MBNPtIAmFoUf8MUIG3aC60X2hr9MVr2Ua0QdK7LHqqASMHXt/+3/qPNaxPx672tY/zdNs
	SYVFM37w2K3Llysj91LreGhjZb9HM4RDmrS2B6gbjfj8XBCkSZTC7qQ1RuU7C1EveRGt3lG0Ka1
	sEGGSh3f/EUPAfs/OBWkjk9oQ=
X-Received: by 2002:a05:600c:3115:b0:495:6936:120e with SMTP id 5b1f17b1804b1-495693612a7mr2560195e9.39.1784628177415;
        Tue, 21 Jul 2026 03:02:57 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7c69sm39976860f8f.17.2026.07.21.03.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:02:56 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2 RESEND] dt-bindings: arm: tegra: Add Motorola Artix 4G and Droid X2
Date: Tue, 21 Jul 2026 13:02:44 +0300
Message-ID: <20260721100245.444623-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721100245.444623-1-clamor95@gmail.com>
References: <20260721100245.444623-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for Motorola Artix 4G and Droid X2.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 033a63f6c0687..ca311262ca323 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -46,6 +46,12 @@ properties:
       - items:
           - const: acer,picasso
           - const: nvidia,tegra20
+      - description: Motorola Mot based Device family
+        items:
+          - enum:
+              - motorola,daytona
+              - motorola,olympus
+          - const: nvidia,tegra20
       - items:
           - enum:
               - nvidia,beaver
-- 
2.53.0

