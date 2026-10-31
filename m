Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793457753;
	b=5e30MdccUkwLiF27O5nuuiqX6SjEp8/BfKBkU89Kr3W1lTt3wQhzaK7PPy+zrgqHPho1
	 mjWnY8xVBxB2Y2fn+iStOsY8MgvD7hXD2Qt4Cmlja8ICB3Y6dF3LGzsImgA2eVpSUu9j9
	 vId4XB66S+Uw5a6S03te2qOH7CBSBZTZjrwB+m6WiRwSY0nNByKHlyWLxxfodrc0Oyx8e
	 6sMxuslr6ke1o/f0/WsGWH7bdKJrPCmuuljjtUf5l+Q1d6ftlhu7rsgPX3jVbXD7Xm4/8
	 a+8uuZH7DaT9Cp7IJ2AJj1YnniI8ipHiiPRFY8Mdnyv15tdeOW2+tvpWt8vfftC1y3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793457753;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=ss0xSe+Pt6PgEZHV2e7Y3lWERQ/LJRcZPbx6UEcovl4=;
	b=o+X0l6nwGrlr2JRtyIuY8iR6lIrsPgKY9YNen3zaIIKcMrIFNSxW/tjdIUWSIJVuE55Q
	 UWgC7eJPbbB2WjjJWvwNAQI0gh5OmO27auG7Z4uEOTfO6eGHvKuRxDVoZzATQ+5M4J+ID
	 Z+115nfPM+UlgdDev2vZBDToHdC5DUWUtcHzvNBjOAk0f+9uNza0EwCzu/M8UXgszHQl2
	 hrwgufFi5suWeMSBnehS1wWi94N9ju+5pIxBSaLCdY4mL9Vv66kkr+lPmiRLEFjsBbbw0
	 asC2XNIbvkw0CFnf2HGl97uC/O51Op/yzIcB7mb9TrAd8f1T7dZ58tbyo6Pa3G27OPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b7P/ctYO";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B039606A31A;
	Sat, 31 Oct 2026 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7P/ctYO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A360A1F00919;
	Sat, 31 Oct 2026 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793457753;
	bh=ss0xSe+Pt6PgEZHV2e7Y3lWERQ/LJRcZPbx6UEcovl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=b7P/ctYO/CBg201eJj0ZK+tn1kX7s1EJz++EhMoYvwlGXLs0cXU++VeepqjW2/rtb
	 UeED/B1Dm4BDuaQ8wYnbb4PdXtQgHq75hWdcHLmKq6tF2biyPttbf/f97oksBKWTCe
	 X8P3sTwcs+S7UqLFy9XDzrUbfme4aotXxkcH1uabMEV4JsZSoZWVFmvw7KrvAyEIj4
	 AprmXsyglaA+nudCOf2cMJVY0cCrzy1eQUgj28QF6x7hVVW+ap8l4eXJ0tYjd1T6dv
	 3oNd4yK/42aVkSVL9dx/pOHknGJPhzcw273J9KPBHR3C7+5XlX0c+ByuGG7kljmDn4
	 DU1yTf4XwcVTQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Selby Mashiki <mashikiselby@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261025190322.449324-1-mashikiselby@gmail.com>
References: <20261025190322.449324-1-mashikiselby@gmail.com>
Subject: Re: [PATCH] memory: tegra: fix device_node leak in
 tegra186_mc_probe_device()
Message-Id: <179345775122.31057.3510152299401839631.b4-ty@b4>
Date: Sat, 31 Oct 2026 15:42:31 +0100
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Sun, 25 Oct 2026 21:03:22 +0200, Selby Mashiki wrote:
> tegra186_mc_probe_device() iterates over the "interconnects" phandles
> using of_parse_phandle_with_args(), which increments the reference count
> of args.np on each successful call, but never drops the reference with
> of_node_put(args.np).
> 
> Call of_node_put(args.np) at the end of each loop iteration.
> 
> [...]

Applied, thanks!

[1/1] memory: tegra: fix device_node leak in tegra186_mc_probe_device()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/3de6a98362e7c833ba78f5928890744ca9187cdc

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

