Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450379;
	b=s58ibiR+xVNZ67emTMOUWVkuwxtc5bKHzNtq0xUrayFe4CB4vs0JcTkJbrwCYfvjnYwC
	 18dOO94ZQw2rtdx+mHY/mu3MSPKH+10mmji3tiXDWJqUi+WCzKRPes9ixCSKz+4t5SCsw
	 K7djHNkbdW/EaYfPWJYFhYo2E5gr8yzzl5DcGVOawDQ5njPj6uBmN9rHfK3KF4WXze9Xa
	 uvp2+cCGK56rCwkoPH88BR2YeJfU/WVKZDuwuvEaIuybdgF5638BjwFzl8xzRMlH4ryz4
	 C+6iBw+F9cNHjo9AnigqlV57A5C8vD5XeUWIYBBAhvEirKuPMV2WcbFF4Wsp99NmfzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cnXM6OEqfvGVRy4AJACjTgyVnlWSquVpMq023G3i6Do=;
	b=ujBVCObtlO1g+MRbalxp829/y2vHl9Dnlkeo94A/wNJ3S6dErtVCXt5oNYJ2mJm5K1aO
	 1psoA/IjLVkBNjdigMAazPqdMpvLfRmNL3px+Hc82mhzj3+hWktJZiScMY+fxCN5hVdPT
	 ULcYA0yg3G/9B9QfkSu6C376nOp4635kitiDF2tlhtTTrd/YM/IKtWZ0Com9jeeowwRI3
	 bLkT/NyB61DBS6Y+nj1rk5WFHO5thPW4D0MK89D79cnwjjX7wQiNbojgLOwGIoWUuo3O3
	 w2ZLG5CGplzhp8VgO6tBFizFXyRjDuICIQ+wvR7gyg4H7gt0XgfZpD2oZWaPh7fdcUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="noT1P/WW";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AA1606A322
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 12:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14AA1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=noT1P/WW
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a2551d7b5so3419674eec.1
        for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450378; x=1794055178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnXM6OEqfvGVRy4AJACjTgyVnlWSquVpMq023G3i6Do=;
        b=noT1P/WWygxujj5N7CXMhW9KUUVBrILgHD3cyISauVEk/333TsPoEAmqe+vPvqtcRg
         vjg3LueDnm5cH58bO/1RkjL3Zyyhyet/YpGCw85fQZ6clqc8g5c2VvITHO7H4/IZHghP
         i3ItIumFpvLEMSn4TI/dPT0noFcxzmIels6683DS2IBe5sMFlIEcJ42hA8J58SCDMMXN
         oj8Hzu6Lei9XwPEZ1sIQjePY5nh4oDk7mBgwrJAybwT8ux/aOkmsmwM6NttyskzXEH/9
         b3V0q5e0X3miPnQ6m9M4hqBfxNIorRAN2b+on7ZzhuGhOBDcR88eVf6j4nCw6rBNPPVt
         likQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450378; x=1794055178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnXM6OEqfvGVRy4AJACjTgyVnlWSquVpMq023G3i6Do=;
        b=ha6rUYoYX7OdhfwG5WCtm+ElQ7gGMOoD6FQdS+E15ka7KOyTnWjS/zB4O9tTXNSGUl
         h+15CNK6OGdhEO82DDztJ/ru+hjtoN6ZRA6gJZwx6P+dgmsRVRccJxaALiSRQo5ZDeSq
         UxeD29vnErPkgawmiAJF8bAawAGSEDZXneNxogo52hVI8QDumuUUMmiRx1hYc18z54lB
         yciCRYdLFBjkEeWpoZXtiNXuk8yPnsLw/Rm6GFb5BPc5AeJd9ii6ynhthSQu2wprhHN7
         WRtehptfbfqA0r789qRuG9dBW7bWS+AGLm7FosWi7TEgLc0QomUifXufh7ulN2EyLeJe
         oA2w==
X-Forwarded-Encrypted: i=1; AKwUvBy5qmSw1ZTIl+RyXo4pllZYZLebkvOumeI6M+ya5IIdZJy4BSV75DsxhJQOL3FgayQOH6MJnNLUNq152g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJBHZc6nwIKnJ9gcrkL+mjF/moF8lLWhRdGpLUzDI+Qr1zBxFZV
	mKpv5UzEXDqFr+l8xGhwGsBDvFoRcJhAQYrg8ypy2LLVBVC+m92QnfKw
X-Gm-Gg: AYBFou2Fg8UcqujxxfdJGYhXqT1dTI8jFqblq/AyXk68CGG1N4D5hsEs0Oob4wkLEAL
	cKSwKMx07bU3YrOojJhEk0QEY6IoQ9/e+vy+AGgqtuW0pwEDHjpbjE4rrx4Vi/drXvOa62G+X86
	3+nUdjNMVBAvS6ZOe3Dc4YMcHf+Td+eIIY7W8jg4mQFV0OKqrNVRd2YGFF6faaMARuCYCNV+Lcy
	yppdqo/DmFP0QXrChZPBMo5REQZs0x8E8Zhu8IwOqEHnPsR3ufIpdjo0buYMFNfP+ebXaIdJ7CT
	Cy+6ZyIFmBNvNUMvb5escUt/tWtMwMy/wR22fQmhUYLg8vPuUa9YmGZsFVlKAUEhq6r6yj5G9Sm
	y2j29V8PMeiowXNcMzPtWDYEfULO9PHXJq8lx1rJg6SzbDdf6Q0ybtkVUlNZzhFdL0JWuQz1jxx
	FMVQLGYA7Fd0+yExiTzo5NOc1FckjnaC6TfYiUJfmTKfzoG0IartEqU0cdplRTSWuUJa58uV5sJ
	1flG5su+O3YuuyP39VyGM4J7WeKOAaRyWsZqUXtGxRuEwVtk9Vux+DjBwFh1IoBM7OeasFhZHs7
	O50kKDGRku/ogSrmO29A+OQvDmjHC9XwXiHjjxV5T1JwSvMj62sOQh++HGHbWbCzRVw+XBRHmRG
	43mpSvK0zDwrOon2UNpaFfrFb81A4NpewfsHaWrJ7Aj4FAdDb42H5DFeccnZX6iyBRMWv5NgDox
	qxsc2cXRpRjsoMhg==
X-Received: by 2002:a05:701b:271b:b0:148:ece:8cc3 with SMTP id a92af1059eb24-1a94adc93b7mr10542506c88.24.1793450377950;
        Sat, 31 Oct 2026 05:39:37 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:37 -0700 (PDT)
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
Subject: [PATCH 3/5] serial: sprd: fix TX kfifo underflow on flush
Date: Sat, 31 Oct 2026 12:39:09 +0000
Message-Id: <20261031123911.3784690-4-samarth.colleges@gmail.com>
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
calling the driver's flush_buffer() hook. Since sprd_serial does not
implement this hook, an outstanding TX DMA transfer may complete after
the flush and call uart_xmit_advance() using the flushed transfer's
tx_dma.trans_len. This can advance the kfifo tail past its head, causing
kfifo_len() to wrap and the driver to transmit stale buffer contents.
The same issue was fixed in 8250 by commit 9e512eaaf8f4 ("serial: 8250:
Fix fifo underflow on flush").

Since the TX buffer is mapped separately for each transfer and the flush
hook runs under the port lock, DMA cannot be terminated and its mapping
safely released synchronously from the hook. Instead, leave the
outstanding transfer running and mark it as flushed, allowing the
completion callback to unmap the buffer without advancing the kfifo.
Apply the same check in sprd_stop_tx_dma() if the transfer is stopped
before completion. With this approach, the data already queued for DMA
before the flush may still be transmitted.

Fixes: f4487db58eb7 ("serial: sprd: Add DMA mode support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/sprd_serial.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sprd_serial.c b/drivers/tty/serial/sprd_serial.c
index 3fdf5939a62c..718732b683f1 100644
--- a/drivers/tty/serial/sprd_serial.c
+++ b/drivers/tty/serial/sprd_serial.c
@@ -133,6 +133,7 @@ struct sprd_uart_port {
 	struct clk *clk;
 	struct sprd_uart_dma tx_dma;
 	struct sprd_uart_dma rx_dma;
+	bool tx_flushed;
 	dma_addr_t pos;
 	unsigned char *rx_buf_tail;
 	const struct sprd_uart_data *pdata;
@@ -236,13 +237,15 @@ static void sprd_stop_tx_dma(struct uart_port *port)
 	dmaengine_tx_status(sp->tx_dma.chn, sp->tx_dma.cookie, &state);
 	if (state.residue) {
 		trans_len = state.residue - sp->tx_dma.phys_addr;
-		uart_xmit_advance(port, trans_len);
+		if (!sp->tx_flushed)
+			uart_xmit_advance(port, trans_len);
 		dma_unmap_single(port->dev, sp->tx_dma.phys_addr,
 				 sp->tx_dma.trans_len, DMA_TO_DEVICE);
 	}
 
 	dmaengine_terminate_all(sp->tx_dma.chn);
 	sp->tx_dma.trans_len = 0;
+	sp->tx_flushed = false;
 }
 
 static int sprd_tx_buf_remap(struct uart_port *port)
@@ -273,7 +276,9 @@ static void sprd_complete_tx_dma(void *data)
 	dma_unmap_single(port->dev, sp->tx_dma.phys_addr,
 			 sp->tx_dma.trans_len, DMA_TO_DEVICE);
 
-	uart_xmit_advance(port, sp->tx_dma.trans_len);
+	if (!sp->tx_flushed)
+		uart_xmit_advance(port, sp->tx_dma.trans_len);
+	sp->tx_flushed = false;
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(port);
@@ -555,6 +560,20 @@ static void sprd_stop_tx(struct uart_port *port)
 	serial_out(port, SPRD_ICLR, iclr);
 }
 
+static void sprd_flush_buffer(struct uart_port *port)
+{
+	struct sprd_uart_port *sp = container_of(port, struct sprd_uart_port,
+						 port);
+
+	/*
+	 * The kfifo has been reset. Let the running transfer finish, so that
+	 * its buffer is unmapped only once it has stopped, but do not advance
+	 * the kfifo for it.
+	 */
+	if (sp->tx_dma.trans_len)
+		sp->tx_flushed = true;
+}
+
 static void sprd_start_tx(struct uart_port *port)
 {
 	struct sprd_uart_port *sp = container_of(port, struct sprd_uart_port,
@@ -946,6 +965,7 @@ static const struct uart_ops serial_sprd_ops = {
 	.get_mctrl = sprd_get_mctrl,
 	.set_mctrl = sprd_set_mctrl,
 	.stop_tx = sprd_stop_tx,
+	.flush_buffer = sprd_flush_buffer,
 	.start_tx = sprd_start_tx,
 	.stop_rx = sprd_stop_rx,
 	.break_ctl = sprd_break_ctl,
-- 
2.34.1

