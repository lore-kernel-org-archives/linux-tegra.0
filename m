Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416C615F3F2
	for <linux-tegra@vger.kernel.org>; Mon,  5 Aug 2024 21:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722894697; cv=none; b=heSAn54AXASaYg6m4G/KA0gt1C4ru1vvI3AFMcrv6+x234kgqTmIYIoKNgTepIz9g58hLZ1XNjXjdCib+ln+TGMhPsbrQiDWYp0lXWGc9T1mb3XC9FIFQro/Doc7HXr+17Krl5+b6ePKuq+v5/JRtfvkk74wsTPRQS7WEysk3TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722894697; c=relaxed/simple;
	bh=7QEoIsXVIp4jLETDDEw0Gsz9F76DdGmqRqMdFAG+/xo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RiqK1xBRZ22AwS/ZuWxMdnnY/Kzy3Dbgd3HlQiG9OP1SONoeZ7d1UxEjKm3dRnhBhKFyxLMZygOWNc70raG1S1onBJH0Xfcr4q5Vo1CUDqd3apFP0PhVLqBwlj0YQcAkdU0MCw5AN9YCj7m4pYewbmlTK8JJPIYFW3Jm8WrXVuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z+ALS5GG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z+ALS5GG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Kld3gE4SblWVR0
	7LYX02//HCfm7mI5jj4CnBnZsYvAk=; b=Z+ALS5GGswuWZfAv42bigkQU+z1T1U
	FAgPUWZj9zB10tkOLDWO/uV9oAuv/zKGSM1jtOQp07yru0thSeXbU6jZuqEKDFij
	FoOmL387TPexlhFcaYeICrnDT91mF3xRRzcBC1+fu6E5CbNX0QMBp05gKi4x7rcy
	Q/mH/hXllgQsajTSgZqWPy7gtuoYhMZ+C92qE7HsHgedRGmag1H7SA6HIn+Oo5ZS
	nu++LjsVROUyMF+NJqNo1/WUzFRWiJspN9ySW/ctqT7hBfpP7skDXZEHRBL8ONW4
	7DU7q0vb2M3fKR1H8kvj4Z8M4MV+r+Y5JPVtYiXrjJrGZmBVRQ45MKsQ==
Received: (qmail 18004 invoked from network); 5 Aug 2024 23:51:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2024 23:51:25 +0200
X-UD-Smtp-Session: l3s3148p1@2RexrfYe4JRehhYC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-media@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Benoit Parrot <bparrot@ti.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Dmitry Osipenko <digetx@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 0/8] media: use 'time_left' instead of 'timeout' with wait_*() functions
Date: Mon,  5 Aug 2024 23:51:13 +0200
Message-ID: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
* fixed another occasion in the allegro driver (Thanks, Michael)
* added tags (Thanks Ismael and Thierry)
* rebased to 6.11-rc1

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_*() functions causing patterns like:

        timeout = wait_for_completion_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
obvious and self explaining. Also correct the type of the variable if
the original code got it wrong.

This is part of a tree-wide series. The rest of the patches can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left

Because these patches are generated, I audit them before sending. This is why I
will send series step by step. Build bot is happy with these patches, though.
No functional changes intended.


Wolfram Sang (8):
  media: allegro: use 'time_left' variable with
    wait_for_completion_timeout()
  media: atmel-isi: use 'time_left' variable with
    wait_for_completion_timeout()
  media: bdisp: use 'time_left' variable with wait_event_timeout()
  media: fimc-is: use 'time_left' variable with wait_event_timeout()
  media: platform: exynos-gsc: use 'time_left' variable with
    wait_event_timeout()
  media: solo6x10: use 'time_left' variable with
    wait_for_completion_timeout()
  media: tegra-vde: use 'time_left' variable with
    wait_for_completion_interruptible_timeout()
  media: ti: cal: use 'time_left' variable with wait_event_timeout()

 drivers/media/pci/solo6x10/solo6x10-p2m.c     |  8 +++----
 .../media/platform/allegro-dvt/allegro-core.c | 24 +++++++++----------
 drivers/media/platform/atmel/atmel-isi.c      |  8 +++----
 .../media/platform/nvidia/tegra-vde/h264.c    | 10 ++++----
 .../platform/samsung/exynos-gsc/gsc-core.c    | 10 ++++----
 .../platform/samsung/exynos4-is/fimc-core.c   | 10 ++++----
 .../media/platform/st/sti/bdisp/bdisp-v4l2.c  | 10 ++++----
 drivers/media/platform/ti/cal/cal.c           |  8 +++----
 8 files changed, 44 insertions(+), 44 deletions(-)

-- 
2.43.0

