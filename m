Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52432FA2B
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 23:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772493835; cv=none; b=epwrmvfgB8uJ2watqbCqkiXcS0M4eGsWOXovkprHT60wH3xiFhwRFo/I3arExT6mJrO7Nta5Y2h63bc9WEFPUFmUjePcsS35oeoCo5iCKD44u2LqCNGlDaBDstyxbM4dtCo/WBEZR/upaV9cFQmVpwpAPOsonYvBl1Oa4sf/TXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772493835; c=relaxed/simple;
	bh=R+OnIhGUZG6A7u0+ocY6sf2SrkYnjLzPYEDeBTYUPVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POeNAxuxBkHqt9lrA3b6fc3P4PP4Ad1gcDw74z/7LzJz7RBjomuBJ8+I/TipxmD8zh2z6vkgctiFrjBQ2ZYbAap5DYaQQiKg8Lu7mxouiMsM+kavemK0g+ZmjJNlldLQT9uyDe5paErKPiVSLml/UKJAGrzf47d14gpX1VQ8SlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSvBRC/d; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSvBRC/d"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-389fad34e2eso81104601fa.3
        for <linux-tegra@vger.kernel.org>; Mon, 02 Mar 2026 15:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772493832; x=1773098632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdtHpDW016K4LQxH2pvRVvZZF33gdKrW39HaViFcm2Q=;
        b=RSvBRC/dL9ZlMJ3FolaO0fYlNRCqSkU0N2vbz3BfgIVQBcK1Rmp/bdQvFQTYBtaRVy
         j+jU8fJRJ11bmm9RmP1Z4OM1/tzaUIHWkGyfX6QareT9uBDMUzAne0MMKGnE5YgfbavP
         yUur5H1RD4EWQtuqDD1sRAp4IodK/3m1NGiIrjbIDLMYdB+DaD2LK3J2ns7g4Tql9Ajw
         rdqzU0yfNLrTLN3JkvHzfT5t1we5Xe1+zsbLCqoo5QVwBiE5xv9jhbcP6BldgHTUL0JA
         P5DSolYfjHNl7awYbMap8c16WkHOUWwXXcZYoUgX/sDe+GhqrfZ4OdoH6ZlNsNiCajq9
         KEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772493832; x=1773098632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdtHpDW016K4LQxH2pvRVvZZF33gdKrW39HaViFcm2Q=;
        b=mw+1PEeIjOsKVn2Z5nPjVi6Bo28LgAdJbGZi+uwt0xJ6RIXMeOzyFetz5PWt4ATurJ
         IAxy9vhyV2C2H6I5le1gZQxn17XR8wqQJ+HV+TdQ/U84P/cI9nmfb1BrMRDStS2/ms6w
         2iUC6pT6XGoz38BDVSgV8KpK0uLAAsBjchafxYicpR0IBa8WwdxgW3u5lsnmzaMM9ni9
         XEuGBJ+l79dRsxepR+ih7qiIuLWhiLNVlwL5dYd5ZqSKaWfZlHcCjyShNwsXcyZ//bPM
         1GSB/yGcHGFG6XrA70P/GT0qxAvU24mAu3lwJcz8wpJ2cZaTkWfiYIXuKbDx+csHZqei
         tq1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmBb5n0C0HU2957aZPgGmIRGHPfk/X9/HRvC6PfhECv7WvbjMPMKmN9IVaB1mC2WewRL4gniWEdfTZEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmmuzln+SKZiMdWsRXkYWUHEUdlfczjnAbDdTLIMUwVRAqgHOw
	YmKbk1qnU0SnvDprXxexhBNDk+NL02vZw1ixMzP2djWWbXITFz6RtWBL
X-Gm-Gg: ATEYQzwDDjIUiTKePYR9qhISWuG7aww5ug7xIn83tode0qpUIdFQ9sKG4xnEvOHPYPn
	tZb0NlIuVM7GoTAsJq0AZ2C4EFr2IHAx8jrF7pzPgfopi/msFiBFpfCEivyxSbah7SuD7ng0ZWV
	HElWGyQeq4so9uNtLxrwW+HXE/7bagkVnnSnPaVzvXfMpSn1S9YpYov206sMkjDT0lKAWdVllTl
	Gfbe3wht8PRdFqc6sVE+NA/YdxwXCGGiy0azq6xI4E2HU+KND5JSRW75VTb2ngBO/OsyHMisM3c
	JxWIwRRgSeiojXboy2PN9xqSsXrlK8VG3wdL6TgQACTjPTNo9xZtwojnXIpb0J4k6lHj2Qy2XwZ
	FuvxSXYyG5VMFQY7nIoPtKBIz9Qc8E6edbHwTnt2b7yrTSaGEMVuuYvpuUU1RFGptIaaKv+LPm+
	hSJtGZO1DapcJSVNwBoTsHP9ZUlgZdvDgxKpkLs1RJvA8HsEMAL2gDNH8qi5evhRwF
X-Received: by 2002:a2e:b992:0:b0:385:d0af:f05e with SMTP id 38308e7fff4ca-389ff34ecbbmr63230501fa.31.1772493831510;
        Mon, 02 Mar 2026 15:23:51 -0800 (PST)
Received: from [192.168.2.178] (109-252-156-195.dynamic.spd-mgts.ru. [109.252.156.195])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123573d69sm189012e87.70.2026.03.02.15.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 15:23:51 -0800 (PST)
Message-ID: <4b98421a-9e64-48cb-9726-ff34a5b9cc76@gmail.com>
Date: Tue, 3 Mar 2026 02:23:49 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] devfreq: tegra30-devfreq: add support for Tegra114
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260126185423.77786-1-clamor95@gmail.com>
 <20260126185423.77786-2-clamor95@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20260126185423.77786-2-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

26.01.2026 21:54, Svyatoslav Ryhel пишет:
> Lets add Tegra114 support to activity monitor device as a preparation to
> upcoming EMC controller support.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 8ea5b482bfb3..fa83480a923f 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -963,16 +963,22 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +/*
> + * The activity counter is incremented every 256 memory transactions. However,
> + * the number of clock cycles required for each transaction varies across
> + * different SoC generations. For instance, a single transaction takes 2 EMC
> + * clocks on Tegra30, 1 EMC clock on Tegra114, and 4 EMC clocks on Tegra124.
> + */
>  static const struct tegra_devfreq_soc_data tegra124_soc = {
>  	.configs = tegra124_device_configs,
> -
> -	/*
> -	 * Activity counter is incremented every 256 memory transactions,
> -	 * and each transaction takes 4 EMC clocks.
> -	 */
>  	.count_weight = 4 * 256,
>  };
>  
> +static const struct tegra_devfreq_soc_data tegra114_soc = {
> +	.configs = tegra124_device_configs,
> +	.count_weight = 256,
> +};
> +
>  static const struct tegra_devfreq_soc_data tegra30_soc = {
>  	.configs = tegra30_device_configs,
>  	.count_weight = 2 * 256,
> @@ -980,6 +986,7 @@ static const struct tegra_devfreq_soc_data tegra30_soc = {
>  
>  static const struct of_device_id tegra_devfreq_of_match[] = {
>  	{ .compatible = "nvidia,tegra30-actmon",  .data = &tegra30_soc, },
> +	{ .compatible = "nvidia,tegra114-actmon", .data = &tegra114_soc, },
>  	{ .compatible = "nvidia,tegra124-actmon", .data = &tegra124_soc, },
>  	{ },
>  };

Acked-by: Dmitry Osipenko <digetx@gmail.com>

