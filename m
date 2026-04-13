Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FFE391E65
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 07:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065652; cv=none; b=irFiObJ2tVfRbaVZm//ajdQDYK/bcdTRS5+QDp8n32oUmI1O+XushhiG7JCyR/kiyzZW7C3IRqk5yMpZhUcxAQo/fP3xY6BbNDxsxdJgfdy4Jq1gYtNwIgyCm+fJE3jrroXKbgEvfuYmVtDBCm9HcUaYPqCVsSCiYy9eSWClH+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065652; c=relaxed/simple;
	bh=e6BQAZGUgVAkgKcYanzsYKMx63YC+gNCChBKEtZTy5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=af0T9Y7w1Rc0mtrzfm6MrC+h0A369AcqrgX/7Gxk8/Zckywh5D2j0EL+moJ7KnG4m1d/dHnSRcDj1VJFHLVu66lIYCGamz+ACmtews1daw/zz4HxrecVNEbsB1JgMjcRFtGd3MgwjRO8Pwghilf0/HcaELhOcAV6kxcNs3qtiNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0xUq+Q4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0xUq+Q4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so2407858f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 00:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065650; x=1776670450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6HEasNH32115c+BoQHyOfy+FArvbq95odOHWQ7HgwtU=;
        b=E0xUq+Q4qhtBwrOWeaPcMpTD2As0MFGwL/PO1h25s/6Utw+tkSbYs0QFZQyQOx69RT
         /YGrf4eOMqCecwQzcP0vOagV+KZjyjPTuDldHo/6z2LcQP+q4O9VzILrHgJLjpPanbCk
         m3B5Ag/BbKXc/HfO2Mf9JjfnZZVvaOs6a1fwx5YwEM1iQUET/brQr8kPtXc5I0fL/h1F
         zzF5RiLvNsvl/fUzMU68pfEVhDg/4ZQIJlHugfgIU8Grq+SucwWInIATKoY3psiRPwfg
         eIF5Xd1lzXNTYv7QfM60u+6pqvIPW4mwp426B36WOqWaQ3nkwGH5fweEXe5ySyZ2vren
         MF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065650; x=1776670450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HEasNH32115c+BoQHyOfy+FArvbq95odOHWQ7HgwtU=;
        b=NDnNtyska4AoVzCvFnJzVFvJsjUdSKxQuT/TONfAF15MVDhlCU6Q7CdaJKUELmlRhK
         bcNv3PErRrSjCWhxDibZR9UBBTugqZdUZN0WYAk6cJ2kPCT7tm/R/nWVXcEXYUvTCFaM
         ltETwMq+TSGTEu38NFR8v15w9Qu1yV9UEVYxX/A9VkZQewJVrsNjqiy3fki7dseptxR+
         lhXpa5JcOBcVrdUED4KMKLLBrww+Nl3Hb3vkzB4DHlVKIFKeMNo5PzUym2MgV4uhLl5L
         bDQhpMDA0q2IEEIsucusPvY65/4ukmMUwYbYQsccWLmYhwN0COtBt4A8zw5Aig1zTVrK
         PZqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+twXC4F+PN88yLT0zgN2kC7hUnT9s8Na1hm4zqfINDn89ostGsHeEn7tr0w6zgss1p+16tREUt4PhOzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4BMoYevgI4ARwjT9SfAEAKKWACAoRkz0ilE13hKbinJ8/Z2iX
	gLG2eDMHGh+HA3j9ZEDtuAEGdwJNya8loUJRcGWzJKucUGlDH3/rUUlgU5XhrOx+
X-Gm-Gg: AeBDieujUPYIOm//1iN3i7w2ZKQEjIYl70/xlsC41P2uXHxtycjiFRXbqPIkjb9uctx
	1s7FmS/IB7g2pqF0lzId1itJbdpmyN34q8BeDIR4AD616nhF8zxpWlVQsTnMXp8ueeI9Nh0XNUC
	h8fZwg1fGEzOyiiFBk4ls+5fifGMz144QFS0CfPARHFj2P4EhGogx7PQBgMqzmn0dcW0bzIXIsN
	VaRtCAmFkbgPxdinWu8WSnM6miJ9X9IMbXRDStZzn9U6ceiilUL4kaI65FmQcnpza2E94Qojs70
	IcBKXh94uGEeAFcLFqlN0Vp0OM7HEPlZMqtW4+cKRs0LR/BPAUme6/pHr4VXscH/DSYerrNzvde
	g+ltbEB/oVwpmxRxKaeLDvjnA9caD7DZHTp9IRcvUYwUfQ6cgnd4p54yD2fFnfgVDCeIRqG09yL
	+Ipd+03i69FkMeQjCTCEU=
X-Received: by 2002:a05:6000:25c6:b0:43d:7cb5:43a6 with SMTP id ffacd0b85a97d-43d7cb5513amr831948f8f.2.1776065649604;
        Mon, 13 Apr 2026 00:34:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6f4bf2b4sm15189470f8f.20.2026.04.13.00.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:34:08 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:34:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: vi: fix invalid u32 return value in
 format lookup
Message-ID: <adycbQO7qXN5Uq8D@stanley.mountain>
References: <20260412000245.26696-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412000245.26696-1-dennylin0707@gmail.com>

On Sun, Apr 12, 2026 at 12:02:45AM +0000, Hungyu Lin wrote:
> tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL
> to signal an out-of-bounds index. This results in a large unsigned
> value being returned, which may be interpreted as a valid fourcc.
> 
> Return 0 instead to indicate an invalid format.
> 
> Callers assign the return value directly to pixelformat, so returning
> an error code encoded in u32 is unsafe.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 9c0b38585d63..966792a6ec19 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -81,7 +81,7 @@ static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
>  					  unsigned int index)
>  {
>  	if (index >= vi->soc->nformats)
> -		return -EINVAL;
> +		return 0;

Someone else just sent a patch for this which added error checking to
the caller.  I liked that approach better.  (I haven't checked to see
if your approach works).

But either way this needs further review to see if the bug is actually
real and if so what is the Fixes tag?

regards,
dan carpenter

