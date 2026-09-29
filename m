Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0143E6394;
	Tue, 29 Sep 2026 06:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662140; cv=none; b=FMHEB2Oqd3c8at4LwTK1pgSVXhvsUSrjbUvBSiC0yzj7wfvKz04Ifxs0TbUU68YyhL18GFSUUwsVQ20EgCEhyr5LtrSUDN+Y8tj6Eu+RnUZfAmGa7KcxEcgknOubYMrA++P671D5P5OaKlUTVvBSX8WoAo9hhqwTOG1t6oEmOeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662140; c=relaxed/simple;
	bh=sneyS2U9Lco6BpqXd8UUbg+c5joetV4+6duZvo5fpIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XeplENv4XOuNDNF8JtWmwnYXxkIJzkoni9/xvGjvNTucxeCiMdkrTb/HdFgNtHtBijmU2OnIq1Jm7haL8ACAuhMkkWJDoGhqnq7jqUJBuVl7vGR1+QiAXpQ6voNsS5xwCgLhkC1vGAkIN0f61CpZsonQPYFZflln6mMvNoJEEMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=D5A4UZvh; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="D5A4UZvh"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790662131; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=bFv0wob4XHJ5pGfQQypbVS1ZQLGGrZOj5GdLUdoZp2Y=;
	b=D5A4UZvh2XQMzBOrwa2eAk3+5tXDfj+3UNz6UVmGL7+UmGiJIRbGk/IuAtOuB5+DMKgYavZN3MxItqTrGU6zSDq4huxEQOgLBzk0nRJzdSXupHuQDzwebNXgY62j08Rp+SeyBgLjAFuIeGZQMePT8An6ldF1GkfuqkJjBgRxh38=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R931e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0XBsCxhu_1790662129;
Received: from 30.74.144.142(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBsCxhu_1790662129 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Sep 2026 14:08:50 +0800
Message-ID: <bf74f2a0-bc38-44f9-a54a-2e213b78f6f6@linux.alibaba.com>
Date: Tue, 29 Sep 2026 14:08:49 +0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] pinctrl: sprd: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linusw@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260924111856.622898-1-yaojiale02@163.com>
 <20260924111856.622898-2-yaojiale02@163.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260924111856.622898-2-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/24/26 7:18 PM, Jiale Yao wrote:
> sprd_dt_node_to_map() reserves map storage before adding mux and
> configuration entries.  If a later operation fails, the error path only
> frees the temporary configurations and leaves the map allocation reachable
> through the output pointer.
> 
> Free the partially built map and clear the output parameters on failure.
> 
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---

LGTM. Please add the Fixes tag:

Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

>   drivers/pinctrl/sprd/pinctrl-sprd.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
> index 16cf9d15f247..218ac5236e95 100644
> --- a/drivers/pinctrl/sprd/pinctrl-sprd.c
> +++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
> @@ -326,6 +326,12 @@ static int sprd_dt_node_to_map(struct pinctrl_dev *pctldev,
>   
>   out:
>   	kfree(configs);
> +	if (ret < 0) {
> +		pinctrl_utils_free_map(pctldev, *map, *num_maps);
> +		*map = NULL;
> +		*num_maps = 0;
> +	}
> +
>   	return ret;
>   }
>   

