Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0AF2BE7C0;
	Tue,  8 Jul 2025 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751964638; cv=none; b=UH7SPCFKlV2W75wHmOCRO0SSBv+8vOo7iocgLSo5LboLqVnUmXz2DW0h6AIYXvZ5M9w34cwMquaSl5WWEsNCiqjg7K8eu7nCxzimTCtJp31nBtWRMUGf5kqDW7KqqJ/EMRLtvT6e5HCl9WNqXQffmyqTq2ZlUjt/AckORsMf+Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751964638; c=relaxed/simple;
	bh=HnfC2Ek4S+K72bSDC+9duLI+YxwkJ49GQ4nMLtuXbks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQgSvFZmIZzKsHtA1B/8NBAZosWwmHae6KQB6HsWHbZCcDHITaJVE9W7zzKLgdMksX2h9WggdwaABaBkMPIOADY98U5L5pkyFxMTmiCl2rnbvSkhk70AU4vkCI7KEeeFbqYM8DHMGMbuix1LnbdyTL5jdcQ/PmMBB+rDhUULeDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bbvWt1LYQz9sfF;
	Tue,  8 Jul 2025 10:33:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoqHkokhU4QF; Tue,  8 Jul 2025 10:33:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bbvWt0c9qz9sXD;
	Tue,  8 Jul 2025 10:33:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0EC098B76C;
	Tue,  8 Jul 2025 10:33:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id s3ivdJfLK1Dw; Tue,  8 Jul 2025 10:33:29 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D09838B763;
	Tue,  8 Jul 2025 10:33:29 +0200 (CEST)
Message-ID: <907f875e-5ed0-4eca-b285-ebb7e47137ce@csgroup.eu>
Date: Tue, 8 Jul 2025 10:33:29 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Qiang Zhao <qiang.zhao@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-tegra@vger.kernel.org
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-19-jirislaby@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250611104348.192092-19-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 11/06/2025 à 12:43, Jiri Slaby (SUSE) a écrit :
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Qiang Zhao <qiang.zhao@nxp.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org

There must be something wrong with this patch. b4 shazam applies a 
different patch.

$ b4 shazam -l -s --single-message --no-parent 
20250611104348.192092-19-jirislaby@kernel.org
Single-message mode, ignoring any follow-ups
Grabbing thread from 
lore.kernel.org/all/20250611104348.192092-19-jirislaby@kernel.org/t.mbox.gz
Breaking thread to remove parents of 
20250611104348.192092-19-jirislaby@kernel.org
Checking for newer revisions
Grabbing search results from lore.kernel.org
   Added from v2: 1 patches
Analyzing 25 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 22 code-review messages
Will use the latest revision: v2
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v2] iio: adc: stm32-adc: Use dev_fwnode()
     + Reviewed-by: David Lechner <dlechner@baylibre.com> (✗ 
DKIM/baylibre-com.20230601.gappssmtp.com)
     + Link: 
https://lore.kernel.org/r/20250612084627.217341-1-jirislaby@kernel.org
     + Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
   ---
   ✓ Signed: DKIM/kernel.org
---
Total patches: 1
---
Application de  iio: adc: stm32-adc: Use dev_fwnode()

You must have posted another patch with the same message ID. I had to 
apply it manually.

Christophe

> 
> ---
> Cc: linux-tegra@vger.kernel.org
> ---
>   drivers/soc/fsl/qe/qe_ic.c | 3 +--
>   drivers/soc/tegra/pmc.c    | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
> index 4068b501a3a3..943911053af6 100644
> --- a/drivers/soc/fsl/qe/qe_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ic.c
> @@ -407,7 +407,6 @@ static int qe_ic_init(struct platform_device *pdev)
>   	void (*high_handler)(struct irq_desc *desc);
>   	struct qe_ic *qe_ic;
>   	struct resource *res;
> -	struct device_node *node = pdev->dev.of_node;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	if (res == NULL) {
> @@ -441,7 +440,7 @@ static int qe_ic_init(struct platform_device *pdev)
>   		high_handler = NULL;
>   	}
>   
> -	qe_ic->irqhost = irq_domain_create_linear(of_fwnode_handle(node), NR_QE_IC_INTS,
> +	qe_ic->irqhost = irq_domain_create_linear(dev_fwnode(&pdev->dev), NR_QE_IC_INTS,
>   						  &qe_ic_host_ops, qe_ic);
>   	if (qe_ic->irqhost == NULL) {
>   		dev_err(dev, "failed to add irq domain\n");
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index e0d67bfe955c..9543bee0c321 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -2500,8 +2500,7 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
>   	pmc->irq.irq_set_type = pmc->soc->irq_set_type;
>   	pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;
>   
> -	pmc->domain = irq_domain_create_hierarchy(parent, 0, 96,
> -						  of_fwnode_handle(pmc->dev->of_node),
> +	pmc->domain = irq_domain_create_hierarchy(parent, 0, 96, dev_fwnode(pmc->dev),
>   						  &tegra_pmc_irq_domain_ops, pmc);
>   	if (!pmc->domain) {
>   		dev_err(pmc->dev, "failed to allocate domain\n");

