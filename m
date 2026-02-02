Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E757D2DC763
	for <linux-tegra@vger.kernel.org>; Mon,  2 Feb 2026 19:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770060515; cv=none; b=PpmYlBc9QdpFN7b8AshrolDF3yRckH9NG6+NWYGzk5t5XMJNuk5uKjKWF3etTckc4jSWKU68LQlEFnse60yUjpffS3P4fzQLKBIllkRzWCzxkOEhwOjvukzgPB5uUJ9ZQFIWrg1cOMCEygASE7367qmEXjniXitChyUnCNnkNBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770060515; c=relaxed/simple;
	bh=9R4umd06t5E/qKjLk5WzZjI2I/NhDeB3w5NjHxxqiwg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XhZ+/anoKK0lIiRVRV3v/IEDp9h9BCVajs5Cza0MAirrj+S/DrlwRKGIAmp8DtxHZN2JZzoTdt22O/udpioTJC6nvJByOJwsrsWJLTuKXntzrzqqMzktjf4KuxIwbqZiT9Qwc8zyqh3uVzyIT27kdH1wOTPW5dwMRnUsUupWVV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGQxBlPA; arc=none smtp.client-ip=209.85.167.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGQxBlPA"
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-59dd4bec4ecso5452768e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 02 Feb 2026 11:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770060512; x=1770665312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OeH4xFhVd84MvPT654VB38zYOhOQMi7sJ1xCCDkznfU=;
        b=UGQxBlPALiZ+I67cxSRBkM0lxAmDlzm9IxBVQhYZ2Q4caB1d+s1RQiuwAt8KL6e2oH
         Yi0jufFiDY8LyhVde6AXjfx/mNcoN+iyRVfK9G1s/+xK5qSHhhT47jvw0ainsXGbz4pe
         /JnFGEklCiSOxbHubUZhT3nP3LsGLX6CndRa/CoTAGdTwZmj0hiAmgyNSnf+fcVh57W1
         lt9qvMabwYDCRBYVZULi57hWTReLWPvnwYk8tqMudTHm2g+wOhMdtZjMuLyBsvcqJ610
         faBcZAwNHXlXc3yusGZ0Y8EhUxxls/LzeBxi1/8NuKzcnidfX+OGiKqsUQhQytS87t2t
         q+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060512; x=1770665312;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OeH4xFhVd84MvPT654VB38zYOhOQMi7sJ1xCCDkznfU=;
        b=ns14Fh1Bvi0+9A3d+aTKrDJp0jDa0sF2e22XvR4/wR9m5MDJAG9aU0CE1C429oRAuj
         AeMAGN1MGItmnFiBnwlk4VRZuhXqnSp1wujpWiLZ+FrOCsLbbjwUmnfbfCy8IRfnaz0U
         oqecTggGLbRjboTY2jeDn80Tr0g8Tjd1A7xXdrjTy0VWBI8w/ODmIja6t7UXMb7mmTSe
         OdNNzGYT+gEC08uhf7IZ8AO5/kBpeDoaD8r28yCg1sNAoXWB6fvHK8c/3q+bTbiZbLY/
         AMBtfCbdIEF6+6mhTOyLyMHGncju25kEQKRyMlcLuHoIBUbCq44xBpRQKwjSeaydPj3I
         S5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgbiZqfbesxDYPCWMWpSXaN1/GDZYJIeZZapyy4Ab2n0jZPP/mG3t4OQTvCcXZq43QzBSUM7qvGIKecw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDIvAIZDz+bHFOYaBFZihXZxPz/mHbEFDgxtzCkmyipIBdKkyV
	qoU0tg8cA9oPS2kML6ByubQuAV5HYx/Zz3rEOgozxOOubQua/dXhm9vg
X-Gm-Gg: AZuq6aIWEnLObYiaNeVAYC5yZjMSiOmAbge2j8MgGGXWJRC0AB9fvA9aSNtvwSmAAET
	wj3BzX4JW47M9E3PPe8CV1saIbBJ55zU4zTR+IHNPFxj+AhZN9uRkuS/diB6Usd1AzJTWBiNimV
	bm8qvJ2en9vaMGYpBNNH4bgxyZq05grH16KPSTkTxF38UtEhol7UPV5Cz+va/gzKCUIb4QVvEZV
	wvMs9T2T2Xgj1e66ooKWTH4+jDPSefr+XSXj5m6F/h+qJiyCulA2ZJHYAsZAOA5GCOoV/HLuDso
	3bokXk6kEZ1N9K6dtLseAFOO/+1oUCKmWCs+hnOL25+QxAuesDoyx0n+AfXZ0Cpevg9zW8770sW
	BWf/GoJLPJFHMIOAjFaKYjdhTP8/xCO+v1tu5j/r+EapGPUAlCUog1jXOItsKsFHXz7zvOL22he
	2NEdnAsz6FIcFzP/UgmdXkD0EGI43asJKmTBJZCXf/61k5gxk9G3kPKd+crB7Gb6b7WuX2ew==
X-Received: by 2002:a05:6512:3c96:b0:59e:479:17d9 with SMTP id 2adb3069b0e04-59e16424c41mr3974297e87.38.1770060511723;
        Mon, 02 Feb 2026 11:28:31 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:4246:14fa:feaa:638c:335c:bdbe? ([2a00:1fa0:4246:14fa:feaa:638c:335c:bdbe])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c44c32sm31745961fa.1.2026.02.02.11.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 11:28:31 -0800 (PST)
Message-ID: <d63a6d27-14a1-4064-b5b2-e144beeb0827@gmail.com>
Date: Mon, 2 Feb 2026 22:28:29 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] usb: phy: tegra: return error value from
 utmi_wait_register
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260202080526.23487-1-clamor95@gmail.com>
 <20260202080526.23487-3-clamor95@gmail.com>
 <74268def-31fd-4015-8be6-faebd6676667@gmail.com>
 <CAPVz0n0giLnk6caoZFHZS52XCfA_CN1BqKjSQQGnbHBdHGikiw@mail.gmail.com>
 <aabfe8bb-cd04-43f4-b0e5-07aca86c3ae0@gmail.com>
Content-Language: en-US
In-Reply-To: <aabfe8bb-cd04-43f4-b0e5-07aca86c3ae0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/26 9:01 PM, Sergey Shtylyov wrote:
[...]

>>>> Return exact error value from utmi_wait_register during HSIC power on.
>>>>
>>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>>> ---
>>>>  drivers/usb/phy/phy-tegra-usb.c | 9 ++++++---
>>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
>>>> index 3a7a74f01d1c..6173b240c3ea 100644
>>>> --- a/drivers/usb/phy/phy-tegra-usb.c
>>>> +++ b/drivers/usb/phy/phy-tegra-usb.c
>>>> @@ -891,6 +891,7 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
>>>>       struct tegra_utmip_config *config = phy->config;
>>>>       void __iomem *base = phy->regs;
>>>>       u32 val;
>>>> +     int err = 0;
>>>
>>>    This initialization seems pointless -- the newly added variable gets overwritten
>>> by you later...
>>>

[...]

>    I'm pretty sure gcc will drop this initialization when generating the object
> code and (what's worse)

   Well, that's actually the good news. I've tried to feed an analogous code to
gcc and clang -- and both seemed to drop the initialization.  I was not able to
make them complain using C=1 and C=2 with make...

> the static analyzers will trip on this code telling you
> that the value 0 is unused...

   Svace (that we have to use here) surely bitches about that. :-)

[...]

MBR, Sergey

