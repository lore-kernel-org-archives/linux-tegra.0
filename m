Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00B61A269;
	Fri, 19 Jul 2024 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721375318; cv=none; b=mtsn4uwjwty/zaHn/U/MaUrvAaEKPy32VVX7nU5LMh8ZCqgt+SbgUZYsEnB1N5UwovQzLonIDdwTK5EgUWic8fFz0wWGxicWJMzcMuX8uUvzUoNXTCSvVq/9pUY0z0X0RfHSU4s5M0l9Gj4t2vP8bTba1YagJAE3oh0ur2N2dRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721375318; c=relaxed/simple;
	bh=DuBeB9Jo4XDCLdekAEbGjpBDINlXuEmgBBn9z0DQtkc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yn6gIC1hUhPppRnZw8m68oLM/PLVW1qSJuHRG69Utovkogcaa0PvBe2sIV37zWNePt3gzDwz2BSMrSXsxHSN8GQdLtCUj0hso0NDigTZPV52rG5vQu8nWgRfFZJ06c+o2RPgTJw9xBs35j0WkOg+uxK4uu+rjNhyTyvYCzW+ET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uiip+ivV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uiip+ivV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EBCC32782;
	Fri, 19 Jul 2024 07:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721375317;
	bh=DuBeB9Jo4XDCLdekAEbGjpBDINlXuEmgBBn9z0DQtkc=;
	h=From:To:Cc:Subject:Date:From;
	b=Uiip+ivV+oT5r8mssop0C70ck395gOwZWGDRVxM4o7BJM9EiAEYtvcmLW1xlHwwTO
	 aqDMF/YIr1mcuZ3RxoBtGEcrIvF+I0/lGZrq3NanBn08GZbwJjvh2bMwTzCsbb02KJ
	 T5OvE9NKQEq2GfFYRVgZyl19If//8JijYJHaEBUf8XVlr4q5zYX1BO+cBY959uynac
	 Gq+SnY/+W0L8cFwcKefLSG3IClZzVmLfNYufbJVrNSbOc2bgje8UkL7txduetj4C1f
	 gaDt21ckcm0r4FuSdBBbNpbXexpxM36/O+lRWBJQR0A9RKtMwjbjMPDV99RN4Kqi5K
	 zVLoplzCB7Bcg==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Mohan Kumar <mkumard@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tegra: select CONFIG_SND_SIMPLE_CARD_UTILS
Date: Fri, 19 Jul 2024 09:48:03 +0200
Message-Id: <20240719074831.3253995-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This I2S client driver now uses functions exported from a helper module
but fails to link when the helper is disabled:

ERROR: modpost: "simple_util_parse_convert" [sound/soc/tegra/snd-soc-tegra210-i2s.ko] undefined!
ERROR: modpost: "simple_util_get_sample_fmt" [sound/soc/tegra/snd-soc-tegra210-i2s.ko] undefined!

Add a Kconfig select line to ensure it's always turned on here.

Fixes: 2502f8dd8c30 ("ASoC: tegra: I2S client convert formats handling")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 74effc57a7a0..2463c22e9cf6 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -78,6 +78,7 @@ config SND_SOC_TEGRA210_DMIC
 
 config SND_SOC_TEGRA210_I2S
 	tristate "Tegra210 I2S module"
+	select SND_SIMPLE_CARD_UTILS
 	help
 	  Config to enable the Inter-IC Sound (I2S) Controller which
 	  implements full-duplex and bidirectional and single direction
-- 
2.39.2

