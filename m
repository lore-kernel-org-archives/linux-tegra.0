Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E99A2AEE9
	for <linux-tegra@vger.kernel.org>; Mon, 21 Apr 2025 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745214297; cv=none; b=DV0SmnM/kRS8JkYk2zo1SgUwL4j77fDDMoy8vD6vFOtzwPAG7+BV1FNbRXZgYxeib9NnU6xEXANq/6Xbyf+HDYn1JbqwdvJsQyspsvDuwxjGJzt2nu98Qrbpw9XMLPmbJlWqb8Z4Nnza7orUw1z0LzU3YA/5Ij2jvHPWWeszPkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745214297; c=relaxed/simple;
	bh=eBG1slbqTRw8vsbgYrWTwEorbArUGPZrqx8A3p4gBj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZShmnOn5YMO2ryGV2b6LEgkjiC6XOi52/XtwBCyVCzqrkphkHrG2eiPYMA98/vl/RCCNKvtC/HVBLBVNLKKPYO6383d7VTQKOofWGCggA/ss6IhaIH313PtaAwnBn65K9flp+9/U+QryGhXsIeh/Av2Lhm+3uH4H7Xwg9hLv48I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v977lrKk; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v977lrKk"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224019ad9edso52390405ad.1
        for <linux-tegra@vger.kernel.org>; Sun, 20 Apr 2025 22:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745214295; x=1745819095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IyOTo7rnTJ1HQMNMgNbpA3SfQ6Ks6YJstKsXKdKshu8=;
        b=v977lrKk8VNZnHgjNCWgZcKvluYqucgQMqsBUL9hoHL74ez4tx98oJCsDI63kFTpDO
         ctgAGV1cdhyEWYlBGSsgM08ycWsKY9uZwDL5JjyBBaCAEmwLQkBSoNCumeyeVvW6XLBe
         QIzp3whntcplHQPwhS+IuJVwQ9gyjqXHfHI8e4rTHbTU4q7NV6w4aPWQQvUwOp41gSdX
         zeWzwBwqwc4G0K2XlPZI3jGPfzTjTT8Hv/2rl9V23Ah767XNZuztZncJuzD49Te5Q9p2
         gSF5ccjRbhUnxd43S2noCBb52fNaOXFDJSVuedkzQUcu1UNtIcF1hvRn+JUyAy86XqIM
         ldiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745214295; x=1745819095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyOTo7rnTJ1HQMNMgNbpA3SfQ6Ks6YJstKsXKdKshu8=;
        b=LteJ69+gbH9+aoq3VIIzW7ZO4KpCprga9AgOpq39oMcDH7ikQiQ4+hcBEwXAnDVWGx
         hdkG7E0h94BAnikMBbF2/4TIBPkFRMXFwggM1vp2IMhM64D1Kdld+sPFs1zIn5PFDYla
         RZjuxa2ZLbSTbxkVLJVtgVL08PNzqgPQ7ImUShuP4xTmg0v1Tg43RVGqPahJtFtOinPt
         YFRry2+vJglf0AZZx+HnRom9GoWGTHRJgpaH4fz8rtpMSE5qx5f0mCh1UWUk0UgdZXXZ
         1eCf5BdqSCgmg+N4ZG2nZo+5AmnFOss2WJNYRRqNRqSh57kgJxmsvNpFgVuEdkeuAnlg
         043A==
X-Forwarded-Encrypted: i=1; AJvYcCXbsON0dVL3jQ3otXYXQj8hqVMpVBfCfGdmWhMCCWBdKk5GqJOPI52hwSd7x3MDrfLlukm3dLsra0En/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRGOSlndv4hduyNWQ87YmBm/Q3r+A/5uH1NErqarMPfQGVtRyS
	FRtkUY7sXW8RObfRDyOWw57sbPCNOjRDJA6UO2c66IJRy1FoiPlTl5gP/DdHuyI=
X-Gm-Gg: ASbGncvX2QoQf3fHnsIISWerKK1RC9PwrhgIJUtjO9y8irzZP438cYiZGzFmcoyDd70
	kJiFe195DxhKrFXASr6relST0Ssjj2aoPn9i9fDFviw5mxmA9w+3+m9dbgUTk/iKcjkt3R7yuZL
	tzl7Uup1fGSuK1TaVt7gUPh5mIq9ShXjKA36pDfZhWdtkdFZ/hLZWH4H1RshUo/2PNIKYl1Meop
	ONJujRuGedvto7G0HxqEB4XthFmevZixD0f7X94li5LL5nmlsvMw6PbHyXFEUHE484yMJS6XS49
	wcWWH5oADE7UkxmRqPQjo0nXMLJRf724a/RXFLmxiA==
X-Google-Smtp-Source: AGHT+IFhnaa0z+ayVrcmvAvIxkBt8wrJ3nfuin/kbU7E0Vx+ZE9g1E7PEVYhPkwAR5/xTaisUcIpCA==
X-Received: by 2002:a17:903:2ca:b0:224:ff0:4360 with SMTP id d9443c01a7336-22c53654c0fmr157873595ad.53.1745214295413;
        Sun, 20 Apr 2025 22:44:55 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdaca6sm57336995ad.9.2025.04.20.22.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:44:54 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:14:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] cpufreq: Export disable_cpufreq()
Message-ID: <20250421054452.fdlrrhtsimyucbup@vireshk-i7>
References: <20250420-tegra124-cpufreq-v1-0-0a47fe126091@gmail.com>
 <20250420-tegra124-cpufreq-v1-1-0a47fe126091@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-tegra124-cpufreq-v1-1-0a47fe126091@gmail.com>

On 20-04-25, 15:42, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> This is used by the tegra124-cpufreq driver.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/cpufreq/cpufreq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 0cf5a320bb5e864709b259249fb1af8bfbc0b04b..78cddc78ee98630f99ccc332c64c94f437297177 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -109,6 +109,7 @@ void disable_cpufreq(void)
>  {
>  	off = 1;
>  }
> +EXPORT_SYMBOL_GPL(disable_cpufreq);
>  static DEFINE_MUTEX(cpufreq_governor_mutex);
>  
>  bool have_governor_per_policy(void)

I didn't realize earlier that tegra124 uses this call directly. I
think this call was rather meant for other parts of the kernel
(non-cpufreq drivers) to disable the frequency switching. It may not
fit really well here.

Instead what Tegra's driver could do is remove cpufreq_dt_pdev, which
shall lead to unregistering the cpufreq driver completely.

-- 
viresh
