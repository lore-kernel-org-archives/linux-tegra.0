Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9167036934D;
	Wed,  3 Sep 2025 19:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756927823; cv=none; b=aCevNafDXlY2Q0xDg24LKsyC1vD9u9Xxw8ijAtNEkSZra5XEyDPwVcgfIK8f4PzEjTyYvN6VPCIIkkIIEZjtIebfFJxua6VEW+V1lZ7xzRMGODZPqR8QyHcfs64dWXKwU7xeeBQfHk1aZxKThRQ1d2WdvcGI0k0frsbRB1EEEcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756927823; c=relaxed/simple;
	bh=V+gmNqrKhR6NfZjS9fiiQNqd4Ol4603Rv3VdeTp6Zis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FrG+0Z9DxTao0Hjddk/fFRr1nrMHCejZ04fCmdDoewWayzpwbYDbJqVxN775qE5cAU5ctYcOZCz/m9CFYqtySiyfzxSR4142okQklg+CfYdPMq0yIas+b9g3WsHU5v7K3+sKmU4Tflrh+OIz4c8bfiaDTaN6tTbsoZon/sUXbQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZLDI3HI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZLDI3HI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12E7EC4CEF8;
	Wed,  3 Sep 2025 19:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756927823;
	bh=V+gmNqrKhR6NfZjS9fiiQNqd4Ol4603Rv3VdeTp6Zis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jZLDI3HIaEb1d+2Y171dtb8I54q6ehsEI4oT4H0jOm65/0dH0zkbCZSJdM7tBHYMg
	 T02jH9u3HzQ8hTs7l8b4Ji4sRvbR1B80QkdHmvmzoeI9Wu6wTnTehvF2Uwq1xPmoz/
	 fDFo8ZPSzGyMuocqlYtZ0WkvHesJRz/qT/T04V9rtjoEsgRRj4DXxuz5csizQfID/q
	 a8lsWBjwcO0/22fh2IMNtixa2NXJipzM6DOlTgOPwrgAV1Opm9DmfmTNk9myyDk/6f
	 hudpNT+PTglyKc4w3GyR6xKEHmSeuWxTPZnwustRVREkw5KG/DgM5KJmyMNSSx9aKc
	 m6/XjHqnyAH6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07579CA1012;
	Wed,  3 Sep 2025 19:30:23 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 03 Sep 2025 14:30:18 -0500
Subject: [PATCH v2 3/4] clk: tegra: dfll: Support limiting max clock per
 device
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-tegra210-speedo-v2-3-89e6f86b8942@gmail.com>
References: <20250903-tegra210-speedo-v2-0-89e6f86b8942@gmail.com>
In-Reply-To: <20250903-tegra210-speedo-v2-0-89e6f86b8942@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756927822; l=1454;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=HHRtvxWltZLOQ+/PSjEx/VXgJfA/2/uQ/lKhb4XDMgk=;
 b=AzsH+wmGolTg4V4dHGipf3kg2dmJoNVJ9qnBLjnDNA9iqyCI5SAu8/HjJ5D1MKfuU8+UVSvpK
 LZ1CiYib7u9CX6v8N7ZJkoB7HgYqdCYjUquMiONQIYIV0PGE3mLK8Vn
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Some devices like the Jetson Nano report a cpu speedo value that scales
past the thermal limits of the device. This allows limiting the maximum
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


