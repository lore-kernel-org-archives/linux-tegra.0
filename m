Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794783424;
	b=awB4nq5CHA2Tc4h2hrjsetZVYTOQOxtWKN924HRGaau7PMpVnS5CuBa+owNRhTYkhxU/
	 ADIoHruaC1fCNqigsGlAGsBZ4N8lncQizoUG39j/vec4NpVfRAskswJMfoNUYzL0kWn96
	 R52n52HcdeCt5/LVVO/M8c2yC/ijyslwJEvSE03L1xpQdNhm8UJADdat4ZYrQx7TgapYP
	 Q3umXbE3Y3aDFNpEV73fjUalq/i6LikxJz0OLV5FRHtI49Q4AcLlPPHe5mzttBKJ9omUB
	 fkciRLgdpSoXCGBrlUIO/YSDeAl6hNZG6AoNCmi5Lb1zUd+XKDntiDCDM1ARFmKRh6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794783424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WpSIe4tLJIwZsVjPZznB7WvuZ2lyXPI8G0YCiWHPn/Q=;
	b=KR2Ag140A669QIo6kUiIeD1YWRPKH/uojocXj/UUEV2Ra5c9+ZJc2ee4a4GvuHRR5Fky
	 ADhiQ+5owpmLeX7QsLSanr8Ku4w3e3mYUpu4PZ7Fms1Ab6NrPmLYLcCnLD7BxxcXYbH/J
	 Ni5wbkKjkFzFMkTcnJ8bjMA7GTpbC3d5+BVMiT9DdHEme4EDBAm9UopbIMAVywV7/94M6
	 JUMEwn9ma8uVSErTH67FKuW8n6x2EHgahTQdcpAMoqFM6y9h+cA1qIhcIP5xisnG1olYy
	 zfExVLX3cl/mgoPkBR4t2vU2Kw5zczwZhHxwv3qhgxXCAfmx98Fr+6SgoNMp3LypX7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJAzbxLL;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED69606A31F
	for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 22:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EED69606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJAzbxLL
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37f14feca60so530704eec.1
        for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 14:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794783423; x=1795388223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WpSIe4tLJIwZsVjPZznB7WvuZ2lyXPI8G0YCiWHPn/Q=;
        b=zJAzbxLLJfqk9yA2eC3kpKBXCxMa2jNFOheVKVl8d+f1BhsoNlJr1vailxT3fV4aNh
         wsIxeUvlpzjqUPydUUFh3juEsi90wpvUE6bEffVwojrq8u5/k+Rb3KInJn94jYL8tBV4
         YuwwfU7Ldeg27w4likYqMzN7xmM18hRL4DeefKJZ55jwwxL8VXkpNfd9HEtE44FUDRnw
         zjurKf0TMY0nouiRkgcxelUw+8SA4Cnd7NSfGIiGkeLF3OYRNfXq0OYT05NcFzBlePQO
         dgIuH75zbo+5ZZgLTNdmtVOClxxy9x9YyTyWWD+tbRZvQkigXIObXTQCv2T7h3wkg7Pi
         C1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794783423; x=1795388223;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpSIe4tLJIwZsVjPZznB7WvuZ2lyXPI8G0YCiWHPn/Q=;
        b=k16E1klSvAnxBRvl8nji5NCY1/FEFoYhCVcEzGjrlQ8nhSVNjRKOKtcnUJliX7gSY4
         qLW2m+AwtW2j8iAq0Kzi0va1N0kUDnzuV2Lh66+YDwdRhoylC0vw30s08BAE8hm5oDCa
         HimkjOM0IqDZAvymITuYOOMJE8JR11MBJUb/SuKFkjVbmHlo4C5+N8T/M5bizqDzQqg0
         8Mu1NNXCWEVkKv/y22iyZ5FyStzyUvIj1Lyr2gnMYEE7ATSfb7cY8p+INJA4i5SXoYlY
         A2NpRnR/OYtxo2ckiwG+7KpQOOizz2JbP82D/doVaxc6t39S31jSWMNUEBjfpkJFPAN+
         6dIg==
X-Forwarded-Encrypted: i=1; AL+hErGQR81O9C/3xaQ7D9sgcU8tZ4BkFU4+G9zyaRi6U2byG5H91I63vM9R9C+Shj3qzePLKRJ+1ZSQ3mEHWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+k9wA5ONig0exUos0kIDQKhMFW6JmYj4NpZXx0DR9A84BlZhiH
	klVJ/x7MN4OQgjskiDBLa47shg2lwx8OCs6HYPi0Z4iAT62sRcR5CXle
X-Gm-Gg: AYBFou1c0JRVQipc5pnVkPSwp8KCcmUrlflSZw0EbvCL7cV4O5odv6nfhctNyWrrccD
	ctYZw+3FkZ6GUuy+ui08+qAObCeVjSundLI0YX/lj0PoB/rQZ0q8GJrYrkEZdK7wmEfJmK6+hfz
	DaL+T+4Y7sUKbNV4AR47wucZi3KFaY6FP2sT0f0HaZ01MdyuZ4lFYOINsYHwmOTWqrpeiJm79BL
	lEMN/u5MnuHPUd7XVIxv311r5xPkUiVlezK6a3yFSNld8o02uy6i6/bWMONgV3gxPG0LigE8ii0
	HWD2IOn0Yf2zRezJ3jsoFUTiqRGfCD/mmaZcHE+6Bp1wVA9UkKYU9Gx4RK/kAkTTJ+rcHQTHIGC
	QS4BJn0IF1Bk3rmolHHeSniz6E0EmNJDBdPk5raztOdKhmB//Cd0RqfWgyW5mvnjtVPhey88GKL
	Es3B/V6zqXe1opWyZ5COf2zxH+XA05c5+zT5Ssxijw2F6mG8ZbR49632IP9yqgHIl7SuyLsUzOr
	Wx3SreCxpT4F68Tmhk5927V1nvUTIXG++0d9NTw73iMURFIOYVBF+w31IIZPGQIEw9+lWePAI6f
	CdRgyRb4tBlKMhQQOXuTHksmRdUwDXYA11zUhVz9dxt1FLgi1IqHfJZmD7KBGTgau5R88CiNjt7
	8PuUOzMqt4melUEI=
X-Received: by 2002:a05:693c:4153:10b0:37b:e40:397e with SMTP id 5a478bee46e88-37b0e403d73mr6432496eec.14.1794783423022;
        Sun, 15 Nov 2026 14:57:03 -0800 (PST)
Received: from [192.168.35.214] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm28183468eec.3.2026.11.15.14.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 14:57:02 -0800 (PST)
Message-ID: <2af4c490-8655-4afd-8c1d-1894f910dcc3@gmail.com>
Date: Mon, 16 Nov 2026 07:56:59 +0900
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH] PM / devfreq: tegra30: Remove redundant dev_err()
Content-Language: ko
To: Pan Chuang <panchuang@vivo.com>, Dmitry Osipenko <digetx@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:MEMORY FREQUENCY SCALING DRIVERS FOR NVIDIA TEGRA"
 <linux-pm@vger.kernel.org>,
 "open list:MEMORY FREQUENCY SCALING DRIVERS FOR NVIDIA TEGRA"
 <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20260713131316.322358-1-panchuang@vivo.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20260713131316.322358-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/13/2026 10:13 PM, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 401aac6a9f07..d149694becd9 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -880,10 +880,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	err = devm_request_threaded_irq(&pdev->dev, tegra->irq, NULL,
>  					actmon_thread_isr, IRQF_ONESHOT,
>  					"tegra-devfreq", tegra);
> -	if (err) {
> -		dev_err(&pdev->dev, "Interrupt request failed: %d\n", err);
> +	if (err)
>  		return err;
> -	}
>  
>  	err = devm_pm_opp_set_config(&pdev->dev, &config);
>  	if (err) {

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
