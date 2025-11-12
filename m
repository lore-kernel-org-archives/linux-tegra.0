Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC3130E0D5
	for <linux-tegra@vger.kernel.org>; Wed, 12 Nov 2025 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943365; cv=none; b=Wxsl/ThRk8L26OugzGWGXFTaMG27QlVh82bynf0HHKT14YlNBQ5IiiAVSH0W2vo2IsnEUwJpJtI8BSGK39tUWaxsVZlijiCbs1IidoqhQUUO2EUUh3c6/G4C7+CBWYBvVBecBK+KeBaffbW7eaaYLQug7WDeI+LQX+sG6Ehr7co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943365; c=relaxed/simple;
	bh=nbwVZd1B/0VhFu7wCpDEX+Xq7qXUW4QXmwaphM2p2IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dq8e5gzeMRxEaizbTc9YKbiWTplklwCk/IY0Ux8E+tO9cbehI63Os2IKGFPQpk8JMjIDtepDENXBjJXMM640x8ktj/PKB5UC+Bx8Da8mL0//FDp8/I9eAsNwgji6imztfSevaKyKa3oLvoZDHelC7wI6iRWH27ZLV9aQPX4Lzxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XXNJleC5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXNJleC5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47714bb5c49so148725e9.2
        for <linux-tegra@vger.kernel.org>; Wed, 12 Nov 2025 02:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943361; x=1763548161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsvFfAvlWLWUNByqNFGDgf521DahJAyf+bE64GmioBo=;
        b=XXNJleC5qKSNtvmIEAkGOLxGDmq3jFud4he9epG4tSDPUS/BaAsJZfI0ShwvsWT3mD
         e1oLw8ucPt7CnuwflacurAAAeUKuN42fY3PxyWX99NlwcIymhFDb1Ax99lmFTRO4U7NX
         HpRarxQaBWFbjmPe9nh1W8CQSFgxzZZzMTmVgt1+moogPtFsdG8OCz/LdzFKxNL+tFwp
         CBMvk5q0qTb+NqhtPf7I2XKuGxoXVruE0FGfnbGd+7ewGokwoZs8RiG7xpPx4oo+EThX
         K1U7EK6DxF+n0n9UwupPTaV4BD6bjnObrm62Zb4c+Dvelfu6XyESHbuvV6zcnKi5g+Gt
         M30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943361; x=1763548161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CsvFfAvlWLWUNByqNFGDgf521DahJAyf+bE64GmioBo=;
        b=h7HG5CcWMs5MbRKLOegv5izo3ELxIggNYYw08sXorqgLF0W7sa54m8HvOuQJ8htC6d
         bKlOpGc6geIYoCU/NqAUz8pTAlFsQvBeb5s0uq4RPpwa6AtozoqCkVqoJxq1l965gVBK
         ynH0zkG2vwLSlIIb/73TYWfCJhATav8QrKziw67cm3uk1dFonZvvOnTVIiMLnh7DybGX
         4WBFFd4MEsJHH4Y5kPIWczdo4A0XK9lpcaGpY03lB3zRu4kd61kGnKoOuJFgdqfw7sP4
         5gdOiKJKCXD4dEBx0MdPuxWARElxPdO0AgrC6Ub5zr/vbbhM2WF0OHL/w/85bCPvg+o2
         khSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRRC1excDE8Z6bCcKvXIahZyLyqTHztIAdYUwVMJuYOB/iNpacBdq+4GzKN1xIrJ+cK1oujyc+NRJHJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIwkaqjEolxibaQv4ukMLGGQrK6obYGb/xNS6aGAQG73I7jDqr
	v9DNz/7PWqtdNiIYLXeYpeTerqpNEkfaLx0Zni0+t748WCQg1TvsQ12WXf4NaWn0KZk=
X-Gm-Gg: ASbGnctrPYPvSAWs3ByxQUPbxdLQf/G8ntiIgtCa+60VOqHyAWBwTCE/ioFnKI5ikCR
	Kzgws2NS2JSx1ixTQxIDqilBxLOdqPvn1UM1ojtpuUy6C93FcNZCtoHcgZti+RKe2b8AYmD4aMU
	ix8dA+II9+hU0WH013rRFJHbufL6S0507JnKs5BTfAwYRMo+CKbM8hbx+6XOFprTEqemg3PW3uy
	fxZRjTYP86tJFwzMON7Jqw1qoio7D2PW31Ob4qDi0XKNS+GvEqonMybLy7RTmdOzimgW0HzguAy
	vpOW9KkS3dSlcz1VfDhoB3nhcuAPmWIYXd73t8YQVB0lw2s1iHBe4AguEsCVIvP1gXDCIyTuokz
	A7JGZ32XLHOwh/qrvJX3aVVLbYsPI/flQIwwZMcy27OhYbQFby4xYxjBGEO7eocT/p45Rfs99Jq
	RErMw6ivQkX7X8EHUbsSGvuWuC5rA=
X-Google-Smtp-Source: AGHT+IHAInGs1fY6MhYk+BOaIQN6jWgnuAcNUMCj8asWuYpXZLP7gT6bSs36V8+DqD/oHKzLuMjE9A==
X-Received: by 2002:a05:600c:458d:b0:468:7a5a:14cc with SMTP id 5b1f17b1804b1-477870a634fmr13473095e9.3.1762943360967;
        Wed, 12 Nov 2025 02:29:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:53 +0100
Subject: [PATCH v2 08/11] platform: surface: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-8-d46b72003fd6@linaro.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nbwVZd1B/0VhFu7wCpDEX+Xq7qXUW4QXmwaphM2p2IQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFqdZoAVmnIlbNdcg1Y+7nkfxGC6i0n15Upq
 K4jKAztwCqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhagAKCRDBN2bmhouD
 16TrD/9AMI5SrOqJWRLQ7jKUbUsOysXBLyuiMqQn38xIXkce16vSkar8aQIikXJi255w8BCbJN5
 XpoXeQslytCRS2CvSCYzSnwLKm2jyAZ/UJ1eYLlbnFgA+bS/tLQ+ZxexHjt9zLRFy5y/asoQ9P5
 T9ql1bh7o1gtWYg/4FFEWUimNr9blWrvDirnEFXFokhYDjS3gC7o+PuR2zOwO1cDK1KeZJJNkxN
 4siZTPlGWjvimJMhb9MFFIaD1FGMjk8Oo9RuC38wtEQu+3Qnfv/pidmsMkt9EOEP0qyuk39qX97
 K0bF8PhZ0HlmSGHSqBDDnZ7h6TT47NdxsBFm6VztA4UBwafUt0laGgFVTbdjsPh9eLldIzc6gX4
 qd98n+HB0L0CRvu5lEA4fuApN250SBVNphKHTRCHH4rvm+c92d9Rviz27WVVP6aXK0lXrLRvuSQ
 a/h5NgHZvUsRgGR6F+KsWkKyMqs82BCAQMm3hAXYKGAHaMWvvL+CBlqoakEF16kOlukPZ2PeyBx
 +LBG4qy8sQRRamg1wPYLUZkGifRetG7z45hjdPYQwpEltgLy0irZZM9ct+2IGITcZjmMnULegw4
 nTMQ+fbC0RPtlIJPjVmVA3X+PhxBpo1um9dL60Lwd6bft0tS+sEppobeeBlN0d0Kr9qBJ5OTrXg
 yG81W0MnFMi2LXg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/platform/surface/surface_aggregator_registry.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index a594d5fcfcfd..78ac3a8fbb73 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -491,24 +491,13 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
 static int ssam_platform_hub_probe(struct platform_device *pdev)
 {
 	const struct software_node **nodes;
-	const struct of_device_id *match;
-	struct device_node *fdt_root;
 	struct ssam_controller *ctrl;
 	struct fwnode_handle *root;
 	int status;
 
 	nodes = (const struct software_node **)acpi_device_get_match_data(&pdev->dev);
 	if (!nodes) {
-		fdt_root = of_find_node_by_path("/");
-		if (!fdt_root)
-			return -ENODEV;
-
-		match = of_match_node(ssam_platform_hub_of_match, fdt_root);
-		of_node_put(fdt_root);
-		if (!match)
-			return -ENODEV;
-
-		nodes = (const struct software_node **)match->data;
+		nodes = (const struct software_node **)of_machine_get_match_data(ssam_platform_hub_of_match);
 		if (!nodes)
 			return -ENODEV;
 	}

-- 
2.48.1

