Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716118;
	b=LA4xD5K7cYLXZOAsHSC80bY+wipR4lxfiPcPRVWbw+OeYLtzWafOjCsZuo06LHASo76g
	 91rmtXD7YHxGfyopiHPphyzUJn7/+URmLoDc7KtN+ZvXS66SHbWCs6dQba/9yC1wGBYNj
	 WdYowe8kINdQjINcZS4BlbBdHyHQEHW9btD75rmy94xxqEHtNmCyr4WpxaDFh30Qir9Yb
	 41j5w28S6SZ37hgaWnhWTNBrIbG87VxJMCVK+ry0uK/LLjQuWniBLzl8zYUijr5VmquTj
	 Ykn+iq5diJ0P5BfdR4r1Qd6oT1qvsFOSZLQGrmcSEaf3tJWdZtqMBmOvME7hccqO9TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716118;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=kl7bg688dXQ0GAc0QXvKBX0thFl5TKdWcSAQVME7qL0=;
	b=sIJqEOaxxk+K5MtviQBS+y7inx6bKQ9mQu1OtkN32O8I1hUKUUoeOFjgVwfPe4KyfyHd
	 5O2E6U9a/8B55KXQlUsmp0MP5gYkzz0iJqDn7UqWai/xOzkvXdrKLYjPkvG8njdwZdNgl
	 hxLOQiHSo83ooqQrwKHVExQjPfETsO+oEWhUdyG/BHSmbgHGg+sHHMFoZOB9YuO45SoSK
	 6jiqcV1U+cTf92RsYLmCIkxvz9oiM6ckDJuGYrv+szAlDsqavuXrASukHpFP1s/sKIX8g
	 W/JE1PPnTjRyogVoS6PWENhSEFsWs0Dtirhooia6pUCF+aCiwDkKHJAmXEVqsOgFWdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=B3bSM3ji;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3128C606A31C
	for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2026 18:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3128C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=B3bSM3ji
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B24AE1A1824;
	Thu, 26 Nov 2026 18:01:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7EB9660558;
	Thu, 26 Nov 2026 18:01:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0528A11E69167;
	Thu, 26 Nov 2026 19:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795716111; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=kl7bg688dXQ0GAc0QXvKBX0thFl5TKdWcSAQVME7qL0=;
	b=B3bSM3jiUK4noIe6e1knXOQNbSpWZfGs3R1GXa6wZ3FImgsCFptNW6q0DzKt+gmqZvJQwr
	dSDr5dkmCUujMxkPkyiCmAu5OIPMV2KCIB5nIqOnhcWe8/cpFFuLy0q5S2eyDqRrlFYASw
	BLVGru3+EVfYM60JVxcPnUdxeTeLHvaURR2I7Jo2V2nROSta4wyy2wmxD06IUhaWbe+A/C
	n4ZaOb7a3xXMHJ/zTBslsJw4duEKvRGRIzNtI+1kIUoRR0GvZCZ9NKhKTzCvAgPMUOh6gf
	36MLWOi+y2LzIHyIWhRKguPoWy8G4K0y5cLjKMrqBLFbP7dAdE+j/2+nFrRqRw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Stefan Agner <stefan@agner.ch>,  Lucas Stach
 <dev@lynxeye.de>,  Thierry Reding <thierry.reding@kernel.org>,  Jonathan
 Hunter <jonathanh@nvidia.com>,  Dmitry Osipenko <digetx@gmail.com>,  Boris
 Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-tegra@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: tegra: drain the IRQ before disabling the
 clock
In-Reply-To: <20261108-submit-tegra-nand-irq-teardown-v1-v1-1-2c570ad4a22c@gmail.com>
	(James Hilliard's message of "Sun, 08 Nov 2026 14:05:55 -0700")
References: <20261108-submit-tegra-nand-irq-teardown-v1-v1-1-2c570ad4a22c@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 19:01:45 +0100
Message-ID: <87se0nv5di.fsf@bootlin.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 08/11/2026 at 14:05:55 -07, James Hilliard <james.hilliard1@gmail.com> wrote:

> The managed IRQ handler remains installed until devres cleanup, after
> removal or a late probe failure has suspended the controller and disabled
> its clock. The handler can still be accessing registers at that point:
> it signals the command and DMA completions before its final register
> accesses, so waiting for a NAND operation does not drain the IRQ handler.
>
> Mask controller interrupts and release the managed IRQ before dropping
> the runtime PM reference. Apply the same ordering when chip initialization
> fails after the IRQ has been requested.

Can we instead include power mangement in the devres logic? In general
when one need to manually devm_remove/freee/unregister(), it means there
is problem and the solution is incorrect.
