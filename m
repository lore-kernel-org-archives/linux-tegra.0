Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656E2D0C62
	for <linux-tegra@vger.kernel.org>; Mon, 19 Jan 2026 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817969; cv=none; b=FH8Ja043E4AM8+VxJ7a3UlFsVFXcf4dIqv3wgATvKfy+ed4+OZrGITaoWDeg5QHj3F78uLQSsP8bX3NdrGMao6BEPdViz9bUUkuSNgJDzAhI2irG00SJrlDqY8M36Nn8Wd1NNAqg44oKbYruHi4r0l985Zc0QoKWOv8TxA7ObnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817969; c=relaxed/simple;
	bh=vkJ7QhWWnA0+byNJxAusoi4UVtpbBj1nRWD8RlGSPT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NsQSE+oEEEd8qIh8ZzHw6pjAszKvnpHHdwI9k7wSqSzhxViZ/9DueccrZnN1xKHz4FZJr9LzhBjeU3PAp0t9QcLI018DquJICpbNslSGPsx7C8FxAF8t9TCO/Wt99VWGZ/AlC0tXFGMbYt5PxoH7g1J2vmJPxpj1e8hraQDCzio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hQ3YiryL; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hQ3YiryL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 30E48C214C4;
	Mon, 19 Jan 2026 10:18:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D26B60731;
	Mon, 19 Jan 2026 10:19:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 606FD10B6A431;
	Mon, 19 Jan 2026 11:19:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768817964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7U95hX8xhuHK50tXFZKL1361n0NMWFN43s0ja7COG1M=;
	b=hQ3YiryLfffqai8EXuIq9hwnc+7vTu+lRME5nOKSOhmPN9W2z7mzFjUHmmGkaQpXynNny0
	txufss0TopVlZFEUheEaN+937sTAcY8EEcNLNx23+0U26ApfgixCToxtlyMTVs5cWKOOS3
	7POWdg05VK2fls2msSwSMErCYMARWTFsEq0G5L3t6aSUgyAtpZMTlhzScUR4M8294Ug/G8
	Fr6umWuefSJYvOv0z3G/bNAg/hIRwRiE8TwLCIEBI7idUQoJKoZJH+vR9sN35in/ThPRzK
	HDg6/j+v0lboxauuRvqFkQM1yfLwH8gvJb1h+bJWEDlDKguzcnHRm11YEB8rQA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260104-nvidia-nand-v5-1-0e147e416b4b@gmail.com>
References: <20260104-nvidia-nand-v5-1-0e147e416b4b@gmail.com>
Subject: Re: [PATCH v5] dt-bindings: mtd: nvidia,tegra20-nand: convert to
 DT schema
Message-Id: <176881796211.2442128.8985181716841573512.b4-ty@bootlin.com>
Date: Mon, 19 Jan 2026 11:19:22 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 04 Jan 2026 11:23:04 +0000, Charan Pedumuru wrote:
> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
> Changes during Conversion:
> - Define new properties `power-domains` and `operating-points-v2`
>   because the existing in tree DTS uses them.
> - Modify MAINTAINERS references to point the created YAML file.
> 
> 
> [...]

Applied to mtd/next, thanks!

[1/1] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT schema
      commit: 9986a70db37627cbe92fba288c2efcde25ad5c6d

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

