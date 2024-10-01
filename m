Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25C7199FD7
	for <linux-tegra@vger.kernel.org>; Tue,  1 Oct 2024 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727772234; cv=none; b=TmqlEwSau1ekryRijbU8g6JqGDpuvR6dlXJvpETAoC8JaouOc46CgeHR8WlgC+7jdAYWTgO4yggZise47UOwlpjxGJAp1Pxef0saxWwbeud4m61Q5wYppokXs31MxIAL/7lnJNiDKQvH4hSjqrSgCawu/3vV7dR/49xEW8xGf6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727772234; c=relaxed/simple;
	bh=YCn6CJz9wNslbDQYWuofALMOKvPHR03VTNXlkXTETJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLt6gPItFbF7kxTvlcLFrKkamckKYVw51+wHSvCizxyr142YdKXdPSGCKo1W2fnsBbKCCWDf1ORIuaZ/13uunygTRIFDMmZpWqBLwqYx8R8Px6bxQOmqtDYDf/BbZnWPEJ/D1SKrUa90mzwU8JELeQ27HlLLamQ0STdQY5lgA4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B28Ptrgt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B28Ptrgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727772232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBZwAi+LoFPSmQZhpxhVR3gQFHxasx7Vn9+lxQ2ezrc=;
	b=B28PtrgttO8EUCz1/i6uKE5evyaoD1HSkOGg3OiJzNslkLuapcZ3h2T+zqdpsp5sQpZr4v
	+M+JqCbJ4QQ191MVdZaIm0QaeWcopkzhbIftebH2xhxPup+dUD2ukIpYY4raxY6Yiw+XLh
	yVDhXvNhqjE5oM9JP/QCOMO2mvw3sSw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-fbLq-i8yMR6X6eV0rKaLtA-1; Tue, 01 Oct 2024 04:43:50 -0400
X-MC-Unique: fbLq-i8yMR6X6eV0rKaLtA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42cb479fab2so30240885e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2024 01:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727772229; x=1728377029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBZwAi+LoFPSmQZhpxhVR3gQFHxasx7Vn9+lxQ2ezrc=;
        b=ZJrkbswXNnhcV97jvphKKBekyjQxY0M1eftYcpvt8wvNAlTI4QlRobS52CEDCkj4+h
         2pnflwJzecOXbLUMHfjeJhxEsma3f3J4WjNlxins3kjDIOVehOFXJkQXolJp7jqeTgaF
         sXMqzSnsnVLf4ziu1B5nG5R4MUiVa+S+y57loJ5Xa2jV8Ybve581hKZ+ipM0m69113OV
         VzaTRHvevxFv9LoSDDUWD3GZnDcbScyGtITvbX94EqSzbA8/oOuQ2DEotXsg6SXJfP1t
         J4/vzkWIc7b+ie5nwFTRmALpY0DJ3L5NzriBEUzGhgHDxDGESX0cywJuLki+NPjQd67u
         NgCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrR+cDsKkJ57AKLUiyVJBGHc7fUjDKB4ZWvpscOFTiXGw8J5qJwtnwVcNzQ8sCfZzBGGaSL1Yaffr4Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvdpKMQKXhn27s1a6/jyXBvGLcpWfvdk7ftKpl/wOq9OngiQ7u
	L5SG7CkNEEhDqrXxNg+8ZHuQwYtpwxZHaVp89IW/T4meICDm19vlScduibr7ZXjMLWSznRGEEZf
	YiPzectLDY35k6YBByhow34eID1mTpKfiwuHJNFRFZ3r+3tUs5pYn7cxo26Vf
X-Received: by 2002:adf:e904:0:b0:376:dbb5:10c2 with SMTP id ffacd0b85a97d-37cf28b204fmr1083019f8f.29.1727772229319;
        Tue, 01 Oct 2024 01:43:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtw9vrE5plQVkEv0YpSWAr170pGXokEzLZGD5H1sbnowfqnNJalSwfsB+aJIY1/QbpbtPzBw==
X-Received: by 2002:adf:e904:0:b0:376:dbb5:10c2 with SMTP id ffacd0b85a97d-37cf28b204fmr1082993f8f.29.1727772228922;
        Tue, 01 Oct 2024 01:43:48 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:b088:b810:c085:e1b4:9ce7:bb1c? ([2a0d:3341:b088:b810:c085:e1b4:9ce7:bb1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575e322sm11249429f8f.110.2024.10.01.01.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 01:43:48 -0700 (PDT)
Message-ID: <7485182b-797d-4476-b65c-7b1311d99442@redhat.com>
Date: Tue, 1 Oct 2024 10:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: dwmac-tegra: Fix link bring-up sequence
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paritosh Dixit <paritoshd@nvidia.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bhadram Varka <vbhadram@nvidia.com>,
 Revanth Kumar Uppala <ruppala@nvidia.com>, netdev@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240923134410.2111640-1-paritoshd@nvidia.com>
 <qcdec6h776mb5vms54wksqmkoterxj4vt7tndtfppck2ao733t@nlhyy7yhwfgf>
 <6fdc8e96-0535-460f-a2da-cd698cff8324@nvidia.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <6fdc8e96-0535-460f-a2da-cd698cff8324@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/27/24 17:28, Jon Hunter wrote:
> On 25/09/2024 14:40, Thierry Reding wrote:
>> All in all, I wonder if we wouldn't be better off increasing these
>> delays to the point where we can use usleep_range(). That will make
>> the overall lane bringup slightly longer (though it should still be well
>> below 1ms, so hardly noticeable from a user's perspective) but has the
>> benefit of not blocking the CPU during this time.
> 
> Yes we can certainly increase the delay and use usleep_range() as you
> prefer. Let us know what you would recommend here.

Use of usleep_range() would be definitely preferrable.

Additionally, please replace c99 comments '// ...' with ansi ones:
'/* ... */'

Thanks,

Paolo

