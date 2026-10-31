Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450373;
	b=pLiShF72rjJcAG8VYBq0wdQGliVffldXjgSD6GrT4b6xeWu8Ttubk+gO5pVRc5quHxtD
	 O7dQISDZhPkTd6ClWsoXVBCiAeSqmPUirynE1dUmkZvyVrECdDhN4vt1GlM3OGq7BYA5+
	 YhZ3rHFT76+tmBaUs4Ea9kJFn2cX58v6XsEiE3aY5RgX+IYV44Q1N5BJnJT+qcIldPtZm
	 t1EX4Hw9EytzZtpRNITKpq/QjGhLbgbXe4HH21U+4VaVd2NNxF9jUoJKSQAZr95r83jMa
	 bKFFp4kq+KOEnlT3ieUP7APO7xTIC5aj3KTVjSQ/LpdNgolGLOrqy6hWJsewXryF45A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
	b=CfY1waVKIiITVpj91ozwxxUqf3gW3A9Ophoqo8fp7riIgcY5h+NfaeX+SozXWQJxLiZK
	 mQr4Nk1z3kwj8wsQ6yoZVJznBfzpNIhMFj7XcojfZ8rVztotexQS7hw+nF50g/SF9nC+I
	 VpA+OEJ/zEhd8nSLHgocTESvZW0Fk9Q5ltYS5V/fFnYSsxLiWfnVBsGHlLIm5kRJmo+Fs
	 jMJy20krcXHRrlTI/GIhbBBN3HG/8jmnotQvW4E67twDtfSVYm4nQvx9y0k3Ji5z5YLpv
	 KK+Qlyu7vIOXogzDbvZjyl2ZcJ3L/d1MxmoDoPxXuu8cLcrCokDSwmrAfaha4v5XRbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMeYLSu8;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B393606A324
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 12:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B393606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMeYLSu8
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso374173c88.1
        for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450372; x=1794055172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
        b=MMeYLSu8Hfxb4MMwRmB6e+af88Re5khoHp3/t2EUBiUGkWoq5iAZ1cjS/455NZJMYc
         IujJzHWomO3jTDNhqb6DoiExYizct5Q5FVUJmFS7XuCy2LxUc8jj0Oofyc0IHl+EntE/
         eUcP2z4Ax8+oIgGKpmcRfzMrD9dQdamJcuC3zrvef27BS8pSvZievFDvuWoZs0CqMcCq
         3vKRYyOQMEzwBfi2Zm0+f/C1csutboBvSRGc8Yte8xi/BQo0n10Jw6RwB6XCFvO+KJ09
         hZWMahyBeZ0zoMbqMmuxiabU6Q9VNG+7uRaQgI//VnxikZbVXNq/V6EAx1/ZV4NVzTzt
         LUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450372; x=1794055172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
        b=jl+K87M0ZG1S3I4/k2PmbLRLNPMB5Imi9ftc1Xn+nYiLfam1oDuXJ5sPt3WZwK6MDv
         1W4l5/864KB1La1G2001WhpZAhTSFdVHnapG5fxDiAru1xgrVUsWXq4mIpk9B/WhXMcD
         XKAO5A1tPcQ4A/3+vtMyOTEnbJ3I5zF5h9zQIYwAVXAmDVnLmW8FCcKkEVfc0zi4gXNj
         AZaZgFWUUpxH2u5OguASPEyALhkvRXInJSV532S6EezdxDRDnpQyfjkb2vaN2Q8bFaAz
         n3ajRwTgYl41QrY9WFyWt7OVrpkWbkPmr01W7QnorhFNDGWpXcW38HQ2SrxsxRq7vKvi
         EZ4Q==
X-Forwarded-Encrypted: i=1; AKwUvByxQJ9qw2Jg96TaEGvuaQqf+5/6ZN7OuQmBQDpn0DtjxVG62+UrqOS3tvzLxaLPjJ9n1Mwnust4+hXREw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJVVUGXOHI6c/JMWEZ5DsfWym2RGIs/Rccs6oNlX8kpQomSgAXG
	c/Ihbl4LJTgLiiOhG16AQpPaGdGW5QMNBn/SVP5uvmdqXHk6qn5KUdjXdgCErEpaC5Q=
X-Gm-Gg: AYBFou1UDn8KHbUrKxqMJ+Aae8i+M3Ano0HKe4WzitGnmbV9gu5DWEDlCzRNgvnSnFB
	ZRm7L2jhryIrGHCOHvGX6pWwUiXIn/soppHvzDwV975vuNtVHvHUQ/gvwJscKglfLjAkYUoDcgL
	MQBXhQqGkzWeB4pUTCO6pGKUiaxQy7ljbVuFq8Qz0857OBYyk7kcj9UwjMFC1vY451MylqbVFe6
	XkPbCn2RBQ/xQmEt4Xk6N6KQpZHgbaIN4i6oenTxw/lwzLQHYCJ8cEs17iUWgnbQojNuKvmAQsh
	WlU31s36EJ4pk3pD4gVNPvzvwtA2GySpTLM0luRinY/doUDpjWn5g/Mx0xTAcWbEiOs3VGOSV39
	qfT+Rbrkb5ewLDggjEC1NA+yq5HHP0ApXRcRFsGvpXFRFjfBBIUiLjnzYKdy34qOJ7odM4ez7mT
	UOD2m2Kn82xcdv+rt38nbdEdyf622zHhnai0M1n5A1MSFpPUUTztOtuwtL5ebORDX+sonkOKIU6
	xZ76uwoo3LoKSY1Lvf3RRjhgaz1Ru1zGI2sGrx+1rCi+v+bMroPXwqzE7QcmRpH8R7zVZ8u0y4n
	qkd6RSn9qHNzad/X36OyXuUq2WiJRAG8ok9YnU0X7Nj0D26LS0ioN/zko78Brrn4C7EeIMmEiqC
	M7gK2SZAds9PMpi7YpMxDrbaeirmvZMJNA0mXNrpzN3B8owTK13haJu4iP1LFTR3+XMAwz3wc0f
	t9hl4cWiI5jrvPjg==
X-Received: by 2002:a05:7022:294:20b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1ac5bda4837mr6575924c88.18.1793450371863;
        Sat, 31 Oct 2026 05:39:31 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:31 -0700 (PDT)
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
Subject: [PATCH 2/5] serial: tegra: don't advance the TX kfifo for a flushed transfer
Date: Sat, 31 Oct 2026 12:39:08 +0000
Message-Id: <20261031123911.3784690-3-samarth.colleges@gmail.com>
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

tegra_uart_flush_buffer() terminates the TX DMA transfer after the
serial core has reset the transmit kfifo, but leaves tx_in_progress set.
A completion callback that was already running may have calculated its
byte count from tx_bytes_requested before acquiring the port lock,
allowing it to call uart_xmit_advance() on the reset kfifo after the
flush. This can advance the kfifo tail past its head, causing
kfifo_len() to wrap and the driver to transmit stale buffer contents.
The same race was fixed in qcom-geni by commit 452d6fa37ae9 ("serial:
qcom_geni: fix kfifo underflow when flush precedes DMA completion IRQ").

Clear tx_in_progress in the flush hook and have the completion callback
skip the kfifo update if the transfer has already been retired by either
the flush or tegra_uart_stop_tx(), which also advances the kfifo itself.

Fixes: e9ea096dd225 ("serial: tegra: add serial driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/serial-tegra.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index b0fc4ae3686f..8b712a9bc293 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -537,6 +537,11 @@ static void tegra_uart_tx_dma_complete(void *args)
 	count = tup->tx_bytes_requested - state.residue;
 	async_tx_ack(tup->tx_dma_desc);
 	uart_port_lock_irqsave(&tup->uport, &flags);
+	/* Already retired by stop_tx or flush_buffer */
+	if (tup->tx_in_progress != TEGRA_UART_TX_DMA) {
+		uart_port_unlock_irqrestore(&tup->uport, flags);
+		return;
+	}
 	uart_xmit_advance(&tup->uport, count);
 	tup->tx_in_progress = 0;
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
@@ -1276,6 +1281,9 @@ static void tegra_uart_flush_buffer(struct uart_port *u)
 	tup->tx_bytes = 0;
 	if (tup->tx_dma_chan)
 		dmaengine_terminate_all(tup->tx_dma_chan);
+	/* The kfifo has been reset: the completion must not advance it */
+	if (tup->tx_in_progress == TEGRA_UART_TX_DMA)
+		tup->tx_in_progress = 0;
 }
 
 static void tegra_uart_shutdown(struct uart_port *u)
-- 
2.34.1

