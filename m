Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407662;
	b=1gE6xm9HFapYg9fNvXMrDcO0hj5AECRbgvRmFnNIb+SXOat9dj1wBLoVXXyK3JyBIi/6
	 Qo58qAyGFo3PMrqllWDEk7gt3ECU0MKAEsP5+IGItDm8ZiG5do3kSMfgZXT+59MvMp0dT
	 pxR5LfxjvlgkJIn98nzwGM1CIz6A8b0p+5Z+l5d92IDth0+l3HV0iTjSWakQ3PCKZihDz
	 +QIu0odyVpHwNCawSiBX02wQ0A/qO0ATkYWwAQJqfEfBKfqB+789RTD79IFyZJWEEgfyN
	 zyqW6TEIx5B1Eg5gRuS8+M4KCVIVPfL2zIoBKnPNzb0bIXFMHgXz6CIQjjUBlcP3nZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
	b=BJzm+RlAEEncT3J7e9osw0fDA4NNYju9v3D0v5ZSPfx7TZjR2rNbXMlMgWdwFOtpcpBR
	 mjyiZN+U1PRSp0lDxo97GwZqkvFitnRprknslky7MUR+mISXVRg67ZswN7AS9vhJAP+b1
	 XI0ITcNCE3C8sCkERjdapTjOoHdfqTe5DoQUuhGw6fci0lv1myXniZWFwro8xO7EeVP+h
	 fQAEXrfWClvED+5eL5+zSahppwJ3Rmz+TjRHBFYFGahhHJ+lkjtP2OFN/N5uAH+hXWPrG
	 VeNOyShPLnBZMUIk8Pue2434Fib1evYNv5Y0H3WnOkbCt0AN1EfCv6wXoDmfwEYqy4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJRDK+mR;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1AF606A31C
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 00:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B1AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJRDK+mR
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2195554eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 17:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793407662; x=1794012462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
        b=IJRDK+mRMeVNqm4z8zkrrkm0GNNjwiXPX2+viPyOK8zgiaefP8s19h7cOcU2VEcWoU
         PqS1XRCbjdYh8/g0znLNQU0essI/+qfLqU2xlyBU4DHp3tNzHFcvrLS2+rOiIVaJCWem
         kEaYuHo6CAuPnj+kPUfjxxsg/uCUZVeAq6n1gCrgRG2swHABFX5Ao65TGHmfT1wmdlg8
         x1WzbkGgr50xX0yR2P3DEtnPnCv35Knv63DNLVKWeUKLGcj6G31LaDCsMW5PoGfP+lrS
         6/DtObogIU9qrRnwiZhPWD0X3MwiZ+ZazfKSBeAVBoGiXe3giW9oRw/gjKDHqMDTKgir
         udqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407662; x=1794012462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
        b=wd/xLk7umjQ/5x6NHQwMARJI2zjIMQazLE80vNhHbIn0wYIvfG54nf89E5bVNe4DSW
         7D2gswkEav8+o9uiPpwUgMH2Ax/J+K0viHsMWb1BTM4cFIL2C9UCCinht84jk+Y8/lm5
         vJ4RxKGG+NkN+8yIK4mhYuT/oCDv68Su1vdyjem1L0IL6UD2IQt5Su/PDWRgc19BKr7Z
         P9WCD8XSuU9AOTY56HPfMFZuiEPz7zgTHMp4FvSzNO0c6aJaJV7NmIXoZuZ/Q7REWk2w
         VvJkm31HjsGPcj5fO2OOIMMvGu136th9Wsn8g6AP6I1OzUtdNIQWYFDQ1NLpWoUk5uCV
         yQag==
X-Forwarded-Encrypted: i=1; AKwUvBw8MIcf7csDYY/KqlQjaPzCYJc19zh5OVatbuthoD2xluYrsrCPuoPLfu+d7Nds5LaB5Gnyq3gQdoTDJA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLDlNCFCEEEEjPpYEVBwjJxAn24Cwi1iw6XcjXjGjXNYzhPIhjq
	HhWQQP4eWx3977XfCE1l5bNgV3Uy6IV0+QTxfbbm8SCMkwB8/OR0IbJ1ebDTkBpFanA=
X-Gm-Gg: AYBFou1S4YPziogZ48Y6LOJ/BwoVgQT46cn9mQunZUprBSzIb0tUNXykCHO2N7PRfOR
	Zj4BFlzcoictpiOO+HzgpAXahxsrvWzly4uz2N/M0Gt3FAaGNB68W159xVSzvt7cXeIkXXjnlMK
	sjTPwRzj+qO9rIV3JZCsyzb8zgSj60/36H8E/fLj2etP2xbKmMhuumtpy5NbSDWGYgxLqSzeQtp
	E8lqSz2hgqrkPx5WSAZA5v+07lFsrN277Z4k6S3Rdrfam6/bnuIKSFw+dv7x24eLkhTf09nzZ4j
	KkFXa6YFHAgW1IyhjCiRcT4s8Mx/X8ScT/ZIhLP7a5EWtd0kuJxYR+A3v/i7/jabBhjwWKJev5L
	GZAPUPcT1sJf5GLkznBOe0o+S5JCUPOZddTecX+DVrkwB5jlLXiTjkzRFo8OsmtOOlUAid4cUao
	l8b8jK4bEkJmkyQLMpSKZATFWbwSP7ufapFkbbCNN35geLPHddPpkaFl0U6vl+zOt9ZN3p/N8OG
	CXo6K0G3/+NPKWZcsNpkY2T+bTqcl6gGaVHZMYPKxaJOHmdmsr8H17h+uIgLyBWMWpsavtqWTRM
	wtegcta4fQZR4SEqIqBXg2XgZUg0LwjAsOSwxUHjabbGaUad7YFfCjObCVzBN6f+2e//fo5qpyt
	WW7b8/ompTnkh50W78smQCKDb/U0FQC9QBNXE1s6ZwhgSVMl/FQYoREodRKhhIQJFm23hJqT9HJ
	g4qLsFcc1+CowLgww=
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr5374853eec.13.1793407661421;
        Fri, 30 Oct 2026 17:47:41 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm12703100eec.26.2026.10.30.17.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:47:41 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] serial: TX kfifo underflow when TCOFLUSH races with TX DMA (samsung, sprd, msm, pch_uart, tegra)
Date: Sat, 31 Oct 2026 00:47:33 +0000
Message-Id: <20261031004733.3345841-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hi,

The TX FIFO underflow previously fixed in 8250 by 9e512eaaf8f4 ("serial:
8250: Fix fifo underflow on flush") and in qcom-geni by 452d6fa37ae9,
7ea38c49e717, and e3c04834ae1a appears to affect five other serial
drivers. The line numbers below refer to mainline at 83f32c773255.

uart_flush_buffer() resets the transmit kfifo under the port lock before
calling the driver's flush_buffer() callback. If a TX DMA transfer is
still active and the driver does not account for it during the flush,
its completion callback may subsequently call uart_xmit_advance() using
the byte count from the old transfer. This can advance kfifo->out past
kfifo->in, causing kfifo_len() to wrap and the driver to transmit stale
buffer contents. As shown in the 8250 fix, a subsequent close can then
wait in tty_wait_until_sent() until it times out. The issue may arise
when a large write is followed by TCFLSH(TCOFLUSH), or when the port is
closed while TX DMA is active.

Four drivers have no flush_buffer() callback and therefore do not stop
or account for outstanding TX DMA when the kfifo is reset:

1. samsung_tty: Neither s3c64xx_serial_ops (line 1679) nor
   apple_s5l_serial_ops (line 1700) implements flush_buffer(), while
   s3c24xx_serial_tx_dma_complete() advances the kfifo by
   tx_bytes_requested - residue (line 342) without checking whether a
   flush occurred.

2. sprd_serial: serial_sprd_ops (line 944) has no flush_buffer()
   callback, and sprd_complete_tx_dma() advances the kfifo by
   tx_dma.trans_len (line 276).

3. msm_serial: msm_uart_pops (line 1547) does not implement
   flush_buffer(), while msm_complete_tx_dma() advances by
   sg_dma_len(&dma->tx_sg) - residue (line 482). Its check for an
   already stopped transfer relies on tx_sg, which is not cleared by a
   flush.

4. pch_uart: pch_uart_ops (line 1518) has no flush_buffer() callback,
   and pch_dma_tx_complete() advances the kfifo using each scatterlist
   entry's sg_dma_len() (line 756) without holding the port lock.

The fifth driver, serial-tegra, implements tegra_uart_flush_buffer()
(lines 1272-1279), but only clears tx_bytes and calls
dmaengine_terminate_all(). Its completion callback calculates the
transferred byte count from tx_bytes_requested - residue (line 537)
before acquiring the port lock and advances the kfifo afterward (line
540), while tx_bytes_requested is left unchanged by the flush. Although
terminated descriptors do not invoke their callbacks, a completion
already running when the flush occurs, particularly one waiting to
acquire the port lock held by uart_flush_buffer(), may still advance the
reset kfifo. This is the same race addressed by 452d6fa37ae9.

The existing 8250 and qcom-geni fixes provide possible approaches, with
the former clearing the outstanding DMA byte count under the port lock
and the latter marking completions as stale during a flush. As discussed
in 7ea38c49e717, comparing the completion count against kfifo_len()
alone is insufficient.

These findings came from a research static analyzer that checks whether
uart_ops implementations using TX DMA provide flush handling that
accounts for outstanding transfers, followed by manual inspection of the
reported paths. None has been reproduced on hardware. The same analysis
found flush handling in the 8250 core, atmel, fsl_lpuart, imx, sh-sci,
and qcom-geni, while amba-pl011 is not affected because it advances the
kfifo when preparing a transfer rather than on completion.

I would be happy to prepare separate patches for the affected drivers if
the maintainers agree with the analysis.

Thanks,
Samarth
