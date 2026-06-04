Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8753DE443
	for <linux-tegra@vger.kernel.org>; Thu,  4 Jun 2026 06:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556189; cv=none; b=Taa7AYhU6TrhlXPj8axg8TP0eOwewyY1WMEJwj+TAOEjCINmmj/15KYTqVqqbFoEkd4AJJyBXcxJzqIZ00//DROeZltvfAiLPW51JXh/yknTFuZdpd8m26YcL2PZWIoL5X7H9a6WkjDBpDVxnp/iiEp2PWkUWfQ61B1xzddrVrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556189; c=relaxed/simple;
	bh=mfMhw8X6rqSkNtHrkXfGwY4WQE9ume16xTTOiihtOCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YvNWqkTwFbuooVkh0++bRhFTqICGlKuoeqOiNPbxTVdRKfLMJUBzibEiO/CBTAhxTRc7Srkho1qYNywr6ecppZNjjtOTZ9MGWPJutxB8G9wNU1Ql/LJmlgYSFsa/h1Q+F7uPQIX+ypKGTF3gyeidK3nKquiCuHM0iTKfClqqbaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjGOpfXe; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjGOpfXe"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bec449d0af2so40910866b.2
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2026 23:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556185; x=1781160985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUjdA7Q98BNOHlYv37Q+eVdFjAnQXSNmLGsjPptNwdk=;
        b=cjGOpfXemYwxnRHxTPQLsSrl4rfNP4BhYCP/sfSrilr7Swjy28UX2MJbL1Hw1EANBi
         O2XSi3sZUXb+diEdQo0Fg8o9dKi6qh8DVXsH6nc8hCjcpnQ3KbqVkEI8wDzUBBmusSZ3
         tCNZDQJWCqhUU5cFHJ0c0fm+om2Qsxb9EuF5Q9z0j0t1uitmnpu1A/lMwbLwMDy6x2Mq
         JEoz2vk8Y/dQW5jM7ngGu8qaDJ8PA4BRt9NRIbDBdF3qWhdO9GRSyWOLG1GtoJW56Ci1
         TcPj8mlLWHmcv//iuD6XnuN3ofQq+1uoBkt435QrTU7p3Qj5vbR4AIJpMrUK9TAdZJ5q
         XOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556185; x=1781160985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XUjdA7Q98BNOHlYv37Q+eVdFjAnQXSNmLGsjPptNwdk=;
        b=sBBUy6p+XvXQrk8NIKhq3BDLyfUOAVlCj1RJZnl1VRsrdK3dSBXQIFdQ5nXLURXkOf
         PJx6B1o9Sw5B6zN9q3lQXwUK/S3mUjr4ar1sXdAne1NyJ9iZ7R1uLdE78tXkeMmtyS6/
         CpX2oIGmC8Cpni0eVQhw7RkF1f34w54P2bWo9B/vCifaKaWU/2v4NE45C56l1GSy1o6n
         FpwnpsLD4GIrxPAftBEWhEls0iPOM897xHEDjVF2hhbWrExWE2gmP8He/vycfJAX/2fK
         N9NlHOMK4B6aiFqWU7s77gNbjo7rb5eaQ+1HG7FnA31Saf1fGAvpbLNladHSzAQy+FPM
         T9xA==
X-Forwarded-Encrypted: i=1; AFNElJ8vQfNzP30oogXqQzVe1eKRZR0kJUAn+VytBP+wSYAV/Q0T4TESX0txOSiHAOr9lmPnpGZzBdb/JKHCoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwpcG/LFmzwsw4g3wJa61AT1UR741M3F6du2Mwh1YgTKbDCGHM
	KgzM/Awa1BPEFjGjWBjVyxOfbh/4cJArh9BlRhwRE5ffv1KmWGgV0DGE
X-Gm-Gg: Acq92OETD8/uKyzll4wkH3B89YtUbLy7Oqho/igUoGZxDoMs/zZpIxD8LziYYoHtAAL
	OBeIL39SEGtKCRfo7W1gRYSG83YYQqRVnbMmOYhTmB0Cfd23gS10A4BNpbCGlfSjutr3XE9br3s
	0FpHYje7sx5Y565jCjl1e5W1soUNR53pLvw/50Fl6USSPtyzTANu9HpzFUUIgoVifaFXsvZgNJj
	r/6Bz+TH8+sO067si7UiD5SODri2Hq7tuQPTRqFdulxO8IgbcU0icObRKuuFEUaI4F6xHCPj0tp
	zUzTv7f8bO3YzQix3PNB9SSQFKK9LljZ2g9+wrFgIbzqNNZtMQq7MAljwNK8iSUdpTfr1SC7FfZ
	JOQ65qxwC0YixSQIg6DLYJd1oFqZ3EA9PFdEBWTFlih2RuFf/Vwo0tzRFPSuvdpGISSjzKbIgv+
	CDpZQ7oje5riVZwYlZFgtFWtk=
X-Received: by 2002:a17:907:9629:b0:bed:f7d3:6211 with SMTP id a640c23a62f3a-bf0af9f6ed1mr314039666b.45.1780556184392;
        Wed, 03 Jun 2026 23:56:24 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/10] ARM: tegra: tf701t: Configure UART-B line used for GPS
Date: Thu,  4 Jun 2026 09:55:55 +0300
Message-ID: <20260604065556.137614-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604065556.137614-1-clamor95@gmail.com>
References: <20260604065556.137614-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set UART-B line to use hsuart since it has GPS device linked to it.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index df4ccb332301..fa4e3def9ec8 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1283,6 +1283,11 @@ drive-gma {
 	};
 
 	serial@70006040 {
+		compatible = "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
 		/* GPS */
 	};
 
-- 
2.53.0

