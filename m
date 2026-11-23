Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400910;
	b=vLnnPim3ej7xjqAt8NWIPKFxiFalCSBLK9GhEuVQRwnlDnAFKk1iR6zFdaDJL8YaFQwi
	 Cut+3+/oy98bO4PIhfrwDb5Y8KPreanJf3AdF4H25LR39M5PqBAbetSRrP+D4b9uf78xJ
	 vlvgDwaeM2gpztJS9FI4n97+MRz1mBv5E8/2xbW1RiZ9Wy0SIN3jTul79n3URFGFyJq7H
	 /SX9D5KrgbaEZlFSR8lNngjfuTjdB2P7NDbIgcnI3rdrBZGNo6PE+f81iI9sMQNIMlCbd
	 9DOibwNtUlnLwsKj0azR0ZMHz+IJOAcwfu4+CEKNX99F1CWbwfMyUG+lIQ5di5BYzUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Sl/jKCVgSD32LaFfQfoKkqKt/VZL+Shvp0SZIGxaeZI=;
	b=KCZTweDJ3o817qURcxnVQzdjBUf3+1/UdoT3y3mcGOHvOY7l9eXybUO2gQkT/6SsISVx
	 5aeqPsSIQXoUxG/lnT662+iaySv82SSR8djXj2QdDYF3Ml5nHo9kYLH91uUKiJEE5HCdJ
	 dLlMkumGHQl4FIk1SDr9dbdx2IbANDpUvTJD/BimdP0wGKWvDdbtnpBAT0Rrg1AxzJWrE
	 pNzMH+AHoXdzzMk89JK9Rn0NEiOqhgte5/sEcXHdpHhkCmqUphUbM1PZKtufCqV/3uJXC
	 7mNXucDeoCfRmxwyFajJ0Uz8YBbto2BNoDAc2HOuOr2UOGIhF/PdUyEvqymbQLONHPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NkHnYc8C;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC18E606A31A
	for <linux-tegra@vger.kernel.org>; Mon, 23 Nov 2026 02:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC18E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NkHnYc8C
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so7879593eec.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 18:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400909; x=1796005709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sl/jKCVgSD32LaFfQfoKkqKt/VZL+Shvp0SZIGxaeZI=;
        b=NkHnYc8CUqkuAR+TowFEkpv+JMo/jYm6MgCrAZoVYCGYXO53FaBRVwKXld+eDVJeRh
         vLL0Z653Z5+lD2/NcaVgyOSfNpKOpIRvjjzBQrWGhcFa1duZGU9U535sv1R1y+zzGKIi
         zcy0ybik9BFKVf1MV26saHmIFZc0VHPkKlgycOWtPLl4siReomtZRs9fZsFEribO5+pw
         GWCeKBkkhotP3FWS0ccMerw6Zh4FloKAt0gThBZjJNSSvV/QFXIP6IhWl/wVQkKAe7V6
         IvARRdsnNavMzUg6uqgNfO+SJVLTjPq5viFqhze2tmMurHbsUOnBk5COvMeV1TB42DPo
         cUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400909; x=1796005709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sl/jKCVgSD32LaFfQfoKkqKt/VZL+Shvp0SZIGxaeZI=;
        b=Shp/Kz7mTkyT2AZU1lY3atRA2kuoaaa9UN6nZTqovbbk1vxNt3H5U6kdnETYPZTPjR
         3KSQdhso890mkNfNb22NS1Ch2TjCUsjQUs4MM+R06dysCHbXfi7KbtN+JKIezwRNLGzK
         g8HFtUblwcb5pvDUVVyhO1Xgq7GI9qs9kqm2rmGjX2Z0WBj6e2FSVfe/YDBcF2Tp6rzY
         gQiv6ee3mzLfR5dQ7og7+rBqFPFQ617ltHCQGLWlecTezlUtpUAHDSF/kndkN3tRYGhh
         VLjJdFsoXp7YlZVJohgkEAKYPdF9AGopJmpQ1aqX+JdKuKUYAFpzW3zszAG+xW0mynEL
         Kz0w==
X-Forwarded-Encrypted: i=1; AL+hErF50tL48JcCDs4874b8ZqxFrK6YAQmb99BjzlPvzDdcm881UfiEjfq+rJZPrUpfPWpzGCilIBuFTNPcmA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Aojavk9uMDV3BE8aY+8kahxuJXZU2kaixipfTBfPzB3vOqf6M
	/6d4l3/schT7PIptHBaHRIggXZLJXZ3VuA2FDXC/HOabCtjxIzHX9Yip
X-Gm-Gg: AZFdTZcXynptAXL0flaWtotfYZ/FyxhQ/HUk0PJGW0h7WViYNS3/6y1IU6k0OxmxjBh
	8ZNMTmnTbMqqnmXCOohiFnFW+/L6BVh6+Zj2+eoS2zH88BkrfIrBET1vjLRmk8zNZY1iirD/YmB
	qLil8X1IR9v1vHWVf3BePBOqc1xoTAY0ZHZCwYHkQmF1PnDViOuWzAIMhilNTeAZ3P+955rZ4RE
	2UiHEyU+XzYUokj6uhYHcVSwD/6qJ+kdgr34zO7qxVWL4TLCfkjeKQl6kKV5AktuYmrYc16J5uS
	vtnWFnfYSph2KYrmBPWHGTs9mXlyJ/C+fLFZYxqjwGkBbKzvtS7PLfJ+OJy7I0NQvP0pNBxIGMk
	kIgs/fNeqlKufv6sqiRo0907zhu/FnnCBBuowJXYjWKFfw0BFuNNUuNV95hrioef2IDe11QgziN
	9rqXMwh/6fbHVhGvQRZOT6z3xstU14xoJy1u3ad2HZhcNnHrRs/IZXIfPwIB3uMLOoVfnj6meHi
	GI4QrkT0GF0TwDHdeGMPqURzzDLeNSKYb4bWoMGpwiRmZSA6Cmr/WhdzAT3s3R4UlrUKOdTb1/W
	rt1/WnAARogjYaJhx2eaUEg42VzykXOhD3/mJ6zpltOa28yEe+x5nX1mcAX8YwqyiiLrQqg=
X-Received: by 2002:a05:7301:d805:b0:385:ce95:2e14 with SMTP id 5a478bee46e88-385ce953221mr9510209eec.30.1795400908908;
        Sun, 22 Nov 2026 18:28:28 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm35337348eec.10.2026.11.22.18.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:28:28 -0800 (PST)
Date: Sun, 22 Nov 2026 18:28:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Geert Uytterhoeven <geert@kernel.org>
Cc: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, mfd@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 2/4] input: keyboard: Enable compile-testing for
 KEYBOARD_ASUS_TRANSFORMER_EC
Message-ID: <awOkxOB_owPvollr@google.com>
References: <cover.1795355432.git.geert+renesas@glider.be>
 <8b0c54dbf722168d9272a4bde9ed4618c19e8afb.1795355432.git.geert+renesas@glider.be>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b0c54dbf722168d9272a4bde9ed4618c19e8afb.1795355432.git.geert+renesas@glider.be>

On Sun, Nov 22, 2026 at 02:56:31PM +0100, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> The Asus Transformer's Mobile Dock multimedia keys driver builds fine
> when MFD_ASUS_TRANSFORMER_EC is not enabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thank you.

-- 
Dmitry
