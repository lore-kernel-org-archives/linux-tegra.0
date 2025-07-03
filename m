Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1582E2EE9
	for <linux-tegra@vger.kernel.org>; Thu,  3 Jul 2025 10:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538819; cv=none; b=MszDS3AkNFPcaAknyxataQrq57D3mT2T5hXisckENF0WhavPcX1v19ZRahzhBjLAVrcvVw/Wajy7LSuckpxWEjTLAGwMY7K9wz3YVuol2xjcu5JK64uKCfpVvEHIssUIasDm2XwDJzYKChEh3tvB3uQ0JjMksZJxQzqqCf9sXYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538819; c=relaxed/simple;
	bh=xe9m/r2wNEKhNTq1yGfIvhKesACxvY2oAvUudaItXOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMkBaj6UxrIX27NWCtO7ZtdLwGHPOz1fyMFDUty/jF2zyRG/X7GNovEgHgoxBuhcO1sOk7Jh984oBq5YVoYoDmn3ZgbpB8NvAtgEk4YtcoId6DBqVFpC97+gvcQ4c0Z75s/R3FEq0dZ4jwNCYdPFkk/+yFeJqEgKFxLHvIqnCJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NgSdbYKW; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NgSdbYKW"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae36e88a5daso1082741266b.1
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jul 2025 03:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751538816; x=1752143616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FtQ9lRAm6z5cCoKKpjFUoJ7pNUTxADNFPTG8yUssXP0=;
        b=NgSdbYKWtC1iB97sW90g4jlmqpWTRwTaKuaZkMIwgWJbO9dJZTo39WHco1/oZjtQ04
         WBc3mf7RoOmNkt9wUOyYtHQ2Hqq45D3yvE42j6LJSTGHpJ10ROoW/6fyC9TuSUFPV/hf
         HziW3SdlMtA97glCSrfvaCjifsyAZnkckMzqXgAfD6sov0/znm89nsf3vWIQmCw3GjJQ
         iOsgtx1zNP7KkKqjZ3cpw7STuEHOlHJALy/BPh2JNVA2RMQpgevZUt2dcM9Y2lVMu+hh
         L1ENVHqm9/ktRvh3dg4IBAqUNHxKRpk5CzBX+QpqW4xGMwwzb11ndODRM+IYJM+XO1Bu
         8y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538816; x=1752143616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FtQ9lRAm6z5cCoKKpjFUoJ7pNUTxADNFPTG8yUssXP0=;
        b=k+oY8WN3OPI6tqRFmBY5MvxleBov2iUVVar/C2AoNBIkSHvf5KnhJkfCA4Rkdc+M4g
         2kFCejZzLRJ42Mo/xm+QIbtMhH+BTD0AloWXenu043ajBQQq91sphjdLx/M8JE7yqMeX
         ShmAd8PxvSuFgcOCKzOpMCsMU32mfiu0CiDm/0Q1GQMGdasYtTVC+YyG5d3V2zw3CLsk
         Mm9af68xnXDCI6w1TodPj+RPYVGmkoa+pxL9dAQH09UMswW0YTgvAb1LhpngAmbYmpXz
         uIf3isSck7BtlrUuTv0VRAACt5MJtNu4tYbOQoQ1jSUqwsAMNGYd6LYiRPRbghlSXl0a
         gBvw==
X-Forwarded-Encrypted: i=1; AJvYcCVV93T2WFM2vSGezSY8Vdg0J+A4nj0UCX23evSSfz82TK4HkTFT6NtLSQgrn1iiYnB0UPKIhvLPQbkU/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3fict7jY/5X6vdlRBLG7q5ZW1oUC6GsSgXXxsJj6h2odfBxK0
	cex7rS0+yIq8AfblMl8Ea2WYH/FIkq+f2mU/J4q2aqNSdOi21C2PrBE7OSV1T17RkGw=
X-Gm-Gg: ASbGncstYKwgh8cGMnVnRwvsvSBt5WtgffxLLnqSGn4MRuHo6FIUqbZXWPhJHMarlnC
	Dt0OL5AFqysqa0DdmhZcFSxtZWs7cJsIzuxEqvANEMhACVXAXJOXHaQmKWGvUK0koPzwz667BO8
	pC8QTSrjGqEY70wD2JGnXR68Kv6uN1Xkb2Iprx06Nvx+FsG7M3In7oAFtQo2yVCeK+4US5x32i+
	sawj99r70Kb1djeLBwTPkQTfMwS8datfxuhVNcW4egE6XCx/FJLABxYJpYYNh4/zkrV/dry+KQF
	9+5RyD6VSbisVgwXaNt9pQu4Metp+iSnuJGziK6LC1hAZECqWDJXslLnfDeWP9bTYYvpzixEQ3P
	Qcd9ZaC2DGbA/BGeu
X-Google-Smtp-Source: AGHT+IEAH1Qbn4XNukfjtEADuVdGYHRx0aWx0QTiYECTFTYG6zMFHteBb3TPETKc8kywiiMldQNjzg==
X-Received: by 2002:a17:907:9720:b0:ad2:2146:3b89 with SMTP id a640c23a62f3a-ae3d8983431mr230012266b.47.1751538815896;
        Thu, 03 Jul 2025 03:33:35 -0700 (PDT)
Received: from [10.128.60.15] ([81.92.17.128])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bda4sm1246384366b.141.2025.07.03.03.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:33:35 -0700 (PDT)
Message-ID: <fbfc6bf9-d7c6-4df5-85d0-b1d357159d88@suse.com>
Date: Thu, 3 Jul 2025 12:33:33 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Forcing devices into idle
To: Thierry Reding <thierry.reding@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <rlzpjdsg6cbgxc553j6m25ysb6tyldy4lnxsjjn4hdzv7rszpp@y6rfcrbjfook>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <rlzpjdsg6cbgxc553j6m25ysb6tyldy4lnxsjjn4hdzv7rszpp@y6rfcrbjfook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.07.25 12:08, Thierry Reding wrote:

> Any thoughts on how to solve this? Is the pm_runtime_{put,get}_sync()
> method acceptable? If not, are there other alternatives to achieve the
> same thing that I'm not aware of? Would it be useful to add a new set of
> APIs to force devices into an idle state (which could be semantically
> different from runtime suspend)? Or is this all too specific for any
> kind of generic API?

Basically what you need is what happens when the system prepares to
do a snapshot for S4. However, if you just perform FREEZE and then THAW,
devices will assume that user space has been frozen. You need a way
to substitute for that assumption.

Runtime power management is unlikely to be a fruitful approach to your
needs.

	HTH
		Oliver

