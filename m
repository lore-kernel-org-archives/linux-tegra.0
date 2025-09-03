Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F24C2C18A;
	Wed,  3 Sep 2025 19:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756927823; cv=none; b=P3Xhpawf7G00K8cPqIweQEJ5UghK/zhPW9rs+zZnCn3anvjex0X1KfigsdnDRu3EeVt0J0Bs2uZq6oEo9LAq9cq8R1yPoVKp6etuQOIKfbwO5gEv40kdq3fpM2X2EwBBQmT/p5tQClZuf11VGJBnnZeLXgQq6YDVOV9tb3R9G84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756927823; c=relaxed/simple;
	bh=azJJidwQGmkU3EAnsYHzQNhECcLwkhnufXPLFd5EkoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ick90VhaOMumoK1l5IUyqAmxtuoa2I7YKWjsArr2JEcZ45TQYAFMyx6io9tH8/NswMxOLA9QHpjYxwzq8Q+BADyFEbCjaSYkfmxaOCukWjl6Bku9ZnjWO3NsRM+fb2xp4crj89EG2pg2PE/Rr0X77ebx+MClQ67F20YxiaNUE6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6NoLQU2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6NoLQU2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3D6CC4CEF7;
	Wed,  3 Sep 2025 19:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756927823;
	bh=azJJidwQGmkU3EAnsYHzQNhECcLwkhnufXPLFd5EkoY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y6NoLQU2vUF/wN07UHbDfQMC0h2gpNr+ap0txcRycyL4VYOi+P6N6BKQ9kUX+Yu/P
	 99R4iD+oNRe5+EcYxJSc7OykW3H1dMV2sR8OFbTU2sM2r1P89Xd1KAqrQiP4HzSu7R
	 ogxRPn5TzXKxjsUoM0+adFqjf4++mBa93avbjbneabjlIQ0jX91U6pFl9L+2Geuse5
	 6gu9tZ+h0d7P33yQx9MZrCGHz8/AeOiTNLF4rNqn+S3xUyWleQvg40iMoTNolfTROn
	 A2CATq0Y6O/faq7pWhMeHXPfXMocfLs4uhcRUK8mhIoJFjnW25d3p5boEESpnSz6fn
	 D5/kJhsgZm71A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE948CA1009;
	Wed,  3 Sep 2025 19:30:22 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 03 Sep 2025 14:30:16 -0500
Subject: [PATCH v2 1/4] dt-bindings: clock: tegra124-dfll: Add property to
 limit frequency
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-tegra210-speedo-v2-1-89e6f86b8942@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756927822; l=1194;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=axF8VoKW1z4zF0BEmMzp42sD9+64WYeJh7/vhD2MdRk=;
 b=GFrHH9RpV8qd9w+3EfHF0coPiEC42v2Wpr+Ti33KTvOfyXPFojo6VwAuDz5QqhZ61O3hrwYom
 eSIF1u9ke9TAUtRBS6TbBOmUErspN5p7rIUcnz3VDv7vTTIPoIwYyNc
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The dfll driver generates opp tables based on internal CVB tables
instead of using dt opp tables. Some devices such as the Jetson Nano
require limiting the max frequency even further than the corresponding
CVB table allows in order to maintain thermal limits.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
index f7d347385b5775ddd702ecbb9821acfc9d4b9ff2..8a049b684f962f2b06209a47866711b92c15c085 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
@@ -70,6 +70,9 @@ Required properties for PWM mode:
   - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled.
   - dvfs_pwm_disable: I/O pad configuration when PWM control is disabled.
 
+Optional properties for limiting frequency:
+- nvidia,dfll-max-freq: Maximum scaling frequency in hertz.
+
 Example for I2C:
 
 clock@70110000 {

-- 
2.50.1


