Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0090B43B6CF
	for <linux-tegra@vger.kernel.org>; Wed, 23 Sep 2026 05:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142184; cv=none; b=Id7RtsHovRzVRO+DlPHx4leeOsNmwyZnjO65/ANHxd+gXeB3vKOcL1DZPzavUGt3tLyj1mAJXZOvFOIE4PuES/Ukrb1CudT/TOA8WAR3AxmAviPfxfZtY5yTLYD6mm2aBSEuR6xwIt4F1hwKmEoWt/KH/qtXnjJ/BweZCuOm+cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142184; c=relaxed/simple;
	bh=evvdxFW0XGj4u2nv1dcL52FeniuoXTfcetA+SkuRBR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoHPUgpGK8MkV3bo3KBSrHX0DryxOB/MsvFH8WUeg3qCIsqfFbu61b/Vf2ko4NBjNRU6Z+yDto8/tOEyEzzzk493EbG9RBwaglcKpJqWo3fFdzXHfPSy2uMnucP2pzqCviY+Ug3Of6NFYI8+8BejJgeTCb793n5F2rQXm573fWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=KXh1sMJJ; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="KXh1sMJJ"
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id 9ARvx1sMMFNWB9FktxUZU8; Wed, 23 Sep 2026 05:42:55 +0000
Received: from gator4166.hostgator.com ([108.167.190.91])
	by cmsmtp with ESMTPS
	id 9FksxyoVhZOPw9FktxIVyn; Wed, 23 Sep 2026 05:42:55 +0000
X-Authority-Analysis: v=2.4 cv=H8Xbw/Yi c=1 sm=1 tr=0 ts=6ab366df
 a=vY9Mjuda9oMEc2E4Cx1x2A==:117 a=vY9Mjuda9oMEc2E4Cx1x2A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=7T7KSl7uo7wA:10 a=1XWaLZrsAAAA:8
 a=VwQbUJbxAAAA:8 a=gQCpgM2l43S2ifiWpRwA:9 a=QEXdDO2ut3YA:10
 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=XZXuWlR3J1G3Neq9edGZVGMzRKBFPrLLovwH9qNtkMk=; b=KXh1sMJJccY4
	QijMG9o3a3hO+BM4rxEGNIW3ATPnbIDla6kiEZMIegHSU1dVcTXMDQsCRSzLMfQqfrq5Wg7FvuxQE
	rKlefYM3lRP1IZLPy386slYt55XiRKAPGLdXaBWOHJuyezxFNxwVvz5QBAMmIlVVCk8wANhLqLX54
	210PeKNjxla8t8FSE7vkHyqqFvSm0BAg/cC5j14dWFGnXseXRXX519pajf3SnD8wRtCs4BtiAlrzO
	c+INWN21FlkLdNdHFdpT6DwRDQziZvNESd6NN84sh03I0JEsKQ0+fPF/eIwoZwnG8S13nxS5NfdUv
	Y69+E6Xc7CT6/nVsuktPcw==;
Received: from flh4-125-195-69-90.tky.mesh.ad.jp ([125.195.69.90]:43778 helo=[10.203.100.34])
	by gator4166.hostgator.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100)
	(envelope-from <gustavo@embeddedor.com>)
	id 1x9Fks-00000001x5C-0S81;
	Wed, 23 Sep 2026 00:42:54 -0500
Message-ID: <08b4b6ce-a04c-49d0-9250-1cd3122f1a32@embeddedor.com>
Date: Wed, 23 Sep 2026 14:42:49 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: tegra: annotate struct tegra210_clk_emc_provider
 with __counted_by_ptr
To: Bill Wendling <morbo@google.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-clk@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, codemender-patching+linux@google.com
References: <20260922110601.1959213-1-morbo@google.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260922110601.1959213-1-morbo@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 125.195.69.90
X-Source-L: No
X-Exim-ID: 1x9Fks-00000001x5C-0S81
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: flh4-125-195-69-90.tky.mesh.ad.jp ([10.203.100.34]) [125.195.69.90]:43778
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 16
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGB4lSRnD4wiAkK1GGhL0OuE5jfvhu9LOGZ1B8yndLTXpGIpz8ArGmTidXJr4ebVI1BMyemPnswLbHbTj3zofpZELgnqjrH2kP1sys/weA0ruygDI4x+
 OBJVSku9qATsS2XqF+wCp/RSNyG5S3Bfl3QsfUvbksbLiQk3ZgKO/d2W1L73QVEvcc8JkzDys6uuYt1+85SrGzjnQkogDViFrkILKFC8rnzNun7HwYIKZhkB



On 9/22/26 20:06, Bill Wendling wrote:
> Annotate the "configs" pointer field of "struct
> tegra210_clk_emc_provider" with the "__counted_by_ptr" attribute,
> allowing the compiler to perform runtime bounds checking on accesses to
> "configs" based on the value of "num_configs".
> 
> The "emc->provider.configs = devm_kcalloc(...)" call uses
> "emc->num_timings" for the number of elements, which is then assigned to
> "emc->provider.num_configs" before any accesses to "configs". The
> "num_configs" field isn't modified after assignment.
> 
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-Gustavo

> ---
>   include/linux/clk/tegra.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
> index 3650e926e93f..f1034e14c1a4 100644
> --- a/include/linux/clk/tegra.h
> +++ b/include/linux/clk/tegra.h
> @@ -170,7 +170,7 @@ struct tegra210_clk_emc_provider {
>   	struct module *owner;
>   	struct device *dev;
>   
> -	struct tegra210_clk_emc_config *configs;
> +	struct tegra210_clk_emc_config *configs __counted_by_ptr(num_configs);
>   	unsigned int num_configs;
>   
>   	int (*set_rate)(struct device *dev,

