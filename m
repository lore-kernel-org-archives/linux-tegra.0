Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3F6186E3F
	for <linux-tegra@vger.kernel.org>; Mon, 12 Aug 2024 13:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723469678; cv=none; b=jjOo4NLCAoKV9S14eGh14KkYkSSa1g7wm362+cUAc/GPx1G4POAx8y1AemX96K9igEnwU8lYBaoPrNlGtVA8G+IkK73lYxoEc/QCZzXG/s0vFBGwL/JdQNyD6ncy7LmGFKleL8DL6SNjIKVhbrVbKqoZwXD3Th7kyXqkgLxcT4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723469678; c=relaxed/simple;
	bh=1y9LIZ3UpOVR4pnvMVqojw1S5Kf9CAK2N1Et998QgxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PD1bwMYMfIVTvnuOQlldYE9p6z8ZqeBhRyI8mqCrz42HNh9hB8nff72wnhBLgKR07/kTklGk9d3n7j49bzBvazxO53hLPU7sTYZl1pURmDcHmEc5ak0ZqsgQZ2cNL6VdN1OjdZ0xdshHIe5dlpZsuf7DiLkjhZqRo3tkkaqe80c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RMDLQwpb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMDLQwpb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428ec6c190eso33363005e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 12 Aug 2024 06:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723469673; x=1724074473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDjln6hpCDXYJ0URbIXokRubyMBzSip15NzhUO8TB7c=;
        b=RMDLQwpbrNYeWvYBBG3wQC6alJ4BkDSartO7T38R+n2++6HF/JN9IsebeYdt53/0cE
         MQq003aOzYm62OHOPcNt3Vbp48zTXhnfGb7F1+1Ov+58NOD4KJY1hRGuwMhoHq/26LQX
         12sdBthwH2tNzO9MqElsSbCp0vTgswVlWbeUFTMweXVZIBkj5LCJsHKPMcA8Mime5wD7
         +85dbPCoX3isZ+o0zpNrZfXiNdDy1UkdAbjdZeAeRJTSAFP5CDHYoL34NQkxyFxBjywS
         vO6lcpJ1m4rTVFAudr+t9sVTYS/1evWwD9k4cWw2VjpGKuqZwdTVEgq+tOpgzgUa1ZU/
         aycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723469673; x=1724074473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDjln6hpCDXYJ0URbIXokRubyMBzSip15NzhUO8TB7c=;
        b=OlXrWn/WzHSUq3Xyp/u6En5JxBXMQNDqrqcaThtFraWou5L6NtyKEVdHg1EHOQcR8R
         dwoP2fnGdP4Dx1lb1lRpIXiWyjWSf56j0z2RuwpKK0A+PioelMwOOUG5WogybktO5YJh
         v72fs/9aTxSI0pnEWDuYqCrQZ3ypY54s/sfoQJRC14KipH/0cp6WZLE3sz8DCQz3VxYJ
         jETrRoOtzuxm7vytXENR9AqvY/8NQAp+iN3q+vcQZznnXBs/gDr1yVeQMc0j3T8Xf+RY
         J3Imv2IvYLZyOqQcpWW0nlCG13w0HlBeosg98Abpem9fmRr2gRyYTO7KCWnIWAmWr+87
         EInw==
X-Forwarded-Encrypted: i=1; AJvYcCUaZN7AplrEyLjolQt9Fu+mJu8bRTqo1NDFO/Olq8NXoi6WHlwkYreMB3jk9EuylyaEVSFSPxfyiE/Wt6Xbr7u+2pK/D7R9eo0Ahw8=
X-Gm-Message-State: AOJu0Yygh7u5E2XT09D5Qi+sc8Oc7JXt9wnRn2eLKhnRI8HGM1sx0QOo
	1f2uzAyjNcAYqQ3/5PEAcu1veveqcBeQQYPLLXP7e0ZK0+duBD3epWvlhYcgk8wBa2ua/BAuoJY
	g
X-Google-Smtp-Source: AGHT+IGxNdfGFBc2sd+uT8Mshv7zE0iMHxVPPRhCFdm+enI7xTfevgaIs4pdgcrzguVgeuzP0FcuHg==
X-Received: by 2002:a05:600c:358a:b0:426:5269:9838 with SMTP id 5b1f17b1804b1-429d47f43a1mr3753855e9.4.1723469673377;
        Mon, 12 Aug 2024 06:34:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:34:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:34:03 +0200
Subject: [PATCH 9/9] memory: ti-aemif: simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-9-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1y9LIZ3UpOVR4pnvMVqojw1S5Kf9CAK2N1Et998QgxM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9YQQCkCmD6RWyldjxAxJ+p417Q43d0hTixW
 dLzROOtWr+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPWAAKCRDBN2bmhouD
 1+nCD/9WeAq/6x6IjpXwsbY6q4WpzSCuLIsFjo3y8wWVAXieoqOsqOZ33OR2zlrlb5R7xqAmLOk
 n+hWanKoaIz81P6uaaOV4ADrfzpSGO3F3pljzOFcC5kjgcvvPffYqPKATl5sUjzZNH+GbX+OJRZ
 0av395if4QbFFVZNGRncMfCo2pB8HZQQawKOrIVCOPLzN1l5iqgNomvHLRDECCa/i8nCeaWlmi/
 9UjCR9X02xh/BxZW74SjO55jI7IqLA9ohbA/OOGySP5UKVr42BoPn58P1GXpkfY6FZA+HZZ3ZxH
 v+AGb+6rq80Wl7Lz7DM4tVc3RniN66Yw1veXOM5c0CnQcQHGRGJDD0PV1Mm5Y/UEhTzsYmy3srt
 a2GcSDTHi2UlW11x5nxxS3OqY5xQ0lPmPn3y1UQ34g+x6gZpPZIQ5sRbQBNisH0kkU20pL32Toj
 vJG2V8EcF8BgyExdqs5VwUIyMk+IGrWmq9XPpedyVUo3qSrUBR657572wxtDIFSOEkJ4sPtKxg0
 j3AB0xCbvaDIJIE3xaTuD2DMCy2Tqf/EocjX/gF6//BfmKUbuQQUFxqm5UCiuSihYMtB82scL+Q
 uQzGTpTFXzJKJUPlJUNaBiagiaOp0EoNTtbPKrmqybnQqPkBi7eMW/iiBy5E8nu+QOfyqv/mAoP
 uWIYBVUyjipVCyQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/ti-aemif.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index e192db9e0e4b..cd2945d4ec18 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -330,7 +330,6 @@ static int aemif_probe(struct platform_device *pdev)
 	int ret = -ENODEV;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *child_np;
 	struct aemif_device *aemif;
 	struct aemif_platform_data *pdata;
 	struct of_dev_auxdata *dev_lookup;
@@ -374,12 +373,10 @@ static int aemif_probe(struct platform_device *pdev)
 		 * functions iterate over these nodes and update the cs data
 		 * array.
 		 */
-		for_each_available_child_of_node(np, child_np) {
+		for_each_available_child_of_node_scoped(np, child_np) {
 			ret = of_aemif_parse_abus_config(pdev, child_np);
-			if (ret < 0) {
-				of_node_put(child_np);
+			if (ret < 0)
 				goto error;
-			}
 		}
 	} else if (pdata && pdata->num_abus_data > 0) {
 		for (i = 0; i < pdata->num_abus_data; i++, aemif->num_cs++) {
@@ -402,13 +399,11 @@ static int aemif_probe(struct platform_device *pdev)
 	 * child will be probed after the AEMIF timing parameters are set.
 	 */
 	if (np) {
-		for_each_available_child_of_node(np, child_np) {
+		for_each_available_child_of_node_scoped(np, child_np) {
 			ret = of_platform_populate(child_np, NULL,
 						   dev_lookup, dev);
-			if (ret < 0) {
-				of_node_put(child_np);
+			if (ret < 0)
 				goto error;
-			}
 		}
 	} else if (pdata) {
 		for (i = 0; i < pdata->num_sub_devices; i++) {

-- 
2.43.0

