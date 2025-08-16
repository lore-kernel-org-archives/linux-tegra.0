Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736131F4168;
	Sat, 16 Aug 2025 05:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755323659; cv=none; b=qO34zxekJsuNJEwB17ZanO4oT05ijtKhiOYBRC2/YKgHf4He1LYj9eJcZqM584G6uQhbH5M8CB3c6U5WRknkIf1ok9+XIlbG6WK0EQZl3THjc4HB0ixFbXG6nMQHxZ9zg7dcdx4QgcbfGmHdL8Qt+7Txtv4b7wZj2UPhle1v8KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755323659; c=relaxed/simple;
	bh=a3kdVSUIQtyMHNIPp2pI/HbOTfJTuX5FsLAVp+ykcJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=exL0TPAiq3OX1DnhXa6NoWPe0xthiwKhOpbRn2lE95/LDsFQcTJ0mF5zUEjRH/EBCYjP25F7iu86xZqDIPjA4qzUr1u4sDRU2clPxonMS5KgsiRO6Xuay5QT9nv4RmcpINmdl9nlw8lYLk5Iym3uzsFneslgA69J3fOOW99PDKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsSo7QHM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsSo7QHM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 324E7C4CEF8;
	Sat, 16 Aug 2025 05:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755323659;
	bh=a3kdVSUIQtyMHNIPp2pI/HbOTfJTuX5FsLAVp+ykcJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KsSo7QHML9fMQUtymVRVdXoZzUPhQe71lmX37b2YW4+AQQG9fixHChhJdAVUni6hP
	 7xatm+I5d+2lAZ/32MwiTj3WmbK21FA5V2USOyzFaJSVGYwhvUkRyy3UmYvO1KoUb6
	 iMgoj2IVkwYu4JpIGKaWzRIeFHfyUoEWKOqR3UWv7487xnpB0BaT2j/ZWtyqTT4JP7
	 WGhdN9+faTyt10M98pkhKLLsDEkooB7Nz5ycFZj/v3xZ/KWpZM7A2LJ4IMc6ypT9Cr
	 2ZxdU+Cl4WxfSv3gGIMgxmi5Wfbj10FzN7TmLqNjWqp71/znmlzYLG+ZSBllYljwDC
	 WTNcSnGknb1kg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256F7CA0EED;
	Sat, 16 Aug 2025 05:54:19 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 16 Aug 2025 00:53:36 -0500
Subject: [PATCH 4/5] clk: tegra: dfll: Support limiting max clock per
 device
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-tegra210-speedo-v1-4-a981360adc27@gmail.com>
References: <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
In-Reply-To: <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755323658; l=1449;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=F+yoRA15M31xbQIkPC6+4/poN2QJpx1PWxc/bXVO320=;
 b=sTV9RkNktfketMdtjuEkak8xkFZnoPszZGHh0v811QDSMTwmDGvJcopPKY1LzaYtIHzfBNHjB
 hRnt+C6cfP4AOceWHEFlJfKImaM+xDoRl0w16UCBz4iG2j9tBImXSRL
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Some devices like the Jetson Nano report a cpu speedo value that scales
past the capabilities of the cpu. This allows limiting the maximum
scaling to a lower value within the table.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 0251618b82c8321724ba0aec7a5bd90b2c2ffaf2..0c84f7e85baaa96fee005a1c9a5dd6afbd1875fa 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -556,6 +556,7 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
 	struct tegra_dfll_soc_data *soc;
 	const struct dfll_fcpu_data *fcpu_data;
 	struct rail_alignment align;
+	u32 max_freq;
 
 	fcpu_data = of_device_get_match_data(&pdev->dev);
 	if (!fcpu_data)
@@ -589,7 +590,12 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	soc->max_freq = fcpu_data->cpu_max_freq_table[speedo_id];
+	if (!of_property_read_u32(pdev->dev.of_node,
+				 "nvidia,dfll-max-freq",
+				 &max_freq))
+		soc->max_freq = max_freq;
+	else
+		soc->max_freq = fcpu_data->cpu_max_freq_table[speedo_id];
 
 	soc->cvb = tegra_cvb_add_opp_table(soc->dev, fcpu_data->cpu_cvb_tables,
 					   fcpu_data->cpu_cvb_tables_size,

-- 
2.50.1


