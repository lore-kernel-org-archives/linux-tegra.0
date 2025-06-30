Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7284478F24;
	Mon, 30 Jun 2025 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267588; cv=none; b=IMUUa9EZHgLFF/fKzJnHj0LOzmmEHJwKc/6zOfsZjUUxWIqzn+xnI1CGfIWdZLG25VYU4nbYggm8sJZLvD8yrgKLw3V0qz9HnyNKnHNCo9aNQQWu2n6FVmlTDX47/hxxdd4Qf9xAjwCztr7uB0IpLY+5O+51GzAR260tQNu1xdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267588; c=relaxed/simple;
	bh=a0mOBBVvKHJ/p2pgWeUj2C0zQvdkOKWWtMUYv9nVwY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1XylhgwfYHlyqv+LQ1QvQAVh9sgm2IaKKHe83ZYX3oPA3rVdrUpW48Jx103UnNMce7iItsykKCZtiDRmtKJx9vlHVctpf0So4yxqkHmhEZuSBSxpdMdM8wuOA97xGIE87iRlDiX5/HogeVvlpGdJfg6dwqAsk2IMQ4fEKBxy/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=NFaZ1cW4; arc=none smtp.client-ip=91.232.154.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="NFaZ1cW4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hdpPcH72q71eFKMVk37M5XbLZ4kKadKnisDL++Ydm+w=; b=NFaZ1cW4W6ByCiKmTde1ZePKCJ
	43LK9PnLdTN7kpwb4rGLfvELiphWVDL65ANp8TCqExFHc7WCEd1957r/VbyI8OZ3WgYq/RU+YNqte
	i7uQnJAFDQP3LlicQDfrWk3wyTlCqrYtpsQJqd8HDS+8aXmHjzvcbz1WJuPis4H0DYaOZvJ61d04g
	eA3mrIOQ+N1QhP00S8JaISLfkBa+u1QqZ9nw0YqSStp5g50tHZhWQNdC6MYCpg6zB0Yy6UmoHNnRJ
	lmEehZBIc/JPQle0y7hZ4qVMPXAgdX+7DxYDQM0lwZQDyhiN1Nd1Q1AjsrJnCzJebhwJWwF0ExYxk
	1GwrpFoQ==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1uW7lC-00A4zL-2n;
	Mon, 30 Jun 2025 09:12:59 +0300
Message-ID: <0bed2152-8bf7-4091-8c2d-126f1ec3be5b@kapsi.fi>
Date: Mon, 30 Jun 2025 15:11:34 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/tegra: Add NVJPG driver
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20250611-diogo-nvjpg-v2-0-01f8c76ea90f@tecnico.ulisboa.pt>
 <20250611-diogo-nvjpg-v2-1-01f8c76ea90f@tecnico.ulisboa.pt>
Content-Language: en-US
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20250611-diogo-nvjpg-v2-1-01f8c76ea90f@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

On 6/11/25 9:18 PM, Diogo Ivo wrote:
> ...
> +static int nvjpg_load_falcon_firmware(struct nvjpg *nvjpg)
> +{
> +	struct host1x_client *client = &nvjpg->client.base;
> +	struct tegra_drm *tegra = nvjpg->client.drm;
> +	dma_addr_t iova;
> +	size_t size;
> +	void *virt;
> +	int err;
> +
> +	if (nvjpg->falcon.firmware.virt)
> +		return 0;
> +
> +	err = falcon_read_firmware(&nvjpg->falcon, nvjpg->config->firmware);
> +	if (err < 0)
> +		return err;
> +
> +	size = nvjpg->falcon.firmware.size;
> +
> +	if (!client->group) {
> +		virt = dma_alloc_coherent(nvjpg->dev, size, &iova, GFP_KERNEL);
> +
> +		err = dma_mapping_error(nvjpg->dev, iova);
> +		if (err < 0)
> +			return err;

This needs to check the return value of dma_alloc_coherent. Looks like 
this was fixed in vic.c by Robin 
(5566174cb10a5167d59b0793871cab7990b149b8) but the issue persisted into 
nvdec.c in parallel, so it needs to be fixed there as well. I can send 
out the fix for nvdec.c.

With that fixed,

Acked-by: Mikko Perttunen <mperttunen@nvidia.com>

Thanks!
Mikko

