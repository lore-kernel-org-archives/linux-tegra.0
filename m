Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CADB409279;
	Wed,  2 Sep 2026 22:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387091; cv=none; b=eh5hFn8Y3JPjzLEbX5GN4QpKcwcFNCokKzaJ7puIqK62lRbQpLLX84jf95ecwVlT2KMWONbeQj0Wp0cSNfUo8IMqDsA8uC06FzwrHjh4eaHEIAfg6vTbwPuJech6km/MjupwnmBnbmy4sk1BwF39xLNxdgenPfhEqjk7n/uBSLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387091; c=relaxed/simple;
	bh=5CV17x68rtlPkq6ZOLLQ2oWAaWfwZ0cf6Jr9bZAt6JA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3pmc8XDVaiQpLl2+rcme6W2twDgxzTBbE+jGioKXsj+xz+OzFHDMhV0aJUHGqBtsxLgkFoSDy+UrzmEsJyZMsBdFwtuqMLk+ct3UhzFjR8/Hza7J5gsk3+W19WCLM2oxlQzTxERWCiiEbZ3kg9kuXCEy/gT3mpWnh3cw7qzyY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dKe+1stf; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dKe+1stf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7CF7C1A1968;
	Wed,  2 Sep 2026 22:11:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 505B95FF79;
	Wed,  2 Sep 2026 22:11:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7967911C795A7;
	Thu,  3 Sep 2026 00:11:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788387078; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N+wNISRASKus7EeITpAzZHyULz1hHFn78L5mI9WzJ9I=;
	b=dKe+1stf4DB9ogbWn9reCw4yUKkDUK+z3yCMbVNKvheTccSpYtiRt4lOXabhq41yXb2OEU
	DJ6bh9oqMa9zyY+l1oHBySkfKZWhD/A6Gz/og1CMJySSsH8p4C+ZkaTz7IlYmwXf7T32os
	tmlV22yoVnAu0iYvbcvcnQo9UDsUCCDof5rVCtoLHvVqBdpGkSWhX9Xu5unJzpxT4078VV
	9GJ/J9qF27OQBahPKgg/FdapmePbwJ0IzAih7PDrZQGluutuca97OK3aDLg0N24ywmT9Ls
	H3niBtvbzSFsUT3p3sP+ZBTyXWgwgd1Vo4O1EuphEeLCk2NmbA0eMkfC/2ejbg==
From: Diogo Ivo <diogo.ivo@bootlin.com>
Date: Thu, 03 Sep 2026 00:11:01 +0200
Subject: [PATCH 2/2] arm64: tegra: smaug: Add rt5677 mclk input
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-rt5677-mclk-v1-2-b71a5a3533f9@bootlin.com>
References: <20260903-rt5677-mclk-v1-0-b71a5a3533f9@bootlin.com>
In-Reply-To: <20260903-rt5677-mclk-v1-0-b71a5a3533f9@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=diogo.ivo@bootlin.com;
 h=from:subject:message-id; bh=5CV17x68rtlPkq6ZOLLQ2oWAaWfwZ0cf6Jr9bZAt6JA=;
 b=owEBbQKS/ZANAwAKAQa+fFtWXslFAcsmYgBqmJ756TvhtkuKceZ3EDPwNE+GjLMbOIIJ2AOs3
 yyNs5Im6NaJAjMEAAEKAB0WIQTma35o1i1081e8B2UGvnxbVl7JRQUCapie+QAKCRAGvnxbVl7J
 Rbr7D/4o5XeAmFBaMR5GT8/HQBmz16Wi3Tls0xQnSW0jtYKWfKjZbRXcaIAh0ngjqZJSWltfuiw
 tPyZkB7WQCnWheQOOXVcYG6Bg3vBDV80xAd/gd/E9vYcY36n4JdQ1UDaAlc149VwnBPiKq0HN6G
 dfP5r5Pj7KIjdo6974hvrwqtE4/v6JAOwJ5nK36E6UqvRCEk3I2ttRNfbHqgjYMdRP1KIxlslJX
 8+aKoCIb5Io7BzmCETgWkQE4PpyEg5wouspIvjfF8NnrwtF9npfCqauUNy4/nm3wCNkYVDAP8hJ
 x6BnPIkjQp8FyISuihf2zXm3O2naCrQ5lax5fz/c7ZvIcYIkencua0u2/LSiGpvmQCgizUT9jUH
 +5p2AG9J8Vx3IZhmeP+U2Bv1+msW2BPGWo1s98gSdwH6PwT1DK5vWSjn6xzXKO3zYLl+K5kJReb
 EfQ4TCPvgujCCZqx9jJO8cL6Lhss9tzWiFaT8e6bgY/BJlFLW5bIiTiMb/2ZBq1QhWCHVI3V6ks
 Ub8vQGVIusGuNsB3A4qqsVb4Vn0DGSJJ90QvtrqRdEFSoDpgj6NZ/ZIDfhOM1PwBFxkLKGX5tJw
 l9j//tXfhChj7gsd6GZYE/Uwkh/EcD7NtNEF5W8e6XRINraazMJAQCJnqziqxQsrETAg/SJXcpa
 zhWDeY6siqlXuYA==
X-Developer-Key: i=diogo.ivo@bootlin.com; a=openpgp;
 fpr=E66B7E68D62D74F357BC076506BE7C5B565EC945
X-Last-TLS-Session-Version: TLSv1.3

The mclk input of the RT5677 codec is connected to an SoC-provided
clock signal on Smaug. Add the clock definition to its node.

Signed-off-by: Diogo Ivo <diogo.ivo@bootlin.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index e0fde65a552b..5513319d3198 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1754,6 +1754,8 @@ audio-codec@2d {
 			realtek,reset-gpio = <&gpio TEGRA_GPIO(BB, 3) GPIO_ACTIVE_LOW>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
 			status = "okay";
 		};
 

-- 
2.55.0

