Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919589;
	b=zeCUc5iynQO8MN3fRLnfTosbQ2Vd99UECkms876Vt09YVDmfQIz11pZwQunGvQ0W63P2
	 wGUsqW5u3Qni3a916on2e/Gg534vnccDxwPt8xxfeNzb8ndOcYPoiKWcWxCMZEnUO9ZY8
	 cuYIKKW+pXW4GA8V9cvA9Er3xF0+cJGNAbjo0PiTzCAAEdBkoYguIvNlzkmmvDS+31Tj1
	 g2VjO7ykWV8vhI/55U2zPpmjY4C9LnCO/u5J3jxk5Yz6s6K1Zj/Qq+vmLctyxDI+7E+J8
	 lNbO5yEj8YtCQwJj2JFrUwrGhIinaRHR84GGGh2/boL8HSV+gITc8KzWlKUU20M1EFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919589;
	h=Received:From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1TsdOwup66Sk6NxUR4HcjkhoK1g+FBTKhCtwSbf6eaQ=;
	b=btFTuzqJB2RkXzYoLJOE7Bz6NRlNCMXDdGSWh0MYgYy0n92lJyJCkVdAEuGhZmz03xwk
	 QlIwV7MEBfMPOR8wdeDRcc+ZrR3bdjALFctwxD0/55pDerEv8Ol/u9LpDtIUzmp0fCpYS
	 8gVoCmCPaemleLBgg8FX5Dq4NTgXLxhgOfp0OHZe43LG/IYns82XXrbGDcXqJSDgS5Unh
	 eYiw2DZoLQzmnAPrNznUhFJxGoyqFSjON9dkql7J3owmEZk2d/bDjpKiy1J5aH3HgdhTA
	 RGUB98Na9pdHiSyrZkmkymfmLRQ7+OOlQpdQ4g7OjjfHv/vqEAtrH2ESX/JaKt6bh3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D49606A329
	for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 12:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F3F1F000C6;
	Tue, 17 Nov 2026 12:46:28 +0000 (UTC)
From: Thierry Reding <treding@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: Antti Miettinen <amiettinen@nvidia.com>, linux-tegra@vger.kernel.org
In-Reply-To: <20261030-b4-tegra186-ethernet-defconfig-v1-1-ea6e62086ff8@nvidia.com>
References: <20261030-b4-tegra186-ethernet-defconfig-v1-1-ea6e62086ff8@nvidia.com>
Subject: Re: [PATCH] arm64: defconfig: Enable DWMAC_DWC_QOS_ETH as module
Message-Id: <179491958246.1887007.12756970940219921860.b4-ty@b4>
Date: Tue, 17 Nov 2026 13:46:22 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=313; i=treding@nvidia.com;
 h=from:subject:message-id; bh=aVsEyQO7BccuHTw7uBpnUCjqE19XU9nXD0W++kOasyE=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBq/EyiSfluTzoc0SONf1ECqTx9E+IdjCrywjc2C
 SYprZ823UOJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCavxMogAKCRDdI6zXfz6z
 ochMD/kB9l3lA4P5eJ2ZpuRENUC4Ih7Xv4h97VJSl3J++KzGk/90uySatT1H47XMG03Zvh5cSIg
 mhuhZVJf4mYkfSPP0brDT4EPcBvCfke+Xs7m6XELwWfXTY2970C5hRPg6glyDMoar0EzbkAaK9p
 y54c7FfVCe2zsNb+FeEzVVexeqsk3jLnQ5mgvhBFqUp3QZed0TUdM1ZQy0r3ZUa4QXnnuas2QyD
 U8zQ/FKw2MO9rrYPt66n2EOf0yhcw2LvnWNAk2FFwAaIZzycgbTJN3mzQmTolo1vzw5VRYOlvlJ
 oKXd8isbgzwEwq8xvL3ZVYoXvVLrxahkPBdt9KJ0FEUqCkLZ8NYD4HUzC/oq4mVGGbTbZ24oNVN
 0hADBOms6iL/RK5EUxaCkH+hApMOC1+2fjzWDvf/Hdrrw7QGhrrNr5qFKMfRlAWmY6kr8wIE3pc
 NbEkMbtGCcQjxMRRZFJN7npri5waieDRTgMaD4y45nI380BFlcSbFC/qzhMHXD3VJH4dbwvPC5D
 wznrGBztppngkml74MfAnnuJSCMw5ArKO4f09NbakeeokXPcaPXwDzANfZnRePMAYqAmI1MFJKB
 peXa7xQ+ehAbvkp6/P3t9mhq+//vLxuel8Y37G/eUbP0HRcBD5A43H/N2z0htgUXV40ZIt4IfOl
 Nt53eQdMHsLb95Q==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1


On Fri, 30 Oct 2026 16:02:29 +0900, Mikko Perttunen wrote:
> arm64: defconfig: Enable DWMAC_DWC_QOS_ETH as module

Applied, thanks!

[1/1] arm64: defconfig: Enable DWMAC_DWC_QOS_ETH as module
      commit: a2101b64218a2c7b17f6bdf79e2e23730e5a1244

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

