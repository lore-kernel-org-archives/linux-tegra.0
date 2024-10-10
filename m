Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27DD1CEEB5
	for <linux-tegra@vger.kernel.org>; Thu, 10 Oct 2024 18:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583603; cv=none; b=gyLQBUaOTfkolmwYCJlkiXCV1w+QJa37A1dQOYlBh+ovBsAKW4uW1BoTiC7AdC3HUA0k702QgwApdtSYhiovNvHOnra1YAGdLQBde7ZPVpYHT0fJ+tALwMLV2n4oQhpwPTwt5a4iWrskK3kQtrP7htrmSZl24tESIMU6M/rat6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583603; c=relaxed/simple;
	bh=F/6M460B12wipWGDyJ3DH4nQN17g4TQGelqGAmG6zMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8icWpFNVLzt2dr3v9vlzioy820NGk6jscsgcJZNBa3Y+yjzjkodQknlngRqTV4PS9Bulxu10MWdAWRpmfBNmZOKz/9qRMfuEyzb4PxCuh7cLS8iJKitwg8Io0fQ37SJhD+QzaPQaoYHZpjYE9CKTh2VlC8XLvScAVsDdZoUqCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fCQBIrb+; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fCQBIrb+"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a994dbc40a0so15260966b.3
        for <linux-tegra@vger.kernel.org>; Thu, 10 Oct 2024 11:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728583600; x=1729188400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T87muPGakKecqoFQwCwDAV8Lh+PZOzuzFVteMhdsZl4=;
        b=fCQBIrb++u9it0wia94mKsZaeUq+nlK2c83G8PhJloyTSV5yPH3nvqHn0GVMB4ClyS
         2KbJhqbP+rVpQCJ1z2i/kO5cOGpPujmwrR3SG29Ebk53tYgTvs/PcCKFLZoJiCkn2wrU
         9mSqHoGlZ0kMuEMhPWDZuSUrBNOZXa+tPnIrHlQ5pIQZWvG9IEjiaQIUQEZf698TUTj3
         UcwyTvoG9c2JvH7dMzgmMb1TSghIIB10ZLC8kZS1CEIZMv+0wmX6arEwp5QlHHWAtB6/
         q5+m59c0r1d4VmAMxgBmDIMO6B2cbG+3Ad1pgyDqmplfjIU7caJLcMmrME6it1FQ+rka
         iS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728583600; x=1729188400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T87muPGakKecqoFQwCwDAV8Lh+PZOzuzFVteMhdsZl4=;
        b=xQ39jWSssBS6It3AqNSqRkGxecJ9vB1LE7oA434a8V8XIuAcXBPDezERZr+Tdofpj6
         dkPMYlp7ctLH5hfNYZecl/PG2xKLzPEsDXPlV3b8rS27dm14R+MFAQUfnRsqFR1LpZ6k
         /z5NT1YKS+baSVKpQBoj89KZWiJwaDEaxup8wSDacK2klsaTc2m5gpgLDoJq8p/JuHSS
         V+/VfNogDgJOjOKqO1nf5tcLhJHful2PnjOSfdmhloMDnHj89YVV7cNtWkd6fKwVxnhI
         Ii73QRUSp7WZRSXjbm4VlPLWYvBgaotmJIRhqLuiC6YkKgNjZivNc//oEtnsKZyy1MJE
         y8Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWC72+Wb3hl4d7Dyiypc49kpbKsnXP1g5beRsl7UOMIOqZ3xqOWfKOiatykxpT0+dAgm4DMn6E7j7IShQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtoVopMBzxqh72EnGUUjpHNG9tam2X2bLWBbvt+6KOwPEA3wme
	DOjDv3baZ8XPVniPaAbb9rD5lB67r6PUyzPKl0ZzCNuC58t65O6Q3lqpI/Gr3WM=
X-Google-Smtp-Source: AGHT+IFrJLzGfmSeY4fLffFxiKpfgPVtVi0hI0pqAhjV/N3dGTkIuoCJA+UIpnDwUjrA9tlgsN7+gA==
X-Received: by 2002:a17:907:3f1d:b0:a99:53cf:26d5 with SMTP id a640c23a62f3a-a998d307d15mr331306666b.11.1728583600130;
        Thu, 10 Oct 2024 11:06:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c1b8asm119757966b.116.2024.10.10.11.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:06:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 10 Oct 2024 20:06:20 +0200
Subject: [PATCH v4 4/6] thermal: qcom-spmi-adc-tm5: Simplify with scoped
 for each OF child loop
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-b4-cleanup-h-of-node-put-thermal-v4-4-bfbe29ad81f4@linaro.org>
References: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
In-Reply-To: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1450;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=F/6M460B12wipWGDyJ3DH4nQN17g4TQGelqGAmG6zMM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCBeibSc7HHoJfMrPMNz85qOOfTsHttHWu8lLh
 rAfMZtJv+CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwgXogAKCRDBN2bmhouD
 151lD/4nfzF0ejhz0ulFE2vT8CeAE7Ieg+4VBtu2Dsv9RMUy4rYMvfjiHgZNGU5s3mhdapRtgwV
 +j8bOKgBQsUXU/HzoWG9sf54gPp6k1Bpcg9ab3KfWSDMBbHSNrM0PUPBa1DY75PiFI97fDEel8j
 3HNyRupjhiOQxMpHLSfesKOPXHk1nmTbGbUx+K/z5EduD023nVQSw6R9Bmnw5un/fxwWJpZQord
 nKD5OO5fIxUCaXUOiWDx1pv4v4Ieb069xF480SvUFU3SB1/2fD3htTcq3feZVkL5JG9DJjI0oDl
 JwEvxNsHl5pVkh054LprqvH5X8o6HyrToK7GHCwCeQ1R0DGiGP07WBb3LFgADZjGC8h2fYo1SSA
 Gnr6qISd6GtAn3xhJIcBbo3xSWtJD2Uf7hZMhLDbJfdjl5Vlq2CQ18IAvS6s0o0qiiGox9qtkie
 NrxWxNUNkWK120IBXyduE8/EgAsVeBKd0lnU5Y5LxLlWgyz15vq8vday7JkPYVtMzxjxuZWbQQL
 s3GYktASoFB026qr+pzzRNsruCUnVXbQ+MYrvcyFV7meWrX0dubnOunJbuy+fqccRsEUbsbCDWt
 +5/Zu8wUDuKev+8QrVnVhfjkJGcpz68HGRoFwkLpqELydAz5GxSiSf9WfvAse11dJXSwWIb2tBz
 IXhmCGmCmQMkFcA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index 5e94a45eba3eef65e436a01b3aa58aabf5f706c2..d7f2e6ca92c2c9fb532ca5d4bcc22b6c2cddbdb0 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -938,7 +938,6 @@ static const struct adc_tm5_data adc_tm5_gen2_data_pmic = {
 static int adc_tm5_get_dt_data(struct adc_tm5_chip *adc_tm, struct device_node *node)
 {
 	struct adc_tm5_channel *channels;
-	struct device_node *child;
 	u32 value;
 	int ret;
 	struct device *dev = adc_tm->dev;
@@ -982,12 +981,10 @@ static int adc_tm5_get_dt_data(struct adc_tm5_chip *adc_tm, struct device_node *
 		adc_tm->avg_samples = VADC_DEF_AVG_SAMPLES;
 	}
 
-	for_each_available_child_of_node(node, child) {
+	for_each_available_child_of_node_scoped(node, child) {
 		ret = adc_tm5_get_dt_channel_data(adc_tm, channels, child);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 
 		channels++;
 	}

-- 
2.43.0

