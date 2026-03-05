Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F323FC5A
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 05:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772689973; cv=none; b=smMHDIhWq7QDA3AHHwfwwZvKcmg5vjj+bo0KMBDje5i/vCq3kc8XhhTtGHXr/YAmp0sCZhVkTsDSPbDtJSwhX3Qeo/YSVFtrfnzLGsvs0o5VAiHor+uMxFuwCPvTnw9U1QuSqBQ++1vcfi//Xn+u+inaH0YwjmOItxuMw6aq31s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772689973; c=relaxed/simple;
	bh=PAib3q2+jzkZQl2SQUl2CQJxZ3Li/poRIFophP65rj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4SQKmkDY7pAjR8AP50YGv4Xoqg2J4Ja/HP4aCJroOixUKU1j8N8sukv8uU5B2EgyX/gL/qXv52VmhScDY6yrVKP6r1E/5u3wPcBEbRyDeJRGJisw9n0sCL7ZDq2WrNT8y9VBat2p3RNmgSIZ3mtwPY5ky1o+YuPwBu8Byv0OXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y/TGbKno; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y/TGbKno"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439c4a93841so1406285f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 21:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772689970; x=1773294770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PkSdYaC8CvQvE6HYrnl/qBK5Q8vaUau7HiPYcQ/FByA=;
        b=y/TGbKnosZtw89ndnUVmJlMuGVk7MTfsex6Ko24c9P+jreRFWU6FakI46s/tNkru5D
         J5/G0As6KQuT22OLyXvuhW0nGDqfwZtVKOQro9l0I3I5nXQvO/YX8ncArOMg9p0oVpVE
         IMqug/3Ks/PGvDXDPC3MLpoYiwJzBCYWNB0uZfu6wk+9VkedU90w7W1uo5I2T2T9STch
         YYQoJ7+cwGRMhPtYLG2uOHtGvzN60BNu7HEVV8GGWC7AF4/9gAFj0f3OMiMD7RDeGTKJ
         4uSrG+cqpolVbdoq0DUk9svOFjGgzqhArYDAu6czmWCRd5HCTqw78LJjQvbxKyQlD+R4
         53Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772689970; x=1773294770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkSdYaC8CvQvE6HYrnl/qBK5Q8vaUau7HiPYcQ/FByA=;
        b=sevk9VY8v6U+RD2jUD2/u8mW29aVP71YwuoqZkMVUweKzRr9KTBuliGecSDPi5Z9UT
         59l4PtGp4P3d8TCmkenyKToDrnlE9aYB0Oke0m7A5oWgJ8uroBOReWpc+23Y0tTtNmSY
         1TvsTPrV1dU8uE5bt/F1iM4iwpCi9kNm3+Lz0imFvB4aG4D2gnNXMwkHgXhD//xkfI+4
         6W6YJASRDzS46iNRwQAs5Heyo+IIflM+/+r/+10YfcVtq0QmMbExGA8+D2HtC2ofLoSq
         y7+ve62h/YLRSTQSjoGOb8ADqZ9WPZ0yzyqSleb3vkl/pDPiSy2zSZRFrDGT7jEWRMv5
         H+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWOdHfbKoSw3G3paDMIOP8p6rUULQtV8135kgw7upJLauwRqFrHqk5cQQzVZwMkHhBdBIqeqyz99pTlPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl8f9LsWD4excZUAVkke5LkvhTn8aqHUlwRQ7ohJN7iUzDziEk
	4kHAiMvuWZCBfgAoJ00RWxBtP1+xJ+dV4WU4zwImMl/GgreYdhBXxfkdYdlt5blg7jg=
X-Gm-Gg: ATEYQzyfYgP/BhFcuP0zq+lImr8ea7ZIch1JKW5A6Ysa4aGhBSYn8P+yt+nPYQUNOka
	YdSF2mr+Adf/lBtM51VwNsmJ7QH/TopNQk/QldEI4EMmTOoRPNAQosXvUaQVK5cqnw5id7hAnHD
	Rvssuc6kEpNophvXq/Ju+vRjNFUupZ+NXrtOO9zVoxIZk/0zbHcKJwWO1niNvVip8Md2I/NvC62
	TMZEqgNudtgMQ9B0LVEX3MIP9ILlT+WnPostP+FGTxAA+W26ROCAjSZnBIg34btn59t0vNX5+P+
	XISzOEZzWwiuTVLryFb8S/+9fhs75nhMB4v7zAxjxrKSSxxFZzzlXJq8vfe0G1+kRnJs1qD3zn4
	lMXjULcno5u5BGH7b3xHLrrWypMbsSqjFhMzUsdiY8nnrH1WxsSE0FH8t3rYMa6dmuBzqAVVtT4
	PwJkGSWy6Dl71t2WKoKd6tgI/XhUPh
X-Received: by 2002:a05:6000:430b:b0:431:8f8:7f24 with SMTP id ffacd0b85a97d-439c7fe3a2bmr8326230f8f.39.1772689969742;
        Wed, 04 Mar 2026 21:52:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b485a0b6sm31427795f8f.39.2026.03.04.21.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 21:52:49 -0800 (PST)
Date: Thu, 5 Mar 2026 08:52:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	marvin24@gmx.de, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: fix multi-line comment
Message-ID: <aakaLv83wsXQl54x@stanley.mountain>
References: <20260305012626.56403-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305012626.56403-1-marusik.adamenko@gmail.com>

On Wed, Mar 04, 2026 at 05:26:26PM -0800, Mark Adamenko wrote:
> Fix multi-line comment style flagged by checkpatch.pl.
> 
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---

Someone already did this.  Please, work against the staging-next git
tree.

regards,
dan carpenter

