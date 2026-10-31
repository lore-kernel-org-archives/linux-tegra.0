Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450361;
	b=ehi+GOqp8k17kDuvsxSR1Z/hH4Y7/X4teZcosDl9FhIZw+gWZ2/Zcf2TQvnkCf/ajvRq
	 7SPEpHK5CFhzndR98EOVE/hU5kgeqO3oaAQEfH9XU0c2m3lq9gK+guxOL/w/YDILjQAgN
	 eZTJYwcONnjogAyiAYRpLPSZgkBwDFffWOjEs84r2E5gYYyHOunAlydB4y1YsSyK+QyOe
	 v3YJMGPPElsQsO4cZIo+jcQ3HyXEbCatCwJpI4kB0P1lSL+8eskyRvIxQ9ApwEZy4cRJu
	 u88nQqd2q9Jvx9FVcbuvIhqw+h4XWATpDuDpO21FIXV9P42gMaGvxx4JM4ilKkMZU5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
	b=b2TV5AN1r/CiksEY3tOSSwouYh7pcpm0KjHxkgY9GIAwjJfw99ASqSJeaIfu2TwEYxNt
	 quNf0rYGu+k6IPslfEAyf05rZOvWPK2aDIAljtm8CqKUs3qYGs0XSmzUEftQ2DP/Bt3Dd
	 n99fkHo9tvKdmgNU/L1Vu6K05qu7XXrF6C+JNaVKkNVFniX7/1slaGF/WfGxYZnairS2o
	 EAJwtZxVUcoOGCTCPiqbV4jzH+5jCSo4d/kWqD/88vtB1VwBwDYuFHFwxrcT5KmgEwUgM
	 /9+RGsLHZrTv/t8Mqdr1HH9ItZ4jz8d24hwmGsaxq7j+mtqcR1EKor5g5OKxsdn6YpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKL4FZYZ;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA8E606A324
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 12:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA8E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKL4FZYZ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35829219da8so3139585eec.0
        for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450359; x=1794055159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
        b=xKL4FZYZxZ2DMFO63mud1fJJvL8ljHKd1cSzKueTBjZ5KWdT9ssOnP0v+oXC+Q0hZo
         Qs+PHJ9Klrp7eA+ZXpy9jf3Dvec5+bt97LOlRXjZ2Q/ZQk3duWOE8JWGvfSgl57vgWch
         JCwhFXX9MgJGW590FuwNWfZumZRtLkpFT5T7+6Bz4lAo+aIOdOUI37/Kc3CAmRyY4HcK
         W41yN4QDz1O5X8AHfcEF+5+xoVAARl8Hp+FsH+KuRBB/WuH0FK/KGowokkDV3UY6/ekT
         v7y6LWO5F42Vjer5ob4L76hFwBAGTlmtyimH5jt8uYFW8EL+iFHLnr9Tu8b/QEml5OWf
         mHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450359; x=1794055159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+SP5aC6kFf2m6+Y0UAcy1XbuoZimqxQ+Qboov/RQdw=;
        b=UtqHQPTUXO5yUe2agdDVV1um04IXI6e2MKXdz6db06ikHpt8hE+ksR1JVj2B4jf1xY
         PyFmpuVHPMkOPiefKLvESWhv4KELDar8Lb+COYs/3s+9QZakulc+6QSJMTftHP2Vla19
         6IXn17J/2U7/e02TNb7xpituvws1v9+ozngqn7wN7JorLCiQord+hhZ0CMGdh5UhQjmi
         FQ5fjWcNq0tgcRijRcDJj2lWF3C42usv5rlxiXtPfex/nSf1DwbXr6a1Z2Ck7Wywu3Tb
         mhKnfedREIs0aYv3Qmw31YxQyeUnZn2illcEHICH5I2KdmAdDOiHrHOHJETxWm5d/hpz
         ifiw==
X-Forwarded-Encrypted: i=1; AKwUvBxePFJbidhHRirQmya4wh6zABzaJeEj7klvdumv2VtYNIroipEP+cPoIGQEyFpnhYtHSDT8hu+rKeLa8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIWV9tm0axb+OsufwTQ9zOjhh2GVmZDkNMfXPWvOiVs/Id+iVQu
	b/CLlTEKlb8/KoY92/3OQfYH/aeDZkz5o144MJMQaAQovQsvCnjKVP1L
X-Gm-Gg: AYBFou3OpF26HOv3nODYB3IEVxv45vcvKcMZHYj6ahEz/RS9BT9SlW6Ms+9T7/Gd1qc
	demBjW3tAeXGUWESPRwl/H7Nw4L7T3Qa4mIhVNxqpJKepUpw++S243Xq1KR0QXPt2HZnPfU2ow5
	Ttv6KI5wOwr9Juzr9WbPOlQxGo2PuwMGX6xXKxshiAlE2Qs/5Vsm1zFJ2ZLoIx64axMQXsmkEOt
	vLx/Fqjdnuj0WrA02c5efQX86Df6Id95DzMR76hn0TRGOUFEUw2gaEWx326UCmweLsQ0YEUWwRL
	LkTPCs5smOqNlqPf+mu+ut5X95zRpuYt3WOOG/JlNocePgZo/YYQpqwg0HfWqRiMGMM9nv5icOu
	rEYCynbCoNtsPzST6jOZooqCUlKKQtGKbEKVEb9Xq4wiV4kb5LyrDipnAP4ne4tExe6kdSKUCPz
	1t1Dl9s7TEVLFtMVtHhigPk1ik6MLyzrjWaZzOEqX+4/V458AuMpZSFww1Wwg8B2QIz4chp0J1L
	+ip7NF01UF9nurKYvW2RgnlfKITvVJXdZ51z5UibSJTIH9J+Yer2UMrYKmIZgKVl+u9TDoMZUN1
	F0BpLNBSaxHKbaxXMvQbaklRTCbwXpU5zX4FkMm2i7MCl7nEfNHdCFySBM2cigbhBiWE1kHWFm0
	XcLm4t+3c3EPTVeBK4M1+1HMwBB/Rn6pgDyBXOhs+JiX5eknqUv01nhYtS4KpHdldxCeMeVpfj6
	QOhPifec73xJSt5w==
X-Received: by 2002:a05:7022:f507:b0:1ab:90a8:87a2 with SMTP id a92af1059eb24-1ad1077e9a6mr5123543c88.11.1793450359362;
        Sat, 31 Oct 2026 05:39:19 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:18 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] serial: fix TX kfifo underflow on flush in five drivers
Date: Sat, 31 Oct 2026 12:39:06 +0000
Message-Id: <20261031123911.3784690-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031004733.3345841-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses the TX kfifo underflow reported in the parent
thread, where uart_flush_buffer() resets the transmit kfifo but a
completion callback from an earlier DMA transfer may still call
uart_xmit_advance() using the byte count from before the flush.

The fixes take two approaches depending on how each driver manages its
TX DMA mappings. In samsung and tegra, which map the TX buffer once,
samsung's new flush_buffer() terminates the outstanding transfer, as
tegra's already does, following the approach introduced in 8250 by
9e512eaaf8f4. A completion already in progress skips the kfifo update if
the transfer has since been retired by flush_buffer() or stop_tx().

In sprd, msm, and pch_uart, which map each transfer separately,
terminating DMA there would leave the flush hook to unmap a buffer the
controller may still be reading. These drivers therefore leave the
transfer running and mark it as flushed, allowing the completion
callback to unmap the buffer without advancing the kfifo. This means
that the data already queued for DMA before the flush may still be
transmitted.

All five patches have only been compile-tested with arm64 defconfig and
the relevant drivers enabled, including pch_uart through COMPILE_TEST,
using W=1 with no new warnings. I do not have access to the affected
hardware, so testing by someone with suitable devices would be
appreciated.

One race remains, which is also present in the 8250 fix: a completion
may already be running when the flush occurs but acquire the port lock
only after a new transfer has started, potentially mistaking the new
transfer's state for its own. Preventing this would require tracking
individual transfers, for example with a generation counter, which I
have left out of this series to keep the changes focused.

Samarth Narang (5):
  tty: serial: samsung: fix TX kfifo underflow on flush
  serial: tegra: don't advance the TX kfifo for a flushed transfer
  serial: sprd: fix TX kfifo underflow on flush
  tty: serial: msm: fix TX kfifo underflow on flush
  serial: pch_uart: fix TX kfifo underflow on flush

 drivers/tty/serial/msm_serial.c   | 19 ++++++++++++++++++-
 drivers/tty/serial/pch_uart.c     | 27 +++++++++++++++++++++++++--
 drivers/tty/serial/samsung_tty.c  | 22 ++++++++++++++++++++++
 drivers/tty/serial/serial-tegra.c |  8 ++++++++
 drivers/tty/serial/sprd_serial.c  | 24 ++++++++++++++++++++++--
 5 files changed, 95 insertions(+), 5 deletions(-)


base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.34.1

