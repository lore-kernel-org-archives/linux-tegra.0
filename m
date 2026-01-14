Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6E42BD012
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406471; cv=none; b=OxKpQ4t6Ts7igr7eQJ9CcIlXzVwK3uI1eVNHU+seTOw2CPWr+Eh5fu2J1x1hiiYuWFzDZfoPWWx4SgPc1El1hElM/iC7P76gU9U8pnMOdkNrHGkHSALu1BhOwX7XQ5e7PKU8zIgEqF6K+pAjMT48szoiJmGGa6IDNwC/C/RGW8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406471; c=relaxed/simple;
	bh=ItedIl3q8I/v86+Fllc45VF4sAYPiKQZYULeg15pOjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InvLgT2XoO6dKU/Y1YWjJ8E1cEEdIoubsL2EXFYTxy3xy6xWtqTc6hfMYuOxF/Fp3mnrQ/34kF5w+8FV5hyiVvYaqCbHXR3YH3V4nsdwpMRZA9D5mbiy01MY+o+D/s7wBU1EsepF/HW3eiRTHfiNXsPjyNndmnjizYAEvJAxwAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e6HvS/yl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9YmYqru; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e6HvS/yl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9YmYqru"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E9jnJJ3296151
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 16:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDXaKw7hU4Ou74YOJlJoM7UHcKL9JB8/v6f4qXkRkDY=; b=e6HvS/ylOeFmZz5r
	XCDj5Ie8I3H7HusyR9aeIzvngDginwvwvTiFEwfNcPji7TAtMCB7gTNXu9qQXf9t
	NhfLvvrpkmLP9eyes3lXKLER3c/SF5IMcFNud1eVoj8N1D9fB+qwgI2RNvJLrYPI
	aNVNT/U7s8Wv1mpIHgf7key2oXWWBXAqWji6+pbDnqxcSlreyhFIzOPyqX73YqOh
	qPGjDx8zlAUfNiphtt0GXne6VQ8ASN6nSrmaMFFJjwrqvrLouZWwkz5nIZUmA+ez
	3rSEqppcwctupx+ovw1Cemm7QLBh6h16EiPmb3r74DraqtXQ4fg00ncO8npZE/td
	DSJang==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8t2s91w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 16:01:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ed0a71c0beso6441428137.2
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 08:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768406468; x=1769011268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cDXaKw7hU4Ou74YOJlJoM7UHcKL9JB8/v6f4qXkRkDY=;
        b=E9YmYqrupxPlMdMjGK7s24vePAFwsEB84aEOSBSZiSCult8Ah3xnF8TF3JDaCrmnyJ
         5gOpA5vMvuZfINbjFbdTQou30J3AH2hWbLVKMArMqXGltKc7Q4L4Jq5YfHpMZIoAX1ze
         q/QZgBKbdyU/eMvw2ZtfvWCQuzFqSnbrf6Z5BYx3oDdPFB5m5IpNhT7Wst7vGqvpk3af
         wmWO1Vx+X3jtxnuA/FZyKYiJbheBJKfoVyBNf1QOk3usdy8OeNEKpwHDHqYindM2Ra28
         AIhuiosmn3j1StJ8iHWd9vZz3DVr86TZ2JKfoYSsfr6iktmAAicvQKzYIOTAZH+iIfzz
         OJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406468; x=1769011268;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDXaKw7hU4Ou74YOJlJoM7UHcKL9JB8/v6f4qXkRkDY=;
        b=n1i/vfgoNLGFYXMDQpRVT2JJ+1epw6O7axVKjqPe/uKbTxn55wkUcWZbYIDTP+VLlK
         nOChtU/xrqjBtLhyqOGCwYJTX3JqvGVTEHpAPUpvhyl0RtX4NuUtf3OrkxDptodAFf6P
         vW95T3vlp9Q+G+3JEjlzyA0Zsz14N2hCu6h9R4buQwwF74Q3Va+6LCgdn8dJIo2XqELN
         nMm9tfCWudIKB52RrasWf3+EBvdhxzBocr3UZeI24KKVdo0gt21fgV66NEnaVd5CsVZw
         YuhC71Kgu+G53k6QLa5VqTWnXIT3IZ3iic+iUUBQahLGMovWrSvmX3V/HAta8jKdTIdr
         KwYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDRm1jo2yku4lzyQiT1vE2+3s8j38z0aBnnp9fdoztAh4dsJzrepvPLwoWk0xf4WMnfJIHDn6Tb0I0SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywuGjQ2RX/Yq184E6Tu9V616yo77n4LtJPmSH2CwUVKRD9RBoF
	WhU4wGE8XofuH5qEFZzXo0CAzeL2deRvfL6ElFOmLFQJC04mr/FxT6qsOmlM52KQ3tRZPB0gPET
	inlALqx9WIXzzQJrKmXkxtlk7M5jEcW0USHRfiXa49XI+oN0dTIlafLUI8Ym6r2CUOB6RXA5BFw
	==
X-Gm-Gg: AY/fxX7ynp+ITK3KmHzLGAZmGUCEX7SDgI0mlF4+TWCMZ3n5QjqdnK84fQ0y67cjsFc
	hfkOCqo+5u9ekf/jiebDuLVN1wpSwoqOE1IvkyT2AAJYKvPt+f5ZlGeK+wt8EoH4NdYzWr60Xto
	Gos/6M///OzkpyMhlqfEYtI84Ele3uTHMQ+kz7jfwGJZSvXbwR66fzSYcH+H0Q8WrAM4PoP/mj9
	D8tZ2mOl+RSkQQhZ44KEBeGRWRH2koqfqxwayf5z5lcK1GPU/PCfVeXj7b9ZjU2y7pVhwq0Vkh9
	YteDsnrgXXgGMW1GNw9ypvOpgajOTofs85H4+fbSFtPPUSW5TjXbay3svNxnG9Pgk3gmpb4eZwO
	E1Ha1HXFJtE6tUhaCSlyqu2EDI9vwB+zlbnQ0ww==
X-Received: by 2002:a05:6102:a4f:b0:5ef:a8da:8b29 with SMTP id ada2fe7eead31-5f1838f9fa3mr994395137.19.1768406466027;
        Wed, 14 Jan 2026 08:01:06 -0800 (PST)
X-Received: by 2002:a05:6102:a4f:b0:5ef:a8da:8b29 with SMTP id ada2fe7eead31-5f1838f9fa3mr994171137.19.1768406464543;
        Wed, 14 Jan 2026 08:01:04 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65411f70f39sm11577a12.18.2026.01.14.08.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 08:01:04 -0800 (PST)
Message-ID: <6a84b1d5-7305-4a30-a542-c4279989cb83@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 17:01:01 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] pinctrl: tegra-xusb: Simplify locking with guard()
To: Jon Hunter <jonathanh@nvidia.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng
 <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-9-a14572685cd3@oss.qualcomm.com>
 <af986bd3-0bb4-4888-861a-33fa09a7d139@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <af986bd3-0bb4-4888-861a-33fa09a7d139@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPaSCBGx c=1 sm=1 tr=0 ts=6967bdc5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mMPh4IZubgD9fDeW7bEA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMyBTYWx0ZWRfXz3T59Xk8VSg+
 URR9drdI61SgXbhzOu02z1M/nnQYyScRR2G63zpu0qfMBnOg+vd6/cG+MKNl3x6C+GWXOC6D08w
 nN6fmgQ5Kvf+Vqo9nsZy7EgUP3Km5QJkJKbkifPDLKVtLO9WrQEq6kWfvtvV79jCW3tPEAIFfQp
 3TjWRFpKqbtcT6he94Lfkvn3WzUxoQHTmVKDmsYJ2vvpc7/dz46o3mlWmA3SCZ3atuXvZpeJ4KY
 6OiEiq4XIk7RMPXVInJXf6IzmocOXCe1wz9WSg9v9bnyIQZfZhKRHzbfIDeLe7s1uGQT3aW/GWM
 DNvnDffSRBzVbNhAP30YZLHKHGNRDiKi5ucMlipcy4T9K9u1BVzAexXvD5sMU+IGvmnIE/AMJLo
 ayvnKHeN9Uyf4LfIGjchICcJSXfyvFRue6CG7zxVNoTW9M3AbEaHXz8DDQ4Yw36hGAvX5o9dggX
 9KTdmJgIxCZlE1PQ4vg==
X-Proofpoint-GUID: 9Z7l-NtTluG5MFT8ccPQJ0ihar0bdx91
X-Proofpoint-ORIG-GUID: 9Z7l-NtTluG5MFT8ccPQJ0ihar0bdx91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140133

On 14/01/2026 16:51, Jon Hunter wrote:
> 
> On 14/01/2026 15:30, Krzysztof Kozlowski wrote:
>> Simplify error handling (less gotos) over locks with guard().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 +++++---------
>>   1 file changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>> index 34a373f7e04d..855f708ce510 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>> @@ -478,10 +478,10 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
>>   {
>>   	u32 value;
>>   
>> -	mutex_lock(&padctl->lock);
>> +	guard(mutex)(&padctl->lock);
>>   
>>   	if (padctl->enable++ > 0)
>> -		goto out;
>> +		return;
>>   
>>   	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
>>   	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
>> @@ -499,7 +499,6 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
>>   	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
>>   	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
>>   
>> -out:
>>   	mutex_unlock(&padctl->lock);
>>   }
> 
> 
> I believe we need to remove the above unlock too?

Uh, of course, thanks. Some rebasing mixup on my side.

Best regards,
Krzysztof
