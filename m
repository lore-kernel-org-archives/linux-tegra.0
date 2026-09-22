Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542FA5383FB
	for <linux-tegra@vger.kernel.org>; Tue, 22 Sep 2026 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075168; cv=none; b=KL9xMBAZRCvp02wbUFhZXvINtcOERK5S0pghSi9TgrYSXJGuslS2W6gKFWcstIfdUda1eQabGWz8iOnVqRlGp2RirefS5mYlpIp6Ic+nd8FQk4klRROAH4JbfaM4jnnBaanukAMZ9YToVzQk0BQUNsCUOCPbiDv+2nApqDgibk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075168; c=relaxed/simple;
	bh=s/0O22UlvHKYSxa61UAVvdf6eqtjzPHamDIakwAoE5Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FWXtUvo6dMHVWwWNVAlm0iAfs/Dza/7Zbq6cuge9wEY8Gv7kRLVxblpaadJClAFtkrSUPz2N6aaBhWiw6/PQlvWNTytWnLBob0IFUN7ZVSJI+cRBNf3Y0o5Sr037yL90pIoljPtuvq0iuzXaev70zGYNzAmGOmTKfRrp2RxVcxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WY1rGbem; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WY1rGbem"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd53f2b27cso49275255ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 22 Sep 2026 04:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790075166; x=1790679966; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ecy7FzIPrtxUNn+PNMjV2l4GmOvdXqqQHutFCvXsJQ=;
        b=WY1rGbemVvteaE/3BhtWu7EVmN6LDsMw5vRyPU7xONN3QZ5w8FMRRxjeFENfk1/SmU
         +aohFLMK/p2Lxb12GX4Q+NW2WbigXoTGWR9Ym6cJkdJdW63TQc7rXfaCB9tZ+7cKAeBd
         MEQePu65OtnWFP6v43/hrE61BrjVJsWb7sTXkX0jmJgMInkCaMwnmtYg6yCNaB8TTFnn
         e/PTbzQhFYZECylMksKtctUb0prjO8bIh0jVKG/VvpXz/amGB6NqI8FxQH66cg1jBeuj
         mqxG0InWzb9DtL7PLB+SAP+4a1KBgdIK6E09L/4yoPilX7alN6qAsF4aj+XO9qqwO8Hz
         Qvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075166; x=1790679966;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ecy7FzIPrtxUNn+PNMjV2l4GmOvdXqqQHutFCvXsJQ=;
        b=Aj3wUSgNjXa3WCTg4YBPP/LftK6yEqTBA7vDRAhFUohDkTWWKOkUEOJPzY8d9DNnFX
         8Ow8r4aD/w3BEldV/DOLLeK7INfwPxSLFM+4yEj06RXieRNJLYO1EM+AQw0anw0FweuQ
         /IIPKHiqmaMgJbofff1K2VweCBedFyTqh9nY7paH/HZl3kTY1fSoS3xv2jf3fjGazFsV
         baigaImCc9Cc6tGd4EOxvhVVCmg56IDOBo4f/Q7rKQkIUcbgiDpv+y8DWxIFwx0RlkG6
         k9FI1VahfQI+ueB1WwAc2+u8sE69Aqql5PlQ/4Pw/9R7ePY83QgEgZgPZ1aEbDRF0c3b
         oxtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwP8k9amHJW6nsSVOYjLlpQo6OQqcauNqtemEpA+THeWERVmEk2FkLgQyT3Jaa+Onqk3B+reu5DcoClWA==@vger.kernel.org
X-Gm-Message-State: AFuF++m8xpGvemHx747AFSd7jkfWpDeIroa9r9HhU+S3Rv3G0fdH0NXz
	bjL9QgTgdj8ICjQiGpxmRagyjftQi3pN+WJjkrizrinEOKQtzTO3KqlPORcXyhJj4tj1mhOkn8k
	w
X-Received: from plw15.prod.google.com ([2002:a17:903:45cf:b0:2dd:b2b9:91a7])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:984:b0:2d9:438e:b70d
 with SMTP id d9443c01a7336-2df609b194dmr9585075ad.1.1790075165400; Tue, 22
 Sep 2026 04:06:05 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:06:01 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922110601.1959213-1-morbo@google.com>
Subject: [PATCH] clk: tegra: annotate struct tegra210_clk_emc_provider with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Bill Wendling <morbo@google.com>, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

Annotate the "configs" pointer field of "struct
tegra210_clk_emc_provider" with the "__counted_by_ptr" attribute,
allowing the compiler to perform runtime bounds checking on accesses to
"configs" based on the value of "num_configs".

The "emc->provider.configs = devm_kcalloc(...)" call uses
"emc->num_timings" for the number of elements, which is then assigned to
"emc->provider.num_configs" before any accesses to "configs". The
"num_configs" field isn't modified after assignment.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/clk/tegra.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 3650e926e93f..f1034e14c1a4 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -170,7 +170,7 @@ struct tegra210_clk_emc_provider {
 	struct module *owner;
 	struct device *dev;
 
-	struct tegra210_clk_emc_config *configs;
+	struct tegra210_clk_emc_config *configs __counted_by_ptr(num_configs);
 	unsigned int num_configs;
 
 	int (*set_rate)(struct device *dev,
-- 
2.55.0.1082.g2b9226bbc0-goog

