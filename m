Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="k2+K10mt"
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EED189;
	Mon,  4 Dec 2023 22:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=wSBGOMrJ2rIBXWPc0f3qBJ8q9G+L4w8pT9nIJNShkrs=; b=k2+K10mtCasLCe+nnWQ85q7vXD
	6G42TQ3niROCJsnGSJGgj1RwmKWWK1IwxQugE+FAdWezeLM1xBPkpO3VLZFrpYDzzsKlHs+l1e62H
	6Ur7CbQfkMyK32SgX1Y884319euKaBylwygNO3okacrsZsXQT0ZuWinXSP32U5NUg9kCmeMr5Mu1B
	gWym4/f8rVxBH75FZvrTroZqMN3gHYDlVmzn1LxAMAPZp25l8uU2L5KX6u/CNOQ94iT1kewP/Snhn
	CxA8IHMnnk4GSc/1Alr1vUU1otrYcJ3oWREOdv1ZYKogW7QC2ffK+Vc5LZecVGmgHNLp0SDW6fQMS
	KHEM8H4w==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAPLO-006RZK-23;
	Tue, 05 Dec 2023 06:55:46 +0000
Message-ID: <75d52b42-0a26-44d5-b64d-60b762c858b5@infradead.org>
Date: Mon, 4 Dec 2023 22:55:45 -0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra: Protect SID override call under
 CONFIG_IOMMU_API
Content-Language: en-US
To: Ashish Mhetre <amhetre@nvidia.com>, krzysztof.kozlowski@linaro.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 sfr@canb.auug.org.au
References: <20231205060045.7985-1-amhetre@nvidia.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231205060045.7985-1-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/4/23 22:00, Ashish Mhetre wrote:
> tegra186_mc_client_sid_override() is protected under CONFIG_IOMMU_API.
> Call to this function is being made from tegra186_mc_resume() without
> any protection which is leading to build failure when CONFIG_IOMMU_API
> is not set. Fix this by protecting SID override function call from
> tegra186_mc_resume() under CONFIG_IOMMU_API.
> 
> Fixes: fe3b082a6eb8 ("memory: tegra: Add SID override programming for MC clients")
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  drivers/memory/tegra/tegra186.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
> index d1f1dfb42716..0ff014a9d3cd 100644
> --- a/drivers/memory/tegra/tegra186.c
> +++ b/drivers/memory/tegra/tegra186.c
> @@ -141,6 +141,7 @@ static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
>  
>  static int tegra186_mc_resume(struct tegra_mc *mc)
>  {
> +#if IS_ENABLED(CONFIG_IOMMU_API)
>  	unsigned int i;
>  
>  	for (i = 0; i < mc->soc->num_clients; i++) {
> @@ -148,6 +149,7 @@ static int tegra186_mc_resume(struct tegra_mc *mc)
>  
>  		tegra186_mc_client_sid_override(mc, client, client->sid);
>  	}
> +#endif
>  
>  	return 0;
>  }

-- 
~Randy
