Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DC930E0E4;
	Wed,  6 May 2026 07:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051107; cv=none; b=IUGPmJoJPuzuBLGVrNmXAqlxLoiRlyTH4frbO0wx9l/wnpqZ75HOoxvc5f3eMjzKdMEISghEa0/Lpm6Vqc4JnsEzDL1JHfehC/eW3mo9loxH+fqdJmNngjECpVZ7K3NWjNz+sHHaCVfEtNS6JoWBUYHOsrpC+mMaGPP3FT7gDGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051107; c=relaxed/simple;
	bh=0kQs4mwh7DEMQx2/yk0kO06Ch3Q058Iv5aVOkWviCv4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=evqtmOsXGoFyw8YeqRJVZmo/TKqm3oNp/PeLi09wunQhdpzK2inQ3GhC24sj59Z9+l/QPrhkMHshbpLkLImq3bQl+kokH63Xy4Waz7eq8HFazk/KeED8rcD0g79OHiDnult/A0E3c4BgsafBU7XvFkX+1HD/o1P4ipoU8g+vgH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jhjt0gFH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jhjt0gFH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07661C2BCB8;
	Wed,  6 May 2026 07:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778051107;
	bh=0kQs4mwh7DEMQx2/yk0kO06Ch3Q058Iv5aVOkWviCv4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Jhjt0gFHefbul1JYAok9JADgl4cJjDJAvysYHOtQV/g3OV0Yh3dfSss4/iWq8olsX
	 mHRKmS2ojgRSFwIFoUsRpwBobwVuIs9Zas0pj1fdZTy/GUMjsupa5bnBmUsT/n2af4
	 p2lomRY5u3SK0kZDAqPdtOryTB83jhFKocyBihcYNehr3oMg5KqZWQP5j7Yvcpog9I
	 awscApk8X5R6RpSvnaztwAoxYHm0U3/vzUqqK897J1l3WdtR8eXTlWl8pibCUb9Q4h
	 OFyYSewf/ZSKXe8fxL6wEVGQhuDsKkeWePPKujJcPAdKFQHAr6nkaFZbYNfVFWUJkV
	 z6HlhzsqjJtIg==
Message-ID: <4db267a6-4d00-4777-a7d9-c18b303624c1@kernel.org>
Date: Wed, 6 May 2026 09:05:03 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 1/2] staging: media: tegra-video: fix wrong return type in
 tegra_get_format_fourcc_by_idx()
To: Alexandru Hossu <hossu.alexandru@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260411211006.150782-1-hossu.alexandru@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260411211006.150782-1-hossu.alexandru@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2026 23:10, Alexandru Hossu wrote:
> The function is declared to return u32, but returns -EINVAL on the error
> path. Due to implicit conversion, -EINVAL (-22) becomes 0xFFFFFFEA as u32,
> which is an invalid V4L2 pixel format value.
> 
> The caller tegra_channel_enum_format() assigns this garbage value directly
> to f->pixelformat and returns 0 (success) to userspace via VIDIOC_ENUM_FMT,
> giving applications a silently wrong format descriptor instead of an error.
> 
> Fix this by changing the return type to int and propagating the error
> correctly in the caller.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>

It's a duplicate of https://patchwork.linuxtv.org/project/linux-media/patch/20260412000245.26696-1-dennylin0707@gmail.com/

I prefer that version (after my suggested change) over this one.

Regards,

	Hans

> ---
>  drivers/staging/media/tegra-video/vi.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 9c0b38585d63..afc7327ef318 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -77,13 +77,13 @@ static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
>  	return -1;
>  }
>  
> -static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
> +static int tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
>  					  unsigned int index)
>  {
>  	if (index >= vi->soc->nformats)
>  		return -EINVAL;
>  
> -	return vi->soc->video_formats[index].fourcc;
> +	return (int)vi->soc->video_formats[index].fourcc;
>  }
>  
>  static const struct tegra_video_format *
> @@ -395,6 +395,7 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
>  	struct tegra_vi_channel *chan = video_drvdata(file);
>  	unsigned int index = 0, i;
>  	unsigned long *fmts_bitmap = chan->tpg_fmts_bitmap;
> +	int ret;
>  
>  	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>  		fmts_bitmap = chan->fmts_bitmap;
> @@ -405,7 +406,11 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
>  	for (i = 0; i < f->index + 1; i++, index++)
>  		index = find_next_bit(fmts_bitmap, MAX_FORMAT_NUM, index);
>  
> -	f->pixelformat = tegra_get_format_fourcc_by_idx(chan->vi, index - 1);
> +	ret = tegra_get_format_fourcc_by_idx(chan->vi, index - 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	f->pixelformat = ret;
>  
>  	return 0;
>  }

