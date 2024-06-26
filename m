Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E6E13C909;
	Wed, 26 Jun 2024 04:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719376916; cv=none; b=uI102cGxXofumG84ddKGk+lEYtS7/i657MCLYG+cH+QwvRvEk2/WZP8AKlWcDv1LLJ8hupyFOqBQzdXQ4x+B7q4b4HkRVhD0diyFO30zzb5cEC+nVeoZu9mm5cZLF+F1nAWOeIOwA/H/+dQXIoDBWF6LeL+yw79ud1EDu/aL5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719376916; c=relaxed/simple;
	bh=c3Yze73LZu3I/gljxsqZ2WmNEz/P/xYnIpox7TAo2FU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rgkztRL2IJf1r27eGy498lPtFPKB9GqU3yEI282w2kFbfmNUX4AHHool6aGMkFTVfcU4LOKX8da6or4SkbqJOmRrXMlIMa/FQXigHLTPCBJcQf+pbbXH1HnpF9i9d/pZmhO2usEW9c74uX9dXG2OPaTc+vacbz38rpDS1vpYzLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hK6iMFpF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hK6iMFpF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-422948b9140so5537075e9.1;
        Tue, 25 Jun 2024 21:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719376912; x=1719981712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OPu8o3NFntJwVaPbGld8pCdkv12AmcbKbLHyv6SdaIc=;
        b=hK6iMFpFoJFJrEBJ2TwiWy9YXyScnmtKq0cFxEC4Jcb+nAw7GFMhdWJcoZ1QwZ9SlE
         jawSqqjmsG0S2C0lNdcBYJFTvaUmvu1niM97pkd3ugOQBa45eLH3SLEedWHDBf0jEwi4
         6kWV9K/k7BuO1T5oYri5JG+gppvuLA8NMjlNQ07eU2hiKA+p56a2doxWdkGvMzEOLdkn
         ayszcaSIg7TW6GE7k1e67mZKFL5vSI4cXI9O7D4YuIQQVlUm9b59CxZKf5O0tGQmE/hA
         flgKLyMRRTTkExlZ8+zXYbTwdRyMAtBL2Bmgcp96xBKeSPGXDVxfwH+M1JGVRWznZ+yp
         GuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719376912; x=1719981712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPu8o3NFntJwVaPbGld8pCdkv12AmcbKbLHyv6SdaIc=;
        b=SbUB7pfzbRboxQbGiV+X5Wot/14eBI7v7Uqz+e7Saf0dEZGwSx/pGKDzsfBrx1/Ye/
         /jGzwGRg/T0+ZIIr9FH6gUHzvLw+W4cAX+FuaUPMwFvbFVDF4Ig/lnhH+mjPzRbUY58H
         Mvtr48HIDdg93293mXczfhaC7G5hxX9wOELczRdAo0tCWK8SSuEzjpGBwj/CynlqmcFR
         xJmcciSHosR6MsbzxJmaVR4YT4Z9JCo/pNiFa8x+f9SE2nGrPDiPQN49XgI8AmjlE+rv
         Ei/vQX1mJR7HkQ0WJ3Pkix+kJfYqnh3Mk17PkZA9E4HQQqzwmSqCPvsK6AJqdmCcBIoh
         zH6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUbXSyU+UsFeHM+LYaMP8ssLxgWdgg/1q9PuNJaxQVKdzmrWzB7ANQRkegQWn3sHkdeb4GfB0G3ztTjH2S8/WRChELaTtdMbqiPSam9/FqoKAv9VTR/hXdgddmiD8D2d/xLK63JbgTtb8=
X-Gm-Message-State: AOJu0YxoQKaI6pdxkE8JBc/uvBHBIXMVR+8CDJTOrEatHipA7raqHgL6
	IJUg+qmJQMHePvJSz+UGrJYFAdKiMXwN8Vh/u/YQNgwtzP4svG8E
X-Google-Smtp-Source: AGHT+IGrG4cFrWFZFLHowsdYdllxDPlIUG7c3w0AxGdkSM0WlzloTYOFNV/Z1mztaxkugppxgJhufw==
X-Received: by 2002:a05:600c:1c23:b0:424:8c26:a236 with SMTP id 5b1f17b1804b1-4248c26a402mr71896525e9.0.1719376912043;
        Tue, 25 Jun 2024 21:41:52 -0700 (PDT)
Received: from [192.168.0.103] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c824ef19sm10021125e9.15.2024.06.25.21.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 21:41:51 -0700 (PDT)
Message-ID: <c2911f68-d1e2-4b45-af95-590926b7a6f1@gmail.com>
Date: Wed, 26 Jun 2024 06:41:50 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: nvec: use x instead of x != NULL
To: Tom Mounet <tommounet@gmail.com>, Marc Dietrich <marvin24@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <667b2ee6.050a0220.f9c1.5426@mx.google.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <667b2ee6.050a0220.f9c1.5426@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/24 22:56, Tom Mounet wrote:
> Comply with coding rules defined in checkpatch
> 
> Signed-off-by: Tom Mounet <tommounet@gmail.com>
> ---
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


Hi Tom,

what you change in this patch is fine. But the Description is not so 
lucky. Reason is that checkpatch is not defining the coding style. Not 
at all. Sometimes checkpatch is even wrong. The description I like would be:

Use x instead of x != NULL to shorten code.

or

Use x instead of x != NULL to improve readability.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks

Bye Philipp
