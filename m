Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81B22BB17
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 06:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772690652; cv=none; b=rzqdp50iqzKz+z3tJiKHxFXogkO/O426CqyxUPMW8Zx080chu20DNQyabFsUSHCl+60qKh4s74sKtEhp6Pge6f8XQAFIYg/NFLW0/qPnRl1RA1CBvc+9jB+aM10rxXg627m43Ir7H/lTq8mslM6dosYl8VVIGQd1dRrXQyi3jXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772690652; c=relaxed/simple;
	bh=mw2FowQeB3NKNiDWEv3z2zPNu0YlBCNNOQVnPEtXm00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzdxlowDEkR07Bg92NvkfCqoVQWDPqACz/ifzxGlRs13vcOox0NHmxsoXBS8vI3tr/8/roWzI6Be/YWrnh0XAhqsbtudnP592Tle8ZM90ljAaBPhLnuwYoI++ulZjX2pZchjqIqJzXG5wv9WPCjDrQxVWdMRuE/glS1+k25djUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEQ885zy; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEQ885zy"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so517744b3a.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 22:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772690651; x=1773295451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEWkW3Nk8ma3FEylFtlJlya4pyZzhciMSL74qSW9b+o=;
        b=HEQ885zynfnvBKYmS65kaWn+VdW3JCNxBo1vg4qZHckCPH3+Tk+ccLxGkqfsem0q1b
         nQu48bfqAi8dyuqmTLSCZgLyD5kq3Y4kM7GRhJXaqIgqRdZ9sqitRxfOlSfj+H9a/4C0
         KejPWvHm78LE932GJa2uabukL07WriBdb31YxCRE4M783XzkkbtXd9Jw0bJWza/DtAXK
         +9o2EhZKxEXAReiJP7mFSETuAB6dTeQQu0LbkOdHOr5Aw8ooi5azXAPCUyypx50b8Adg
         FiFGyJJgfbLQ18b1sfALOYOjPXOTPHaBspjhMbOBKbnPBw1dzg2q/8exDAp525CTfmPM
         r0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772690651; x=1773295451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEWkW3Nk8ma3FEylFtlJlya4pyZzhciMSL74qSW9b+o=;
        b=fk+49Wv4g7oVImRhlcQbMVH82BkUs3xCv/U91A6OK5fcT9VWCJVSxUk2ldvKQpTDty
         vydzqUH5Kh35BXX/3swmq8UhjSlgyywa6OKqNYUn+seH6yke5wwZ0PbaTbN5ViI6+Pdf
         ABI6Liz1OUG8PIIzsO4nSyCpRL/iyk4rExtecJ8Qmsn5/x1E3IIOa0MOhAX5p6icWCbG
         Mg/m8ccqRTZxEU7EFkn7vDuIOtJLw0LPZ6N50ZO5jjDFJ8UwOBW0f5wCP+RFMBZ0QG76
         Q281vWA+BZ/WeWxnu/cIzNGFw0wyDGCfz8k8U1SB0r/Ds4wd8hncJ7EIIcj0Im9KW6st
         urtA==
X-Forwarded-Encrypted: i=1; AJvYcCUHqQP+545R0uqqmiAVtEjqPcGOfvR8X3MK3atdLDtZXFXusi+cHaj3DzUmL0aAzG6NC5MOPTncMFnSVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk6xgzDIkcoZTjWuoqeMWNQbKNi65aGnOm7BySxqr0Peq1/3LY
	bdKFhUG9l1pHJKfW4INes7mkpG+nvl9zlEyfE7912ibFYdYOrFvwR7IHpFEI3KZj/Xg=
X-Gm-Gg: ATEYQzyiQEIxwcDrrv8FdlLLrkFpkAqvkx++p2nvNKkngGLkJonefcUO6+vrrrH1qSz
	vosezxS0lrtMOW/TfkSuhB1GgOFNoXYxBm6qY1tA1+uHsBPl0qiMaoCopIdStwEzCp0f/EfkusP
	t43I7I/n9hSLAMoqGc4XV6qrYED0WI/t01yNNYZGE7LKNeg1XUpUsLBLsSI3lgditZwn48fx81I
	xqa7F7Ih93oT1z+2uTIjkPrb9sr7urzlfTD5HgXWR1Z5G71Rewu42bOCRAVg+I7N+wZjHmNc5YP
	a+fqz7NxCR9PTLlD5/So/sRUkEeCFr3v66yrP98I668Bjhw3YHJyDZcgWHLgs+sJ5a0rautma9y
	SKiMj42Q6QCx1NpdSJK9c3wsWxZkln1BuogSqKbJF1FxLE2GApOqp4jVBN51a+YSCw/pfLDcKMS
	Gb4hTf/Mq0yCmQe4/q6Phq7bxPrOEo4fVaVAq7viGFnoR11YFX0c4tAosz/je6WCnUWepsIpfdL
	Hztl9BUp37zpfHqDwgspOMoi4Mi8A==
X-Received: by 2002:a05:6a21:60c8:b0:392:e5eb:f0f with SMTP id adf61e73a8af0-3982e24369bmr4341135637.68.1772690651300;
        Wed, 04 Mar 2026 22:04:11 -0800 (PST)
Received: from [192.168.1.109] (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c738877202fsm1600352a12.25.2026.03.04.22.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:04:10 -0800 (PST)
Message-ID: <2f7bcd41-eb4d-4b4d-8332-da2b193e3aea@gmail.com>
Date: Wed, 4 Mar 2026 22:04:10 -0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: nvec: fix multi-line comment
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
 marvin24@gmx.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305012626.56403-1-marusik.adamenko@gmail.com>
 <aakaLv83wsXQl54x@stanley.mountain>
Content-Language: en-US
From: Mark Adamenko <marusik.adamenko@gmail.com>
In-Reply-To: <aakaLv83wsXQl54x@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I was not aware of such a thing. Thank you

On 3/4/26 21:52, Dan Carpenter wrote:
> On Wed, Mar 04, 2026 at 05:26:26PM -0800, Mark Adamenko wrote:
>> Fix multi-line comment style flagged by checkpatch.pl.
>>
>> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
>> ---
> 
> Someone already did this.  Please, work against the staging-next git
> tree.
> 
> regards,
> dan carpenter
> 

