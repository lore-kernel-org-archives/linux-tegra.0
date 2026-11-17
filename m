Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915204;
	b=3h9A/fayzPBJWcLTJYSgwb3md25S/Jjlj98FNEBp1M5ntBLDEQTlYlUpkqbEbdJPOGZI
	 sDMf4ysGoA7A0GcLtQBFmxc9fJM983tiKkMctGaGIMMZdsXu0mOnm8YrTeF0+FgnX4kDc
	 /wblS8t7UjShwSiHrr2GqeZJNhvMt32OkcHii9CNayX7N79VTPZO2Q89XOG7/1DQKEiRP
	 pzIKVaXRofxXZ2qSRPyodAHEvjUzLqkSzulz4rVDjdnidvKl952m5r5DtUYjVVCJjlwAz
	 GUx+X7qQgtDONhLeVp+O0ykQM0Frv4UHZNWanJ7ScghjMjnla/eaBH0SBvMf7Kydnzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915204;
	h=Received:From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=nazGYBZ6aUtBFfLrnsb8qKguiidZW3WmEeyb8xa30T4=;
	b=mhVSeTsqUQtwmtPFGredFMkBhwMe2hYp9vFPzQ+xjhzufs7bH1ofhnq8m1y7CDLfXgJ5
	 tclnLbRggJU0Z/X80Z0FI55Z+UdauMrXbFhDoLcFa0VxF7kcIyAYLgivGf2X6wYkeS4pl
	 iwkdLKmb1ZZNz9D3G6FHQaLX8Z4+LB1aGWCoJUglIsxfa0AJ0hQinE2y11qwHlRBway7k
	 QlwCJcd+m4RPABmtwhgPNYJz5zf1nzuxHC1O8dMHi5hpK0I7G/ApEYHxY4xItfQNKiSkj
	 bnxiYOUrAXD+B7GQwGHlcdgaXkeTeTCpdNOOIO7htoVCDHgfJ365w1i0yvswGZcVyFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A62B606A31C;
	Tue, 17 Nov 2026 11:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3091F000C4;
	Tue, 17 Nov 2026 11:33:23 +0000 (UTC)
From: Thierry Reding <treding@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jon Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261106-tegra-for-7-3-fixes-v1-0-e62053cbda3e@nvidia.com>
References: <20261106-tegra-for-7-3-fixes-v1-0-e62053cbda3e@nvidia.com>
Subject: Re: [PATCH 0/3] arm64: tegra: Fix missing regulator for Jetson AGX
 Thor
Message-Id: <179491519712.28851.3143452577729436181.b4-ty@b4>
Date: Tue, 17 Nov 2026 12:33:17 +0100
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=930; i=treding@nvidia.com;
 h=from:subject:message-id; bh=SC0M39FMoPNdeIaUGCJ//l8xoZCg6Kv50/xKH/G/wjA=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBq/DuBOcNp+sQA5uNVK6yLiI8jZgq1FlViYIH1m
 FM2wPi05i+JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCavw7gQAKCRDdI6zXfz6z
 ofFaD/98o6w/Nh3waZbZhw0Iazv3OhXhnlfg3rudBrkBdwcqjOuukKMzhZOqtcNFKa1f3Kx8dTW
 eOPFzUTdLUXARCDhE9KD3/kKAvOMqi/aQMInOOZIip+LS9YRBNTBsJUbtqDGX9A3tsoZ+B3//CW
 oNgOrFZIdv0pZfJpaf2mTKCxPUtv5ZY3GPBI2Y+U+jO83/f9BYH/6caDRgdl6fbOkqNuPtHrJDH
 8Z3y//NNbzUb7WNGsFGmqfxl6MRIoujaVt9U1yrRxlFsxR0Fm3dzzw5ofzjyjEaGK2QLRqOV0AW
 15K0Alup5BLp8oyr9H7uZ/AIfG/iTzaYZsdOjsXASp9mBwgSItHmuKAQC4LDJ3haFIY4jos9AHT
 pKCZvPOV3Dly72QGl/N1E6SImSw7hkyZhuuAuDEjQzsRbDEuvLeaO0KbroBHls4YclVtTms4NGb
 Ssz60wmKKDjk995RiLvn9lEtE5eCAemUOToJYOOU8S2pADIUdrGqz1sHsEpsPRShaasXLlBpity
 uCQsqIKR63K60mQdzR6DrrPihk0VcPn0sVWg4bqSguOV8gEBFuWmxaCfNLHce1mqLzpMwLZnPgP
 MtoIgc/3fpcqtZioxfXZWkQxSU7mupUdhnZAAvr6ItpkeXugiV1EtNgDbZnvgQnkOkAE0+wUw/j
 qYUdaXoHXyTOaWA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1


On Fri, 06 Nov 2026 12:02:57 +0000, Jon Hunter wrote:
> arm64: tegra: Fix missing regulator for Jetson AGX Thor
> 
> This series add some missing regulators for the Jetson AGX Thor board in
> order to fix the following warnings:
> 
>  WARNING KERN at24 1-0050: supply vcc not found, using dummy regulator
>  WARNING KERN lm90 5-004c: supply vcc not found, using dummy regulator
>  WARNING KERN at24 1-0056: supply vcc not found, using dummy regulator
> 
> [...]

Applied, thanks!

[1/3] arm64: tegra: Add regulator for Jetson AGX Thor thermal sensor
      commit: 168fca2ee5e60e649b3d476e451f7833633a1455
[2/3] arm64: tegra: Add regulator for Jetson AGX Thor system EEPROM
      commit: 17c5a5ee525da79ab1ca0a5b92190a0587604643
[3/3] arm64: tegra: Add regulator for Jetson AGX Thor module EEPROM
      commit: f87ba646efb4afd159a418c43b0d95062eaae1f5

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

