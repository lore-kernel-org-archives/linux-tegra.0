Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F05C3358C3;
	Wed, 12 Nov 2025 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762952806; cv=none; b=JTbMqd3yOYB8IvriGDkILaiKLvJxCyWvGrKhm39nrai4rUHq1idJQqgdlqMpcyUrNqqlzIHlIC4TbmoQ4GPJv81dEmZvikdOMwZ1ozJkEU7/3kYMKENPDCSxC1/nOkJsmx4Roukhw5ircxWH0lBGx5EXN2ikZM7b9tmehzZFz9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762952806; c=relaxed/simple;
	bh=sAGvVt0Ey2gjql9TDneVt2Dv9i4NQP69HdeqUkBQEEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBEltePMJS11ARo/JcIEG/lQXFBIfxa2HJZit0DwRqmFawlLvtlU4C8Uhx9yFQdU4zk4XNN1esd9nMAcLRgVTj9JCG4cD8vqOm9HA/y/aAKJoO7JqMm7NPybZjVLr+npug0AaY9JaQiuRZkU1vX/NdjCLzX5QzY2l8VEXDUpdtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NdqYIgXd; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NdqYIgXd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 04108C0F556;
	Wed, 12 Nov 2025 13:06:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DA2F6070B;
	Wed, 12 Nov 2025 13:06:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD0FE102F16E2;
	Wed, 12 Nov 2025 14:06:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762952799; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=KJmj5fQs6js8DPEkDWxWh0SpOhOreJFftTCYU+pcBQ8=;
	b=NdqYIgXdiPgo1ApRvQNGKDs2APPqWG511zKG0iqoRl1PuluJCiEjN12pdh/SawE8qhiIjt
	YpYPEy6bGhuDeGiqOrbk4/RkY/XG7ZQzzRHK0MvRmdmCB/PCig3JXsfSOcAhbhU60ZjMPO
	2RrW4JzhhSyi7WQoFFSCldTcnhSYwiiG3LSTGSMsqr+KSfkVc4BP/i1yr9D3WgkfBQ/50u
	ZG9CV/QU6Ibp53/vJ8wai3bk8uFJU+WIolP3Yq1cF1TpNzZVGZDMb84yiPgBpy2n4oQj9J
	bIvTadDnU5ynVGLKoqxRI6zxGgpelxrxkw3f4dYrdFzXkMC9HRwKPuz7fQm1Sw==
Date: Wed, 12 Nov 2025 14:06:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 07/11] irqchip/atmel-aic: Simplify with
 of_machine_get_match_data()
Message-ID: <202511121306329b57d6ee@mail.local>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
 <20251112-b4-of-match-matchine-data-v2-7-d46b72003fd6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-7-d46b72003fd6@linaro.org>
X-Last-TLS-Session-Version: TLSv1.3

On 12/11/2025 11:28:52+0100, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Depends on the first OF patch.
> ---
>  drivers/irqchip/irq-atmel-aic-common.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-atmel-aic-common.c b/drivers/irqchip/irq-atmel-aic-common.c
> index 3cad30a40c19..e68853815c7a 100644
> --- a/drivers/irqchip/irq-atmel-aic-common.c
> +++ b/drivers/irqchip/irq-atmel-aic-common.c
> @@ -187,20 +187,11 @@ void __init aic_common_rtt_irq_fixup(void)
>  
>  static void __init aic_common_irq_fixup(const struct of_device_id *matches)
>  {
> -	struct device_node *root = of_find_node_by_path("/");
> -	const struct of_device_id *match;
> +	void (*fixup)(void);
>  
> -	if (!root)
> -		return;
> -
> -	match = of_match_node(matches, root);
> -
> -	if (match) {
> -		void (*fixup)(void) = match->data;
> +	fixup = of_machine_get_match_data(matches);
> +	if (fixup)
>  		fixup();
> -	}
> -
> -	of_node_put(root);
>  }
>  
>  struct irq_domain *__init aic_common_of_init(struct device_node *node,
> 
> -- 
> 2.48.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
