Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD9A353A8C
	for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 22:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785537719; cv=none; b=jGpKxi6KbU6yGR75Gx3W74ENrvXF0KBawWYdVjzdVtpYLlZpABepuMpzH2cfKUhWBiNXCsd1YOUoUx6ojxot17NeIULvhbb/g0fm63McHFRnZlO1u8/kVdN5y7L5kbMPpvZj1yXU5ujjfeZHarDJg6IjeUjoig6dxA61V8i5Zf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785537719; c=relaxed/simple;
	bh=Eq4+LvgoR7rpMQDzEWXVcrc6/NUq47RqVqosnWPlrvU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eVVxmnMj2EkiD/n8Nn76v3X7zbkz4/xfhbbI7pkQwA2RXTTRu3hb8fF9VWOA67nROKoMYB2wBNMg11lcY0FGwnmb5XFV0JmxVa3D0ifFQShUKFwFfHs+FCvT/QdN5VQd0mzUsIuY2tudegKUKsol8dos93ODXgbZ+nw7j5CKBTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0KKjty0d; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0KKjty0d"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 574C84E4106E;
	Fri, 31 Jul 2026 22:41:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28C286039A;
	Fri, 31 Jul 2026 22:41:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7D8111C16E1E;
	Sat,  1 Aug 2026 00:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785537711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4O9p1HgfmCPNuO8NrFXNLQh/x3qwmv7rnJHjHYwKXww=;
	b=0KKjty0dM7ebLLjGiCJKPaCQjGBzRbPIr9XjLPmQ+bpL4q8cu7H+1zyFd243pIJXOUxI0w
	qnBF5o7cj1TrnAd/fVBsJHnH/ld2r57x/y5hLhI55HrSEiYfyCz6wQHxAsvWWD96Ccy2/b
	Swtkbry9la+J/VJCnTZENyD2ySfmF+XqxORC72KxAKuQiuIpe6dDmyqnUWF5OjqDr9blqk
	JN+kWNzw9s+jr483d76Abh8yTTefuISnO8INgZunCszadmPo46Wwo4uVcMo91k9QD59Scj
	a49XNG8fcD9K5/8kB6wR1lcsE0TG+2ziyLzOobChCWqCEmgkseaNvn9VjG9R5g==
Date: Sat, 1 Aug 2026 00:41:43 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Neal Liu
 <neal_liu@aspeedtech.com>, Cristian Birsan <cristian.birsan@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
 <jonathanh@nvidia.com>, linux-usb@vger.kernel.org (open list:USB
 SUBSYSTEM), linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED
 MACHINE SUPPORT), linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED
 MACHINE SUPPORT), linux-kernel@vger.kernel.org (open list),
 linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 USBF CONTROLLER
 DRIVER), linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: Re: [PATCH 05/11] usb: gadget: Remove redundant dev_err()
Message-ID: <20260801004143.1b0d864d@bootlin.com>
In-Reply-To: <20260731035448.252289-6-panchuang@vivo.com>
References: <20260731035448.252289-1-panchuang@vivo.com>
	<20260731035448.252289-6-panchuang@vivo.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Pan,

On Fri, 31 Jul 2026 11:54:39 +0800
Pan Chuang <panchuang@vivo.com> wrote:

> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"),
> devm_request_irq() and devm_request_threaded_irq() automatically log
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/core.c | 4 +---
>  drivers/usb/gadget/udc/aspeed_udc.c       | 4 +---
>  drivers/usb/gadget/udc/atmel_usba_udc.c   | 5 +----
>  drivers/usb/gadget/udc/r8a66597-udc.c     | 4 +---
>  drivers/usb/gadget/udc/renesas_usbf.c     | 8 ++------
>  drivers/usb/gadget/udc/snps_udc_plat.c    | 4 +---
>  drivers/usb/gadget/udc/tegra-xudc.c       | 5 +----
>  7 files changed, 8 insertions(+), 26 deletions(-)
> 

LGTM for renesas_usbf.c.

Reviewed-by: Herve Codina <herve.codina@bootlin.com> # renesas_usbf.c

Best regards,
Hervé
