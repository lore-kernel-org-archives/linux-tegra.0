Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6BA31AABF;
	Tue,  4 Aug 2026 06:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785823949; cv=none; b=sYKS1QTFYiAsyVyALrPcqrqObV5W8Ocqw6bFuipwbGEZ4Udbe1ZmC+vLZBndIjTSCxUJY71mrEqHuty1E1LWuuErhwu9cpS4onAC6yim5cgFyoWkYxLtEjGx8zv18Myg7OuO/lNlSa4iKWk+i1y80CN0+T1LRht5pFyv6QK4JyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785823949; c=relaxed/simple;
	bh=fxrJqoZbgyPw80HOCkjkwYRZlBAfEeeKPHm+sFOQdGE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YUTpGdT8t+npQyWqTz9G67hKnmMkej9UtQbO2DX0JhcLM17cO2SYytutJmU6D8gNwAqr7z1i7WKmIpL5+n0ogzpEoZDP2bU7NKmdBdZ4Td6sXfL4znJSV5jcNgayvVHgNdeA3c8wmK2s1ENZyNSThyqJDH/YjgsaaeUNsmGhLJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxPZb2tt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxPZb2tt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CA51F00A3A;
	Tue,  4 Aug 2026 06:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785823947;
	bh=NDNd9DzFETq7zh1CKdTiu36YsT+TypRRNBpZkxjqnXQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=nxPZb2ttW+AtHuTh7EaCmi5Q1aeKAz7A4kjEhHSkoXevYZkAJ1SwjC79NVj79bEWa
	 fCd21l42uHO1pst7NbEAeF3Y47viGm/7wJm2Hny5OjTrt/v8oor0eOWP1ZGoDEMWev
	 5gmXjhJA9orub5sQh/q266YYqEPxOPCNxmytLj8jtQRCPKIJo023NOmjJFZRuPFnGn
	 awRZA3lc/vHJqEsMODDZsvDBRxytIIbB0zgSFOTCP3WGyKh2Zq8KjWhI+e7NFH/M0k
	 gNWvASJsRldMDEYc4OIZCd63jzX85LRnYjia+qYpa2V3ax81eHV+IZyrFXdp8MVbhM
	 K/JtRdeQ35Ahw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Hauke Mehrtens <hauke@hauke-m.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Dinh Nguyen <dinguyen@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org, 
 asahi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801210210.383417-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210210.383417-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 2/2] arm64: dts: Correct white-space style
Message-Id: <178582393779.12985.8100593791487064400.b4-ty@b4>
Date: Tue, 04 Aug 2026 08:12:17 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 01 Aug 2026 23:02:12 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

Applied, thanks!

[2/2] arm64: dts: Correct white-space style
      https://git.kernel.org/krzk/linux-dt/c/7c78d6fa9aec67a72a498cda5cdbaced890cb038

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

