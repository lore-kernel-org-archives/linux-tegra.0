Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AE012B14F
	for <linux-tegra@vger.kernel.org>; Tue,  9 Apr 2024 12:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712664959; cv=none; b=kUzCwtMaoaH33GyCKrDJcgi7PK7M0Vvn/ITUtOEzQlep0YgbgQb5nbmJb1nay2ol+IPlSZ4/q7roaRWF7y0hCXWOvY54MKaFfI44A2Kwh8cWVZ58p1Jhur2frutmJXpzRovYu7PmsprBUB5bpfbVH06CIp3grdDKj1y+6vMBwEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712664959; c=relaxed/simple;
	bh=yPd81M+1NfZphw3W4cYk6nOj1ArNbzmhlNz4HC9gqq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGoX31msrbAtJv2HOO4JezJjmSEYAe8T5wt3zi5D4NIdfFdwnmL2jon38D4SQIkL7GEh6RKMlHpLuYool1hy9DcHSw0d6e+NOwwcGPQsKVnVuA+uPSTghWiXIP902nNX9ibcQ3hdZawWi6yh4AkiBqVbZZLqxjzeuz8b6zvFBGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cy4v+7po; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cy4v+7po"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a450bedffdfso779490366b.3
        for <linux-tegra@vger.kernel.org>; Tue, 09 Apr 2024 05:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712664956; x=1713269756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N2a7zpSCWKKDFCFWBoP14IB+FQzIYEADjjepMzBJTyI=;
        b=Cy4v+7poBRkXZpyAW9PmUxqoOSdRXm5+TD5wylJrAdZAVEtJaZPTt7YzxvRP5TNSKN
         Kv1AoiO1Z1Iw/acNKRUXQAuRJY++yd9HX6iDT5xFuQ7mKv1kX9y7zpqn3yKMRACBKj4q
         vOfeMUjVXRaemIWM8Bz8K4rLOWVgi0xYhH/oaKegZlGTgyWPd+fF2zws3eNhRRub5m4K
         EJUf7mEXlt5wpPP+fx8S3NeZpCOvrghXUCi/7HZPoEPuDHU91Xu/Nx/YLQ81VI45fwOR
         0o1xvkFVM/tgRkrjZm0OV7L9X77RBYd69Mhp391muPnVyqirwntkBXKOHue6WznuST1J
         PmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712664956; x=1713269756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2a7zpSCWKKDFCFWBoP14IB+FQzIYEADjjepMzBJTyI=;
        b=a4uLq06Vglv19hMS/1aVZ5RrIdqJKj0zxrsYdUU5yUKc3VLFK7+sKa2X9/a+yLjWDR
         coN55hy9TVlPalsGmyMVZmZESaLQwfxaJdtA6RjCMPjb7t+5LG31WU15OB2GzehqTti0
         Qp5FEA/4JKIfUpKUXHF1PZPbP914bGMlVQwSI8ROkiwSwdEcXopmxGsOFyhUQNFIiZ9E
         hofCKlAo6NsNhQ00MhCmYK4XXAIaSyxXsOpn4aGsI/Pd86hEs8hny2WKPEqeR3rfkkH5
         LTysgRdHOBCopnjZrArSxHkANGOXFBtAnzAvlAJNPOwFUkh6KBVSVGKbVmwjn+WDTP+e
         D+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPcOYLmRxGnOLtXB5d14NT7slx0AjbHmuIH3IJqEvqz7+34Jf4+rBD3l5m8Mu57mdI7kUONVKDXjP6fDffYBy2ElgMr9R1q8sXAMM=
X-Gm-Message-State: AOJu0YxmEHqeeSfuKRvnMjldteCGu4WAwpl2ByIm+hKbIyqVl1vvCi2e
	wB/k+ESv4YcgPvRMrWQyfP9q0nY8EvGYsqWCBDFnsOJjAttR/FwDR1eOZAdygprwY0+Szj/o7pN
	8
X-Google-Smtp-Source: AGHT+IFE/zCvPySd/Jt/cqVeIJgBn1agejVAFKR8x0SZSzXrJnJAe+FV3CiGMlIqGDswtrhwFrIX8A==
X-Received: by 2002:a17:907:96a8:b0:a51:904a:e3ca with SMTP id hd40-20020a17090796a800b00a51904ae3camr9982209ejc.30.1712664955960;
        Tue, 09 Apr 2024 05:15:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gv18-20020a170906f11200b00a4e1a9e1ab4sm5632229ejb.157.2024.04.09.05.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 05:15:55 -0700 (PDT)
Date: Tue, 9 Apr 2024 15:15:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: topcat <bfonseca@ime.usp.br>
Cc: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	topcat <bfonseca@ipt.br>, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fixed spelling mistake
Message-ID: <1204e94a-d061-41eb-984a-86a29991637f@moroto.mountain>
References: <20240409114045.13872-1-bfonseca@ipt.br>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409114045.13872-1-bfonseca@ipt.br>

1) Fix your From header.  Use your real name like signing a legal
   document.
2) Use the subsystem prefix in the subject
3) Add a commit message
4) Add a Signed-off-by-line
5) Run scripts/checkpatch.pl on your patch

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

