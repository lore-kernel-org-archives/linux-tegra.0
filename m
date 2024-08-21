Received: from terefe.re (terefe.re [5.255.96.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1F316E873;
	Wed, 21 Aug 2024 19:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.255.96.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724267186; cv=none; b=hOlPISgysyego6H811ptQGNJFIDXFEGzZtQhDqwjpYy3XaSch0W7yDd4PddPTnYWTVRI1FLCJSLifh+dXevHvvcPFdauHhMjBmjsZh2yl4GFJ3j686mD5vWMoK2uY4pL4q5ZNHq1OcJyHGnKrVPJ4nEGzV4m+e8D55wsgkDdhSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724267186; c=relaxed/simple;
	bh=34MFcCZ3blJSkVZnKx7zZ191kBMyF8eFb6URIOqpTvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GYjHaAXKXw9k/qKO1vHqrjmGIgcYHyci17DQppoHZGbqncsQWG+tLYk6cY2gydgxPe4ftjW0wXnX8qWpoPse1nTtWav+rEBXlZ1NCY4wtDr2WqmJe3ZB2bMVeMJJVfNonFq+0GrVU8doutI1niObeCEk1Zhy8lB/DDcBJaGP/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re; spf=pass smtp.mailfrom=terefe.re; dkim=pass (2048-bit key) header.d=terefe.re header.i=@terefe.re header.b=tqX4I7UD; arc=none smtp.client-ip=5.255.96.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=terefe.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=terefe.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=terefe.re header.i=@terefe.re header.b="tqX4I7UD"
Received: from localhost.localdomain (unknown [212.106.161.95])
	by terefe.re (Postfix) with ESMTPSA id E31A21FFBF;
	Wed, 21 Aug 2024 20:58:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=terefe.re; s=default;
	t=1724266716; bh=34MFcCZ3blJSkVZnKx7zZ191kBMyF8eFb6URIOqpTvI=;
	h=From:To:Cc:Subject:Date:From;
	b=tqX4I7UDT/+q++aOKXL0BRkePHjqDJuF1jp2amnlhbQGMAVIXJmdUSeLhh7xAGRaG
	 QW00egiAsYkoS5HPlAcjx/uTLMv5OVLl79i2J5I386Y+K+MT3sPdAZmxdwhhKxSF/Y
	 vZj3AdwPehNgRXqmm7y5Qp1Yxkqa9qxXIShhHH3P1UpoPqQPhUIyOjfXUv6YvSBr0C
	 tNzpKGaqqOPyxEl1G6iE6cu8oejeFTxavQjSs5Y9azbRAeGjH80UzUH8y3XL0q1Jak
	 GAUaDZZlMMlVjc4Da3pMsuRmwXBpKQWqJw6yW7iNC6CEesayZ0zWTqcxuZ3GmKCQZQ
	 SpzaBTtruF4jg==
From: Tomasz Maciej Nowak <tmn505@terefe.re>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nicolas Chauvet <kwizart@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomasz Maciej Nowak <tmn505@gmail.com>
Subject: [PATCH 0/3] arm64: tegra: add power sensors and BT+WiFi to TX1
Date: Wed, 21 Aug 2024 20:58:02 +0200
Message-ID: <20240821185829.20997-1-tmn505@terefe.re>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Maciej Nowak <tmn505@gmail.com>

Jetson TX1 DevKit features bunch of peripherals that we have now drivers
for, so wire them up.

Tomasz Maciej Nowak (3):
  arm64: tegra: wire up power sensors on Jetson TX1 DevKit
  arm64: tegra: wire up Bluetooth on Jetson TX1 module
  arm64: tegra: wire up WiFi on Jetson TX1 module

 .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 64 +++++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 50 +++++++++++++++
 2 files changed, 114 insertions(+)

-- 
2.46.0

