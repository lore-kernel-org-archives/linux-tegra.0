Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3B5183CCA
	for <linux-tegra@vger.kernel.org>; Sat, 14 Dec 2024 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734172044; cv=none; b=enHx8xF/34XcvIDxMf4Nf7ldrKLY6ki6CzJRVf/KUlUOHQBdaGguCvHz+PNjunfbD+O24XdC58CpKP3BJ+nrIwguXlQmvpQKqGikEi2hI61UiK92oGcNzitdJ3B+VcutgVDjAO0qf0YBWvEc6Ov8iNzBKBlM+yUyBztqLu05pY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734172044; c=relaxed/simple;
	bh=7RpdwuvYmgixj4vG2B9l+ya77TGtrY7C7zo1xUxhwDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ArP2f/ezy0SkolobZoJ+QKNyGwqf+w5G2IQcGWMLM4kFOTGk9fXrBPlfNOaho7vW5iVBgyxY7aHq8ooY+Me1qxblXFjIlZEfY33BWg67eK8KTW2GTjNJTNf1e2oOzg011VuCo65ZJTD7kjxbLLqGrfHsm0Es5hIHhRuvsJjqQ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZceXJTJ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZceXJTJ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso284102f8f.3
        for <linux-tegra@vger.kernel.org>; Sat, 14 Dec 2024 02:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734172041; x=1734776841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=76bsd+NlKi7MABhUx1jp8fheZObwn9nIfZqMO3x46Do=;
        b=eZceXJTJ0O66hPilRWOBObo1UpKtr35k8F0t+vLqr3wZ7sO2PbdkR7f8LpMJUsvfyC
         TmqU4/3MrOrX23XSukha6aaiuZwD/NsP/DrW8WEkaMJgNnWx5urp3jVkFCP/J3An6SxN
         K+k3GyxEWu47affASr1btqscIFDeqers1zZ2xKZsNmtK+xqrOhfysX9dxXJ4s5XSkr5z
         +xZPOBRckInLoD1/CXLgSWBAqIujzLCpPyOJd0m3IX+F2tuu8P8iqOT6Hq9KErOvSq6h
         VymtcM6JJ79PqOo/zDj8jre25d5WHJ/nji3g6T5hQ5LiMC1FAdt+u2sun6W0voEx8nh9
         387A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734172041; x=1734776841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76bsd+NlKi7MABhUx1jp8fheZObwn9nIfZqMO3x46Do=;
        b=Utf9dBAdjWG1b+sDOOZ442r2w1MGdl61QMC6P8a/cduVep49xMH5B4Cl8ncv+ptcHC
         MYyE2bSAUGlrHDk2YXDYvS7nM7cM7gk2c6kZ6G0OZx2mmUCp7SSg1CR/4TILlyP6Hr+g
         2MKZAcs2n4j95ANoMbEBywVVd5g3BERoVawE8N3b1RfHRkDZajG1HHV2HhwLJeEH3a23
         x30JenbJZQug6YPuTGZH3QFvcqTUVmVECZ75B8C5LEnTBUYg5ME/4hfjYeE4sbI3S1fI
         g50X9c6duZNX+iTnNegKFZbU8n2IAMieibE5bkI00l92IScsSxwr/pBjFNi+7qDD5aL6
         wrVw==
X-Forwarded-Encrypted: i=1; AJvYcCWmoypgLTTtk/Q3MYPp3vWNSuwkjYU7bb4mLvJud5Qx4XEz2w4LnxZooIdQluuW6+YBDYLdu4B3NLxOIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRV9evOBWu157IrUbFe1725P5KGRMHEFBQqjIQph4zy616FBd1
	Oj/Ql+Kqe4RG+zB5Zy87nai18rNSlYBiJ+G1SnKImvD7mcsusenx28bGvF0vvr4=
X-Gm-Gg: ASbGncuOHNR2k2S/545pPK8NKPlGdu3R4tEYEQ3WZe22taG5tOyPdCCMwwH70hTV3H/
	tZAsUUKCpZc5YHIu9wlhcHqeZVzJW0Z+qBDJMI38T7Mv6Z9suMCsOLoaNYzy+oI7+3X2e1CJi72
	HH16rSsJct46w3r64oVakx/o0rVofefUxkvKoe5N4+sQUZC+V3uSUa9SwBmvjZpfFcTwG4KNxOY
	oaXlPeZdoz38+8PjFuJ3fdL3puRE3BPdHU1RGKYb47mU5YXg8h1Rqm6oK1kUh8OVoNXii1KiSOM
X-Google-Smtp-Source: AGHT+IEhzOyeYxZI6LEke9/egyJ0SBQBWjEjaOE2iUCrFSKhNkBheZLi9apNCf+AQfdCCvONmrWwPg==
X-Received: by 2002:a05:600c:3b87:b0:434:a339:ec67 with SMTP id 5b1f17b1804b1-4362aa26e03mr19439125e9.3.1734172040775;
        Sat, 14 Dec 2024 02:27:20 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4363602d76fsm20289365e9.18.2024.12.14.02.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 02:27:19 -0800 (PST)
Message-ID: <df097900-e6a9-44f0-8589-402ff50ed80b@linaro.org>
Date: Sat, 14 Dec 2024 11:27:18 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: tegra: Fix Tegra234 PCIe interrupt-map
To: Brad Griffis <bgriffis@nvidia.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20241212211114.330245-1-bgriffis@nvidia.com>
 <942ae75e-51d1-4265-adec-e1446fe0ff48@linaro.org>
 <7ab2cc1a-a461-495f-824d-9dd62973cf48@nvidia.com>
 <ac09839a-b356-489c-9ab9-54a567fdcf95@kernel.org>
 <8a372dab-ab8f-4635-a5ff-bd7c8ed4756d@nvidia.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8a372dab-ab8f-4635-a5ff-bd7c8ed4756d@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/12/2024 01:35, Brad Griffis wrote:
> On 12/13/24 05:26, Krzysztof Kozlowski wrote:
>> Yeah, that was just an assumption, but three independent people are
>> Ccing address which does not exist in the kernel and it is impossible to
>> get/deduce/invent. Three patchsets from three different people...
>>
>> Best regards,
>> Krzysztof
> 
> I am developing and testing on mainline.  However, when I checked the 
> get_maintainer.pl output on first glance it looked unchanged and I 
> copied/pasted an old "git send-email" command that had the older email 
> address.


You should not "cache" the output of get_maintainers.pl EVER. Addresses
change, people are added or removed. Just use b4 or simple
scripts/aliases (like Rob's send email identity or
https://github.com/krzk/tools/blob/master/linux/.bash_aliases_linux#L92 ).

Best regards,
Krzysztof
