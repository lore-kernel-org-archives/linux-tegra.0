Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128D421A92F
	for <linux-tegra@vger.kernel.org>; Sun,  8 Feb 2026 04:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523443; cv=none; b=nXdMrBzsi+uxb6Z1VKxtU9NkRPjghd9XjQufNxcebN3Ube3pVngiSWgI7KQF79WoIy0qDj2Uy9PEWzN/QM/evE2dqDZZYta4ASxk+R3n7uL/1QwVVWt6VPN2YJdyWMNWCwNn/xZwTBL0Yf1b3a+eOezSug6wMubI+7nxCGyGRoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523443; c=relaxed/simple;
	bh=gVLYpM9coDM1ziPBdzZCYGdJwdE7dELsKzKbZ2xsotU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ibZKX1Eo/63syKK1FnxVjTcF5d5d+pSq8B1HnaryCjTDsdQEVmqDTWkqnOupf2VSDhGfDbKKM+/qxAmbbU1uvneEvQKLtbiU8Qd5L8qUYq6LlPht2ikODqvacqdbXSEy/U6P7RusHjz9rBRpKs90pbEcGWDURuyoAxcu6seI8sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P7qE1WmT; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P7qE1WmT"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1270adc5121so1642069c88.0
        for <linux-tegra@vger.kernel.org>; Sat, 07 Feb 2026 20:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523442; x=1771128242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oUKaI1Jl6BOBoZBMk5DmhJ8i+x4ONVWqzInJUK5fe+o=;
        b=P7qE1WmTEd5I37fInOyQx1w45mjLTo3qys+INfnu8t5IC9k+n6eN+ZAZ3b87UDXN2R
         v1vJuuW32wtajMDyRxLYu5uO5V3+NEqo2KKby93w25FfGf47VyoRpWyBNa5sxkx60LU+
         stMtq3lODGpYytxQofsfgc5yc+ToC+xJyk3qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523442; x=1771128242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUKaI1Jl6BOBoZBMk5DmhJ8i+x4ONVWqzInJUK5fe+o=;
        b=Ry1xdIJNqWxCdP+7WMIkqBmae+jTymfQB28hD0TzRSK81hIl9wv2X5Dc0BU5g/kLbf
         y2wpn2xROk0jyvUny8y8HJci8PaWJQthr4aKNs48OvVsqgAvMdQGKY24XPU+7nRbCygy
         1RkPRSGhcT0ggWcph47MYrR6cZL87AmfTLqBiBuUVhVdkRpz6IvQPTQtZQK9zx3WAngm
         JDjX8dM3VMBUkrfco/yWPn7JTBkSi/oHxyMa3GO7nwc5GeA/ui818a1nW+9/cBZOBNfG
         AZQ1MwkmNZuR5Fnf2yT530jciRySbeOdp9+MaQyzh++HNTvOKnlbCCSpuwrSPAVPYTu/
         KJTw==
X-Forwarded-Encrypted: i=1; AJvYcCXxM9Ct7Mt/zPWPq1j7UUgnQWbwNQqMl123b3D0d/q+U/MnC5cMQEDBsYHikjysC/+MTMP2F6gKWB/9DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YycDtZQgqK9KVe1vjPs0ms9o3BL0dSmKzwSjF6bqot/u/mNMH84
	jq8Yh7ehsuaa4Vmk7J13QfdBKVqvoTFe4f6bGAys2VZ/Ui8jcrvj5swF+2kmRueprQ==
X-Gm-Gg: AZuq6aLM9ysUpNHD90mSh4zjfvyocXwH0+OTMn7/+1jCanmKMudCklngCfyNM5Cst0+
	d2LzlKnuKXGcVjtL0NIkb/XrlT7IfEoHjKmnm3SzANe2By6AQnmCDCzfwju5XyTuOGwt0GvAWWa
	8l1AEj/+QSZFcjWiD18Xva6eLsQUM+Rzp3umtScsL3HwZrpfzTDaIprkq6ePxgIL1SvtfR/L7ux
	uXKA2C7aYmmKgm4ScD6CWEOriu1W3jQLJQltFyYJ0f2CaTh7YnII9iZmQ9UCHbn7iWu+2m33GHP
	4+toerdVjCnEtrwLXaIw9lnR1XBy8Y1OoIz1XJ72sF+wVgXjIQYM0kxDDrYO4SRmgNU2Qg6XKLX
	RY3iqV/RuLBosLJ9+mr1QbT+2ArFHha2V1vmE1uNxt/n3va6NKbQAAOhISCUuphOYteJCejhLud
	+HsrQB/L8KCBdsv4pm3+J8yrU9NesJ2jtN41xeXEWtzUE6A6LiCrcwkGECF4xj78DRFlQ7PCA=
X-Received: by 2002:a05:7022:6184:b0:123:2d38:928d with SMTP id a92af1059eb24-1270405aa72mr3860925c88.36.1770523442099;
        Sat, 07 Feb 2026 20:04:02 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:03:59 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Frank.Li@nxp.com,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	andersson@kernel.org,
	arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	jay.buddhabhatti@amd.com,
	jonathanh@nvidia.com,
	kernel@pengutronix.de,
	konradybcio@kernel.org,
	krzk@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	mathieu.poirier@linaro.org,
	michal.simek@amd.com,
	nm@ti.com,
	rafael@kernel.org,
	robh@kernel.org,
	shawn.guo@linaro.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v2 00/15] mailbox: Stop sending NULL mailbox messages
Date: Sat,  7 Feb 2026 20:01:22 -0800
Message-ID: <20260208040240.1971442-1-dianders@chromium.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As talked about in the first patch in this series, passing NULL as the
'mssg' argument to mbox_send_message() ends up causing confusion and
quirky behavior inside the mailbox core. Despite this, there are a
number of drivers that pass NULL.

It is plausible that some of the drivers passing NULL may have been
taking advantage of the quirks of the mailbox core. Specifically, they
may have been taking advantage that calling "tx_done" wasn't truly
necessary for NULL messages (it was a noop) or that NULL messages were
passed onto the mailbox controller right away without queuing.

This series introduces a new API call: mbox_ring_doorbell(). The new
API call tries to mimic the specific quirks that were helpful in the
old behavior and it's expected to be a nearly drop-in replacement.

There are some subtle differences between the new call and the old
behavior, but it's expected that all of these differences are only for
cases where the old behavior made little sense. The description of the
first patch details these differences.

The series attempts to convert all in-tree users to stop passing NULL
for mssg. As per above, there are some slight differences in behavior.
If any of the patches are causing problems, they can safely be
reverted while debugging the problems. Eventually, all code should be
converted over to stop passing NULL mssg.

Changes in v2:
- Instead of just documenting NULL, introduce a new function

Douglas Anderson (15):
  mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
  ACPI: PCC: Use mbox_ring_doorbell() instead of NULL message
  firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
  firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
  firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL
    message
  irqchip/qcom-mpm: Use mbox_ring_doorbell() instead of NULL message
  remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
  rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL
    message
  rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
  rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
  soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
  drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL
    message

 drivers/acpi/acpi_pcc.c                       |  4 +-
 .../firmware/arm_scmi/transports/mailbox.c    |  8 +-
 drivers/firmware/imx/imx-dsp.c                |  2 +-
 drivers/firmware/tegra/bpmp-tegra186.c        |  4 +-
 drivers/irqchip/irq-qcom-mpm.c                |  2 +-
 drivers/mailbox/mailbox.c                     | 82 ++++++++++++++++++-
 drivers/remoteproc/xlnx_r5_remoteproc.c       |  2 +-
 drivers/rpmsg/qcom_glink_rpm.c                |  3 +-
 drivers/rpmsg/qcom_glink_smem.c               |  3 +-
 drivers/rpmsg/qcom_smd.c                      | 13 +--
 drivers/soc/qcom/qcom_aoss.c                  |  3 +-
 drivers/soc/qcom/smp2p.c                      |  8 +-
 drivers/soc/qcom/smsm.c                       |  8 +-
 drivers/soc/ti/wkup_m3_ipc.c                  | 10 +--
 drivers/soc/xilinx/zynqmp_power.c             |  2 +-
 include/linux/mailbox_client.h                |  1 +
 include/linux/mailbox_controller.h            |  4 +-
 17 files changed, 108 insertions(+), 51 deletions(-)

-- 
2.53.0.rc2.204.g2597b5adb4-goog

