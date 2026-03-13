Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2741D86FF;
	Fri, 13 Mar 2026 17:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422071; cv=none; b=rUVGeBUoNKkwlxoLHlaCPzPQPBl5rF5HhuEOiuzgTZSvmyz/jd5SyLTN8KXNUDczK435F+8WwGSRxAI07+O6IgjQOF/kvoyaXWx0zqSldtv1Bz8SrC38XHq7sCbvMjTv8jniJo4QR6xqN6jf+3sCHLncJTdsHqhteVu/aiUi0I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422071; c=relaxed/simple;
	bh=2g8VfZXLncHAfTvPfMmJPG/sbEJDvc2tKL/2gXY8qI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahjN8uLhAoWEMhD3jNeOPO/LdFKlAF+qWu60EdipKPjYgOb704nnmAOwAuXx5AqLdQIBJWNCLfTI1aD7Z/IhHtBwkuh612MJbUTNxEy9E4HY7ugnWVMPsfmZcOtc2WV/Dgu3kHwP309pI2Fww/DW0HjxOXr7QzWRF+JUgF7oEj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qC1LFsDa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qC1LFsDa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B32C19421;
	Fri, 13 Mar 2026 17:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773422070;
	bh=2g8VfZXLncHAfTvPfMmJPG/sbEJDvc2tKL/2gXY8qI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qC1LFsDa2RKeru/vinSpyOxrHxMS0TLDP2zd16F++/qOvHi2Y8TFV1QPMUyt+BGzO
	 6M+UGeQ7wm4I2BhUGcpHYSFvUW7QpNwRD424HdLUmIF4ddc5FAGMmMghh6dHgNHL1w
	 sftk4xEMmGTL9IKYCMk7KwMFVSgSklLM3lGjelkNPT+S2sADEaujYw7lSLE6v5GYnD
	 9LGQd/G4Pmiy1hy7AEyYOI3MA6ZoaHraPf6QnBLi8sMiKjSuR45TDdy1vKwlGDjz5G
	 90+8EdO7PbvcbNwkmIokaLRVFWs+QqqC7SqTj3pT887uSEZ1uNvxiNlGblunqmqIcT
	 NXehi4w9ytmXw==
Message-ID: <47c1d434-7489-46d2-88ab-515d147db476@kernel.org>
Date: Fri, 13 Mar 2026 18:14:24 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: tegra: Add support for Tegra238 soundcard
To: Jon Hunter <jonathanh@nvidia.com>, "Sheetal ." <sheetal@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sameer Pujar <spujar@nvidia.com>, Mohan kumar <mkumard@nvidia.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aditya Bavanari <abavanari@nvidia.com>
References: <20260302085323.3139571-1-sheetal@nvidia.com>
 <20260302085323.3139571-3-sheetal@nvidia.com>
 <7447fde1-7eae-4bbc-b36e-fc0da9609c8c@kernel.org>
 <92292069-a60d-4ea8-9c3a-182a5c0cd267@nvidia.com>
 <38e38531-ad06-4971-b750-e77a3268b97a@kernel.org>
 <c285f424-fab6-4dd3-aae0-f9c60e572683@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <c285f424-fab6-4dd3-aae0-f9c60e572683@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/03/2026 17:38, Jon Hunter wrote:
> 
> On 03/03/2026 14:54, Krzysztof Kozlowski wrote:
> 
> ...
> 
>>> Where exactly do you document it for reference?
>>
>> paste SPDX-FileCopyrightText in lore
> 
> Got it!
> 
>>> I know that Rob previously indicated that the 'Copyright' string in the
>>> above was redundant, but we have been told to keep this by the people at
>>> NVIDIA that specify how we should be formatting such tags when adding
>>> NVIDIA copyrights.
>>
>> For the kernel, for most of us, most likely legally it is redundant and
>> Rob was right, but some companies insist on it and I don't want to
>> discuss with them, because they never use actual arguments except "my
>> legal told me I must do", so you can have it. That's not a problem.
> 
> Before I had requested we change this everywhere but there was concern 
> that we would have slightly different variants in different places. What 
> I could ask if for the kernel we can just use ...
> 
>   SPDX-FileCopyrightText: <date> NVIDIA CORPORATION. All rights reserved.
> 
> Although I see some instances in the kernel with 'NVIDIA CORPORATION & 
> AFFILIATES' and so they may want ...
> 
>   SPDX-FileCopyrightText: <date> NVIDIA CORPORATION & AFFILIATES. All
>    rights reserved.
> 
> Anyway, would the above be acceptable?

I suggest to drop the SPDX and use standard Copyright. I do not have
preference what goes after the copyright, especially that some companies
have odd choices and - as Greg KH once explained to me - it does not
matter for us.

Best regards,
Krzysztof
