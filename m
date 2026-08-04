Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86B36C9E5;
	Tue,  4 Aug 2026 06:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785823938; cv=none; b=uk9EnIq+/ZN28FU2bdBv83dY76jK4dG+VuEhFAXsJ/ae/a4dSu2kdSJC+CCQMF1EX33ZLH/c9GEbXh5KHv9K4d5/1nPOxOmgnmtnYKkUi1ltwpfCmhJFt74DzSuUgBH1eAdKCb167nMfoMUFQ/to4BYpV34+/1acB6bdnscsiBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785823938; c=relaxed/simple;
	bh=EeuU/0LDHEDMUg6q/rzNb7sq3OgPc8YtHuih2b6Ygec=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dbnBL5sPa03iMdoN9IAoF1/st0fRNu40xywyV3Gv93MNpn7qKv54dQHmmdpT3a8X+9Eo2pPE8CKGZ7RAxvRY38AaQ3FNC10zpK8Xb7fT1tbiwraCfo0DlvKuXnlpL1DmjeE8a1atzqfNIXnRWow07OIsJpxvaidf/3zrJDK7nv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJsCxs8d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJsCxs8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5487F1F000E9;
	Tue,  4 Aug 2026 06:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785823937;
	bh=PKYseCVUwAsrRbAPoZQ6d4d90WKFCcuz+KWQSPJljBM=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=jJsCxs8dQHMV4VZQ8X3uIxwKM22zfav6Eh3dBkIPsBuhofxUa/GTB0aNqIi9VGlJN
	 vfhzcJX0T+0uZHaR0sR4Y3GXjzFmHy4wkxd3tCB/70KjJbKifuuYaC8NyHQ7iaPUHO
	 wccqNKHTXcsE2fl5UZa1L8hYHgX9XzWewAjrevp6+ihVv24SRnjadFMJm+jdPx7RzL
	 e62FqrI2krUrJHnia7WWri4gfBC3Kmi+tBYmzPud7zr6g+T3Y12bgUzwurhWbAo7w/
	 pzvD84R5B6llP3BlF2U1qpFUW4sRuRpj5efx8+4+OkJMNmCOKO8MSSk6MmLh13y49t
	 zHPCknuf0UC9A==
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
In-Reply-To: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/2] ARM: dts: Correct white-space style
Message-Id: <178582392607.12985.6150713140771675075.b4-ty@b4>
Date: Tue, 04 Aug 2026 08:12:06 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 01 Aug 2026 23:02:11 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

Applied, thanks!

[1/2] ARM: dts: Correct white-space style
      https://git.kernel.org/krzk/linux-dt/c/e2b3acf8c227beda488f00d06f1266f83b9b5c08

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

