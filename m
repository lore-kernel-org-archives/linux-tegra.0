Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="ArvFm6lM"
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69449171D;
	Sat,  9 Dec 2023 09:17:24 -0800 (PST)
Received: from newone.lan (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 1A9B4160684;
	Sat,  9 Dec 2023 18:17:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1702142243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=782FQFL6moJeZUHorviHUFZpWD40sdDv6r8mZSTquXo=;
	b=ArvFm6lMFxPxyeDAL644NGjr17lCwlXdScgrmbrFMxe3cRREnzPWYsxzJbSm6CMX/6+Zdd
	K81VAYmC0VqFe8lra9JLPIf9WLkldQCYuUF8bO0g0jLJXcdkcdkk+QEu4A391HGM084T6a
	2yrL+R0wam37CaLIXg18Qcyj8D7kRoo=
From: David Heidelberg <david@ixit.cz>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	David Heidelberg <david@ixit.cz>
Cc: Thierry Reding <treding@nvidia.com>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] ARM: dts: tegra30-ouya: make dts use gpio-fan matrix instead of array
Date: Sat,  9 Dec 2023 18:15:41 +0100
Message-ID: <20231209171653.85468-3-david@ixit.cz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231209171653.85468-1-david@ixit.cz>
References: <20231209171653.85468-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Adjust to comply with dt-schema requirements
and make possible to validate values.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/nvidia/tegra30-ouya.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-ouya.dts b/arch/arm/boot/dts/nvidia/tegra30-ouya.dts
index 7e3de26ca960..c284dd0a55ab 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-ouya.dts
@@ -4611,8 +4611,8 @@ cpu3: cpu@3 {
 	fan: fan {
 		compatible = "gpio-fan";
 		gpios = <&gpio TEGRA_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
-		gpio-fan,speed-map = <0    0
-				      4500 1>;
+		gpio-fan,speed-map = <0    0>,
+				     <4500 1>;
 		#cooling-cells = <2>;
 	};
 
-- 
2.42.0

