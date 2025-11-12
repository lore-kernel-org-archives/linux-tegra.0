Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EC5303C8D
	for <linux-tegra@vger.kernel.org>; Wed, 12 Nov 2025 10:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943350; cv=none; b=lZB6CC0arZvCzvYVgZOn0HfwvbljZehzdTdrxZvwHbXi8knyMRrigikr0hY1h0sUyHb/uCGcAWpMcvFLMR5J+LKbQwlER1GJQ+BEmz5MnBTeUM99EoSRu34I/mx+XdINn9/9jVigWm+PfpRhZg9MPx7DnU+gZvUw0Uc6Ni1ge5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943350; c=relaxed/simple;
	bh=97pN+hZe6aOdQXzqXH/jzMv6/WG6YtpXykn+P6/wWxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUzvBXKWFYzQvvTY/9qaIDlpxpUHospc0g/wsK7huqUEWu9ix4Xe7so9LLc3HmEle+iA5KO6TKO9rwapWjwgzRQKZtywcpovrplSdrWZCybsY9ztCJbw+/fvBBaSnICUOvm6iRL8CceOJJCCImStDf9aXUXOysvA10JI6Lp01Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bo7E/5Ce; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bo7E/5Ce"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429ebf2eb83so83120f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 12 Nov 2025 02:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943347; x=1763548147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xtn1agn38vYYRSDmrX8xmfCfXiGeMgWG3lL/9kBn0bY=;
        b=Bo7E/5CeRlohjHNpd58+d9WIAT9YKMAa9+ZPv9UNTau/syi/2Uyll3sb4IQNDR/aLI
         pMIdz2Oky9rciPhrgVxzrsHxg0i5SLr3mkzmqBV/zYiJQMFvmisY8ad0WpCFm3D8wGWR
         qqlB7+hPNSd73I5WmfT9Y0bnSqlbf8ZY0yK4VIdYQHXetCFnU3ky7LrBcva9s7ka7P9y
         4EneKs90lgQ7XQSVUxNPAHHe3dvQaNPijWPuGxTbMU60v0jIGGf9q0KG/wvMweK3KJf2
         noQ2wkk6o6qMJUKbb5/X6FkWbxcO42mF1ZcFQ7KC6g8gb0I2rF4Uwajkib36fJIpG1zI
         oiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943347; x=1763548147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xtn1agn38vYYRSDmrX8xmfCfXiGeMgWG3lL/9kBn0bY=;
        b=W52aZARoPNhMwY5IgIuH6yq0RuMxxYxl10+f0tBlsJji/aO98hBB7nwXLoqdLlZP9p
         DYkmyMEkE3HsNM/xWSUQbqZX2xBsLdQofMQ921REHRwRThrFkzW3Ksac5eqg/qbndnHS
         DbwCXqqnIE7aql+OfYaV+Wkbi6aNS//4jzGA1B52+lFxysYuqa6kqtUkKdfZNBgX7DLa
         6QFNMbfJ2rUhdUC9oUj/QkHpuQDaz9yRQPMnPCXBTogj5Oi9tx3NmzyRdRZv0Ubh4Wk5
         ZGfYzpug1g1yjKXR63WIyq5s1bekiMDVjGoP0Ze9W9R6beKSVbB8K3JKNVpU6oOjvuKN
         2Etw==
X-Forwarded-Encrypted: i=1; AJvYcCX4IzfzuMdakFKaWZof6ZySQCk1oj5LG9Hef9tJtW05je7ZOUo3KXVJjN3TrwLvpCKIeu5N2AjI+EixGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxARELfruOwYWtdsvFP5anABfDZgTjou8CoHqGXR1EFBVlr8Lfw
	DUjGA1T2LZkV5e8ZfZCxXywQAY9MfhwF36OMAP6Cic4nUTkirtAuDGHG3jb15JIxbM4=
X-Gm-Gg: ASbGncumBvb7x5T2WxyHolPIzJskkYcUofDrqO46y/Hlmoh4nVrxtqHf89+VshizNgZ
	tJQduC7NQlAAVXSHSIHRKV708FFuJXA8C3rF1vjVfKOvF40cJX19b/Ou5Bs+8AHwf25uciv39LK
	yxg1qmJLU3r7laXmj+IaLtTxcAsg35CMtflCaGt4KK9dP7A7qFfGCxF/zi/WPverxul/7d0cnck
	fJ1aYaySaTfA19Y75g7LXVD5ueDqT85HpRqME/fyV/mzmjkXvLuzz7y1YaWtwbYrQ9ixUW+VerI
	KlqinEvQ6VeLjUxr54D5BebFI3H3dn8PzXPi8BjCAyH3RWLm+EpYd1/0u15QWgBNpXK29N8D1CN
	zx03b8It1S7tpxkrIGC5+eldWSdbs6Uv/HRMfhYoCXTLMp31UzEr8XKVji2CYwroenlO2ucahCV
	iN62NGbuIffetivSYg
X-Google-Smtp-Source: AGHT+IEqw4rhZRyDy+yPmdGyXuh1FmIzLY034EYTwmwGfWZRi5DR0a/TjWaTQc0ZSjDYk6R/6C4iqQ==
X-Received: by 2002:a05:6000:2087:b0:42b:2da3:ac30 with SMTP id ffacd0b85a97d-42b4bb875c4mr1198295f8f.2.1762943346620;
        Wed, 12 Nov 2025 02:29:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:46 +0100
Subject: [PATCH v2 01/11] of: Add wrappers to match root node with OF
 device ID tables
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3774;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=97pN+hZe6aOdQXzqXH/jzMv6/WG6YtpXykn+P6/wWxo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFkNYeOuoYzpykLoG20VsmMhHx83ITlx4eh3
 nQhR2/+8c+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZAAKCRDBN2bmhouD
 1+WoD/0TKoeUAmx+UOxM0JybjWAMODukmdMBn6gauxFIVRlljF/oKwZMabgzYrNN21aWkVxl2Gx
 YzAxkQ/qwOh0Kdg86awylIZT+BceJmpZHLGj/zlXD7z1Kp2Ib/Kvukk1qf78AAs+4CkVn6XLbMm
 SfzvNCXZAFS/Wmwt570i9P1qKzGcXPrFmD4MBRBDKcQbzpnZXtKtATET5wD1DdrmwA6VvwTWg8L
 p0SrRLcNqaiA690mMfLZ7XlwD14yyWMuYn3NzN0WwFvYKWh2yqTxVxjNKzEoCRxn+6Lh6E//R1R
 UotKfqNNiO5iZadxiAimw/mkju2Kc5uaLsCPVtoLaIALM1ORhiyi23/oZKufSjy2XuBogIcXmzT
 fUnq0U1+Oeh5KRBAcI4FJ5EDuOL2QM3vVPw5CHBaTVxUvCg72PkhHxk2T41dJ0MliQNhFjNBVIM
 i0zNFwh00b3UiSNkrkGSas79QDK4rhMiYBsgfZUGYjST+qh/p6kM7ccxpbMz3tirdbvMsZxEufo
 M7xuNl4R9dMgRs7AKLfaIIsojl8PL6NpZNLEoFVh6RzLDTt1v687levEf1VfBoqiRy85HTPXUJr
 NsuSFe0RR2EjGM7CjvRbVfguXXSnUnV9PtpU259qszWKt0OBGoXxH4O/Co15e4lndqJuZVDKFX0
 WigE1E0XpsiiR1A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Several drivers duplicate same code for getting reference to the root
node, matching it against 'struct of_device_id' table and getting out
the match data from the table entry.

There is a of_machine_compatible_match() wrapper but it takes array of
strings, which is not suitable for many drivers since they want the
driver data associated with each compatible.

Add two wrappers, similar to existing of_device_get_match_data():
1. of_machine_device_match() doing only matching against 'struct
   of_device_id' and returning bool.
2. of_machine_get_match_data() doing the matching and returning
   associated driver data for found compatible.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

All further patches depend on this.
---
 drivers/of/base.c  | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h | 13 +++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7043acd971a0..0b65039ece53 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -434,6 +434,53 @@ bool of_machine_compatible_match(const char *const *compats)
 }
 EXPORT_SYMBOL(of_machine_compatible_match);
 
+/**
+ * of_machine_device_match - Test root of device tree against a of_device_id array
+ * @matches:	NULL terminated array of of_device_id match structures to search in
+ *
+ * Returns true if the root node has any of the given compatible values in its
+ * compatible property.
+ */
+bool of_machine_device_match(const struct of_device_id *matches)
+{
+	struct device_node *root;
+	const struct of_device_id *match = NULL;
+
+	root = of_find_node_by_path("/");
+	if (root) {
+		match = of_match_node(matches, root);
+		of_node_put(root);
+	}
+
+	return match != NULL;
+}
+EXPORT_SYMBOL(of_machine_device_match);
+
+/**
+ * of_machine_get_match_data - Tell if root of device tree has a matching of_match structure
+ * @matches:	NULL terminated array of of_device_id match structures to search in
+ *
+ * Returns data associated with matched entry or NULL
+ */
+const void *of_machine_get_match_data(const struct of_device_id *matches)
+{
+	const struct of_device_id *match;
+	struct device_node *root;
+
+	root = of_find_node_by_path("/");
+	if (!root)
+		return NULL;
+
+	match = of_match_node(matches, root);
+	of_node_put(root);
+
+	if (!match)
+		return NULL;
+
+	return match->data;
+}
+EXPORT_SYMBOL(of_machine_get_match_data);
+
 static bool __of_device_is_status(const struct device_node *device,
 				  const char * const*strings)
 {
diff --git a/include/linux/of.h b/include/linux/of.h
index 121a288ca92d..01bb3affcd49 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -407,6 +407,8 @@ extern int of_alias_get_id(const struct device_node *np, const char *stem);
 extern int of_alias_get_highest_id(const char *stem);
 
 bool of_machine_compatible_match(const char *const *compats);
+bool of_machine_device_match(const struct of_device_id *matches);
+const void *of_machine_get_match_data(const struct of_device_id *matches);
 
 /**
  * of_machine_is_compatible - Test root of device tree for a given compatible value
@@ -855,6 +857,17 @@ static inline bool of_machine_compatible_match(const char *const *compats)
 	return false;
 }
 
+static inline bool of_machine_device_match(const struct of_device_id *matches)
+{
+	return false;
+}
+
+static inline const void *
+of_machine_get_match_data(const struct of_device_id *matches)
+{
+	return NULL;
+}
+
 static inline bool of_console_check(const struct device_node *dn, const char *name, int index)
 {
 	return false;

-- 
2.48.1

