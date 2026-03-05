Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8F530F932;
	Thu,  5 Mar 2026 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698333; cv=none; b=V8PgWbeMXJ5F7x1fX4IJpCbCkG4XNEcEZYZuoOk+JwUOLqoy0EYW7xPkc6uYK+E8wqiLYVw0IrOoj07naaAzE+hj76LWbC+lXtBzQYV4a5Z89VpCH34Xa9ktBZy9zCKWafQMtd1EN2ekAv1vp044n/jBnq8bTIBKjR3VZMKBXFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698333; c=relaxed/simple;
	bh=qhIDiUOpJGUOHKetZKcw0dA0wuDpf9VhjdgGMlIEdTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nw8vDxfZXZg6uZNEuILqAacBU20VNkG7d+5d9iqAZrMFp8d+lyYOnDd5t9a5kDss3OTcfrPXqBEO7UeB/xGbhuofffZ9OLttYmN0bzROTdLC1NULFJ6lbyagf8fuARUyXUPo4JiuYvgFfO5uEOJmSt050c5ZB/QTmuqxtQQiTKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pVElDDFa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pVElDDFa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FD9C19423;
	Thu,  5 Mar 2026 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772698333;
	bh=qhIDiUOpJGUOHKetZKcw0dA0wuDpf9VhjdgGMlIEdTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVElDDFaW8UyP1bYz0ioQjWGgyilhCihlygdWb5JTaL8HYTjM9JXJGaV8uT+0c07T
	 0oSXXdJvkcvECdbbObpOvP4MCOSJuGhIlX+2hqAPUFlHm3mQ51i28KZh43HmvWV0Qi
	 Owt6LWQQzcLwlkEo9IMSWJ4gKXJz/BOSAgchj38W8G1ltoA8Bsvqkaex7im9kwUjNf
	 tGQ+LERmqP3VbxlLOb6phRUOEOTwjsQZmjFwjo9ULFECnmgDQBXcVW6gj6NLRCkyaU
	 paLH91ckAeLf0lYxqEipB2rKRpla0N0udlB+7nzLTz+QTH79fpXcAUoo59rr9V+vlj
	 KqBv+bCawNZ3g==
Date: Thu, 5 Mar 2026 09:12:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Antoine Tenart <atenart@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, 
	Daniel Palmer <daniel@thingy.jp>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: arm,gic: Document
 symbolic definitions
Message-ID: <20260305-olive-lion-of-culture-b31aef@quoll>
References: <cover.1772644406.git.geert+renesas@glider.be>
 <36c8fe02dc911141170ea6607034422410e0ddc2.1772644406.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <36c8fe02dc911141170ea6607034422410e0ddc2.1772644406.git.geert+renesas@glider.be>

On Wed, Mar 04, 2026 at 06:21:56PM +0100, Geert Uytterhoeven wrote:
> Currently, the various GIC DT bindings document the magic GIC and
> interrupt numbers used in interrupts properties, but omit any references
> to the corresponding symbolic DT binding definitions.
> 
> Add references to these symbolic definitions, and convert the examples
> to make use of them.  This improves readability, and makes the examples
> more similar to what actual users look like.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/interrupt-controller/arm,gic-v3.yaml    | 12 +++++++++---
>  .../interrupt-controller/arm,gic-v5-iwb.yaml         |  2 ++
>  .../bindings/interrupt-controller/arm,gic-v5.yaml    |  2 ++
>  .../bindings/interrupt-controller/arm,gic.yaml       | 11 +++++++++--
>  4 files changed, 22 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

