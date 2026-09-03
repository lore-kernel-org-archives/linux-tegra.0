Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A8838E5FF;
	Thu,  3 Sep 2026 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442033; cv=none; b=bdYodjQTOvdUrVsluoiCn5pDVQ7I2LKl/tnoZQpU0HvFdVCmoq/AJzs3NsiEIfDLWYhu6X/yBre8hJJvUYqD2dXRTNZCG/NEyBHaunORc4YzwZ53+/B34OV9GIbTx4aBl0ugqpZvQebpCfbPl2FjFCK6onq6dbvIdbyM9x8yh4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442033; c=relaxed/simple;
	bh=kONAT1sWOqq2RkVXK2/3P7bl1cJC2j6xiUdKnuWxokE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmcq1nZKbvxg3+/hFPlVPuN8wG9m0Zu03u8bvj9HSIaspa6G4uvXIZdx27MwPSwQ3zCrDx3hRPXiOABAU9yxeGb98cpq86c0ROBrZQqkKiqxDoDlnYjyuXRBRKN8y9wK667V5Qg9YdrEW5qwuZD1bStiWCYIPFdiLrayvOddA3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JKj2t0Y+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JKj2t0Y+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF74A4E414DB;
	Thu,  3 Sep 2026 13:26:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90479602B8;
	Thu,  3 Sep 2026 13:26:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6640F11C7A01D;
	Thu,  3 Sep 2026 15:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788442009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3fAcnP0xk5VImcOaCSVWFZKTfYi9ijAKHbQ0RnE0Z/o=;
	b=JKj2t0Y+rLrVa8hQMDhuH5A6WBTEQV6WzzOGXWIeogW+5MKBSxcpl8sWzNWdSv7/W9f2HK
	4I+SU7mG9L9YKyuvA6y6/pxdZIXS8zn2heIMRWxk6vvY8SpJmn87rErHdYd8D7l58dgwfP
	5T6SijJWWnXY5DnJsTeBBQerxHA02r9RM6d3kf5c/1wZ3RZ+UJhPXUwndX/gVaLhE//h4W
	k54jz75fPkwaOOVmxURByo6bOA0N4Wvmf/Yu7GpifzrQTy1Uw9IAI0c6BJIYY7l7WayU16
	IAXNpL1IEkZL9mKA3Ar9n3UF7Q6F/d0zU6bDcBO6+N2BUe46lzZr34kMWD7AlA==
Message-ID: <0746f828-a424-4001-8054-1e52ed07139b@bootlin.com>
Date: Thu, 3 Sep 2026 15:26:46 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: realtek,rt5677: Add clock property
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Animesh Agarwal <animeshagarwal28@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260903-rt5677-mclk-v1-0-b71a5a3533f9@bootlin.com>
 <20260903-rt5677-mclk-v1-1-b71a5a3533f9@bootlin.com>
 <aplEfd33wSz59iLS@sirena.org.uk>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@bootlin.com>
In-Reply-To: <aplEfd33wSz59iLS@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Mark,

On 9/3/26 11:57 AM, Mark Brown wrote:
> On Thu, Sep 03, 2026 at 12:11:00AM +0200, Diogo Ivo wrote:
>> Add a clock property as the RT5677 codec can be fed an
>> external clock signal.
> 
>> +  clocks:
>> +    items:
>> +      - description: phandle and clock specifier for codec MCLK.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: mclk
> 
> The driver code has a reference to MCLK1 which implies multiple MCLKs,
> unfortunately no pinout seems to be available and other references in
> the driver are just to MCLK so it could be cut'n'paste.

Thanks for raising this point, I had missed it completely. In fact,
looking at rt5677.h there are two places where MCLK2 is mentioned:

#define RT5677_MCLK_SRC_SFT                     10
#define RT5677_MCLK1_SRC                        (0x0 << 10)
#define RT5677_MCLK2_SRC                        (0x1 << 10)

and

#define RT5677_PLL2_PR_SRC_SFT                  15
#define RT5677_PLL2_PR_SRC_MCLK1                (0x0 << 15)
#define RT5677_PLL2_PR_SRC_MCLK2                (0x1 << 15)

so to me it _looks_ like there are indeed two MCLK inputs, both of which
can drive the MCLK clock and can also be the input of PLL2. However, as
you mentioned I also wasn't able to find the pinout/datasheet and I have
no way of testing this. I think the safest bet here is that I send a v2
where I rename "mclk" to "mclk1" that we know for a fact exists, and
then later on if someone with access to the actual datasheet comes along
and confirms the existence of "mclk2" we can add it to the binding.

Let me know what you think!

Best regards,
Diogo
