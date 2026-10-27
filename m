Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793083973;
	b=2b7XmJot3ItoVDBzevZe5z2A6rXSs+85dYDsAm1z/+pfe0L85Z+7X4hn3qMLwAk9kQTW
	 0wok9F+eHCj96GDSuAutknXcedihSFLd+Rva02Z+cn4F+fJzmGLFXmW3PU64XcBsk5Ddv
	 zq/xVbc7TgCQk4Oh/GxIodBT9ZLj96dkA2odtQu48sG6Jrct8nPMI+A2QWBO16GF8ACy8
	 VuDJIZOAs4aYss1Evwb0aTpSHCN/Em9GDec2zb0RTCAmIXmoSdW5P5rHRYxCHiuorcV8v
	 uTNl+OJYMdQoOOE1pdVxudJEeeHqfJ83qbx2H9Y8sgst3NDNN1P+qkgdCytygJW1qPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bcuq2df4LWxKU06cO1cKfQHt7bV53cP3D5X0WMKpC5M=;
	b=T7b1uHnz6cT/jyrUL5Dxg4BaIOaR4fhUhsBGfnrs/RO1wGY8SXQcAPF1P6CIJ9VJf7r8
	 2Z6kyI+L34ERKtnclDVMCvRQQCbCA7bToaZMzTVaRnePUkdpCRErUd2Y0AN65d+pMUr2B
	 aKog06W1hp+pCba/tCAxoVVKaVR38wUBjgxh0YdYLNONbfJ2eU4mDIr5pelHpp3XgKdp4
	 DCSgOSHbS4gDXIp5EYqng9ShRs+JT/o7uGkhE91Il0Zceh9oeVU1ZwDo0nHoraNDIigZ1
	 vb/qRYonfS4EjL3M99KPnw40gQUblY3KPKF4b9NipFS/FJDZlOKz3MNTaFFriBSFhtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CyVpYmwe;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE2606A31B
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 06:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BAE2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CyVpYmwe
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so9484675e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 23:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793083971; x=1793688771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bcuq2df4LWxKU06cO1cKfQHt7bV53cP3D5X0WMKpC5M=;
        b=CyVpYmwexZ0bVEp0AP6HCD+adMbpynGOGrPpnbPVqkVSdUknZA4JinYq0I51kxx8Aa
         17jMEtKvvpyf6qJsb+JydH+g0gXGuN+gpDGCPywZi8w7SJkff9cmaY4GUC41TyRl41DM
         qD7lYaTVE+xOke0MyrzHq7xXdStA/EzCcFkL/dhcL1N/yvhuUCMLf4m2ph+ctGO+aI2y
         l+nhpfmo8m0zFLguHtoGeGbs5JAjWoVtefeElI/aiZd8obcTZX5IwfZSSpDP4nTW6Ut+
         b6g1/pCZedJSU4PX0NGcQqJekYsdDn1Fp4Cmw7tVPIdzIn5xFRARbGS3vl8i2WqWWLfN
         vnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793083971; x=1793688771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bcuq2df4LWxKU06cO1cKfQHt7bV53cP3D5X0WMKpC5M=;
        b=yC5XSVhQ933w3Isr7O0jU+BfVQbW6AxKroNaWC1kdRpoXj7QBS1+B65/AoUY2US9OD
         U1MhCg03Xmf6XVGcVNrj/H+FRMxbUezrPeo+QEpmydr5a8LW99eTpokOcfm4eyKm+Nkn
         uck3n2guu5a/Ix1vj8GAwN7qROkRDcvpeZZU+tt87xNoEzKWdOu757mh4asuVbncWfr+
         81r9nRoF+MREbFzhOV38YI5pviC/mnzjmFlR7nGjPU/WPsSSToqTLyMzFEDwmh9x6f75
         Ue8nv8oZX+Whyz3zmeN8Lv9MLbB+fdntcd75YG2SSPxLvM/eFjyrmKcClKYhnxlbQ9zN
         EOxw==
X-Forwarded-Encrypted: i=1; AKwUvBwr3K5YYCVA1sQC4xJZ1p/65mgvvPnJ0+Q9PTyWWvG667Y2nJSi1UL8mRwMQyuHAUngQdeLLF2FvTcbiQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLNmbpMD4BWNw8D3Y80tL8iMzdf2yGGXn0aQtR7xQ5LFcL73l+D
	SwClKwzeFVBoH1u6W9R87dbJKlSP2FVW0FA8tzaxx04FHyR9gYZB+F288HX+rhTCCko=
X-Gm-Gg: AYBFou3xvzwlOjh1H1gYMJnPFh0FI683Din0E6Xlk3+nA9GbMt+NId76s+Qjb8NsSZ2
	ZBsD+2h2aS69YqenP2x2N7igoAXESLis3Fg2Ba4L8yxT8fNShHWLR0rJmWQQ5TukSr8/pIAPiTm
	E/1wfKlt138AFewvJhi0oCJHnJSWIyD3I4yia0ECjxQHCpKBRH5zLOF3yKCUBlxmU9h8QuKQhJM
	fo9tAjlWJG7e1MF/RjtgWDo1sqPWglJegosN18s4i7iSldyFT/o0cSDZ7v+8giizwdEq1cRmanb
	U3Or/qkmN4nBCZC0gTlx0/ZcW74IGzdHOABh96OSGT7ivD2TOJQ+6jbDkb4m12TiTH5RlUgkQEI
	Y7uuYgylK4JlF2E5TrpxGYP1pGcdm3rJQfyx3OAoTh6XhB5W4JmeiyFCegcV/HTm2Nqw20bLe3z
	bURTYFGmywzx6RJi2PxMb99tzt1H4j4Tq89aYktGjGWvfLzv83yLXYayR01D8ssWxqxp96O7ltC
	VTrXzcQLL5tYgZq6SaEuA+Ygre/XAdG125ripPbkoIgCShsJUza0c6J/DG1o2UzKfPRH+IaiOcF
	REXM3w0+Ny1T3WVsvNIiL747yT3hlAWljL/qhlogfBAfsqPedbczKtPmqQ5HyZX+ln3Us2gMu3I
	qKLvXTE5/k7zokpdSyQZI/dIqvteVPjJpvR5CKeg8f1ka5DKBZi2nml30sUTIxHOrk3kYQiPXzr
	gKbwN+
X-Received: by 2002:a05:600c:3f07:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a35ac91137mr150192625e9.11.1793083971271;
        Mon, 26 Oct 2026 23:52:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm259282285e9.15.2026.10.26.23.52.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 23:52:50 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Austin Schlegel <schlegelas@outlook.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alan Cox <alan@linux.intel.com>,
	Stephen Warren <swarren@nvidia.com>,
	Austin Schlegel <austin.schlegel@arthrex.com>,
	linux-serial@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/3] serial: tegra: fix DMA descriptor use-after-free and stale completions
Date: Tue, 27 Oct 2026 07:52:39 +0100
Message-Id: <20261027065239.95915-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022-serial-tegra-dma-uaf-v3-0-129f6d67f673@outlook.com>
References: <20261022-serial-tegra-dma-uaf-v3-0-129f6d67f673@outlook.com>
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

On Thu, Oct 22, 2026 at 05:10:23PM -0400, Austin Schlegel wrote:
> Patch 2 (TX) fixes the same ordering bug in tegra_uart_stop_tx().
> It also fixes tegra_uart_flush_buffer(), which terminated the TX
> channel without clearing tx_in_progress, so a later
> tegra_uart_stop_tx() acked the freed descriptor.
>
> The bugs fixed by patches 2 and 3 were found in review (Sashiko, on v2)
> and have not been reproduced on hardware.
...
> Testing was done on Tegra234 (Jetson AGX Orin) with GPC DMA only. The
> APB DMA driver (Tegra20-Tegra210) recycles descriptors only after they
> are acked; the series keeps every ack but has not been tested there.

Tested on Jetson Nano (Tegra210, 70006040.serial with tegra20-apb-dma)
in TIOCM_LOOP internal loopback mode on v7.3-rc2 (5b0764a53235):

- Unpatched: queuing a 4096-byte TX DMA transfer at 115200 baud and
  calling tcflush(fd, TCOFLUSH) 5 ms later leaves tup->tx_in_progress
  set to TEGRA_UART_TX_DMA. Subsequent write() calls see
  tup->tx_in_progress != 0 in tegra_uart_start_tx() and never start TX
  (0/48 bytes received on loopback, TIOCSER_TEMT == 0).
- With v3 applied: tcflush(fd, TCOFLUSH) during in-flight TX DMA clears
  tx_in_progress and the follow-up write() transmits (48/48 bytes
  received, TIOCSER_TEMT == 1). Twenty rounds of 3 Mbaud loopback
  transfers with mid-transfer TCOFLUSH and port close/reopen completed
  with no warnings.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
