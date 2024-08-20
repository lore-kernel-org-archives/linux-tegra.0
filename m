Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADA6191F89;
	Tue, 20 Aug 2024 16:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724171572; cv=none; b=Ot+GvVW9U7FI6n2asqef8k/S6q9I78T/YN34i281CsPBwxLiMHQPvRUWJpShNdL1fifh/6u+ehdOQLW7phuoFpWDYu8ua/lkbFQAfe1JrPd9OFM1jTqz6lVdj+Lrj6k3BGauZNItLpmAqQf25Pj7DYqyKOxaQa51SB+gDJEbOrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724171572; c=relaxed/simple;
	bh=O8qFZaGvqO4gJGf+nVQzubDqK1EVzkzGvzJHxYEJH8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zi2mIGdawRC2Wc7yNsjsdDXS5qbPmL2Qj/dVrd2XMEX/PR+B6hlJQqZsyOW9cB/8vYaoM8ZtTzEtIMmSekCA0u0XKKW6cOCCNb0xd6pFfJqQb14T5Y8L0/4M6Q7HHFZ8fdb8tGXYBk2tjAj3fH498cYW4WT8LERMpdbYHKLbb54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkzI96iX; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkzI96iX"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-533462b9428so609823e87.3;
        Tue, 20 Aug 2024 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724171569; x=1724776369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=363+gipGC9vmsEozTeDnxllkuHgKhHHWE4afpUQLjho=;
        b=hkzI96iXAlUtyG8sMTG0rX49rY/lcjNEN8JgYDUi8C/J+u6PIC3hrbcckn69hUSFS1
         /m9EOxsXjfSJSQoV6ea3Eaay+Mqpjr55edpLA7WdZOQMlp3r2qoaaJQh7Z6N+CzXIPok
         U8E8ddpAzRAouYmRnc4yTlsF+UKmVns6CoO82wlZxJuzrCU5573LZTQKf/40aI5RaBgc
         7/RUwDzT6gSEQsug35FTiX0L8WBhF1jjOX9HYIUVHVpaxwcCwZ69TilXDSloHBvxE0xV
         wjQqtTDlo/XI/IVGUnLXgSSYjsn5Pag8aTz/57oCc3d5RWfV1Y+dhHn3YlZFRbahENYU
         vRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724171569; x=1724776369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=363+gipGC9vmsEozTeDnxllkuHgKhHHWE4afpUQLjho=;
        b=xUsIfWmcX82lEY02DkZv+/WBMK9v5jerSJc2poE4+485MlwmaGRp1cuihDLPB1mezo
         0EPIzYYmShxiRq/Ieo67Rg8+/t6ZQlaQePrVf4fs4ZJ4B39j3M6m/lpL1Sh/D8J/vBaO
         FiN6rXrTLGr19qaZB/JKrU+bAGqdJ7kLmBlo3g4CU5vee1Ax11inpzVSAw9BJqY1jgCI
         a20Wf9xhROaD5QskTcl+/OzICoE6M96I8x7ZgOtpoN5hx8iwcx6AA5hQN0kMItrbSbnk
         dwc1dZALnzPk6mzWtMAVaZ/HS+OwqQSMpMQpflOnFwJUXlvktJ1qQQnH9/MxSGi2gn7j
         FQKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwt+Fd2frxTPLY0JbdKOB31Yw2hXLTlGLvA58jInpP4zMSMXR8S/tIl0ne3wc/LI3SagNBATeIV28rJfg=@vger.kernel.org, AJvYcCWJ5piDPMcMmaqPsXk6x7sBtKsAArCeqEJV/VVeOiy8jnEvNHDYf+qY3ICaincnLQ/SNPJpSZwSrr/TJwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH/KgWYWtbpYSszsAHMEYF7bYMkYohCMoOB8weehUvXUIur3yy
	3ant7bN0De2Et3M4J/WeqSSG3kPNPRJ3o3CggyB/ckHtg/oEbJdpjUHkafFg
X-Google-Smtp-Source: AGHT+IHpGVGaIp/enXPq/mJKZh5E50KP3m3ArWyFfTb9ZUy1OTzZPj1Tt/VRJwshWfV90tZQqmmtyg==
X-Received: by 2002:a05:6512:2346:b0:530:ad8d:dcdb with SMTP id 2adb3069b0e04-5331c6a1931mr14207385e87.19.1724171567748;
        Tue, 20 Aug 2024 09:32:47 -0700 (PDT)
Received: from [192.168.1.101] ([212.106.161.95])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-533457e2ec6sm86793e87.174.2024.08.20.09.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 09:32:46 -0700 (PDT)
Message-ID: <e544466f-8c9c-441a-a209-bda0b47aeb7d@gmail.com>
Date: Tue, 20 Aug 2024 18:32:44 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: tegra: add wp-gpio to P2957 board
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
Content-Language: en-US, pl-PL
From: Tomasz Maciej Nowak <tmn505@gmail.com>
In-Reply-To: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


W dniu 15.08.2024 o 17:50, Diogo Ivo pisze:
> Define the wp-gpio for the P2597 board.
> 
> For this, patch 1 fixes the assignment of the vmmc supply's gpio that
> was incorrectly assigned to the wp-gpio of the external slot.
> 
> Patch 2 adds the definition of the wp-gpio.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
> Diogo Ivo (2):
>       arm64: tegra: Fix gpio for P2597 vmmc regulator
>       arm64: tegra: Add wp-gpio for P2597's external card slot

Hi,
for both patches
Tested-by: Tomasz Maciej Nowak <tmn505@gmail.com>

PS
I case You wish to save some digging for other features I enabled BT+WiFi, PWM-FAN
and power sensors in this tree: https://github.com/tmn505/linux/tree/jetson-tx1
For passing MAC addresses for BT+WiFi from cboot provided dtb check this U-Boot
tree: https://github.com/tmn505/u-boot/tree/jetson-tx1

> 
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> ---
> base-commit: 1fb918967b56df3262ee984175816f0acb310501
> change-id: 20240815-tx1_sdmmc-311e4802c843
> 
> Best regards,

Regards

-- 
TMN
