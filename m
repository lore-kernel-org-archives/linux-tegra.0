Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4239B1BC073
	for <linux-tegra@vger.kernel.org>; Mon, 10 Mar 2025 05:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741583491; cv=none; b=tBGKor9I/A+8epfkycrvHQ7hvdSc/QizHn+wvVznFzm5DXwdy/iYROSQifsTixM2z3OgOfT6MDISEa49kal/Fm4N5aITS3D4CDT2GB6KYlZCVjom8kFcI87yAEFd43XkxxvQ4JQQntPluiIWh+jefv5rtx9MBfmMRT0YS7EMvic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741583491; c=relaxed/simple;
	bh=4979GeQXZM3VH30x/v2nzcE8JX2PgGYEku8PS5snLjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jV/Gdt8q/7bVGg6XEPQTM8q9NvDhGpJMxsFVbpnVmE1ifo3wUz0UuIIMNlIS6wOL943ZbozQ4nrn82Vsbmp10InI2YVCsApE1qVD+3ouaGllkcba0MfJzDADQLq7Jk0QPOKZfnaLl7JoYO5zrw999dsxJaeeDsKcpFAu/mlDXI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XL6Mn0ad; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XL6Mn0ad"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2239c066347so62368835ad.2
        for <linux-tegra@vger.kernel.org>; Sun, 09 Mar 2025 22:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741583489; x=1742188289; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wyoLL4OIFrG4gMeDSCBEzBNAUYvjMu9wkevzhYC73Dk=;
        b=XL6Mn0adHN6XJDqne0TKNxxXK6EzFxNRlsWj1Tukc+bLSSzUfopP2qYaPIkY+f4a8D
         E2uA4qB/V83LT34UbJxhiWc9r7VMZMXwbycj+sKY2ax/mT3HYLUR2bmeMxQTI79pmcpy
         BRl+VVSlGdR4RE6QZM7z9pO4SvR8Q+1ycbxmUJx+OaTJ5o9GcPrnzcITmKz1lTqEAa76
         cBEYoYXnWYqenbzh6qZq12XPdcvb+OlI/mlVQB/JUhSJtdmUjM3Ag6AjkwZIDW5e2deu
         +ZqEsPoK/4WeiDiLDgrlVEzxILd1qnqdAFHWeVAcPauUBR2cAkgNDWfvRpVOsRG0V/oH
         Cbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741583489; x=1742188289;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyoLL4OIFrG4gMeDSCBEzBNAUYvjMu9wkevzhYC73Dk=;
        b=SvN16h1Qx0TKGt90Y4plt9FLkTbUSi3MUR2IjgO2d8+SMdEsi6YWgStC3lIVruMBIU
         croPfUnxn6aGdosom+CG0OF/6JHVc3J/xYUEkgWpYZDeytZ/7vRGT+VyqUmDrG15wo6O
         bGFe/AR7yJwAqJD5HMIlkeq3aZViO6mg29F/Ag6viUZvA7rutWHqPsv6qFEfBVTt8rLC
         Xm3q7QRT2wD2PArphmuqkeq9BLr+CIVcHa852GuKkPQvhmxk44pIFjx+i7+oniXiQYuN
         WtiVlyWvvrNHpncsX0ZTVlpByyV5zJ7zPQgY9Y9MEGogEaycUIfEKj95sMdlnheh5wmP
         VaTg==
X-Forwarded-Encrypted: i=1; AJvYcCU4xgJATPDUYdrmzUOqs9vQnjWY9HQi2kFjv3dhT2842fSJ+HosaV4Vq9vskf1cSsZH7+4Aj3anwRpq1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVQXl8Rffxi1+Li+mIjaIpAk49zdVJbc7bUlTv193t812/a0vo
	ZuuKIM2/E+BVQ3ETZ3oZok9v3OYooHzLUXHPDIx+u6/XPDJu27uwqdICV3SQigM=
X-Gm-Gg: ASbGncu63gAZzR08MYyOtnm12QvdipbYoNZ341jH8N58msry18VfLipGPnFD1uFg1ek
	ZIl6YmWsbUB+rgwAAlBGIdENU/6zd9cf4adsTQg5ykq1SR8CVVWQWhv2V4z3WUhMTAtofVbNIjX
	16ML0ejRLcf/Jq8TQ1oqBVZlxZoR8Tc6B5PX+Zj++Z4WUU31d3kWr09O4amfb6o1c/RCoB/EXO9
	0thnCdCQ7Prgalpc/EI5ryRmEYbChSCUf6iFB6fDYHiuzHr64LL5wo6y4DLAPSIBl8ER+F6eoQi
	2wXwhKK73+Pq5gLtIAnd4tGNFlLljeXSbfeSFFip3W/xNg==
X-Google-Smtp-Source: AGHT+IFt0b16olpogoFM9xHcx/8jo5Ldjyg2FEB+jFeQ3uVcb4VHrywsI0xOp9c+x4cPvtbnptVG+w==
X-Received: by 2002:a17:903:2405:b0:220:fe51:1aab with SMTP id d9443c01a7336-22428c05613mr241630645ad.38.1741583489537;
        Sun, 09 Mar 2025 22:11:29 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a9dfbfsm68188905ad.209.2025.03.09.22.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 22:11:28 -0700 (PDT)
Date: Mon, 10 Mar 2025 10:41:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Aaron Kling <luceoscutum@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: tegra186: Share policy per cluster
Message-ID: <20250310051127.zsnxoudfsw2ebeil@vireshk-i7>
References: <20250216160806.391566-1-webgeek1234@gmail.com>
 <20250310044553.zupmsoi4d3errjvs@vireshk-i7>
 <CALHNRZ-YpkSmLipQJ6i8XR+R-4ReLp1fd=jx0X1V8vDvuPG-gA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ-YpkSmLipQJ6i8XR+R-4ReLp1fd=jx0X1V8vDvuPG-gA@mail.gmail.com>

On 10-03-25, 00:08, Aaron Kling wrote:
> On Sun, Mar 9, 2025 at 11:45 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 16-02-25, 10:08, Aaron Kling wrote:
> > > This functionally brings tegra186 in line with tegra210 and tegra194,
> > > sharing a cpufreq policy between all cores in a cluster.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  drivers/cpufreq/tegra186-cpufreq.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
> > > index c7761eb99f3cc..c832a1270e688 100644
> > > --- a/drivers/cpufreq/tegra186-cpufreq.c
> > > +++ b/drivers/cpufreq/tegra186-cpufreq.c
> > > @@ -73,11 +73,18 @@ static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
> > >  {
> > >       struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
> > >       unsigned int cluster = data->cpus[policy->cpu].bpmp_cluster_id;
> > > +     u32 cpu;
> > >
> > >       policy->freq_table = data->clusters[cluster].table;
> > >       policy->cpuinfo.transition_latency = 300 * 1000;
> > >       policy->driver_data = NULL;
> > >
> > > +     /* set same policy for all cpus in a cluster */
> > > +     for (cpu = 0; cpu < (sizeof(tegra186_cpus)/sizeof(struct tegra186_cpufreq_cpu)); cpu++) {
> >
> > Can't you use ARRAY_SIZE here ?
> 
> I could, just wasn't aware of that macro. Is that enough to send a v2 over?

Yes, please send that and include the tags you received.

-- 
viresh
