Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E371B3F2D;
	Thu, 29 Aug 2024 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724946724; cv=none; b=cGUdv0fLLdbBCwoKvb3QV9AGMvtqSrFWOjokymnFN48th6cVtDw8wvjE1Yz9ZTJos6/OdT3t4fIprgts3D+o+ah6xuf29S68AEepXEz3spH/gZSDH169kF3YFv1GJbX8TLum1ycutwRMS41NfCETHTYYd0O/g/D7pBrEJoX75ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724946724; c=relaxed/simple;
	bh=6ybnj9xuMyLJPe9tCIoju5s2NkxrXxfmd2ADNwQ8CUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YeDAtACEhAOnrxyou5DnR/qQXRy8IrVRRZuFahS8nSycmuiz1+0oaXSLeD86uC8AGVeO1w1/Sa0INoscCQForPNPt1SrGlGo/aGLy+kqQkp3ro3ot0K/cDNwB23rkDrfDHTpDQjDHsbBC2iXAwdVTeXmmBarOXMpraAlCFFHKg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmNcy8jk; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmNcy8jk"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c210e23651so912860a12.3;
        Thu, 29 Aug 2024 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724946721; x=1725551521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LkzGyg+YpeAYRQA8bRsHPMUzJcZCB8L3Y8kiytwETbg=;
        b=TmNcy8jkTHMJnyae1VHYnrn1tsC+kyDY8u2X5sAxf65QaMEfK/mrFxILLF2dWrPTiG
         LbQ7vge8h+w3qEZy2pcSgnoNnTFQndsMtKpPgSgBWm2mTG/YYcSvISS8vlmHjihtEypq
         xwXG/deQXjRd3WFbBCxk2wreA9CfqYIVH0C1bSpKMpfstGB5QshqWDHxEWN3Vne6WmCE
         K4dsl7HDaOn6gu8+isPUj4TnAbAQpep8p30Ltwd4PpBW1lN7nO6Mxh68yuFqgzZRWfbN
         lt2qsC2f0GeMoKN6bpzEKoL8FdVcRB1pnHldEElGX4CmFc3OdwZ8kX5Ql+aq894O3JE4
         E4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724946721; x=1725551521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkzGyg+YpeAYRQA8bRsHPMUzJcZCB8L3Y8kiytwETbg=;
        b=oZHk7bRDCPh2ABO52ChmMlNqVPbFmSirUD2NygCAjKWUDH5TJQTxlfBv0LDCMYOq8S
         CQuZ0rjcbpoKIqLuUpoZiAmGAGa9URPcCDLkP6yjDIIGuX9CvpzBwJGKUBLaxVAg4/1D
         nyAsmfTKHmQBIA8G8yx16RoBqs1588iyyoNNoAS6baWuK/9yaYaXmLt61qbYk34eNsNo
         4bAPqz0ViD7hUpgiEdoj+IdIDDASZqSkggmFIp0tuQAxgd4H/kgckKvXW0rERLCBLtJP
         VmqOxXZPz1FHJMMcjxjM8Vpd1coY4Z9b9nLSYIwYvyzG+qcMrYyUWCJmf3cL9LANPcdM
         Z6Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUywEIhJ5i5LVLLVtjXMZ7RzBldp4zxQ3ApYdvIptk68Awa90k8gtXOukOoGJZqPCyE/5LTNc5ZjCfIHNA=@vger.kernel.org, AJvYcCWogKEYr64ZjCApkVkwrxUVZweFaJLb4Q7RzrtNisYtM5v1ENYbvfa3KdJMcHTj6wPsX0qZiUYwQ4yPJqUg@vger.kernel.org, AJvYcCXTuHIHm637KJImhNMRjctL0r3S4enCZ4ILn5O3qtk4RZnnONjIKtepbd3GJTFaFZypEHUnXNLhOIewepTJ8pI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx62mJ0xlnuNGoNV1Tlk0lK/koj3ehz1kKXjIMteWVDady6Bwti
	l7n/UsytETuQH4T7Zp+Dif8zMUXVVUdAFAMLOyOeKkHL0dJKL/jg
X-Google-Smtp-Source: AGHT+IEHax0znxV7voU1XWsSmK6e3PzUEkJanhV5ouCAG7d9c0TJRpfmciNspiwHOZgvpH4UKWgPnA==
X-Received: by 2002:a05:6402:26c1:b0:5be:dc90:d14d with SMTP id 4fb4d7f45d1cf-5c21ed34a93mr2893643a12.1.1724946720388;
        Thu, 29 Aug 2024 08:52:00 -0700 (PDT)
Received: from [192.168.0.101] (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a8989222588sm92753766b.200.2024.08.29.08.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 08:51:59 -0700 (PDT)
Message-ID: <794ca7cc-f27f-410c-8b95-d5403f4ad638@gmail.com>
Date: Thu, 29 Aug 2024 16:51:58 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/tegra: hdmi: make read-only const array
 possible_nvram_sizes static
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240822205047.642845-1-colin.i.king@gmail.com>
 <a3itbzv4hhkbpa3lhe7w42qtyxwiuwdsdntemtzn25uj27skci@trg63xzeh3dp>
Content-Language: en-US
From: "Colin King (gmail)" <colin.i.king@gmail.com>
In-Reply-To: <a3itbzv4hhkbpa3lhe7w42qtyxwiuwdsdntemtzn25uj27skci@trg63xzeh3dp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/2024 16:50, Thierry Reding wrote:
> On Thu, Aug 22, 2024 at 09:50:47PM GMT, Colin Ian King wrote:
>> Don't populate the const read-only array possible_nvram_sizes on the
> 
> I've changed this (and the occurrence in the subject) to reflect the
> actual array name ("freqs") that's being changed here.

Thanks, my bad.

Colin

> 
> Applied, thanks.
> 
> Thierry


