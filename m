Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C026354AF9
	for <linux-tegra@vger.kernel.org>; Thu,  6 Nov 2025 19:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456122; cv=none; b=UfMf9umN9t28mOSjezljVj6RgzBvfNs4Nhp27jxirlAyuI0rtZHqgoACAxuT0uh9IWPKffU2Xg80hiH87kKGrOOIN8vk8orZc7IXpErEVODE78mJvX7GQQ+6qGAGQuAuumBRhMKjRjGIfjNes21pmsTd2q9ftVMVtm3W6QByRac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456122; c=relaxed/simple;
	bh=aS+78ja3p6OXPY5E9ndwnwq/bvuxECqbsbzsQlrHFPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=at0ODwHPEX5kL2b5KeNLO1z8fqVSx19mVaHTD4vcnTpxaRKcrqsBv/YXYCZK+6sXDpXOm3wI30Jgc3LMvUbxi3SsnGCjvOo/spBaJP7PjZs5smQ2aV3HSdDng5YtW6Zv0e4drLSJDI0dfSDLrXQOG6HGE14T782rokqlQDYIw20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQMxyWVP; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQMxyWVP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3f5a6e114dso21646266b.0
        for <linux-tegra@vger.kernel.org>; Thu, 06 Nov 2025 11:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456118; x=1763060918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEcJAtodzbUC3xZVWApwBo4tG7vpFkamgYaCQUU+adg=;
        b=TQMxyWVP80OOCFTev9aaPVlZgN6ouu2fjFqRCxbnGAwR3ANJqjIVK304v9poJp9Qq/
         aqO5mYV0Km5Y0HiR97LJ+N8xOyODYFh3CAqRkBDebWY9A1o6sC6q1vgpFzZ3ydNtYWt3
         og6qPlrIU4sHTvaU4FpOTMYxvnQlPBHonhoz4B+W5zBEaf9Drqx8tQl3d/B9v1O5fs5a
         gAxs++DkJb+dCh0EKkR8KKC6xV7mX4YJwz1DtbK3KolnqzJzBANkA8OIlc+iLn90/Oya
         p0tcoYKrmcCvcf3g1KNvZJVBnv7BVytIehQpz0v+YW0gjonh6mewXdBxTJk5wdpiY/QK
         RMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456118; x=1763060918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cEcJAtodzbUC3xZVWApwBo4tG7vpFkamgYaCQUU+adg=;
        b=WtFVadu4Xjfx6sCZKMGat0MupNrkIMr7WI+lLGPuXBLzalti9P9pba/wizkxeqG76A
         T5keXpr3iGbqtg67QxMKjXrvwgF2inGVgST9UFGzr4qJuDyZkNpoGZQ+MNPtWYno3b7y
         GkWBmW689tfwz8eXKhSOUr02iyhJfmeFUUPFJ3cxXqAPDV9Nk3r0p0Aew1lGjTIGJn9V
         pHDmnWi8g/LaH7Mvj9ZHmj85o1SRNAU/p9YO4t7CSZ5u9meqrcbgdaj6oTSOZWVZAQ0L
         K9i7SdicUfRf7NAjuKHlLilXBTAV64P9nSDu+PQt18V3+hxfy/tj9RkzI0L2S5iMBpTi
         tR8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhL9R5r2jOs/K7XY6pHYb9k+xGVZ8e+y90IeJIOwe9niRkEpXUHIXe09A8OgumHpvRuZEeT5+3KHeBIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxPP7XfTFylGbzkW89lSMQ/JAvKI24pSo3RSgNLCEFxdlCveIT
	EDyook803vZsKgPOlSuRHYZ13wXtU1g8jmBP6FsRovxpwSPNdWYRmYCfpryiJ6qLaws=
X-Gm-Gg: ASbGnctP80iFuqpr4/PLocH5U/be2QCtXQGKfEsC6sXy3zH56Y0yQvEX65jSvyJ2lep
	7xNvf7znra3vzNII6OnIU+XnuBHqiwywXvINaZHRZXBv5t0WQXRARox1oYTnVV5Hg4W7TEi8Ekq
	swxxYG6qEDzqnN61knDCt0zHSJhvp0PBPH5MzwbixBRNAUbvngw/nq8BB+XH1TBKcunYxXZ0D36
	crCuPuyardfcVK0hz2qydteL5VcF2oh8MuYvBugwoBQxzr8ZJVam8gwgOTBvsIW9Dh5Ux2tomy5
	l1lX4eLKbuci5k/dy9y7+9KA8ifKykbtjH6/RG+7ZYq7cxf8jiOPaEmw+ws/IjdMbY2S1evNrkU
	5C159I7lpdlmD29bdz0sjcJ5obNXJQXMo8TVCefqGVP2VdqM9wjTV4bZgGlvrSx1nxDiEbI7afd
	cUZhqWM5kga2ATPP45Nq/ofRlpaLM=
X-Google-Smtp-Source: AGHT+IEG6JIHxsm0NSW77JVy6hqlVUyEbsXE+NHpA4hsr8vUkgMvS24h2IoWnZAH3XOZ5QWMzHmdwQ==
X-Received: by 2002:a17:907:3f24:b0:b65:c8b8:144f with SMTP id a640c23a62f3a-b72c0996c95mr16220166b.6.1762456118427;
        Thu, 06 Nov 2025 11:08:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:20 +0100
Subject: [PATCH 13/13] soc: tegra: Simplify with of_machine_device_match()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-13-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aS+78ja3p6OXPY5E9ndwnwq/bvuxECqbsbzsQlrHFPw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIU/bsdy2ckqomcJnNEJaYMWYw9A/Yk7qSg4
 /78uRfUhPeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyFAAKCRDBN2bmhouD
 1zSDD/0WA69UvlFQXYTOHuLcL+wvScWW8sP6X/fQsuharZFRRvPkmk5RKJ1H9q9haW5mFRgd8xZ
 kO4ELHeCytALDZhxzR3QwE4LgpseKDZSllt6k9bKnAGouD7wl63kISGTR95uVIILdEmQtH/OMYg
 9dplSgp+4dVxPa0TMzVjb0WV9RzYn9ubwlhRES5DFD5bkw7kpUYQY33eE2cmJlfu8p8On3ipNJy
 6bYBh7HG3mjy9NDDwKd81Dw7cMYRGCAV+Ce7NsEl5k92yn1B5nfokau0GlcFCUxhnsSZaUv36WN
 4TRVXpnSBeMhkM8HYEDdG/YqQFrTVm9ohoQrwVhSVRcjOU6I5YHA+OqDxvBRsjpV5YMXTa0JXi9
 GSoRXU2NxMxA8dXrc7ueXed+jGkJ2NNMBOTmQTjoOSU90vT6eQ0g+MQQl7/vUDIqba4kLTnLjsg
 qnj7S5s5q4cMGiqprqCXnP1Qei5JXuJtNsQzMlmH1GBncgQGLvI/8rwSqD8JGKZHVXHFXovLa7K
 O+juSa69kES3Y05oIwof7EKPSvvW+pOyi2uAXgt+v/ca2qUmbqicWLvSad49kbsc2SLlTGsBsxk
 dD6AtoUoZv3MGI7XcFgRReuI8yTr1b7oU3zSAcyqwA2aCLVxhUyBZr31EQaMVpQ9xST2iFnLrna
 O5LVFZW9cO0pqkw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/soc/tegra/common.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index dff6d5ef4e46..d82b7670abb7 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -27,17 +27,7 @@ static const struct of_device_id tegra_machine_match[] = {
 
 bool soc_is_tegra(void)
 {
-	const struct of_device_id *match;
-	struct device_node *root;
-
-	root = of_find_node_by_path("/");
-	if (!root)
-		return false;
-
-	match = of_match_node(tegra_machine_match, root);
-	of_node_put(root);
-
-	return match != NULL;
+	return of_machine_device_match(tegra_machine_match);
 }
 
 static int tegra_core_dev_init_opp_state(struct device *dev)

-- 
2.48.1

