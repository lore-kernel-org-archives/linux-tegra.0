Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450391;
	b=UDOkH3vJ1vxBW/wo2gZSCxBVK93bh6VaEaAKa+oKZKqIKIYEIBNT8CiHVlMcvKlnnvnY
	 IRTZ/KITOO1g/IaQbB3zin9LHIsNnXPBvtuuGITUGRuDy6o4cdTL+myUQ64LIqn/M/YXf
	 G+XA9ODlpyHr3t8nw+w4nxWrTVMjI2wVi+jkU5re1B8xMXCaEVur37/5Pyded/HPCWKIy
	 sZcnG9nqh1QpBR0Ol3jNqYlPLGM/VrhzuXUNqaWWnzhhq787WQE1SnTyKXSRFiJArYgNh
	 V+TfmB44Zruv6esAueY3mRFL6GgBQEUYGt7vMk/aJKnMQUiWfaHS6tzDW34iVK8TVxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XmGfQWvcvFmnjKr+xP8taKEHDJYND7b+j1Gc4pD7Vlg=;
	b=hGJg/dFQIP9MPYDJRBLSQdAaKpnqBac00i9fAEHTFj/KC5S9ZqrUZv6dy2Sv1AMJ/iJE
	 nvFm/RNkIhory7Kc0rEakrlGOuFFAWNPKNg6WwIQX7qWFlozzJEdWmGcJxePpPUk5mI7g
	 /oreZKA3fsyzcEzfzsRuanGPoo4L8flblGzwctayTAMpx1qEUM1SNuTlYdy+hqxxKNjtU
	 zmFnOA2GIteB8fiws6Vdc69KjE2c0XdDZqbS/asS5TuqpsaThSFXHGT9vPYGEZgdhhhFT
	 rF8B20Z5qivcE9MvEdni+J7Lp5qGGrX13mgOVbXchb5CkPzuv1P9QUwynS453+yXvRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTVaLVj4;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC853606A31E
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 12:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC853606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nTVaLVj4
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15dd124bbe7so1050695c88.1
        for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 05:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450390; x=1794055190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmGfQWvcvFmnjKr+xP8taKEHDJYND7b+j1Gc4pD7Vlg=;
        b=nTVaLVj44Ub7z74cDC1wz876qdD4BKmWpGUd3aathGvyrzUmTNX/U3B41UPTFFFqjN
         x70xLLXEJR0xkZSG2Hv65YNG7+qMPGDvnGGH1Y6MJSXnCL/rRVHa8/tVJW9LJIoYlEA9
         6dXLZ30iqlNeaVxJlOXtpdzaym+La7NnDByhobhHux8WMrYR54d3/v/kt7kyefLtQDqx
         7q8SH8uUvxxsRgNDzao73J8zRBih/KHAA83YUuTGm+5mpJ+STug39hfBE/4SVHn+J1Sg
         qqxqi+l2Ygzq1WqLILBFDDg1fsnLdB/XIFsKTiXNxR9GrGrVJ5brPoJwKKqkfi/pVEPN
         p8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450390; x=1794055190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmGfQWvcvFmnjKr+xP8taKEHDJYND7b+j1Gc4pD7Vlg=;
        b=SWtmZp8r81sjbzfR3QScRgKyfJ4lRoYdlmOn1PrPwLAJyVDBCrauV0VFAX36ycXq7F
         tOlGNGpjIHo5McOBrxMfFH1Bw/Qmervf1AdwiFwf1Y0xB7DyUBUZDadhKVCWI1h0OlzW
         PxW8trA7lqjZMQf//k3Qqf3FuyjR07TurVWg+dNCf1nEd9SzYlpltNS7H5yT2O3zL+/3
         dYjdRS8rW9vn89kS2p87h+JCksFQeRefue4a+BHx4PeAmhgJN37M/84vuUHSjdNJOpV+
         BE9r8tmAYSG8rOW553O3ZZnjM0I7TbdeiOqr+HXNtt29+E60OyC/XMUuS5UVBxvqCHEu
         rRQA==
X-Forwarded-Encrypted: i=1; AKwUvBxw/kvx1Qtz4+oMaaaxhboGoWIbDNveMqlGAMSDPIkwfXDncgbT6tJ/zLaYYjsPc/wpFTlXM4Q59pE1bA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLi/IecRmpzSbu7/ECzxeEXWRZAYA5CQzpp4aIiwZAq9eomLvO5
	wd8Z3gGwh8rwNWE+W031pDFLg/lBrADvMdBlXZXyNW5ooIScMaNU8DYq
X-Gm-Gg: AYBFou0fNVp/Kcm+kjE0p98ySLnL0M9azwlv/J7YKT5JlBnOmAgGNgzxk9a5q5/jb9n
	Gr25LgbgCugy5PfRsZEbnGGFAq6E1W4jRRNYUYlpcoomGU5RHNjNN25PzftDgkpqBibt5vOy8tJ
	ygmdCmt69KeiQQJkJeygNN6UWJz31ST0sp8wsYsusB31v60d24IBApFITOj5D+BAUcedSRoaj43
	AttslsHa7r5QpVMxEEpDVoKTQjkcUuhGBUCN/7zlvVA6AXpJ1CD12Hw0f8kxvgRY3Y4+MKA5fE9
	KMprHDx+QCVk9do88da0WFScjqKqskgTgImsZb2EeZ6lR0JVU0DwFmQP0RmKVEoDTz4zNO9ToHa
	uQXWQn2cTjT2RDiGy2f/7kNeKc84c1hpUaok4es0JsFkT5+P/IXEBEF9A26NScGQw6Cpx0K7Gq1
	WPl3cIEKcgjUDC/x2Z8c5Sacqh5M48zaa6otXdK10yCpTqzwDH2XEgJxuQeXUNYdCk9fsOEZjJg
	vMnIzWo2laKjQUBeorsUCMVBnlokUByFt07np9ka1CJQxs+ivhhFDiF4rlAWs+tE6CXnrfI60jX
	tKVtIcWhGH7TuWPoZSudoVU2Xovaa4XspSgyXJ3aju8Sgxy4mY40FCiELhRvH8+VqTeMouYsEQS
	LXrfKeqDQ3uiG5wnTc1q1x5SmsD54CF/LE3wjJnx5eH7TW8mpCxTR7qChkABYlNyw7qVd1djG3B
	kN/6NqEkPENHCDNV8=
X-Received: by 2002:a05:7022:5f0b:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1ac5cb18717mr6418421c88.40.1793450389793;
        Sat, 31 Oct 2026 05:39:49 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:49 -0700 (PDT)
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
Subject: [PATCH 5/5] serial: pch_uart: fix TX kfifo underflow on flush
Date: Sat, 31 Oct 2026 12:39:11 +0000
Message-Id: <20261031123911.3784690-6-samarth.colleges@gmail.com>
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
calling the driver's flush_buffer() hook. Since pch_uart does not
implement this hook, an outstanding TX DMA transfer may complete after
the flush and call uart_xmit_advance() for each entry of the flushed
transfer's scatterlist. This can advance the kfifo tail past its head,
causing kfifo_len() to wrap and the driver to transmit stale buffer
contents. The completion callback also updates the kfifo without holding
the port lock, allowing it to race with the flush itself. The same issue
was fixed in 8250 by commit 9e512eaaf8f4 ("serial: 8250: Fix fifo
underflow on flush").

Since the TX buffer is mapped separately for each transfer and the flush
hook runs under the port lock, the driver cannot synchronously terminate
DMA and safely unmap the buffer from that context. Instead, leave the
outstanding transfer running and mark it as flushed, allowing the
completion callback to unmap the buffer without advancing the kfifo.
Take the port lock in the completion callback to synchronize access to
the flush flag and kfifo state. This prevents the underflow, although
the data already queued for DMA before the flush may still be
transmitted.

Fixes: 3c6a483275f4 ("Serial: EG20T: add PCH_UART driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/pch_uart.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/pch_uart.c b/drivers/tty/serial/pch_uart.c
index 9505d255f09c..122025c4a0a6 100644
--- a/drivers/tty/serial/pch_uart.c
+++ b/drivers/tty/serial/pch_uart.c
@@ -230,6 +230,7 @@ struct eg20t_port {
 	struct scatterlist		*sg_tx_p;
 	int				nent;
 	int				orig_nent;
+	bool				tx_dma_flushed;
 	struct scatterlist		sg_rx;
 	int				tx_dma_use;
 	void				*rx_buf_virt;
@@ -750,18 +751,23 @@ static void pch_dma_tx_complete(void *arg)
 	struct eg20t_port *priv = arg;
 	struct uart_port *port = &priv->port;
 	struct scatterlist *sg = priv->sg_tx_p;
+	unsigned long flags;
 	int i;
 
-	for (i = 0; i < priv->nent; i++, sg++)
-		uart_xmit_advance(port, sg_dma_len(sg));
+	uart_port_lock_irqsave(port, &flags);
+	if (!priv->tx_dma_flushed)
+		for (i = 0; i < priv->nent; i++, sg++)
+			uart_xmit_advance(port, sg_dma_len(sg));
 
 	async_tx_ack(priv->desc_tx);
 	dma_unmap_sg(port->dev, priv->sg_tx_p, priv->orig_nent, DMA_TO_DEVICE);
 	priv->tx_dma_use = 0;
+	priv->tx_dma_flushed = false;
 	priv->nent = 0;
 	priv->orig_nent = 0;
 	kfree(priv->sg_tx_p);
 	pch_uart_hal_enable_interrupt(priv, PCH_UART_HAL_TX_INT);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static int handle_rx_to(struct eg20t_port *priv)
@@ -947,6 +953,7 @@ static unsigned int dma_handle_tx(struct eg20t_port *priv)
 	}
 	priv->orig_nent = num;
 	priv->nent = nent;
+	priv->tx_dma_flushed = false;
 
 	for (i = 0; i < nent; i++, sg++) {
 		sg->offset = tail + fifo_size * i;
@@ -1150,6 +1157,21 @@ static void pch_uart_stop_tx(struct uart_port *port)
 	priv->tx_dma_use = 0;
 }
 
+static void pch_uart_flush_buffer(struct uart_port *port)
+{
+	struct eg20t_port *priv;
+
+	priv = container_of(port, struct eg20t_port, port);
+
+	/*
+	 * The kfifo has been reset. Let the running transfer finish, so that
+	 * its buffer is unmapped only once it has stopped, but do not advance
+	 * the kfifo for it.
+	 */
+	if (priv->nent)
+		priv->tx_dma_flushed = true;
+}
+
 static void pch_uart_start_tx(struct uart_port *port)
 {
 	struct eg20t_port *priv;
@@ -1520,6 +1542,7 @@ static const struct uart_ops pch_uart_ops = {
 	.set_mctrl = pch_uart_set_mctrl,
 	.get_mctrl = pch_uart_get_mctrl,
 	.stop_tx = pch_uart_stop_tx,
+	.flush_buffer = pch_uart_flush_buffer,
 	.start_tx = pch_uart_start_tx,
 	.stop_rx = pch_uart_stop_rx,
 	.enable_ms = pch_uart_enable_ms,
-- 
2.34.1

