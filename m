Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A182741DF
	for <linux-tegra@vger.kernel.org>; Mon, 13 Oct 2025 16:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760374697; cv=none; b=iI0RNpqjMQgoCqZBlC8Qv3TDcr6mNIorYCdfHhjyrxt3kqnuPygXeXx+Vkpbg/Fw/aM0gIChBwEQSEF5iAzzexjhve2xr8f81Y8olXfKoZS1TrCzjReBi6u1/jQ6Lr6bMHaOxSbOpkSWQ5hplVyOZYNRe7BMMvGOjrkZNLhlL3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760374697; c=relaxed/simple;
	bh=aVbLx3zzuiItcIq6jkvMD/Zgek8sd/MbjhMghYBE0P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b2FtNx0104rat7IkwcoINcWwPnBfirJ9yoPyhQdgSZHuerE3qF1lkQxmkNjTTfET0GRPPxoT/vHuEZ3vS0Sb1N0lrwrL0rRgGujTkq0s2mm0pheETwgttjfqUsY/WGs02SPXvhhk5wze6w3cvc4sbIkuxvJkQ4QOoLp2WMZqEqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M74mFQ9H; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M74mFQ9H"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso5077683e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 13 Oct 2025 09:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760374693; x=1760979493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yugt4TFzKOWVtrp9PcwweappLEqjwwN8AAVbBJj3x48=;
        b=M74mFQ9HvKukuAyHkZgSoarVInq8g6SVHkIHPYSCFvcdFOtBbcbcTV9eKbDReyG/pp
         KdIx6qukevvbll49LnzS9pFeCJSWi+xCmLRCDcwb9prvjP4bSnd4UDwzB5srbExk1lxL
         x6Ink1cLNayjEKBYzdYAvrdxEESaNMvkmRQgDFN5GY4B1rf+KiaiI7A+kHVonyFWCVez
         +Fpk4WA7G+wwikLP4z49RnQZhQXIcTlo/oQWxlwL3mrXM/6O7MIKLIo5tdZ51Y6vk48v
         md0bC4aHTnBmdFu6yKm5I9WdA3qqt9bcLHJCcFXERn3shL8P7hWNvhx1xuE8BsHxIom4
         z1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760374693; x=1760979493;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yugt4TFzKOWVtrp9PcwweappLEqjwwN8AAVbBJj3x48=;
        b=b8ol1GgwLN7kQWa16OabYZIB+hJpNZR7rGLiaBDiq5TU4jHLILajAGYqmQNwAhEE+z
         De+NZdj97+0KgnOx04/NtIm2Vtfhtvr/3jEq6vmNtk7Cnf3izzl0vGXKvi0WJ3qq23DM
         fgV14ch8JX5vi/8lLPI57c382MxIdjQ1nN10fLQm30iwyNUweUyMkB2Kv6b+8LQ6Olqi
         uCxjteQ2oyRqq/KcS0/Uab3p20rrTTCjseEKK8CebXyeQ437Luhhou0UvAlRUkU9URST
         UjU2ZuHHPXxIWZ1+1GKCjmqWegft12HW+iAXO5sJtGMWybU65Nc/+i4c+CmxlzFS+4+Q
         ouOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkebH4Jl6Igm7fbGzckF/18efpT4IVTZQgeUld4zvto8lzieZEItHwji5K/B2VyXjTnOnCQ4MeSVFxuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6aGkTFVuJ79is/Xq9z7RbZnGI6E3dhYoM0YeHkJv6V/OR6RCW
	4GcBi6TKFpUpTe4JD8aj1IrvRP01YGcJ3SUVqdyMe/JdIvgn4fTGblVtuRbvVH5luJY=
X-Gm-Gg: ASbGncvkjn78ohdNMBYbcrzhJ33eSBoAQG1iS8jjPF4NRlhw3krB7lRvT2zq6BYwbhr
	8+/uOA/vic20/vILDQ5E2RQDsAoyljxnK83gsauoLCHkDmoBynet1Aj+9Ea6SotRRJSzMDTj5EL
	UQGPDSGelxDlqaykCv/8rfYWgctlOiPQ462h2T/PnsKg9KPuwzZHlfjxPtxBdfK44j6Oqt1Bquu
	ttF1ER3PBLnrrNPh4VWx91FpuRETIXZZPVcfcNinqHInAEfKWT/6vrFttNSjsXAChU6e7o2ZXHA
	bYtxzjYy0pdEqdDIoFlbqSYP47coBBJIrcYCZCf1FjZNRdI3E1XEeSvFCTTmihhmPDvUca/IZnG
	ys5SZC+IZHwFaAvr3nnPm4jAId3N5k4/kbMWbOrTYf0W4y9ofKiHwxFeS12CHM9yKY/Xo9dXJbg
	EvdfVLUva6faRd+flw
X-Google-Smtp-Source: AGHT+IEh5FEGdLJk3FY3nXjUAjtDIVpFAFgTlMg4hJ6GlsiA7ZQHpqXBQCJHQ9JSVuB42SxmUqwjGg==
X-Received: by 2002:a05:6512:39c3:b0:577:494e:ca63 with SMTP id 2adb3069b0e04-5906d896d59mr5638965e87.12.1760374692389;
        Mon, 13 Oct 2025 09:58:12 -0700 (PDT)
Received: from [192.168.2.19] (109-252-159-193.dynamic.spd-mgts.ru. [109.252.159.193])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5909413ec6csm3376197e87.48.2025.10.13.09.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 09:58:11 -0700 (PDT)
Message-ID: <590984a2-633d-4e68-9601-f379bdc2b8fd@gmail.com>
Date: Mon, 13 Oct 2025 19:58:10 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] PM / devfreq: tegra30: use min to simplify
 actmon_cpu_to_emc_rate
To: Thorsten Blum <thorsten.blum@linux.dev>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251013131825.31400-2-thorsten.blum@linux.dev>
From: Dmitry Osipenko <digetx@gmail.com>
Content-Language: en-US
In-Reply-To: <20251013131825.31400-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

13.10.2025 16:18, Thorsten Blum пишет:
> Use min() to improve the readability of actmon_cpu_to_emc_rate() and
> remove any unnecessary curly braces.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 4a4f0106ab9d..2c9813bd697e 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -12,6 +12,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -326,14 +327,9 @@ static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra,
>  	unsigned int i;
>  	const struct tegra_actmon_emc_ratio *ratio = actmon_emc_ratios;
>  
> -	for (i = 0; i < ARRAY_SIZE(actmon_emc_ratios); i++, ratio++) {
> -		if (cpu_freq >= ratio->cpu_freq) {
> -			if (ratio->emc_freq >= tegra->max_freq)
> -				return tegra->max_freq;
> -			else
> -				return ratio->emc_freq;
> -		}
> -	}
> +	for (i = 0; i < ARRAY_SIZE(actmon_emc_ratios); i++, ratio++)
> +		if (cpu_freq >= ratio->cpu_freq)
> +			return min(ratio->emc_freq, tegra->max_freq);
>  
>  	return 0;
>  }

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
