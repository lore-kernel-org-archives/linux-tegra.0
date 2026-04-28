Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B775F47B401
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 18:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402761; cv=none; b=r9vrLlaOKTNo/DBjcdb8JsfipxeZ5BaQCf7xdNuwUhRneNW4FEzNlj0bIPo8bT7lBA/E2TutiLyR4ablkeiSdYtW6J5xhdiHnPaIJkGp3ptdeDr7ThO6JirCQC1wSFZsEWBedoPLOMsfKIjA9xS+8V2S60Ei1+mqPwRKUW5wq6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402761; c=relaxed/simple;
	bh=6a9Orqs4M+G9Ps0bWLS4aQAcCVzvmv1AumdBspToX0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDjxI/+9Coy4zzOEAO5rYciqjUrqZAsvIzlFj2lyZqoi5axziB/DOsKihHWsHORNSiZSn11yznfo6I4D8b8Nfp91vDmm7ppkQTCrSYvWju5m6h0HY5z1OpowdtEXwZJhiTR5YMeMRagyKSoYo/KzVKBPefx0p6cqvkjAKgiUdak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy+Xi6L5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy+Xi6L5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ad135063so107162465e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 11:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777402758; x=1778007558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iXO2sWkYj08jDd50w1qkyZoYNw3zJTVw3EQTk5oc1B8=;
        b=iy+Xi6L5tNxo7dbhFAp7TjRoDU/fX7dJZZsBbr8WxwdCyCdxJeukYdoe6MsGEulxym
         LoezibCGUSm4SBY3THjTcPHzPOPOB2muiTRZpTzSwmsvaO4ie90G0Ku4R5DxBoGT6Ue9
         p5M4Akt8xBlGfUEkzUp4axo9jGMrtTUpJnO4DhvydPa3TuBa+EznCA3XBPgTuafkI9uT
         41oATH9bb19X7q3YYF9wnEq79BijYYt7D5pf6S+o/BCRu6cTok3p+bcyIi6gyBztBoLF
         3PqfyDshmbDJTFSeIQRghpcg+JoM07jezQu8GtQbOrNuYr5va64/TUI4Q0A7LuqXyvdv
         ms3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402758; x=1778007558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXO2sWkYj08jDd50w1qkyZoYNw3zJTVw3EQTk5oc1B8=;
        b=gxvQ9SWIj7a0KaFMPy0rYjsJ6XBE0mxmWlxwAPYFb9H5/bG7VYmYjc1dtzZMadFqaa
         cyTR+WgiQclpHSSaqzMM0ngABSDSSTAX/bmPM/qzYgtXGMHMdMgddd1OorWp7xDv7Tcj
         VB2t6bbhNngOcAjEZaC1Lg95ILXsvg1LmFSXswfqYqMmLH+L1qfU5d1qQeixsEMweicB
         LqoxZaFcJUJz1JFC4anNi0UjltOiyGDQGPk3yg9qiX8mp5u+3iDQoTUIbaN1yARuQVvz
         NtsRG5hmgd9BtM9RlcJVZSNOM35CtXafHjMeTTNorrH0TIok4nCoVPVXSd71BuYgf35U
         I+aw==
X-Forwarded-Encrypted: i=1; AFNElJ9ovFwd3yVYWp9uqgceFZY0ttxtyNcWIsj2Rqn23gpKzyQ33PR6IvZCTleE546ndlga/ZDpQUYWbpW5WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqutbDgQNCVxcprCyeoVqDYiSXN8uqB2rfAws6UEbrfuXmM8BY
	lZxgAHxfFhiw46yvbeLNgexj2gMdXT8mF5hbqLLBm1sCGSITg1Ugn3g2
X-Gm-Gg: AeBDietjKMv8jWXyCaR9W7rqT1rBV5r4QBz4v0n//rEuHSZG7mmiUKQm/XjOAI1s8u9
	MrJiaZfdIlQ5JEaA1Z8ga2k7u7KLmWvoRJ0+tjVZJ7ZnqrJv+j2MbzEw2Olf9NmZBK7Av+meqTW
	aTV2RiYhdTY0V2b7vU4jEL4un3PMFywZdVBxmHP5qNNbm6dlwNkVP+GxlL/1APO55SZU1ttGXku
	weqMRuOBDVGt6itOn2vwvqB+IhwquuRByA8TKUMZRF2WN6drH+HTW/aFCaopIpdQm7B5e7M0Elw
	K1lnhVQJ+NmEXtpp+Pq7EXUtQEVDHsW0Dwuy2DbkLU99hp2ZM/xoHvlzeAbRvD8MVUZ0rtx2m7d
	a9N5SSJchFnVsGcpjVxXQI6nAk1FakxbNkx08s7RYbHqnNi5Vcri7zJC/AGW8sDktNl1WggitAx
	3Q/AUQj3sRN9e0GFx60xeqitqI+xd+FbqBWscGJ1MP
X-Received: by 2002:a05:600c:6610:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48a7b54009cmr13442935e9.21.1777402757968;
        Tue, 28 Apr 2026 11:59:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463fa89038sm8391584f8f.26.2026.04.28.11.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 11:59:17 -0700 (PDT)
Date: Tue, 28 Apr 2026 21:59:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Marc Hanna <marchanna111@gmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	skomatineni@nvidia.com, luca.ceresoli@bootlin.com,
	mchehab@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] staging: tegra-video: Align wrapped function arguments
Message-ID: <afEDgrzzxGf_VM5B@stanley.mountain>
References: <20260428185024.853-1-marchanna111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428185024.853-1-marchanna111@gmail.com>

The subject still says the patch is aligning function arguments when
the patch is about long lines.


On Tue, Apr 28, 2026 at 01:50:24PM -0500, Marc Hanna wrote:
> Align wrapped arguments in tegra20.c
> to follow kernel coding style.
> 
> v2:
> - Fix From header
> - Update commit message per review feedback
> 
This goes under the --- cut off line.

> Signed-off-by: Marc Hanna <marchanna111@gmail.com>
> ---
  ^^^
here.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

