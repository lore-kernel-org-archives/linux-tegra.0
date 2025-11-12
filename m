Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A3B3093D1
	for <linux-tegra@vger.kernel.org>; Wed, 12 Nov 2025 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943359; cv=none; b=Ea7IHH7wTgmYi4jBmQosWIfITqmQgfww0y8cM7iJLLVF2IHrkZrpA1dZZllvisfyhz9/yGKLE1BU/mIKLNIw+j4ZG2s4dGo2F5xO9QOXzHh25Fgiu/4ycLOUWuceZ4gDYdcs+/c1GEfyO8kgXrsYWi6tj3xl29GPim5SJpDMbpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943359; c=relaxed/simple;
	bh=81jTJshG5U8dunGjPlokrsbh1X84C4sADnDFTx0hch0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkbQLLCQacQuSgT4fzWyYqDqQpCE9f+7QwFgYZDnEPHLzcKgxSnq8KvfwdJ47zIyZHllD/LjuQqMcHSwq5lbfXFu83OAKwbWIWcd6HHBI41LXOr/qoojJvKbjCZmtDWp+x/xAgrOACadquu6m1pIr/OBGx9BaDE/bGCQ6MqY9Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wgxAQFOG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wgxAQFOG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47107a9928cso126155e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 12 Nov 2025 02:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943355; x=1763548155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=;
        b=wgxAQFOG9Anw9uOyjFx2pTNCFI/4mLtXZ6uITKqA72v83m4U39KMpIDU0FoUxqLvpv
         Dd4KzAvJiS/QyvBeIx3sOcsq2BSW670xNIgo9U8i/lMMPlJGigSFpURjyEks480xOMxy
         JfQNz1S0UqKii1F4Ud0HZ6EuWaWopy8dzy9fCIZT85IQ4UcrSGUBZBkcNrQgAzJMqTCz
         foLvEofcgVb7sQfkPZWpHNh99Xvr9sQRiVDrtjaZW9K7U7TZEGSaEiyRhIAj0cli2Se9
         5a44jK9tHREcQD02tnpfKcWWGj8rercieFRwRVhA9LF25lyCZIjgFtSiDixMdpVwqZD1
         bGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943355; x=1763548155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lTTwfl+8zqu4m1wm1arK7XbgGiT9bQGfagDjMk+wU6o=;
        b=ISPay5E4XlBgLZ9W8ku2/DhFqOC50Qu0BW9fP8gLcu3UEecWKJa+dyUFYZkyERDOyg
         If0PYzCB75NIJqdMjfWQdAh62be3ghjm8dC9px/OWA12O3dLG66U4PUaPU4IxHvbhY28
         Dyrh+9aMB5Atw7fXmJhdnZK3a+fI562loDUrsAKLtj7y0T4Qsll683WKCr3haNFPaoj1
         crvFcF7YpzJEDpoAcwQ3ZMHoRszlWkczxajnGL7FeSs39rT2FllZjEJNZ/Xg5lLfaQ7h
         tYMwzN6WVh0OKkuqXbJJ7luFjOZnCf3cjyVyRaCenzfFryyeEVR8E3t0BdNFpSzo5e3h
         EgPg==
X-Forwarded-Encrypted: i=1; AJvYcCWIMIxqIfw3on0L+GL+0ABJwpFJD7v/gPoYH3j7vKJ1l7A1D/qplpf5uiEJxWXqTlRetZH6n0MBrH1U5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK8MU9kmxLkhfH8Hy5/Ei1BkdbWI3YeYJAVoRho8efxUppwk9f
	+jtnDgLPKdkCNTNszFNykJRQNz3GdSZnOPgyApkMz1ca9ZbTcBUh5EAjOw4f3C2L1TQ=
X-Gm-Gg: ASbGncuks6BAum9J0XRmAyJQCOwSu3ZYdq12onNsM2UBh42HJZVa5IazMDFxorSDWaR
	Y4ccRgiZ+8RFvoLUYmxQWWLEW1ZFdKPo5m3seuJ3LJJAmYqsIRIOR80Ur229nyl8POkTsEJo3z4
	Wza9sp7n3bsU4IvtRqgY2Tsil5xaVohlJxykyJaMjvqH6qsVoqicwiedgOxFqSK+ejp4QnemiLi
	eFKYm+xwiFy2DoTj91FZi5curATggOuQ5vbPcvzMuIao9mu/dBuvxQl+Uqj+sO7PlXtSh/v1X8Q
	kayVhF7YQQ4g1PXgl8/uxVmU/vapIbOi/OrS/v8paS1KcrTXv+Tve+sdqzYlldWwLaliqgdWDpG
	NPsHN1hPj5NjMv856Et4BKhsa2diT/R/YfDNBM5Eq49br4+ZklACT6wKb/N5634upCXlP/go1ve
	HGOAgEZz8QwJeHPEGd
X-Google-Smtp-Source: AGHT+IGrKXMvZPgqQESuBAhxDftEhNsnWrEuywC4iLSQ8rVCnZlglSobGl6lS0FycwtWDDujVctuoA==
X-Received: by 2002:a05:600c:138f:b0:477:79a0:515 with SMTP id 5b1f17b1804b1-477871eedfemr12412855e9.8.1762943354825;
        Wed, 12 Nov 2025 02:29:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:50 +0100
Subject: [PATCH v2 05/11] cpuidle: big_little: Simplify with
 of_machine_device_match()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-5-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=81jTJshG5U8dunGjPlokrsbh1X84C4sADnDFTx0hch0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFnyTG8g3Dv3wVreirAjpYs3pAX3qJ3UXkuT
 K35vq/FMbKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZwAKCRDBN2bmhouD
 17JZD/981Aty8LTyqThGaZ2jPZnQRqILA4jQLUdlyGHSD3o1JOkc/OejeGBa2XG43Vs68nAkJAD
 joLQtVvcic7O5R3bHLdubIg/nwmSiJf4E3lzP/egNMDXmQGhpjFr+JbWrafzPx5AkJOcZkYqz6N
 YUgS2cJxbZYonK2umjv++lLOLQnSeIo2E+KprbWM0yjX6kUbPE4epGQaM065McRy0AIwdI4fxoW
 T6NV0F+1HAANoi65DBqfvOzIdaeldH2t1qyaOaX3hEtYzvDDKNjh/Ut1AmmH7gSnlsU7EfG0AwF
 O/P4RyK/k0twGUZr83j3MngPkzj6XIIc800HONG4zXqQcRu5Wl+UDmvPMfhu+G8hCTlD7pTKc7B
 3yRo8XhIdgJZL4BIBD3ZMaD/sfeWkS5N2HQce+sfgszMJWRCRiAIdL4jq2lZ87zhxw3NaR7MQUI
 LnKOqV7KTzrZndBUoFckzLoGxG9iwlS/Q2z/F/FzJK9Wcw7CYIjpNYhIrVxg8XbNbtfnvevBGif
 fIEC9fmM1ZsBP88jyZMpC/z4Jsfhbfv33/tx+L/MkGKxM47rhKd3kvDjANqxXGKWFhO2FB6auwC
 +Cv6k4NIK1sSTmE+jFxF9lSfYVoaZadbNr4XM6w+OP766Lilq7Fe1l29ZMNe+NsXwsVo4jys4VG
 Bx3+BfE9uyjqLNA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/cpuidle/cpuidle-big_little.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-big_little.c b/drivers/cpuidle/cpuidle-big_little.c
index 4abba42fcc31..08f6bf2f6409 100644
--- a/drivers/cpuidle/cpuidle-big_little.c
+++ b/drivers/cpuidle/cpuidle-big_little.c
@@ -166,20 +166,11 @@ static const struct of_device_id compatible_machine_match[] = {
 static int __init bl_idle_init(void)
 {
 	int ret;
-	struct device_node *root = of_find_node_by_path("/");
-	const struct of_device_id *match_id;
-
-	if (!root)
-		return -ENODEV;
 
 	/*
 	 * Initialize the driver just for a compliant set of machines
 	 */
-	match_id = of_match_node(compatible_machine_match, root);
-
-	of_node_put(root);
-
-	if (!match_id)
+	if (!of_machine_device_match(compatible_machine_match))
 		return -ENODEV;
 
 	if (!mcpm_is_available())

-- 
2.48.1

