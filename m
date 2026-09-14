Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633AB497B63
	for <linux-tegra@vger.kernel.org>; Mon, 14 Sep 2026 22:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789425145; cv=pass; b=mlcxuuPk8/3t/m+1ZflePUI0ESXJPxcC96m4QxuNcBaNDBkhLLF7wBoyHB2IgMSXOdEf+y8p7LkiG74BtK+wdqkDQ/som6SrdAjf3jlfpnNN6gTN/6piHxfHTKb9VE5uJg15VbNoSyxbVAIGsw2T5iRd2Rpm12ONbXErkRwottY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789425145; c=relaxed/simple;
	bh=RquOnyx3oonNy5ot8nKZ+MZokFOsGOyqVbKyPQz73Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALHAfxH8uPF5f/MdOeNasgkdqRcWpYrkzwVuNm1rtWzI45zZ+UJYtlaDmd+V5N1OPZ6rkWaJjDjNs6XWPRV7YG+8seCy9YoJyUWxHdxQwuuRvRrE+aC24DuUC957+q8XI3Dug+HeCy6HcHiFEV4MnO6sxFwFsyk+RZOfzFVPGQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhPj5FJm; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhPj5FJm"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c294183384fso634101066b.1
        for <linux-tegra@vger.kernel.org>; Mon, 14 Sep 2026 15:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789425141; cv=none;
        d=google.com; s=arc-20260327;
        b=Cdr26y1DS/bAHBo+ukfZdojPcvb1R2ogToYlYaI3Nwa1tF0O+jikmEu7VnhIRm2cHl
         i3udktFcrQe6nC9EZEWl9Ra3/EgQd8JgMaJQwUhI3MKkLW1hppIy9AlhabEwP4dZrSsb
         zH3I+Wh88FXdKHOj35uZL/mSToDIAw+agpefRVX7k4ancrCWZEI3sx0mGgsJdmQKQyS6
         frJcbiv1CdnHAHiSYQez31xNSBNFdcK92ozwJq3N9Jtq46x74Vch6iOkx0aSuYBT+lwr
         khtoYBXXnOogSrvIwwYhaqUB15cny3OjP5W5jtYt4osCpRrFIpysvOO6llFe0oTEcwtH
         ccJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RquOnyx3oonNy5ot8nKZ+MZokFOsGOyqVbKyPQz73Oc=;
        fh=zn2rWBFNKZsLR+0fIrfOxt/G9LYAnPndh/8wylu8MGU=;
        b=K46wWf4+2Uqtn0H9cOGAMK2EQLnJgT7LC4gF+DNFDNPi0BPLqRu6x/4TgMap9GRTzO
         hBxqdRz32q+g12vjYXXOIobfCo/IhQtQo9LTwVvzVnIY1UL9DiKKvasKgoFfHRhznlUA
         NI6lKVXb6zVW2hs00BYDG16tvr9PRTdDf8LgnbxHYELmdx3MtWf8uriFLkvAbGOILLLp
         QngSCF3XvPTkp3AB1410SPibFZHMQxdgIx7hOs1LzpH1dGHZCk+xBrPXoKe2kvYQ9kPQ
         GPgApKjVvk37V9gr5aH532wb04s3QSRHj5w9MiH+4hL4ijp2Xoj47d+A8L9Ks9eFY8+P
         KnQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789425141; x=1790029941; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RquOnyx3oonNy5ot8nKZ+MZokFOsGOyqVbKyPQz73Oc=;
        b=IhPj5FJmufRo3u88fDdRaoH72K7ArrJLOpQdJOy/gGKFAzj5XxIsE1+DnLI62xZ7s2
         uZxS/2/4Jsc8ZKgauCEDmblqng8u1BrhRc8LqMNyKOlffq0wYMKglT0CMC+ffE1C9Brb
         xJ1yoBz02BKSOmvwCKhUGzpVRb6ARPoHoJ9ISwKjUnxI4jgd1V6Te8tgCHwE40DO1Sx1
         3XMTIOBOvLnRt+tF8dOZd86zRfx2I8HJHaXccOazmm1PLj1GhbruuPTYa/n1hse7ZA7r
         pJ24yVdyytXwPeykQx+/b2ozLANwCLzRr9QO+UNitQWn7L8SO02rrXi3p/AtybyOyQMe
         vp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789425141; x=1790029941;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RquOnyx3oonNy5ot8nKZ+MZokFOsGOyqVbKyPQz73Oc=;
        b=wSlcbKYjwLfJSCYpH+iL+UbDFvRJc8l7ndP8HWWdog6lbEox2uIeB84pndOM1iO5Wu
         rQnPErnU7HfS/t1XdcozuWYuEqVfha7jLC5qtAIyIDERz7Up21lPbTpFk7oEBZ8a5nUp
         1Y61IZxtUKiLPGmw5XyiXUrAii9SzDb8do41R+UWNZRGv1krdSG9B9S5HiqkK+90o1Wp
         I1urbYun/cUN1NNPNQM2N1l+JDOinigjkHj1k9Kkl4LVwWNAsLrvGLeZQ1awekivw/cU
         lZMHdbi2LaPDFDRT4eiGWt9Zq+xpE7aDI+hH8PUkkJ6YUrC0jchYK0aqyh/6OzFvvXyN
         5XHg==
X-Forwarded-Encrypted: i=1; AKwUvBxEvYKHnD+hLRC5k0+yIDlkfQ/LPUEFMzjHxbLAvzrnM72z/rhJXehDmKC6MyJrIttW8FPe3WuIGldWgA==@vger.kernel.org
X-Gm-Message-State: AFuF++mdWN4gNELZzyvYmyaGwb50pQIS4HdXnG6eY+5iT0VCYYsSL/Yb
	0LRsHELuBPPTDPhcTvm1nIRlNWeXV2scZd2h485dLsf0NSEwTBBZxXDMTuERgz9f0gCh7xLFJ2D
	oK7CjJ7CiXhLek15Z2y9zH8gvZX1YWA==
X-Gm-Gg: AYBFou1jdjggsDlyz2AuZ8aIj07wZPhTjm4RbXgxkPyFq/8Cngeb64b+RtYcPFLS6Oy
	oNECrRACC1crn1XEsL0Z/egFoE+Cd3kiMpi7r334EQYY7clJ2fEXu0G4/NOHrCJ25p1QoSt1lRm
	QhnylI9SYqw9Favc5xGtD8rH+N+gyZ6+robBljmupYKy7UNJSzCaETTe6vj96BIY13NXaSnD/Vy
	LsPI3resgMKUdK6ICxJEYhQUFMxdCfb5x8+YkMwdPErXALdCF63/ZADhZ3u4QwwzUzIzvcNQgxm
	q/qCnW1nxY9zSEZQZ8wsTgdKyMpMOSDX9DPKvZFqbEU+rQ8Vb1xAh/5E1bHCsvF9rGrbSkV/ZtR
	r9xS1KsxNOdmHRkTM5h2J8cYq2zORs5x6f640hrDuCqJJvtCvuiG0zNAODJoOu7d8NBmb
X-Received: by 2002:a17:907:8e07:b0:c29:45ad:7afa with SMTP id
 a640c23a62f3a-c29b804bd7dmr277377066b.0.1789425141394; Mon, 14 Sep 2026
 15:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913040606.23272-1-mhun512@gmail.com> <RjVH6lTrT_KugcUQV9puWA@nvidia.com>
In-Reply-To: <RjVH6lTrT_KugcUQV9puWA@nvidia.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 14 Sep 2026 18:32:08 -0400
X-Gm-Features: AcwNN1UpzBAoI25V1FSIL5wEhSS0QLs7PqvCPS_cC5XA-rgMX6mik1qtVrFRyMw
Message-ID: <CAGEsz8GawAJyAXbksWUJRhUWR+c8cXbn-AVWfd+kgLwO7ZQmpQ@mail.gmail.com>
Subject: Re: [PATCH] pwm: tegra: Disable runtime PM on cleanup errors
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pwm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Thanks, Mikko. I'll use devm_pm_runtime_enable() in v2 and retain
cleanup for devices that remain active.

Best regards,
Myeonghun
