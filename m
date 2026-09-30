Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2C43C7C5;
	Wed, 30 Sep 2026 07:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753132; cv=none; b=kGYirlB7EnS/pD87d7QLbUzJrkRuo8PXKYb+0dZTMEXnVZDmAqqG7OiMhTtQhy9Tv7QVpBLNzhfLLCMVuXq2Hc9+E68z8Os+vCR+IH7dptPTUMl7ZauL2uj52H342PoLfXRo6tVy/HtMdp+gedSjSy/C2dODdj5nxOYbifoarRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753132; c=relaxed/simple;
	bh=JgIYE8W61qrqEZ8ujmPTGnjjie1SIq0l7uqEeiolbgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=maOkzhdTpOvt+VI0f11/zQA28GyBN1zDduU2oH2irtWLQJUf1oDdP8XfRvsxXoLtw37LFQ5y2WX6KjVNCyWaoOwysVnSFhaw7ii7SgOzfPCrd9g8CAd0bWem3nB6MeIXjvYxBbULc5v/7CsAXk73TAYuQxqQLR+ToU75I2JY+iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=OxRhz6TT; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="OxRhz6TT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790753124; x=1791357924; i=markus.elfring@web.de;
	bh=pvhzM+VtN4HfJ0s+uhLjjRj1fK0uG+E2hT8cNSl4zIo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OxRhz6TTJQLPV7EqI8WOv3CZ2E5kpxjmsZ5yAgsueLYj/v2XalpDgaWuJ37kcHet
	 I67j3ldA8zKAOYXcXr+4J274OCHer0cv7ygLcAGNo7oX3+eZ3higVHFYhprywBFCh
	 xYmmjsULglBUTkULit6lSCyJ3aBrARza+JnFAXqxxvENzsUvij+iJDSYRxPmqKbEA
	 kdFltGMX2ZzSigPhj3gKvAgmlfkR1POHdsDzaBMRaNBj1SY4DowmPHJN5Qca7ZWIy
	 nii3+GxepFkczPBUHuqqKbYtmZUt2wigLU3IBh+QIxiNIZ1JWHEu3fwvpzf0xgYXB
	 11Zv2RLxntQkl6UEvA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MTvrs-1xLCas039e-00WKZP; Wed, 30
 Sep 2026 09:25:24 +0200
Message-ID: <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
Date: Wed, 30 Sep 2026 09:25:22 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dmaengine: tegra186-gpc-dma: Read channel state under
 the lock
To: Ginger Li <ginger.jzllee@gmail.com>, dmaengine@vger.kernel.org,
 linux-tegra@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260930071916.35722-1-ginger.jzllee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pd2aNltJtWpkA8lydkutweqrs8H41t6OILQWdbHcPtDdZYkIKx4
 QGX2WhaRO8DvPCEcdrHRHNafGv6I4Pw/ceO11/4I86aMb7LvEQSR0QYTbGF6tydlWHGPuxl
 ZZWXzKF5ayP+Th7JsPwtnLgRnY06B8UkDby3tcqLBoPVpUPOXPmi3SGVQnwHGhsE/vEgdzD
 oWUheTL0XB2XOCQk6xzbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CZ3iHzITo4M=;0tsJcd8/heAw6cDKDhfSigLXnPI
 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
 qwjxmkP9onnOLv5Zxp8/l7

> My static analyzer detected a potential issue in the dmag engine.

                                                       DMA?


=E2=80=A6
> ---
> v3:
>  - Acknowledge the usage of static analysis in detecting this problem.
> ---
>  drivers/dma/tegra186-gpc-dma.c | 5 +++--=E2=80=A6

Under which circumstances will additional background information become av=
ailable?

Regards,
Markus
