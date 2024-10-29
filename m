Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1B1201008
	for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2024 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730184804; cv=none; b=P8thau9ewVAqE3nJaoFx9mLq//ZIjKTkVpsrjnscryZfkixOVgG1ZOjENymUFTX/qjU1YtRi8fXliWQUrSKx4/cJjd8DC51WFU+pHon2Z+7cJvHCswRVADhx8M8zUUmBLJtJWzyx6EHPsB7sRkv/u6OQzD7xUvebnK9HIhxCtpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730184804; c=relaxed/simple;
	bh=VI5gBCWScORZmQ5M5JKICCGe/z8Tu5nvu1z/DGuqTYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMYW8ZH1QJvUAzW7uDobIo0e6DXisIHnulxwq+E4EV9qOwK+IGbO6lu4AfIAo0KUj9gNMysmMU9cpDJ/m9t878UXJbpS09e3etejdkdGW1D+FddK9Ks/PSH0gfGeaBLlVY4/RAQfvuBpN/aYMiBa6HXgfWJ0TDQHmC1420FrIsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TsCVp205; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TsCVp205"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20e6981ca77so54678655ad.2
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2024 23:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730184802; x=1730789602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gxdqxmWJXdXU8AUeRm4skNzTB6cELoVffMjUmz4VZV4=;
        b=TsCVp205Z2Rx58O5LNpZUuxsBJqxEYmRVNvrPr05GsIT1URTAfMgYQMYAEKnbzqUGR
         yajxuID98PopypqyNE4CEFYQD8hTAUi2jV4fay16BNghfISNCYSMVfblB8bDOnrcAKI+
         nGQ59tbKZbptMj2c6gimilCedT+Cj+tkMpFKZPwwx9+OFdj5IhX1iqyULBaaP09tm0+n
         MwlMYNWfuGxHxouJHNjdluosOiPy9L8SbbFjV1FnC/bLROYaSZwew/NL3kr6S/7Z8+Qw
         9xji6NMUiCEcBHTRJaDix1z6b6Oui5lgzyuSZlz0mWLToRDAkCOazRLMb6yl0XIdwN0S
         R4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730184802; x=1730789602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxdqxmWJXdXU8AUeRm4skNzTB6cELoVffMjUmz4VZV4=;
        b=RdLRPTFQjVwbDhMCiJjhJXcn2+LNhE0MthQ0kSH5Z5BiqSq897sAgzOGm7eegMcVaR
         Vrr1VVf+R3BMS0Ab+hhmoHqi1XlvQlZ00GqDduGgXMb69ISzK7GhK+rRp2Sg8JEddZvQ
         KsD0kplQgw5GaYd03g0vPSC/c1g3BuzXZC8PqyQXFeap7wXATpsKHX/Mz/VjCbzWAKUt
         LRhv9XW6msFypcWzVzv//ZccARcJdYV4A6UJgjnkLmTU4AC/WTywWKWsZeUqr/LrsF86
         C4L5TJ+tUw6X6ixqYvu/9XVnl1qh1YQhbT3sNKyx9dhOavaZ2VqeGS1HGWVOmuGr8xFl
         NL2g==
X-Forwarded-Encrypted: i=1; AJvYcCXXNxtoqTeuZqcnDIzqxSu5p/x/2U6jBnipHdVn2namLkouj7k524dqJ6HK6onruH5OUIE/DTmtDcfYMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkiKiaOakdsltxAtPOsE8Gs98eK1gU0xi86FQMZ5J+dhjTsIXn
	UuAq81kW/ESkjF1Uvu0nE//UrzYnHHBBMVKzWhjxiZUHr0X5J3q5fIdpdZ1YOGU=
X-Google-Smtp-Source: AGHT+IFmnh6BfWm9u00lcdmwhUncv3sqpOQIn0HAENF9MSk8JtP1yLm3zPeUH5AL8E7LPGeuXgJA4A==
X-Received: by 2002:a05:6a21:3a4a:b0:1d9:1d2d:b656 with SMTP id adf61e73a8af0-1d9a83d9f36mr13743238637.15.1730184801978;
        Mon, 28 Oct 2024 23:53:21 -0700 (PDT)
Received: from localhost ([122.172.85.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921daasm6909172b3a.37.2024.10.28.23.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 23:53:21 -0700 (PDT)
Date: Tue, 29 Oct 2024 12:23:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
	Sumit Gupta <sumitg@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	ionela.voinescu@arm.com, sudeep.holla@arm.com, will@kernel.org,
	catalin.marinas@arm.com, rafael@kernel.org,
	yang@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, linux-tegra <linux-tegra@vger.kernel.org>,
	Bibek Basu <bbasu@nvidia.com>
Subject: Re: [PATCH v7 3/4] arm64: Provide an AMU-based version of
 arch_freq_avg_get_on_cpu
Message-ID: <20241029065319.zto3wlvceec3fjym@vireshk-i7>
References: <20240913132944.1880703-1-beata.michalska@arm.com>
 <20240913132944.1880703-4-beata.michalska@arm.com>
 <aa254516-968e-4665-bb5b-981c296ffc35@nvidia.com>
 <ZvU4mR_FZa7jXUgk@arm.com>
 <ylcfqw4swz6xjxxfoyljyifs4ibbueywogqxusxfz3a3fgh3du@cfaajchbwgvn>
 <Zv8PKlr_PJgxazro@arm.com>
 <5y3yz2ct2o42c53dc6rwpse3andstjx74lowt2b3hohj4ogbct@nu2szdnxvxid>
 <Zwe1p0La_AFknglf@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zwe1p0La_AFknglf@arm.com>

On 10-10-24, 13:08, Beata Michalska wrote:
> That is a fair point but I am not entirely convinced using '0' instead makes
> things any more clearer as this is in no way a valid CPU frequency.
> As long as we document the expected behaviour keeping the interface well
> defined,  both options should be fine I guess.
> 
> @Viresh: what is your opinion on that one ?

Failing to get frequency for the CPU shouldn't be represented by 0,
even if it is confusing for the user.

-- 
viresh
