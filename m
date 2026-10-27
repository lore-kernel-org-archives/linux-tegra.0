Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124344;
	b=kfa9I8zooN0KYmjX4rxagVsObAYQ3XKneDVKUgb+pDJAMBTb2NglXONzfKLJNfQv2+ED
	 6Gv8hM6fN6cVu441OOcy2Aj9lheLkQ4trrni3qpYjQDpaGRmkMmdTCz4lkyj3RCbd+Q3H
	 ypKvj6xzl6JOl0B2zsWQ17BNrTEjOKIQj1sr6OHLVQoww1kW/Pychffl0hCtcN0mbXoWb
	 C2vL7K5FBZpH1BdATJxTcm0KnhYRrkHExUQy91oI7DcigYtHT3d6YLewLwJQTT7SPLyaG
	 UhrY/y5ZilhFCig+XC/XM/qxpnQbtB1HcRu0/+IZUOj2K3S4A4WHgm70TuQtJ/YL1+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124344;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=i0tnwiO+GQNaW17fX1x64Rh6YsbFIHXj/CKsD5e43DY=;
	b=2UDZk+sg+VxBDs9ffI7C3FoAQA5ded909Kg5UKFd80P4rPM9DoDJNbkzAth3KmdFLRcv
	 EvOAUClHbIgw7HrR6Db6Mifu7a51yYe1rbrTT9jgLSjpwhq+ZjYoUOXjsXmplSke9r45i
	 pCIxCDgzwnMnTCQIt9BOWb3oTWeAYWfJyX51qJxVqLGg9evsxRWNo1NRQ6GJfw76nLqvK
	 zI6Jk67YVH7NxqeiFrh1IIAqNuCVbDBtuYioBAtZOwia1X0ccizYF0DqAs1/qN45gpblF
	 7HiDsdVorMIkgkDP+Rx0GgJkDLKj45ZA0IZEXB0ZXLWRX/OvZBCwHPD4u/8IrVxlH8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AOWMK3sV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBB3606A31A;
	Tue, 27 Oct 2026 18:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AOWMK3sV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592371F01825;
	Tue, 27 Oct 2026 18:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793124343;
	bh=i0tnwiO+GQNaW17fX1x64Rh6YsbFIHXj/CKsD5e43DY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=AOWMK3sV6hF0pGmg1ePKyIDjZh0QSE6PED/lDfI+XEm+45eSBd8gRxlYuccr4XoSk
	 DsXhbSOf0vU1/Yl/gbyxLUAO7/a6OVpY5ilt5S50nScACnPo0AkX8rwFbTCk/i0k55
	 0vXmc+0syJkVnMDrOffHyE/e1jC7HzdeA8cpjbE1v0+FaHWZP+MJWH2ZlJLOPK1hjZ
	 1USvdW+WAw8kw3GwneS/5lenfxkbl/zzoRf9s6lPI9FHnjMQR3c5sLsWM2eFLmXhaX
	 3Xh4PKIdfWrXcwRdfSKREebfqnX6xJace4o2XP7StFAMPPXrM26FeXjooS2GWKTIZ/
	 krHeovlcr96tA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 88DC91FB1FC1;
	Tue, 27 Oct 2026 18:05:40 +0000 (GMT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 5/7] ASoC: dt-bindings: wlf,wm8994: Update
 #sound-dai-cells property
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
 Leon Romanovsky <leon@kernel.org>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20261027120019.93611-6-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
 <20261027120019.93611-6-clamor95@gmail.com>
Date: Tue, 27 Oct 2026 18:05:39 +0000
Message-Id: <179312433904.199157.3178610408209114840.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=272; i=broonie@kernel.org;
 h=from:subject:message-id; bh=S2eog+AWujSGXkRWTD/+OiRbfMsQZpGHImsHPgHFqvo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIePP/S8UhZZd+WRQmrmAISWrY+3bFMdUNnav7ZpAtpq
 ss9nebN6ihlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEXFIY/qfwvYye3TApu3JG
 xPQdzo+vFD/qu8I/8eK3399Kzn/zNzrN8Ffoid6S2aKiBsuLrra6fGJQzI5j+9K8smeOkqD2aRX
 /An4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The Wolfson Microelectronics WM8994 codec provides three DAI cells.

>    '#sound-dai-cells':
> -    const: 0
> +    const: 1

We have existing Exynos users which are validated with 0, this will break
validation for them.

-- 
Mark Brown <broonie@kernel.org>
