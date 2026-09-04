Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6123FE344;
	Fri,  4 Sep 2026 09:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512780; cv=none; b=W0yHmRsTw5wRA15v3QgBB4Hy/akA5JVSAKhVuDoO7A3KkaNYR3UO6wQvawapVFz9HtEQe+G3gMk1iXbWf/4KMa786/By3AYHvfEy+SAfqeRxJR0Md3mGMii9m1ZQMG5P2o+Emsav5d1fNvdfz4HckLPwNj9o10RqLb86a1vMznk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512780; c=relaxed/simple;
	bh=L7bE6wnWi8pCFUPleWbZzg4fJr8ynHLY174Gvd4gJAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eMDiKoGZt1dtnlS+OdRxS7Ep66O2KqLwZB3cjKIyPHpHh+Ve6AgDc4e8nNkaqIPQOmzdJHdfVX/+JgEkzfAnugYOUPXRmO6RTdx8u7sCBKKFf2trE6F2WpvWAdgjrTuF/r5MAgmlxlraC+E4iviuNkC9OWSUHCMokj7ZLTLzelc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GgbgJooG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GgbgJooG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 31D064E41501;
	Fri,  4 Sep 2026 09:06:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01E4B6057F;
	Fri,  4 Sep 2026 09:06:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D92211C79357;
	Fri,  4 Sep 2026 11:06:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788512774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xYMtYa6T5sLTiHRUNFasOPpLB6zNpC+7MIJWaSwhPJ8=;
	b=GgbgJooG+uxN8f8xqzYnwk/brDgXCsQ+QCsOANf816Li9YElu+rkrNoADjZCc4vE5Oc6Ou
	CLsdadvVsmigfrym2JYPWxqc7zGTKd7PPWv9IkYF/+0JBbN6Nx3dPOeqmudMBE0KAJVTAW
	ssnQMO1N1rXePCdUX7DmVFbwQjnT8kKZbL4zy1uANK+IwZB127+AC25Iy2rO5QzOblTN73
	uow2M1VfTe6AKtaVoGIdDqSNt+WsExPf1KrGcm0r4WhHK5F8hUTmjq8s/ruTttux2YjFRD
	oHYpYJNQn3te2zcqNVaeYdDyLQ1p1/OAtjJoImaeKcKC4hr9eol6W29r/idXsg==
Message-ID: <a5663071-6239-431c-b346-6a4ec11bbeaf@bootlin.com>
Date: Fri, 4 Sep 2026 11:06:11 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: realtek,rt5677: Add clock property
To: Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Animesh Agarwal <animeshagarwal28@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Ben Zhang <benzh@chromium.org>
References: <20260903-rt5677-mclk-v1-0-b71a5a3533f9@bootlin.com>
 <20260903-rt5677-mclk-v1-1-b71a5a3533f9@bootlin.com>
 <aplEfd33wSz59iLS@sirena.org.uk>
 <0746f828-a424-4001-8054-1e52ed07139b@bootlin.com>
 <12b9d08f-e773-49a9-8b36-2088c8e13cf6@sirena.org.uk>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@bootlin.com>
In-Reply-To: <12b9d08f-e773-49a9-8b36-2088c8e13cf6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 9/3/26 11:01 PM, Mark Brown wrote:
> On Thu, Sep 03, 2026 at 03:26:46PM +0200, Diogo Ivo wrote:
>> On 9/3/26 11:57 AM, Mark Brown wrote:
>>> On Thu, Sep 03, 2026 at 12:11:00AM +0200, Diogo Ivo wrote:
> 
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: mclk
> 
>>> The driver code has a reference to MCLK1 which implies multiple MCLKs,
>>> unfortunately no pinout seems to be available and other references in
>>> the driver are just to MCLK so it could be cut'n'paste.
> 
>> Thanks for raising this point, I had missed it completely. In fact,
>> looking at rt5677.h there are two places where MCLK2 is mentioned:
> 
>> #define RT5677_MCLK_SRC_SFT                     10
>> #define RT5677_MCLK1_SRC                        (0x0 << 10)
>> #define RT5677_MCLK2_SRC                        (0x1 << 10)
> 
>> and
> 
>> #define RT5677_PLL2_PR_SRC_SFT                  15
>> #define RT5677_PLL2_PR_SRC_MCLK1                (0x0 << 15)
>> #define RT5677_PLL2_PR_SRC_MCLK2                (0x1 << 15)
> 
>> so to me it _looks_ like there are indeed two MCLK inputs, both of which
>> can drive the MCLK clock and can also be the input of PLL2. However, as
>> you mentioned I also wasn't able to find the pinout/datasheet and I have
>> no way of testing this. I think the safest bet here is that I send a v2
>> where I rename "mclk" to "mclk1" that we know for a fact exists, and
>> then later on if someone with access to the actual datasheet comes along
>> and confirms the existence of "mclk2" we can add it to the binding.
> 
>> Let me know what you think!
> 
> That would be safe, but let's add the Realtek maintainer (who I'm
> surprised you didn't CC...).  I've also added Ben Zhang who did a bunch
> of work on the device for Chrome and might be able to check too.

Thanks for including them. I simply continued the conversation with the
initial recipients coming from b4 prep --auto-to-cc.

Diogo
