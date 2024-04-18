Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A505172BCD
	for <linux-tegra@vger.kernel.org>; Thu, 18 Apr 2024 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713460770; cv=none; b=ndnN7sfTBRmDKvEGwjC6jUUfP09Dp1Pgnf9LtyiAxd0TpCVUsqGANzzIG/5P8DM+ieSQyBtqrFtcd+7BOq5tAgbg00lcGkXXt/6csTxHH2sd919oUrAv715/uIQVYy2IcvWp4jClkPB99LJie2lBxuS8wNA1TyhVOLSA+FaUsJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713460770; c=relaxed/simple;
	bh=C8un5U7MVXypHfcPucJ6n9rzJr8BtHdPczn4cA/Kz2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eNF9DrEXJfNXqU6Dqk/P+CB8vv8mv2+zJLTJnIpHoWl6kwQtc4Zp/F0WKbAcARVMpoSfvBZDanqtpo63f6l9WQPaYG4V7I7Xy2UZy/tUyXZnnOhGpWQiscr0AZeUJ476SRS0fwghQgGgDzffoZ4PihKerc/LbEP7nY18SOq5XSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fK6pBgMd; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fK6pBgMd"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ee12766586so946575b3a.0
        for <linux-tegra@vger.kernel.org>; Thu, 18 Apr 2024 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713460768; x=1714065568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aN0HwOQHCM+xj7/d7JhLk6zcCUiRB+kNi75a6XoA4wc=;
        b=fK6pBgMdurEskI//1PFYF70Y/6GtVh43ANwiTw2wCd90cp/tvzRo0O42TlTf9EF2UI
         5LIPTqeLYLL73NbuKdgywIV38vkX38QMWk+ltbSlfUe6zRLHd8BTCjW+tmNg/pg3hSml
         2uz0MK4/2KfY3SLAes3gyVpqnWZ0g5hQMKlHpFAYjVHpkh7iZXFildjqKRIIChpCTYiI
         2ZNWidjmCIGh9kI611Zv+4sWFLGfMtwPGQaYT3sV4aHs1jtKUmGQPKl8FH3zcv+AmNVL
         QcALsBO7HE+26aoAJRT38G3qUBNUgl3qX2Bakjcaeatm1DOCmLqWqOL7QS30M87zAbCa
         2GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713460768; x=1714065568;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aN0HwOQHCM+xj7/d7JhLk6zcCUiRB+kNi75a6XoA4wc=;
        b=MSZHWwV8sw7NKiA14wi4/kWiQwbw3eQXJkTSJo5/C7MUfwIIo7Q4NR0cidtyJrvC/c
         B2J1glGmlLVUbnTHmwhyT8Nq0idRMIFdRuS6AsfapNpGorif2Er0upI7CGbB7/Eh9WCk
         QsaU8tcYa6/HpbGBpT9KmOdcrrYk0V+pLtFMcdRvKuVWKyfSXpWT4WoIUS4HWdemYLyG
         KmjEffhOGQ90gYhbP3RxnAjfikYPyn2IJ7us5MY+m8+kFahPcnVQmX7Zq5EMOp114OYj
         pKIzDUsg99SiPjb50GJ6WK1dhkWYpdpwTkF743UBHiKmVhOP7WQF82sgZLLkLZnmshla
         uCxw==
X-Forwarded-Encrypted: i=1; AJvYcCXAzNAeS08FSsqLLILAQw0OQtNr2VcA7VUXFppBy9QXX/rGwakXsZCtL3HPkV+CqEoqr6AkGFibTmkHYjh3vZw/s/rof/Kkusm74ss=
X-Gm-Message-State: AOJu0YwdBII+9Cubvdt01hF6o9H169z3tjqxBPOUnAgXMGuNx6JSB9oI
	tNc7SPpWlMkYRVum1dnh+gNaZ/oNc/kpCFehoXoXOuLClDRTWPc8ojV3XdE5pOEwK4AXM5OQQgG
	XX4c=
X-Google-Smtp-Source: AGHT+IEEF7ncYNwnp83c4zentYX3X6bBCW3yUOdVs0G9gS5RHkixZiC9SwX4uag77o2TRnBFhOl5lw==
X-Received: by 2002:a62:6104:0:b0:6ed:41f4:1886 with SMTP id v4-20020a626104000000b006ed41f41886mr3623891pfb.8.1713460767782;
        Thu, 18 Apr 2024 10:19:27 -0700 (PDT)
Received: from [10.36.51.174] ([24.75.208.148])
        by smtp.gmail.com with ESMTPSA id i6-20020a62c106000000b006ed0199bd57sm1842459pfg.177.2024.04.18.10.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 10:19:27 -0700 (PDT)
Message-ID: <58fb33a6-59b9-46f9-b836-917f6f40da27@linaro.org>
Date: Thu, 18 Apr 2024 19:19:26 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] memory: tegra: Rework update_clock_tree_delay()
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org
References: <20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt>
 <20240409094632.62916-8-diogo.ivo@tecnico.ulisboa.pt>
 <5ab028e3-77fa-44ab-a1af-e70ae9d450ea@linaro.org>
 <tohunkhyf4ojukj4sjmjn4wfxzv6jdxvngma6f73tztbedvy62@6x3unhxhvmdl>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <tohunkhyf4ojukj4sjmjn4wfxzv6jdxvngma6f73tztbedvy62@6x3unhxhvmdl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/04/2024 13:22, Diogo Ivo wrote:
> On Sat, Apr 13, 2024 at 10:08:40AM +0200, Krzysztof Kozlowski wrote:
>> On 09/04/2024 11:46, Diogo Ivo wrote:
>>> Further streamline this function by moving the delay post-processing
>>> to the callers, leaving it only with the task of returing the measured
>>> delay values.
>>>
>>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>> ---
>>>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 120 +++++++-----------
>>>  1 file changed, 46 insertions(+), 74 deletions(-)
>>>
>>> diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
>>> index ec2f84758d55..5e2c84fc835c 100644
>>> --- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
>>> +++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
>>> @@ -105,7 +105,7 @@ enum {
>>>  			  next->ptfv_list[w])) /			\
>>>  			(next->ptfv_list[w] + 1);			\
>>>  									\
>>> -		emc_dbg(emc, EMA_UPDATES, "%s: (s=%lu) EMA: %u\n",	\
>>> +		emc_dbg(emc, EMA_UPDATES, "%s: (s=%u) EMA: %u\n",	\
>>
>> Does not look related.
> 
> This was necessary to avoid compiler warnings as before when we were calling
> this macro from update_clock_tree_delay() the value we were passing in was
> declared as an unsigned long and now it is declared as u32, which it still
> big enough for the values we are dealing with here.

OK, that's difficult to see from the patch context but looks right.

Best regards,
Krzysztof

