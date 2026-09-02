Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEC2361956;
	Wed,  2 Sep 2026 22:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387079; cv=none; b=GzuXbYbITx/1RYnhpTNPg0Qw7sziLNtf6jAS1fS3rZrSEss0RzfjKLaFEsxsfWyUq9W0BtRCjhREeGbbNJAOvFvQgGhus0w4EoTYey78ndY9UMK7t2Nq6sBnqrGtPnvETABc0rQpDc6sPif2F45MTkFWPg52fJAplcQKyAlYxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387079; c=relaxed/simple;
	bh=2BCi+8H7tOldvpl5P9c3Clp8KXuXIqmG6zaR5AU4Tsg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ipmPiZUGEVqz5E1mdL45UJEuHX3L2zdDexyZ13jHz5WBiG/I0pxaW3DyOyXimPKelIWW1bsU2QUKBQcALnjxidldlSexVkr4p6OfL7+JrMG6hwgYjvqTfZR/TkXlZqK1e1DSnukN0RAF+yqsoJ1W5IX3xIaDwaRiOeyDlagQMm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=s78pBNAe; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="s78pBNAe"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9DF5B1A1968;
	Wed,  2 Sep 2026 22:11:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 460C35FF79;
	Wed,  2 Sep 2026 22:11:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A605C11C795A7;
	Thu,  3 Sep 2026 00:11:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788387067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9siX0c7xFoa++FwwhKHlf7rbpRO0KpS94gkulii47YA=;
	b=s78pBNAejfZA/5s2uQGtAmK0eDSJBg9lwDy5uQQIwCWSK1dmrm53QIxJ9iZomM8s9xi7oW
	TjPwOxbS0mrpvrH++uLFPP5S9IzXvR5B2oi5yer+ONXHBMtqaM9xl93IG6Uq2qXC+rJUgB
	XsP79AvA5uI7wVtswefk2oC87mguJhTv7VkVG6JPZqqyfruw9XpZeYDvOGyDAQfXMH13Ky
	rFeX/0w+JAj8wtonb9/siFzsLgvyKaKfmqxroPrKAtgllbzoJVg4q6WBCC4StDC2pz24oC
	D3GfW1YMN82lSs2l4EV7OGbsyR7Vs8K/pB5acqJo4ZmXX0iqT7LD8P57hUUx7w==
From: Diogo Ivo <diogo.ivo@bootlin.com>
Subject: [PATCH 0/2] rt5677: add mclk to DT binding and define it for Smaug
Date: Thu, 03 Sep 2026 00:10:59 +0200
Message-Id: <20260903-rt5677-mclk-v1-0-b71a5a3533f9@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDUpRcNVxIJ2MP7TlkjE3RXLb
 /HeBRYNoYUiuMDgQZbWxSMKA1B9vXTISHtDzOOM51ww49JMSjaraWStqLVMdJMIjMAXm8GWzu9
 WVr/t3gyo3LuA+34A7ajhF28AAAA=
X-Change-ID: 20260903-rt5677-mclk-f3ad74db43e1
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=770; i=diogo.ivo@bootlin.com;
 h=from:subject:message-id; bh=2BCi+8H7tOldvpl5P9c3Clp8KXuXIqmG6zaR5AU4Tsg=;
 b=owEBbQKS/ZANAwAKAQa+fFtWXslFAcsmYgBqmJ75/JutjqkXQfEbkqWY/SgcnKaRCri+TWG8s
 EQ/oQXewWmJAjMEAAEKAB0WIQTma35o1i1081e8B2UGvnxbVl7JRQUCapie+QAKCRAGvnxbVl7J
 RT2rD/92yzgOEkf+ALaqM3aFx7ZCwmxandRlUso/g9meG0mi88vmTGJ5ZCNsu6RhZdd+qiZQUYI
 QFLWoql9nK3NhLU3EnIlxtUnxELQIiChPidwoWc716jHRUg0uHAvos96FHeohA+D0v/ILHcgcEU
 gdnSW1+03zT11Gmw2lfagr64esssVk3P5yS2sFgHTC0vss6I8Dy4+8CdIbob8jDoYWHkk2uvlsf
 fahoLmg79a5jG0L0hPIolvLvbzt9ggjtBFGGTHGvB0+fQXfRqig9bhP5tg7AnufKVc7pLfiSh0r
 +13YNAtnLGmvpeLftITBcUCpnVcDfqQcV4cf4tfD3pwMx0GF7cXCHLw0u1vVlxRgcgE59L+CHsl
 qMQM32DKeTvZfKsNehKQ7Lov911s5mvTA9uzliu7iQalgzmR+UF6HXcZVUwApJehoijYhI8G7i0
 99CkiolaR1IiBGmotUjZwUrqsU3Vu61ZaiK70WbO4ISAKun2hqAQY5PNPx6BfK3lRZ7D++ksmp2
 lyeSbdR1Xx6qOrBUZbou56pSEp4VL+C46vu1TMTGQl/Tvto2RRPhwSqqyr5gQhVBoNMW9+bAf4F
 e6rloQa4m/3qYgN/FwVteIYetmdiJdP9WCGeTEzsiR1e+MaONZ8ygl5ZqITjJP5pSEV+eMiUwnx
 3pL+rKF9jjkHNPQ==
X-Developer-Key: i=diogo.ivo@bootlin.com; a=openpgp;
 fpr=E66B7E68D62D74F357BC076506BE7C5B565EC945
X-Last-TLS-Session-Version: TLSv1.3

The RT5677 codec has an mclk input that can be fed by an externally
provided clock signal. This small series adds this to the existing
device tree binding and defines the clock that is connected to it
in the specific case of Smaug.

Signed-off-by: Diogo Ivo <diogo.ivo@bootlin.com>
---
Diogo Ivo (2):
      ASoC: dt-bindings: realtek,rt5677: Add clock property
      arm64: tegra: smaug: Add rt5677 mclk input

 Documentation/devicetree/bindings/sound/realtek,rt5677.yaml | 10 ++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts               |  2 ++
 2 files changed, 12 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260903-rt5677-mclk-f3ad74db43e1

Best regards,
--  
Diogo Ivo <diogo.ivo@bootlin.com>

