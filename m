Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C2113D2BB
	for <linux-tegra@vger.kernel.org>; Sat, 17 Aug 2024 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723883145; cv=none; b=h1uZsTCGNbs+KD2tZG9YaMqtH6CCIZ6uHNBy82uRCwvm19tem+f3occxFo4u8NZ/2g8i4A29lpvVu70sPcpCAoJ0TYJYjKpHXZkG4sceeA1NVNg5uLmUoMlyjDSxtmJTNqiW5VgVWp2Q1XVOCeQ2otX01lqn3TPBTGL+iCJEoTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723883145; c=relaxed/simple;
	bh=7QYh5fWsYcBy4BjPUODYKtBT58CJYBQAeJg9WYheKL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tteikR7bBAcv6c/oVqb/eMbR+OPKOgVQDyuM1OJjMql9ELUke/f0zzSLZxG1/BOLlskFangADgzd0tU95cpatwpuTE+wMJvXgiBDycAd7zdfDQ6reqKiF7TTT7XOSGJVARg1N6P0ARDOEWUdcx7j1yBVgXCnDQACwuiEfHEl2Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXFSC6xG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXFSC6xG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so21727405e9.1
        for <linux-tegra@vger.kernel.org>; Sat, 17 Aug 2024 01:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723883141; x=1724487941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pJ0y+Bx0FfYzJuV9mHkWycb1W7eNsjmgnYDcCobrBgQ=;
        b=kXFSC6xGH8epNlVa2RzJmDHoiSTn/dJGKlY0JMnNNnv/7q0PjV0W1ZIHAdXvh3Xi9c
         Embr8d9Q41mORTPSPolWBaip3j7o2iNgoDcMGqpH7qKcSt3Ot758P2juBmohHTsIdb6c
         bO9/qRfenU5p/HBhf/pQkQABtOlaXLotVifvYupnakiBt+TRe41txv4Bq4sHRVMOKoO0
         jtlo/LjQ3yZ8R2KouTLZAqpH9KteXsQ8wMGGuy6Z+leZZWxw4uHjZTjh4ZkxoKG0TI3H
         wSpXJ9r7g+g6uZVqZ0PRRVmFHz9aa9AiPyoGY24jASf5e/h3vDaEiFGDZzsY8v9DNF6m
         op4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723883141; x=1724487941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJ0y+Bx0FfYzJuV9mHkWycb1W7eNsjmgnYDcCobrBgQ=;
        b=hRv2/JXx5DTDGPzb37/PGj0uzZSMPLGA672awjWIamz8FFFiceo7Ur9NC39K1Azd6m
         jPtq4fowrD797csfrLVkbHi3RuwF5jdKWo/cGXccZzm82Ian06pvGw1Q6XTiboZD2Mkg
         vQnIz659Q3gPGhcPXSxRXmorXFn3eRacPS8s+7OHAjGP+vk3VI6p1vI36g6Chk0KJfC+
         eo0G3tk47p41U3HiDOsNWISmAeUuyky6/1Msc/i9/XMWNiDBI7Z2h/4Gz8W/j4EOa8f1
         RGNvHNQXcrVmEpjrNAJvCwedueD9DE0U1Vxy9GM6zMIDZmJXtZqm9k5qXpcAT8my9xj8
         Orzw==
X-Forwarded-Encrypted: i=1; AJvYcCV2iA7i/jrP2qHyDk4dKKL+pHVJNNmZltvtf3l+J3yGl3dnLIZ96UEGEUVLArsd6U6d6hRMzeeLKtnT7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYqjTkz5AllIPTSzYgCHgpdqllT3DUBm8MhnN+qGNVZfO3Ay4
	zWkoDiv5qXOzwp3eUIcU1M+GSQJZ4lX81fx7g18RzXDddvzXVyF0dFC3tGN0Fu0=
X-Google-Smtp-Source: AGHT+IFJ12nDtVRGYsYXFLwDyDsgUaCOjGBYJyBY4Zbk3GuRikGwJdu2MeEqx46imh4mG3NDHfzGgw==
X-Received: by 2002:a05:600c:3ba5:b0:426:6667:5c42 with SMTP id 5b1f17b1804b1-429ed7856camr34069445e9.4.1723883140978;
        Sat, 17 Aug 2024 01:25:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded364fesm96109695e9.27.2024.08.17.01.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 01:25:40 -0700 (PDT)
Date: Sat, 17 Aug 2024 11:25:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amit Vadhavana <av2082000@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	ricardo@marliere.net, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, vkoul@kernel.org,
	olivierdautricourt@gmail.com, sr@denx.de,
	ludovic.desroches@microchip.com, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, wangzhou1@hisilicon.com, haijie1@huawei.com,
	fenghua.yu@intel.com, dave.jiang@intel.com, zhoubinbin@loongson.cn,
	sean.wang@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, afaerber@suse.de,
	manivannan.sadhasivam@linaro.org, Basavaraj.Natikar@amd.com,
	linus.walleij@linaro.org, ldewangan@nvidia.com,
	jonathanh@nvidia.com, thierry.reding@gmail.com,
	laurent.pinchart@ideasonboard.com, michal.simek@amd.com,
	Frank.Li@nxp.com, n.shubin@yadro.com, yajun.deng@linux.dev,
	quic_jjohnson@quicinc.com, lizetao1@huawei.com, pliem@maxlinear.com,
	konrad.dybcio@linaro.org, kees@kernel.org, gustavoars@kernel.org,
	bryan.odonoghue@linaro.org, linux@treblig.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2] dmaengine: Fix spelling mistakes
Message-ID: <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
References: <20240817080408.8010-1-av2082000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817080408.8010-1-av2082000@gmail.com>

On Sat, Aug 17, 2024 at 01:34:08PM +0530, Amit Vadhavana wrote:
> Correct spelling mistakes in the DMA engine to improve readability
> and clarity without altering functionality.
> 
> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> Reviewed-by: Kees Cook <kees@kernel.org>
> ---
> V1: https://lore.kernel.org/all/20240810184333.34859-1-av2082000@gmail.com 
> V1 -> V2:
> - Write the commit description in imperative mode.

Why?  Did someone ask for that?

regards,
dan carpenter

