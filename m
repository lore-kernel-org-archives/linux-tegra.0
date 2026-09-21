Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD62E266C
	for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 23:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032138; cv=none; b=RgsbXz5tq4grOZsGto+cqq3wiNxOWbDOL/Ma6wODzGLIph/cxIrrnixGL/KryPDHPUzuGR5FCgcL1ofAys9KgNIa4BiZBFCopb65GsSozq+N9psVQi7pwsJ8KGnxZLVPLtcgtAgz3Ba6IcwzsHnsCRKt3Qr/Q/TgcW9ETGfVbds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032138; c=relaxed/simple;
	bh=FjE6m4Wu22yRUqg3eOb2AwP40X2TKH7xNOyBefmJeU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8BR/4jeNB6bSWtwNB/i6qjm+Xm/MEAhdy9YtpJ6+vFt+xF0g8I2RPIFwCbnYg4mYVByfzjBO7+hNR8xceC3j8JmgHceLGXQlmtxw8hryyA5kNTOAjsO4m08jpBtv8lK3hKtaGNa/smAa85Z/rI9ny3IfA+Aa9QQa6cfMWOwg7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4E1Ym6e; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4E1Ym6e"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so394970085a.1
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 16:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790032135; x=1790636935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+7FtZo0KfJZuE7MAZ0TFcA4sMr0zM/AKrTXBM06+cw=;
        b=E4E1Ym6emMwVocXYNi+rPgWOOJKOZ4J06QPIFyy4mPzFOhLXcdda85G8rlxZQxQTtv
         wIY+2w2zm+vfv/7DdXkF3MAh0Iybkc7bEEv8gj19wEHBD19srwDS+ueb4dbxcWZcdhvz
         eq5DwOrvSLQ8x3s6S/7aOZp0o7BNjLSgb2U4IHTwcsWQRyySoazNHDynQILNlVLIJ/dV
         f+vI9J9PctGd0hv7pNUuOV5C4ulykOknlLzx3heTi8knqcfEu+z18aqdibrLY//bEblO
         0O7jsirA2TiQEYy1e28J81p1BaOD3swJZD1PCcy21xYWgtomwimoRzsnBfXo/mXJpHbk
         ZOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032135; x=1790636935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+7FtZo0KfJZuE7MAZ0TFcA4sMr0zM/AKrTXBM06+cw=;
        b=VpV3YiEDuQ2u7Iv5DCwOWLoOxGmbA7fGw0Z/57InzyCIaqQqtUL6CL4g45yQX2cbxp
         xDQVNjtp2FI6DdrkC+JU9ZyNqowWK66KDMpP8jLBoe3+4T9R6vK0QuCQ0A6euy77wore
         5jqvg78AzteQIO3TD7BnJJC9QrHeTYEdjuqoSBrNixpDqv4goyMaONdsqORyHeoL3UMH
         qj0KpiTxhuEAfLPlUh7DYOSM87WOjgU+e3tuAJ1jLssqPoXCAVIgtxJ16dfsznsrGs39
         cRcGQXFXqNxY6H36KiygoWhQ5cpLl68qehb7Sy0fWm2HkvqYnUKeS0FO8n6Y07/hw9BS
         TKNw==
X-Forwarded-Encrypted: i=1; AKwUvByZTQmZujzYoC5nzqlqCZ6uPCpqFHtaAhwdqyLf89fwtD3cyYVgW3aOq2wcCWNjsn0VfI7XdxOO4EXtQw==@vger.kernel.org
X-Gm-Message-State: AFuF++nPz1JeYAlZIn9wjV8rj/IUEoheOKhk8/YxelwL4oqSa5Cdnj2y
	OgYS81O79854zN+xQYAEK6Z25tq8RLjM7RBiBBc4uneNnRu8KzwTHrA=
X-Gm-Gg: AYBFou3PDUsW1HeSojsioBFIxMpVDWXq8mhZgX9LWUMS04gaQorCUUWjm6azuBPtaBY
	S4UTa+nuROh7fzK6Skuq/qkBwpWQ3/FMKulBfGu+kKh2L6Z+n4vAuWIGV62RntNcUEom1mDTcOS
	7H7dTPecfiPksbkdC0ie2e/NhsZpU+i7pLt3RtEz+siLOg+98hXYPp4Xiq2EIpg0bP6KVTAVlIX
	pz8/W1vGiLV+JazKQKkWUyiG/hKI1IY6UXJGXcmRF3T+dDpRAgb6ACtmbLKWeo3vR1dsgtiFpqD
	8LwymMUEItAPBM2q3mrj+mQtXu2eK9ZlJITDFUnPTvZerEmM6Adn9dn6dKDxUYH+0aCGp6Z4E2E
	473jdk4zgpRW3kwoyACOe5dkq9xhpBIKzvEnJbVP774PPjhe0a0Q3jrWvMQCRcXB9N8evY6KWm2
	DSR/V3bmn7ltP60JLBPE6wSYC7N5XEGqJLWECYVrhC8W1nSbAgwYpUvc+gvD2/qNGjMPCZY4LGo
	6dU+i8hIfDyd1gIVvdn5Ew1DaiPAO2vMDY2hUdgtfGwBnyCivr/1jQ79PPSkBXs7sojLFQzZyEu
	F8D0lZiEMZsLdiNtMk9QW3hjp2N1
X-Received: by 2002:a05:620a:4008:b0:939:6dbd:de57 with SMTP id af79cd13be357-93c198e81d8mr92373885a.32.1790032135435;
        Mon, 21 Sep 2026 16:08:55 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a7f592sm39933985a.17.2026.09.21.16.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:08:54 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 0/2] usb: gadget: tegra-xudc: Fix removal-time work races
Date: Mon, 21 Sep 2026 19:08:46 -0400
Message-ID: <20260921230849.502492-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two producers outlive tegra_xudc_remove(), from different commits.
Only the delayed-work fix needs an API added in v6.10.

The devm port-status IRQ queues port_reset_war_work and plc_reset_work.
disable_delayed_work_sync() rejects a later queue.

The PHY notifier queues usb_role_sw_work and is not devres-managed.
Unregister it, then keep cancel_work_sync().  That applies below v6.10.

Changes in v2:
- Split the Fixes tags.  Only patch 2/2 is marked # 6.10+.
- Keep each Fixes tag on one line. (Thierry Reding)
- Disable plc_reset_work too.  The port-status IRQ can requeue it.
  (Thierry Reding)
- Unregister the VBUS notifier before draining usb_role_sw_work.

Myeonghun Pak (2):
  usb: gadget: tegra-xudc: Unregister VBUS notifier
  usb: gadget: tegra-xudc: Disable reset delayed works

 drivers/usb/gadget/udc/tegra-xudc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)


base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0

