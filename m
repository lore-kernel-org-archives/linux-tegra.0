Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B0F4CA298;
	Mon, 28 Sep 2026 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612697; cv=none; b=OJrtzEMXD/wwiYCdp3m/JzHwbCqPOIaFBgdBC6J3LbJ0vYlJgEJJTG32tNKWEOJOZNERyMfZXeJhqVazO1MFvfzj+85ZwEDePvAY46svrpYxPfPsRNR76sEWND5KYh/Ly0j8n+BfvRZrj7rfrWXMm1vRfLYo6qvYyOYzGUx/wOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612697; c=relaxed/simple;
	bh=aQDx90mJLKVIwh+h8A6BZrGPl8spsVUKNwcTwFr7TTA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c+NT63o27mjrKNCX532wMEHPFCzL/5r+ht29fZFqTnnNStN5gtsA138+QG6D5q4QLxuGtA+uZ2sAECoDfMCxkJTcBrUhfgB2kZiCa6t92a7dyRC7qwY9cU7xrfz9TtDrA1V4mAiC8oESdFbYjZQmad5vqRTBEy3yUpTNQ5CRSMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQXPnD5i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQXPnD5i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EE61F000FF;
	Mon, 28 Sep 2026 16:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790612695;
	bh=o1GvfHwzsVyvgxWhVY79PcEk5xuAYNXBWK6IeNyk3sk=;
	h=From:Subject:Date:To:Cc;
	b=NQXPnD5iG9juK+8o0R8AQkHHDvA1Gty1YTrvdCZgmmwXFTxbEb525P61PBil+dNtI
	 cRBvu4kScYZsShw826g9RZtmvT7EdIOZ1Y9WCICbRe0QvdG5zMdKAp5rS1O2RszGmV
	 a3urASnLIhYPk+K2kC3wz/PkGihUAJkeH4Za4Dtdgomxp88xJaKUcfWQI/6p4HhmZ5
	 uiDsTNLTBMlNYe1yiAa+uXuqBZjC1VdjKy5IbMLKdYH879WdSrE7P/2m36iSmnj41L
	 X85Cqq9VisfZWnjai1lFlBqK58S9ddFEQBvWuPA4rDZ9SgV8MbSQsItdvPo4KjeoW6
	 IzmQC5TDKWGNw==
From: Thierry Reding <thierry.reding@kernel.org>
Subject: [PATCH 0/2] arm64: tegra: Fix DT validation issues for Tegra132
Date: Mon, 28 Sep 2026 18:24:39 +0200
Message-Id: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDVhxE9dRSy0BmNR0kEk4u6K5
 bd47wIhzyRQRxd4Olh4cQFpHIGdOjeS4j4YMMEi0VipTrISURl2PbtRFKG1ZZobrYccQrV6Gvj
 8jk37W3Yzk93eDdz3A/p24n9zAAAA
X-Change-ID: 20260928-as3722-bindings-e2cc715b99f5
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195; i=treding@nvidia.com;
 h=from:subject:message-id; bh=aQDx90mJLKVIwh+h8A6BZrGPl8spsVUKNwcTwFr7TTA=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqupTRtXihGpdOAA9J0/ZTQw+Q99WjON2SBr4Kq
 BQQqPNXAECJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCarqU0QAKCRDdI6zXfz6z
 oSajEACo2Grd8pqOu2VkVWpiiftCm8eqeylbBHN1IC4lmZFwAbYRCbT1/HQFBpqGoIfzH5KEqkx
 nZqQsoGeq2CELauJO1V6OP0cy/BBe+fpwE7mNebpdbDhXjiuBSXRC3iiXsxEhceZGFdjKTpkbrl
 U77NWJQxNW4X5pHZOOHqy779DGdTQEDdmoxuA8rekRu1zwrJ+b0cKxpowjOeaUD3bD00oSDmTYp
 mB7Q/cTgZIKHACt3lVXCm1m04wyhyLkP9bQbsVcT8wDZJTR3Ui+rdA5AIJwAVKzZqhNXX2lhk9u
 dpFHSGTWNsoiw0DFSVAkAQcjLo3Xj3Ed+0zopp4iX75600yf/q4xgHz1oIzKghSfgRrwi6UTOt4
 AVrcNwbN3murdnW7MDMqLM7bruwNcWs0xqocALNDkzYUdZDOI6cHfv9y85JRB3B0FH8obDg2XrJ
 pTQybpSNliTGB6aIx5J72txdYiAzTIFLKSiapQHvItFpys0K1zqaX8IcsuXX3lRAJtwGPXVIwUA
 1LIHSRdE9EIoi1GNZDBc6koM49eCYZAjkMQxgbiMk9LkMy5gh5DCWaIfZjuBVoQtDocJ9xukcxr
 rngtJl5rdCfNZcXHdcN51pc7U+3sSEaI02y5ruLCEjbKnkwn4OXZrVasHISSL4bGqn+gz0st43j
 Lp/mCUbN395hRhg==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

The following set of changes fix all remaining issues on Tegra132 Norrin
as well as some collaterals. The two json-schema conversions in this
series are shared with some 32-bit ARM platforms and they fix similar
issues there, too, and I've verified that no new issues are introduced.

This brings down the total number of DT validation issues for Tegra to
44 and 16 of them unique.

Thierry

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Thierry Reding (2):
      dt-bindings: mfd: as3722: Convert to json-schema
      dt-bindings: sound: tegra-ahub: Convert to json-schema

 .../devicetree/bindings/mfd/ams,as3722.yaml        | 276 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/as3722.txt   | 214 ----------------
 .../bindings/regulator/as3722-regulator.txt        |  91 -------
 .../bindings/sound/nvidia,tegra30-ahub.txt         |  88 -------
 .../bindings/sound/nvidia,tegra30-ahub.yaml        | 260 +++++++++++++++++++
 5 files changed, 536 insertions(+), 393 deletions(-)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260928-as3722-bindings-e2cc715b99f5

Best regards,
--  
Thierry Reding <treding@nvidia.com>

