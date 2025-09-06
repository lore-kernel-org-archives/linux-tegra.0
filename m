Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976F62C0F89;
	Sat,  6 Sep 2025 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757140198; cv=none; b=bYyeDnIcRG9HGIk3ZrTlOOCfVVkdsEkK0+FswDxA5BoTy1Gv06bfMpAaVetq5gxpB8/SX3wzaXYp/CaAC/avaYcwBtc8aDDPc1AYs4K6n5g6I6R1x4vylW3b4StqvzBCYn7l5ogR3dW/AKmR+loJr/b8FZ6KqAK+ZViCkil2ygc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757140198; c=relaxed/simple;
	bh=cgsPZ/q0X2cOG1ld1xk3yXXAh+h+/cOzh3vsdgi9AnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dx0lxe1iWNllKLYD+bdkworSafvNT2TnG8dLwYpxNZVzbw3BnL7HPO9PG6Nml8hUZJTARn8vhK0sOfR0QWFu6i939WcTUvSJ8Mz2+NqWbpy3kcGRloE7uOuNsJiaDZ4iSbE3j8jbMdn0oxGyYdJ42PzQhpJh7GCFOxvxNs17Smc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+Aet+6a; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+Aet+6a"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5607c2f1598so2949895e87.3;
        Fri, 05 Sep 2025 23:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757140195; x=1757744995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MF4LXBaTfyjUHYIh3HMYCLRHHzYlc7kl58gnvCthqOU=;
        b=f+Aet+6ayZ1TmyxGbqlX9RV8oJzNPh6R83qiRQ0/5MObpWXsFmMfQcnK7ANITwfUoG
         fxOKYeKqiaID2/IPZ/L6y+n2DCTgLXb8saC0X/R9wg7cKJtUjv0exzYHnVkP0E3DfreM
         LddSBpsXbCAEmKVP4d2QSbvVLMLtiBc4n0ss29WqtYct81gQxnlx+Q2DPK22u9hz2B1c
         J76K713REKH8XtbUf8tP4xCHrLAVtTDcx+1dOKe0I47Bip7gu0MIsPLgWaEV0QD6Tjm5
         kp9Snxag8Sym2yTBqrVHYQ4hbCuEr7VTTVcbuUL8DzIFr3OQqOGJdZ83MGPUw+srfPUN
         l/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757140195; x=1757744995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MF4LXBaTfyjUHYIh3HMYCLRHHzYlc7kl58gnvCthqOU=;
        b=HuB47rSPmYmKrn/97cUsp+yiq2uaO2mi0vaJTnMQ+A/a7ETVopSaxwiU2RdQdf9yXP
         ORSdQBpTx1bubh2dm1ID+Ny+j4tyKFrG/VmYyVdGXJjZjd4579PHTAm13RLuuCSnVWbT
         ZA+E+eTEEhBkxfbYSbYMBH0rAaMWiedRRguvFgNwaoRKClfzkLi+5VT1MgJmbZEKiQfG
         R5hFUOifueqg3ijritx0jF7Ti6RN5oZjxvKoh+j47R7TSy8cFyYpgHJFTD9KTMAUfCRP
         QTKwvry4tg10R7KTv2n0+4hnnSpCfyG4IY5CezXaCwZzHekp5JxWSnghXgtmWF18G/P6
         e6hw==
X-Forwarded-Encrypted: i=1; AJvYcCV+wNGtwuWDY2Q7FJ4iJixx0HT4Qyf+lOFuP+H9VgBe+vOU/s2HhQo35Grjaf8xBoaiu1/KVnNws7IkOU0=@vger.kernel.org, AJvYcCXJK16kBe4XGjqkWdaoAR+DXa6Dhdn3m3IEurRwLIBx3aQBSXQHZF1s9iqZnBdlN0jTjEFhk2PPYTXWfLA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd4nYiEFMjV3FI+sE8YkNEnYSUZDA6OmwUyOrS+yVSYWYpGenU
	LDU7HSaWMlH1Pz4dSA7x7pUBAT0jPgZPpg8J2CU5ZOMXm/t4izKNixE3
X-Gm-Gg: ASbGnctS18ReUs95DimaXd2ccpRJL6k0OlMHlNs5s+vGXK8CvJ68pv6o24CGKiBWHMf
	xb8PmQAVlQdkNL8GBXVTaeOLFcjfugtsvom5lsTfnesyavHUOMc5qyoTRcUu5w+XT8asyffjmdX
	eEbAAVYYasZp8n52KyT/xbSMNxLH4vCAHFufkb4/hG1uOuB8g9Ai+iUYbjUpni5DGTQBaSXlGQs
	Hzu5/JsDEnh99/4Mtia/2MWJ5jzyVRkkKutQrAvYaYMwx5VJvHm4wyh3MImVhRF0mRY5sMKG1fr
	Ewp7BkdJGoEjK2SRWCFeEx4bxXmW/azZjJEeFBs0FVxE1Dxw0hJLy7krBagAZqTrZq0aQdGbd0+
	ilZnyrcQ11KCWW8LEk0uJf/L1
X-Google-Smtp-Source: AGHT+IE6TJTEbyZUk/AsQhN4pt4qkxBqXf7teA5Y4g3gBabyUhAHYIbqmaT5OzZ7VIBFtPHY2ugB0A==
X-Received: by 2002:a05:6512:318e:b0:55f:6580:8160 with SMTP id 2adb3069b0e04-562618e1416mr362987e87.42.1757140194344;
        Fri, 05 Sep 2025 23:29:54 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abb7c74sm2178737e87.54.2025.09.05.23.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 23:29:54 -0700 (PDT)
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
Subject: [PATCH v1 3/4] dt-bindings: arm: tegra: Add ASUS TF101G and SL101
Date: Sat,  6 Sep 2025 09:29:33 +0300
Message-ID: <20250906062934.6637-4-clamor95@gmail.com>
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

Add a compatible for ASUS Eee Pad Transformer TF101G and ASUS Eee Pad
Slider SL101.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 9cae3268a827..0484f80a0cf7 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -36,8 +36,12 @@ properties:
               - toradex,colibri_t20-iris
           - const: toradex,colibri_t20
           - const: nvidia,tegra20
-      - items:
-          - const: asus,tf101
+      - description: ASUS Transformers T20 Device family
+        items:
+          - enum:
+              - asus,sl101
+              - asus,tf101
+              - asus,tf101g
           - const: nvidia,tegra20
       - items:
           - const: acer,picasso
-- 
2.48.1

