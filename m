Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C84AFBF0;
	Sat, 16 Aug 2025 05:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755323659; cv=none; b=TeGvolFndQpodp/UBaM4Rj+ujQLAAq6fCyCf3a5r08an5fP1aXZIU2VDVh7P06sDHkLSi6TslW3CftUmcO0f2YhzC4/qv40LVpQfIdKNOaeb7guni9efbUHgWZzE32Ydlizp2+NdhdrIG/rP3p4D9KtkYc4wdUG1klJxhsx2Peg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755323659; c=relaxed/simple;
	bh=cOotQfb3hXrw4Cc4Ozk3KZs+QDC0iDdLyslVoGta5QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuWYlBaEvuTCtx0Ht8MU8562P2a5vg/zKXAyJyN14E8t0BlmJpvz/He8l0RHnVCY8BPujaHRJ4rSfdOqt4RK0TfroNDM44r+XRTe/AoIRS6kffOfSFfo4hCc6/QcXEJgYrFmV2H1Nq3jaxkk+BBiJv+sW+ergpguCXLWGRNCoKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evScQ224; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evScQ224"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C25DC4CEF5;
	Sat, 16 Aug 2025 05:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755323659;
	bh=cOotQfb3hXrw4Cc4Ozk3KZs+QDC0iDdLyslVoGta5QQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=evScQ2246WRm+K6XcJD7i8B6eT/naoG2Fr7u7kYeiquxX5KLsK5q9cbnxIvNaVi1d
	 E9EXOwKEsjaxrIblZHRx9o5jcqNGZNaO7goupJwfXSMP5FFrhfckeykqndcFMKdPHZ
	 ROLeBh//6NnPXrji7ZoSu/kXl6e08IAWBC/Ce9z2FpaiMyWR7thikpyN3R0Qvh5x+M
	 V+IgTY6UoiOC6lINfsu/DQjvpstdd7G8cSh9gkqxSpIep3jdL6S9qDBSldFP0QTXqe
	 CMhc4e68jF9j5ivlPvPwFAQG1AmpwbMgzXTd+y3mrD+q8XjqDjfIPQR3hnfVTIkgDQ
	 eJ7RviHAUZXrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C86CA0EE6;
	Sat, 16 Aug 2025 05:54:18 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 16 Aug 2025 00:53:33 -0500
Subject: [PATCH 1/5] dt-bindings: clock: tegra124-dfll: Add property to
 limit frequency
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-tegra210-speedo-v1-1-a981360adc27@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755323658; l=1074;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=i008IfPSaYeZDCxQCAJ7fiLJ8vYgRkhMPyZzDoavqYE=;
 b=RsGAR4X/ZLdBD17nQiWJrjizisf+BJBjuFoEXnTzahSr2JDZ4hFiMsowb5/xLuAlDn6sOrX9X
 gmronvaJJWgAovoTwAAj/SWd+3XthQrlMvT1oUzBKVEHfVcnNjjYmMI
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Some devices report a cpu speedo value that corresponds to a table that
scales beyond the chips capability. This allows devices to set a lower
limit.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
index f7d347385b5775ddd702ecbb9821acfc9d4b9ff2..6cdbabc1f036a767bdc8e5df64eeff34171a3b85 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
@@ -70,6 +70,9 @@ Required properties for PWM mode:
   - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled.
   - dvfs_pwm_disable: I/O pad configuration when PWM control is disabled.
 
+Optional properties for limiting frequency:
+- nvidia,dfll-max-freq: Maximum scaling frequency.
+
 Example for I2C:
 
 clock@70110000 {

-- 
2.50.1


