Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195547;
	b=OFl5EKUI5N6ZrtomXVjOsgndrQ25qB31SZY8KoGMfR17nWPzJlA/GiseJFTYtMA6GrtR
	 qCYGBZtCeTYIIO7xbC3aWj3mA/ktBCKRSW4no1zjoaFmm2UGDoL5p3LXE5CDjR+1Np+X5
	 YOypA3Ha6T+kgqiaoW1QC3Zj9+tLA6+9y123bZDOD1xiDDAb4EhMPY1QPdnoyNJZxwKx7
	 SqtQbm8az77196jUIwoXa3d7ycKkMKFUL+kbMcgSVzcEe8j5PnJbdxVEiejR49h5mAhqz
	 OWSV2q8I1tHDAenST3sdjb76DE1hMzhGk8G0JWcr9EmX+wqUtM9X8OrxvuYgRgfaTMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195547;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v+WG65pANaVwCNqbqLgEEHhTXKrwC0yMtmx16EDj1JI=;
	b=OlGJTLKSMueUgcMOYcT9zVx9mzTP/CyRd5Up4BbgA/VPfWm8urnDP7z4rWgko3XhcG6i
	 oXTFw2dFIbvXJ5KCR21x2sbdLejmCJJIvWgRHt6SWsB7ci00SOoRextZogzrCJXHyrrOh
	 f70JWz6U+yk71jMi2W1rdgBp5smFx41E82E9RdK1YNck1rkkKB2b+iNH6pfGtAEwzPeEQ
	 +skp9P2FpNPp33/Zdb0Mc2Mabu2Jc0Um9rW7t+hwjMv/je5a/M5W9gWSciDJ1cq+TRqmE
	 LeE9Y6okYK+/KEw4kf5WJq5kpDo/bt8EfUNAkfvyRNqUKJv1ji8yCRy1HHKnbZlrPHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIA2pec6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99659606A31C;
	Wed, 28 Oct 2026 13:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIA2pec6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77EB1F01825;
	Wed, 28 Oct 2026 13:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793195547;
	bh=v+WG65pANaVwCNqbqLgEEHhTXKrwC0yMtmx16EDj1JI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KIA2pec6cXMtBj9YkyCvNCZqBVcIswQX3vCvKJWnAU8c60i468rptoRcYRhjau0oy
	 pUODume1dwssoa0tu0+asKKEb6CV4aslTSRw+/foFtSyOeE+E0y0W/sLqXfdbBj5qV
	 fDlccuNes9tcy35Fk+tbhY7F8x/S38ZfZbcDhKIwC5VGy1yhRbKr5bYBLSOfEwc9cu
	 upO72e3zUMlHxvg/vmL+FlRqc/siG3wZ+Z9RASgdbfY2X71Q0PzCYFU50/7sdEUmym
	 ddgkAYpwQsUc6SUhP9qrHCqkQ+N5J7iOn8Du5BEAIEeXeDIeo22HzcaaTZ04ORa4kw
	 4V33GcOxz8JAQ==
Date: Wed, 28 Oct 2026 14:52:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Johnny Liu <johnliu@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Douglas Anderson <dianders@chromium.org>, Aniruddha Rao <anrao@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add Tegra238 BPMP clock IDs
Message-ID: <20261028-enlightened-khaki-leech-7a3fb6@quoll>
References: <20261028084900.1047287-1-johnliu@nvidia.com>
 <20261028084900.1047287-2-johnliu@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261028084900.1047287-2-johnliu@nvidia.com>

On Wed, Oct 28, 2026 at 08:48:56AM +0000, Johnny Liu wrote:
> Add the clock IDs exposed by the BPMP firmware on Tegra238.
> 
> Signed-off-by: Johnny Liu <johnliu@nvidia.com>

And the compatible is in the next patch? Then squash them. Bindings for
a device is one patch.

Best regards,
Krzysztof

