Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3712E7362
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780043895; cv=none; b=tRXaznDpUhJQsxCLWD1oYKnQWNjwh3ZCdwP7aZ/q0Xdd9Hx4/NK2YMrVcMBEBwYawVfoGRGseqEzl/4pNk92/RAdMCSBuT8Ooga7dRZY4vAwgto3CQT8cX9cCktNcU6ejbXLObMrXZ+y9rnDZ4oM5n/Vkbg5o1LdS/caUUr/Gjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780043895; c=relaxed/simple;
	bh=eIoJtuEeUkXYneEzlx9+Je9fqmyCt71Y4TEtTlS9pcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/PWuviphfamYApSqmCGvE0ooiO3dP5LWa/d97ek4w9P64PxOuTaTf39rLSc6Z1StpOEFo4Ffk7lkWS0N0kZdm3p7VmVlrB4ZerGCLQnBtYVE/Nwp33x2ZwZuZ0gbEjGoJenHCmZZ8YaxUbfeEa+IN+tTajJcM6HnXp4mBTyqgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nf/F3czv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nf/F3czv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48d146705b4so144407925e9.3
        for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780043893; x=1780648693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuqiqTXZ5hCzNA7yD+Zir5fTo6aVNemJbGqfNK8pZ84=;
        b=Nf/F3czvcQH6qjTLMddlIEbpr73u/Z3e1eJok+ci9PmEUt5vddFjHonzaJwT3Z5MzM
         s9PmugYKZ8RTRGU3P8iGoViZQs8zIq3hq8PN5iFRjP/GQkp/BErrQq3TjJpVqOUJPYKs
         RQxL2kNvORZFA452J/qUBbwjSAz0sOvDUP8hKs3iXYk7iCpsbwej5PpEYyIA7XE4TPOG
         XJDePgaSEx6A8RgneV4gpIC8c35DXL22lw4gHAkZRW0PMEpMjIMgyX6awhw/Pw+owK4R
         TG2FQ7TKcbHctwIjllu6av821gGcjf+Uv8PVH8laRbyCP9l6OZysjJChSm+BDdoF13w3
         SNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780043893; x=1780648693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wuqiqTXZ5hCzNA7yD+Zir5fTo6aVNemJbGqfNK8pZ84=;
        b=oUje52neCfvpy9P6ayUyb4Mrspnr0oU9eR0FkYeLdnj1eAaSWvngvt0+u7FrmJr1lC
         96cGU1yJm1XkVwtyGx09r7s6QeEgabuOaC2N88jlms6z+3791QSq9myfES7FfoERnm+f
         BD2Hiey2mRGJ2KZbZvIGgcr+ty41jflqHYN0XoTz0TtmdbHz+jijmGnXdMSPGpLMr+pw
         Kaz7jg7bZKkukcr2JTDC3VuzGl3JUH3HzvrcVjJQMrUfd30lQuY/C8TNjwPh+PY87s/s
         VN2m6oEZWhQp/SzkTJ+/G27zYgvjSzo8R46O0dKQbsZzfvj06dSQxLXb31Ufy7rhs56R
         xZVg==
X-Forwarded-Encrypted: i=1; AFNElJ8UPz6v0b0dkN/FI+Lwen7a39KXRKHHdCSC+WTjUSgeOXxkxrHlra1PEMPlzoasl88UE+5RTM6kEGpSPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvejdSPtBf8sT8fjNZ0W8LfB2DFdCcVogbjceoXS2bi5X69ol1
	Q3AQlmZulns8bhivU3UL9yluffOa1tHsZt9dtOiKCi9rIP3tVoKhijHT
X-Gm-Gg: Acq92OEHaoSDozBZbOToUUUyJB27spiaN6S0u1tuEUbCOYGdWaYShcK5D7zhyVzcEjr
	0jOuVPxdnzgkJL00WQ+KAFKwcCrg8gqebAtQO07gzmH+6i+k0Ae6clLnkvLSddzDj+IgGwUF6gP
	ISwpnINqwjLyiF1rIR7K8TJO6sExYNwVzJhf69tKHxVQJwxAEyf5hBam1TQ1oJVHBb4EZ5C4y7A
	E3nZ1EOwufQt8Z+WM7wpUjGQvDr2lK/jJ6Uxi3cQIdTDya0KqJhBPjrwGpGLCHvu7qrsLT1jHy+
	x+SqXUWvQuwSxsEjuqRQn+mTIi9SSSXCxTXsEWaaoaI3DxoGSmXA4TNBAsDZ8UctD4/sg6LNiSS
	+vteeKSWc2xaJKuVXQ3wQki5eWqIjAu7GBuP2L4JNNtWAKvZ+/reObTvziPX4XX91ry0mAlIUVs
	BsglTOdX2iMAu2oYGIZhoJ5sg=
X-Received: by 2002:a05:600d:4441:10b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-4909c0dea0dmr23653445e9.24.1780043892984;
        Fri, 29 May 2026 01:38:12 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d5f2347sm24939705e9.0.2026.05.29.01.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 01:38:12 -0700 (PDT)
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
Subject: [PATCH v1 1/2] dt-bindings: arm: tegra: Add Motorola Artix 4G and Droid X2
Date: Fri, 29 May 2026 11:37:51 +0300
Message-ID: <20260529083752.44796-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260529083752.44796-1-clamor95@gmail.com>
References: <20260529083752.44796-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for Motorola Artix 4G and Droid X2.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 033a63f6c068..ca311262ca32 100644
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
2.51.0

