Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B76DDA0
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 06:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713161283; cv=none; b=reV8nSLYnvzdIqaN9iGtW9ub1htuh0LPfKtEiiBq7DTmFmrjc0L3VUmtyHWnVILAI4gHgP+tLsajyqypzwLu2ut9ryVSYB6UPF14/5s03oYKqFp6EPwrToVFn9LHnitZgZ1aJeQKce5mXjXOTuDaDvBsNhnoIwaus8uTme6tHjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713161283; c=relaxed/simple;
	bh=c7uBqIlqxc8EB+q1+8wjP39j05/0pTfzAZzFqik9e+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjpYw+EZa6GrsrDyX/045syRqCyJB6A4eyB0YBPEP11Pvd3X68spcRga2UjBSxZ3xyQKUXWiOJRpr3hQtrR6gsXPfYEtMrsqKvB/PlwYZnx0JmFNC8PLJ231gRM+rP0fL30zGGRlhN4V4wnnGxdl2+e1JURvyWMN+UaJNo/UoUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+kV2OUW; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+kV2OUW"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56e346224bdso2033458a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 14 Apr 2024 23:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713161279; x=1713766079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=73LhydqsMgrjIBMP/2ZqAtd7p+VoTyZYOkWO7qOnBJk=;
        b=W+kV2OUWrlIvV2xbJP4ntT5vawuL4JWDKi7WsYlFD9puQEH+rl+ZedceRbF3ybfjS4
         CeA4Mi69tXD0WMbp1yU6B1+Yl7x60jcaKSwoqywce+57ZD2lMUW7Ut69epu5ZSXf6hpv
         LOZ5JFuH3rgzbqe66iCX0u91uoy2FcEO7yt1/widc5Mip3KgzYTtzTdVRql9O3rbmtv6
         rCjAgHumEzYF4LiIdijt6iaUx2O4EHW19+JcfO7VXAKXjOhIXkB7A8JQZMr9fU09vnXC
         Jrsb/rJ9LyT20Z7rDSAuPZF/vYD4mX8+E2JTx80y40aXk37fvWvHLdCY3pxt4MzFsH5r
         3nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713161279; x=1713766079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73LhydqsMgrjIBMP/2ZqAtd7p+VoTyZYOkWO7qOnBJk=;
        b=MXeKXgk/8fn4pm7IEe3lnFt3sjwxoLoy5j9Hnb5i/vf5ssgeSeAlG6SMLh/Nw0qou+
         8TDrSF/BsBtYizEK69x+j+sEq9lY8JmK10f9BE41pfE4k74vi3L+KMH4XoLNJ5u8ZE+q
         buBYuSvn905vjvrHXvpxBUcI2MJ5kuUY2hKa5m8VMxGBX4Wzw+PO/w1T/27C/3cxC/Mj
         UUmqLGnZNd6FSpIdXkwXBgbbxx0a35c69vxwA+x+BHSZ2UkKAjZD2Ha3mAYag8IIoiv9
         zpgcz2yuaD8pfS8B8B+hZDd+YGSg0pDKz3AvtkbGg/4/vU0xY3FbthjHzxcB1Kx/BxDp
         SV3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOv2BPU6Gc9DG9mZp/hU8artbPlLBfH6HiuEYmLdBuPYbjpOru7LR5jYLwRcnxnApfB1k5ADKCE2vASVWED6ekc0qnBHen958NN+A=
X-Gm-Message-State: AOJu0YxrHrJBX3C5y8Lhm3lbiIGmB4/gOOMGI32EUj8FwU97Jw/kzm19
	ZNp6KEyKSAHnmdhNqmFNpYCbstjIxAqOTCyrIMOWoq0Au/fXdN/Mcgx4QI5stPQ=
X-Google-Smtp-Source: AGHT+IHmITPax4f4YySVTT5+4VdYth+661F0LDos4jMzkmbrI7jOh4X2xN6MhMQ7iwLoybhaB4n7SQ==
X-Received: by 2002:a17:906:1389:b0:a54:d3aa:64f with SMTP id f9-20020a170906138900b00a54d3aa064fmr150727ejc.62.1713161278500;
        Sun, 14 Apr 2024 23:07:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l21-20020a1709061c5500b00a473a1fe089sm5021475ejg.1.2024.04.14.23.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 23:07:58 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:07:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH V2 4/5] staging: nvec: make i2c controller register
 writes robust
Message-ID: <18f8a452-083a-4764-a039-437d305277eb@moroto.mountain>
References: <2024041156-renderer-shrunk-6da7@gregkh>
 <20240414150937.22621-1-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414150937.22621-1-marvin24@gmx.de>

On Sun, Apr 14, 2024 at 05:09:37PM +0200, Marc Dietrich wrote:
> The i2c controller needs to read back the data written to its registers.
> This way we can avoid the long delay in the interrupt handler.
> 
> V2: rebase against staging-next
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This needs to go below the cut off line.

> 
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
  ^^^
Here.

Greg applied all the other patches in the series, so sure, you're
resending 4/5 but probably it's less confusing to just call it [PATCH]
and leave off that it was part of a series...  Just put that in the note
under the cut off line.

Send it as a new thread as well.

(I wouldn't have commented on half this stuff except that the v2 comment
was in the wrong place so you're going to need to resend anyway.  I
think DRM puts their v2 comments there but no one else does because it's
weird and it doesn't need to be in the permanent git log).

regards,
dan carpenter

