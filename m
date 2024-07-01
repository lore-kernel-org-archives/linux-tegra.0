Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C48616D9BA;
	Mon,  1 Jul 2024 19:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719862280; cv=none; b=RgJibpXYdNi25lYD1Va5szu6bdllsnW5grinC1mosvt77d5mHjOek3pD0KmXl+iX3lQkjUIsaBkdk0N2C2NIHBaEE6jkz5S3nuUIqrMubzaVohSQzHD8B6tKlgATiM2F6Iiy25Sa52GT6zzQIrYOlfkTgawUJhhb2/yjrgX3DuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719862280; c=relaxed/simple;
	bh=7uK56noa9OT7NT7AiKzpcK8+8gv6waaOJ9178RHutXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hNBh3RyusbVzkneC0pKiXNvbaeS4yFYE7jhkXAflHMvRzDKsWxEUvyqNV0SFBL4OR34rvS6zmrrBpypcBzLtRpnE3OK/bHZjAkiLtCfBdGv7FYEV2kDz0kr9Uz8jaLIrxPn3tRgiG9jQl3mX+JyTajOwHIpVztfFbFL/gB7VTRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eprjowPH; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eprjowPH"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57d0e3d32f1so102633a12.0;
        Mon, 01 Jul 2024 12:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719862277; x=1720467077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D0HZlK8nHwoje+lWDsShpqSJVC51ECArGsANp8ntoAw=;
        b=eprjowPHB66SNBaU4r2f+Y2SPmDt844CfcS+EAzMJbakLaJYJXavfpPOeM6NtzJmQl
         A/Nm2hT9ttgIqZ9kTgN8Y43spoA+eo1lEKvH6QZrgmhIInxW8jMG3inmd4ekJMFhC8d9
         IL01b+CGY2stCQOkMPPvSPVjKGY2py4bkNYnNKNyu3yDtoeRR9Jzqd9P5jF21YH2oA7g
         QCjrEk0cMFRDsKQp1UybuL2uxXdMLB5ni1q1DqAFa8qLR8cbQLXkucWkTvgv7jNXCPva
         Rn7UxKguKaqVLGYiJtC4W+RpOqgf4iXQdarMdx3VQks2e98vfARVGtGWO3FXI/BebI/g
         kKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719862277; x=1720467077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0HZlK8nHwoje+lWDsShpqSJVC51ECArGsANp8ntoAw=;
        b=GpceVNknpi9Y3WbA7w+/36+hEG2OrtmHR058rtGTy+qFDxhwxxoWcNVeCWoprP/bDB
         F+Yl6i82GYE9uzJPKlBkJHZZOeFMfhLhk5nQmgl3GaLneKgFWZMaKLAwrPFgFPEEGqhl
         e+Ge0mWN1gOKnw7E6oBN+oDHOhoecJGu7QgZhy1K0V2GL30+9jfo2gaLbxvH/atuXQ8A
         enH5pPucVBOHerNngEImUZeQyiwUjcvS3GA8PD8ShH6isB/YYiDOwEU4UMcu6ZRNuMTJ
         qKIdgahAP+VXUEsuWJp+4cyei+G3xmoaGY6t3wjewSfatMtj2McFvWy1S+6BGzqyLR0U
         oqHw==
X-Forwarded-Encrypted: i=1; AJvYcCVitrthq1XLRl+tNUAzyYKMzrIobcTzFwxVyRfvb1c5V1Drxn3C6WtZCP2Pq7HNcfJQMMBClxINh1k62KKn6IZjcuhy87I4KGSa581lXYfCztsHMHtGBDehbHgJqoQWyKp+POtjeTC7WYs=
X-Gm-Message-State: AOJu0Yx20TupWxFEbhhYeCv7NjaBup90oVTa2PJs1rf/NY6rnU+3Y1zU
	QOmL0I+jw24WdLPfgNxUGx/ozD7+DD9worYhit+1QsPQZJtqpcdd
X-Google-Smtp-Source: AGHT+IEtOTFhO5s/ESTanETwKJvhOIab0I4p7PgSG6Bi6jKBUgeYqvdk9TOJBWlSN/5+j6oA7dtTMg==
X-Received: by 2002:a50:c356:0:b0:57c:bc7f:fb51 with SMTP id 4fb4d7f45d1cf-587a0b030abmr4269936a12.2.1719862276901;
        Mon, 01 Jul 2024 12:31:16 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58612c835c4sm4730177a12.11.2024.07.01.12.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 12:31:16 -0700 (PDT)
Message-ID: <cbd7ead7-bfe9-40d1-ae9d-053388384356@gmail.com>
Date: Mon, 1 Jul 2024 21:31:15 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: nvec: Use x instead of x != NULL to improve
 readability.
To: Tom Mounet <tommounet@gmail.com>, Marc Dietrich <marvin24@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <66804898.5d0a0220.6df0f.4f0a@mx.google.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <66804898.5d0a0220.6df0f.4f0a@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/24 19:47, Tom Mounet wrote:
> Use x instead of x != NULL to improve readability.
> Issue identified by checkpatch.
> 
> Signed-off-by: Tom Mounet <tommounet@gmail.com>
> ---
> v3: Add change history and proper description
> v2: Make commit title clearer
> 
>   drivers/staging/nvec/nvec.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e5ca78e57..814eb121c 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
>   {
>   	mutex_lock(&nvec->sync_write_mutex);
>   
> -	if (msg != NULL)
> +	if (msg)
>   		*msg = NULL;
>   
>   	nvec->sync_write_pending = (data[1] << 8) + data[0];
> @@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
>   
>   	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
>   
> -	if (msg != NULL)
> +	if (msg)
>   		*msg = nvec->last_sync_msg;
>   	else
>   		nvec_msg_free(nvec, nvec->last_sync_msg);

Reviewed-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
