Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450367;
	b=itKygaPvrfKOAwEPW0Ax+m5FY3T9abSlbn5rkqfg+piZaeF1IKsLPHR64oTGvgd6bKES
	 2pQhU1WTDBT9BuW5UwjayU47rJPiP7CAZC+aPzMPMwj+pAy+M78UWVWd/RK9uS4XvLllF
	 KlV5Yim42bst+b4JEy07uOVdix53849/wc7HLikLT5nOnb4D0xp2ZoA2uOJkds23vwn4e
	 /f53jW9Xr9SxLP529d5l15WGpT3Q0/GYCszTk6zBtxcorIgTTM3MCVU7ad2kxFSY5Qgh2
	 t8RWTxivVwLndoeUHcCCDv4Wk/YN0K9k1+mMcuQDKNB7rShPWnJF+NRGsGKs4meleag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uvdMMWuBJgZn2yb+YVIOL/4xZHnwlAFydQfLAoaMsLI=;
	b=HhNYzxKjtdz7q9H+rcW16hAbfe1YQoDjW4dBpFLOVF5vgXKU4LYLmI5ESPDlCmI80Ko9
	 Sv0j3Ex/KcqNNIjnUTU26mvfnDoEq2q2eGLhiq7lbr/IhoVHXNZ+7oZhgkMl+LW+hf0N+
	 EqD4h5rBUykeX80ZC0AdA8c+J05W+YI4b5BkUYCQ2Z2tyVdWQ7o0xPMQYEi9DWK10F5M7
	 hIdawYNs6t6P//zCDfGTcrK+RD5MpR6sZYJg8oQ+qf+ws0X+1N80OPFF0oTjtMd410x8C
	 w2BU5pN7nQHImdPrTxgrnkrVI/ZrPqxhVVRSRQmU97zI3W3h+o1CJCfOY2KYQRdW0Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i8vqxDj/";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D5D606A31F
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 12:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D5D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i8vqxDj/
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-353804b591eso2564321eec.0
        for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 05:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450366; x=1794055166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvdMMWuBJgZn2yb+YVIOL/4xZHnwlAFydQfLAoaMsLI=;
        b=i8vqxDj/OUDJ1iQa7GwdkezQ2bdVTg2TW5UH+uRGHmgDt64Tf6eQQH+vruS93m5WCW
         qW+JBf2KzhXySFZYomRP0Ax7toZf1WMPxxt9QHqp2bkyfYjwWoTnLxn+/qA+FYbnWdOy
         Wl4Mfpu/HXfjiROPPAOVIseUjKHClJwZcEiN87ym1oRxh0isvc+cawWTxzdU8ZWGIZzO
         ngKVY7BHtTJccDsQHVgv1EHBw/jPrfFsZx1gCeD1q6c9TQTgUxKxBUxMYhARjHh2o1s7
         rUOxjeGB8BhyVzXA5SMe1mlF8LTo9V7aOm5KyfAetaE/B8YGInq6fMaj8f/d8d+RlMNa
         Wtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450366; x=1794055166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvdMMWuBJgZn2yb+YVIOL/4xZHnwlAFydQfLAoaMsLI=;
        b=aYvvp5dVI/p0aBHidWEAEcBfqvUrr9BouxhQVeNcLeD5bCyniR6ROK2jgt0AFw9Dr2
         GC8iS74j6VdkIX4o0YMXoiuH+MzQ5TmOOZ2P2On+fzy3WH5K0q3D1TTLiRK67K3e7Wd5
         I1g4dWa8udyF1YBlzmVHW9taOCase6YVExSy2Aoua1uS+IVpdmvAkiPyyIf13MIY1QeU
         GmsEk0VMGo5LICNxPWTM6QEM40AryQyD3AMqTvmII6QjMMrIcAlz/JXovIKYAhbEIhZo
         BIQpCnjaj3DHOQ0ccoUag2VPIYs/1sDBN3N8RgWm4f/AOsOTFWM26o7FcYbcmFG3Mk4k
         9cBA==
X-Forwarded-Encrypted: i=1; AKwUvBwsvusLGYWfTW+eIt9P5JNpI0Pm1UanAo4IiluTKZR/EBapwpoaUw8XzE4Va38qniqsITIbefjjYt+qTg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIyxV5j0PJxiEuRTD8NUjdwEq3eiYu9/c5aU0bqippqku/Qnsqq
	+1gT2LelV9KS37HtHF18RY43dNpEc4hE3NjImR0s0tsfIfVPdjEn5FHA
X-Gm-Gg: AYBFou0eVTYRyQgbIyLwfhP00eZeyjOGeEz9qmHiv4d2lq1bA4u/LVDCHKnn4hCk8iu
	670h7vSXBJbhbvAmb939l8DGIfHvJlDxaHwnOv/8fXpFmq9wVJ+kwapPOoeQF7oaVhuyCRUL9xt
	DmJVd/8g+S9FhQ9tDD5Hi6TcD5ao8ueLSIk1yTV/XZU013q0HPw61af2+EE8dYRIAuUmvTQd7PB
	kWkiQPODULIlTAM2tlwqRWzs+rZCvwHPg5hM9aAdJCEEdITyOW9vl2/paxPqsexf8Tl8vVPKyk3
	1JwxsvULOiBTMpS2UB1LucD1RLtwm/lt17McE3r7BZkceaNkjBkqeLJr5dIQKkCG85rPnLefPw2
	kbpYjDQgMMRKw2onwIumj68HDNXR8Az5P3II9Ziri/zBqniRHlziU5tje3Ujx8YQERsBVYbv/7E
	/wmBQeb1Sj98k9ElLNZ77XztyrHU5Qd9O6QxeDoi3zwSkJB0Tg9gFpzWozVBFDQxZgY2lvJ42cJ
	A+kMoCdQ68NauZ3eItGhZSE37i6WDj19gXjV346J1pk2j4q1FLw8DurPexeMiZSzSJuiQAfZcJE
	ydfZL4Bf29QL+pFeqkEW+sWxV83JLbjltafQtZko8UE9EGiGHNYYgalgIPs/ys3JPuw0Tot4941
	q7iRJHHzmoWFlxRver3aKaQw9+eXMA6e8CtjZEu97gFY41fAlObBFwUEcoTX3qTCq1lrXAF1Jts
	I0vBFxsdwmzVw4Nw==
X-Received: by 2002:a05:7022:b053:10b0:190:da74:2c89 with SMTP id a92af1059eb24-1ac5bda4447mr7716798c88.21.1793450365870;
        Sat, 31 Oct 2026 05:39:25 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:25 -0700 (PDT)
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
Subject: [PATCH 1/5] tty: serial: samsung: fix TX kfifo underflow on flush
Date: Sat, 31 Oct 2026 12:39:07 +0000
Message-Id: <20261031123911.3784690-2-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123911.3784690-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
 <20261031123911.3784690-1-samarth.colleges@gmail.com>
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

uart_flush_buffer() resets the transmit kfifo under the port lock before
calling the driver's flush_buffer() hook. Since samsung_tty does not
implement this hook, an outstanding TX DMA transfer may complete after
the flush and call uart_xmit_advance() using the old transfer's byte
count. This can advance the kfifo tail past its head, causing
kfifo_len() to wrap and the driver to transmit stale buffer contents.
The same issue was addressed in 8250 by commit 9e512eaaf8f4 ("serial:
8250: Fix fifo underflow on flush").

Add a flush_buffer() hook that terminates the outstanding TX DMA
transfer and clears tx_in_progress. Since the TX buffer remains mapped
while the port is open, DMA synchronization is not required before
returning from the hook.

A completion that is already running when the flush occurs may have
calculated its byte count before taking the port lock, so it must skip
the kfifo update if the transfer has since been retired by either
flush_buffer() or stop_tx(), which already advances the kfifo itself.

Fixes: 29bef7990845 ("serial: samsung: add DMA support for TX")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 640f85e2d636..2bea7ef078d2 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -317,6 +317,20 @@ static void s3c24xx_serial_stop_tx(struct uart_port *port)
 	ourport->tx_mode = 0;
 }
 
+static void s3c24xx_serial_flush_buffer(struct uart_port *port)
+{
+	struct s3c24xx_uart_port *ourport = to_ourport(port);
+	struct s3c24xx_uart_dma *dma = ourport->dma;
+
+	if (!dma || !dma->tx_chan || ourport->tx_in_progress != S3C24XX_TX_DMA)
+		return;
+
+	/* The kfifo has been reset: the completion must not advance it */
+	dmaengine_terminate_async(dma->tx_chan);
+	async_tx_ack(dma->tx_desc);
+	ourport->tx_in_progress = 0;
+}
+
 static void s3c24xx_serial_start_next_tx(struct s3c24xx_uart_port *ourport);
 
 static void s3c24xx_serial_tx_dma_complete(void *args)
@@ -339,6 +353,12 @@ static void s3c24xx_serial_tx_dma_complete(void *args)
 
 	uart_port_lock_irqsave(port, &flags);
 
+	/* Already retired by stop_tx or flush_buffer */
+	if (ourport->tx_in_progress != S3C24XX_TX_DMA) {
+		uart_port_unlock_irqrestore(port, flags);
+		return;
+	}
+
 	uart_xmit_advance(port, count);
 	ourport->tx_in_progress = 0;
 
@@ -1682,6 +1702,7 @@ static const struct uart_ops s3c64xx_serial_ops = {
 	.get_mctrl	= s3c24xx_serial_get_mctrl,
 	.set_mctrl	= s3c24xx_serial_set_mctrl,
 	.stop_tx	= s3c24xx_serial_stop_tx,
+	.flush_buffer	= s3c24xx_serial_flush_buffer,
 	.start_tx	= s3c24xx_serial_start_tx,
 	.stop_rx	= s3c24xx_serial_stop_rx,
 	.break_ctl	= s3c24xx_serial_break_ctl,
@@ -1703,6 +1724,7 @@ static const struct uart_ops apple_s5l_serial_ops = {
 	.get_mctrl	= s3c24xx_serial_get_mctrl,
 	.set_mctrl	= s3c24xx_serial_set_mctrl,
 	.stop_tx	= s3c24xx_serial_stop_tx,
+	.flush_buffer	= s3c24xx_serial_flush_buffer,
 	.start_tx	= s3c24xx_serial_start_tx,
 	.stop_rx	= s3c24xx_serial_stop_rx,
 	.break_ctl	= s3c24xx_serial_break_ctl,
-- 
2.34.1

