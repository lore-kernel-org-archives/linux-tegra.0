Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE77B1EF375;
	Mon, 16 Jun 2025 07:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059621; cv=none; b=hv76k7v6ERlVoUkhX5vuTz2xEnQk6Z6s5tCYRCf6+LQPXo54mOnFM0mz23x0Ba4z0lDYnhQRlTS0g+aodx3UMkLpRQproqMl3u+QHXafovmMWkLwzOGEPU02bWtN+X2SZzy2Zd0uXoqpoLmqiIeKS8c20H3MYf3aphfL7tLwBEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059621; c=relaxed/simple;
	bh=dyZEbGgmKpcIr/B2KkREhvZntKgF7irR182t7YtwoxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oXC0EqNCwDZM7Q3dlQRqwb0hg3PdD8zbkY7EXlvNqYTMcAHO6c7TG2eubPqi084yUQImIJIjVM22Z/zakPiRIePlZXktY2PGdnU2R8QjL8S9sGNABtheFlaNW82DxGH+WOVQSNKH9s4fZoOz9jGOPRj1/33hBN+zzU+OsGhuisM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9KWm8ek; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9KWm8ek"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5533303070cso3794385e87.2;
        Mon, 16 Jun 2025 00:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750059618; x=1750664418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/KHBmyeF412bCh/Np+BCHh8EhhyY/UZZsAabgUMvy8s=;
        b=R9KWm8ekjn0sWh2rS/ayjcyGYKG7oy35O3t3khEQbUCPCZ/d4Dov/R7d1JHj0OaMTQ
         p9Wq3vN2K6OJNwEamWHkFBa/Wug2PyxKtmDJjf9D/aX49lci8wnJ/Wd7ZQXarwkr5i/V
         M/gpcS2ISuQTMkyyZBolyU5B8XV5kaPUP3TCrRIlWg2lqCNnRzbvh0Slof6PpaG2uqKl
         x4K6scEh+dPpZd79gCkMmMCpB7yqViAK5SRx/8M8CvtRBMsCx4mw8WKGSlRugdpl9kPU
         MPZ+hlIGfqyf4BxBD/PyCewy179rwDn9uMAqqpxeTs+nQaYIsOtAHVZLlC500RfoGxqe
         yY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059618; x=1750664418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/KHBmyeF412bCh/Np+BCHh8EhhyY/UZZsAabgUMvy8s=;
        b=G6yDB3VA2nWR5E6nmGnpNRGHMgGLL0/NQ7VCoVAnXgmO5o7XOcPKixUCCv+U4Un5Ut
         ngzxTTKA5jZ1JIhXCKZDIxSV6+UGK116j9zkn6JqIfOnC8aZPJ6dBrbvucXzBUNVqyZD
         0P7ivqtt7LX++If7I0TRFSKoMQKMaKAYV2wglK2hmAkNRLPpr0ZS69+FtdcZrXpllJzl
         YPnlfvD/sywv4NuMaucYV9+3Fua6vQ0pgm8EYIANimJgGtNPnH66TWDmPkGfZUZavX6x
         kicDOX1Plv02WWaQzFFeuh7omb/4yp3f/yfi5NyU1gTKXnP3cso/lQo8AiFXp7wZqzd8
         mvaw==
X-Forwarded-Encrypted: i=1; AJvYcCV7TUUuNg3CjusWtab1F+FteGe3jYgWFWAQNXXrbIzbEffAWJuo6Co4Tircujuji7yO/BGItboBV5Gz/5A=@vger.kernel.org, AJvYcCX+a8TZJpYuI4j79XvvOmxecn/UOn7IpdlaAffn383gw89dl+PLfhGw4DFpCYzXq0rwpHpt1QTWZzNzDsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxScGTbg62p5xNWs5Yefg5a8aHaLx7g14tdyhVW4bjsjCA7kcGG
	LHBIK74HJ6kPxHXYUfCqpffJcpIdGHYqpz2ly5vQHagkCB5EXWQd973q
X-Gm-Gg: ASbGncv16tmghU6CHDEF9NLvkyRk8dCExU/P9G+T2dbQ6Vc9ZcCn01DmXfD2m5CDU2+
	8cOShNF3Rwqe3f0vwrICUdnnFIl0nRIWdaVB4EVrkOQsGpCWHegpbkTE2wZIns7a5+s7ar3DIWG
	QTtgUPoci9VZX382q2MeJvWtuI1j1l8YGbkjk6dJzCoNTV++/swDayyA/LIluc0mIF5oPPksQus
	kKOTOWVTz001O5gGnhI/zmbYln7gyDOjiBOXg5IYVUa6vJKGleyZ2fDxtCQStps04CenTZL6dZl
	uFM4pUFb0GV6G85UFVno3cyPN85qk4pEHYC8vc0wMPVR9GGHWmrfVA==
X-Google-Smtp-Source: AGHT+IEVrHW+ppNAQ/2lWwqOpznH3j9hwooAj4zEEgp/O3vwjKHyh9Wxy1nWupuPWIoIvwh6sxXZ1A==
X-Received: by 2002:a05:6512:220f:b0:553:2a6a:884b with SMTP id 2adb3069b0e04-553b6edf331mr1837606e87.23.1750059617524;
        Mon, 16 Jun 2025 00:40:17 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1ab08fsm1452721e87.89.2025.06.16.00.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:40:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ARM: tegra: Add device-tree for Asus Portable AiO P1801-T
Date: Mon, 16 Jun 2025 10:39:45 +0300
Message-ID: <20250616073947.13675-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device-tree for the Asus Portable AiO P1801-T, which is a NVIDIA
Tegra30-based 2-in-1 detachable tablet, originally running Android.

Device tree contains "mstar,tsumu88adt3-lf-1" compatible, a simple bridge
which was submitted a while ago here [1] but was not applied yet.

[1] https://lore.kernel.org/lkml/CAPVz0n1udjVZY3400hYMY07DjNKfOt4bwpW6He6A4qo_3pXtqQ@mail.gmail.com/T/#mb50632e269d89275d97c485037da8893239b5410

Maxim Schwalm (1):
  dt-bindings: arm: tegra: Add Asus Portable AiO P1801-T

Svyatoslav Ryhel (1):
  ARM: tegra: Add device-tree for Asus Portable AiO P1801-T

 .../devicetree/bindings/arm/tegra.yaml        |    4 +
 arch/arm/boot/dts/nvidia/Makefile             |    1 +
 .../boot/dts/nvidia/tegra30-asus-p1801-t.dts  | 2087 +++++++++++++++++
 3 files changed, 2092 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts

-- 
2.48.1

