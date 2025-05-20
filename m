Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE63E26FA50
	for <linux-tegra@vger.kernel.org>; Tue, 20 May 2025 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737040; cv=none; b=soez48WGnJ6QByrwfv9orf9YrXXohqORRVvcW6hSbTHlQyJRZAxdves4I/T0rPyZnSgXv13ES+eBb2tApfg5DccIyc+goVBvuPyyprenzcaAeE4GECqtNp8dUA3fPKwQyBttO/JZVRNnCdwCTwRIhOYOkhZ67f6vWEu/WiOvumY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737040; c=relaxed/simple;
	bh=u6CIUKSBSq4Ix3l4J/Oqt7B1dVs5L8DFoS4qUugvU2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4h+W7TRsxXQ87pJ4QnZ+vugspzj2jMq45//XcwlL3cbSjvbojqTiwryStnBYkOgIb+b+hwXSO2WCMtqmUv2sM4iH7N5x4Z1nybyL3k+PIMIczKXgzT09B4pQlt/LVy4uD3p9l9Lprb8iOi3TgFgNXrTzpMrfOhso0KFD3SpZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cpJU3lLn; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cpJU3lLn"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23228b9d684so24675275ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 20 May 2025 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747737038; x=1748341838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/usBm7/NAt93csSN1UpRXi2JrI8o/Uk8kpvnxNyHM4=;
        b=cpJU3lLnnV1/1sj30D8Q2Pa+ncT9EIx7PtlY8Qy5w9xbxvUWUb7ZUvELZd+/1Cm+wp
         bTwHLfxBAtqb2lOSiL3j+eAYeBKhLyPpPnw3p28h0FMsJyRPAGfyBRUjvimCcufMOZSZ
         tNea/tQF9xelb6fro3Ne1yAOfn10/P0UpbPF6iqIb3wSN4RcyHEoV0c0xkfIgoaDLpxZ
         IWsbml0vruiTHkrVyefh+xmns8+z1oU6D5Vmrv8H94Dn2r5dRQ9IX8B/0JT/kWgvyDjU
         jEMGcOmoXz18ZMEloaeIHZSFjEw7VS9XOp1tlu86kwUUJiknx7Z6hpteWLXZoHM1H88a
         DHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737038; x=1748341838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/usBm7/NAt93csSN1UpRXi2JrI8o/Uk8kpvnxNyHM4=;
        b=dJmE43ydT3IS6c89qcIg53URtnCO8c6gzqnsmLWjZY5R0l0mt2O/KWZRZBxpyrYJ7v
         QD4PXnNyQ8lcGfK7GAvqD8yFSNG+Cq/uZSUF2Mo3ygWZlQjongtwriK6kNXiTUDsskCZ
         mhgvFHhKGjob57s0gxd3pRJ5tdoEdgU0VSnIo6cWIV8eTlKGLz1BnXgk1L0cttgd4riM
         GwlYqAcNC7k0d1h/EYChcxJWSrfNpdEei3lMwhROJawbG3/zduzuEEqotXSy1N/zA+6D
         KBi7F3tW4byEdyFtdye5MNlFKuJXX0vzjUTtnknrgrgxvELdH9nkCce0F7jRWiJ62VLX
         3M4A==
X-Forwarded-Encrypted: i=1; AJvYcCXsYfMPQtsGgipt+APyCZochr0nJlS0SFpv5xAp5qTiHHb5srIgsxIuKMr6j446sZ0hpxIXcQfiqL1jkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7WNy9VDCFyd6M7pz0RghtdsAlzvOfX4Avicu6HN+Z8/tZ/omJ
	LUt0jiNLz362C4Jey+Wjua1Y1E12P4MjgZo+uXoaqwWFO1E9iV+ZclpbQetQfT0GOSk=
X-Gm-Gg: ASbGncsxing1BU31eqLqoemQHy/yOP7zseUSt+k0GByQaVe/8G7X5Ocv5m4f3WnqWsk
	LaRI9MWAJJRiQIaRihbvNiv0kgRKfRjPiRqwhjF0Yz0ober/uPQIoqnWTBLf8XzDvb8gdRvH9AB
	SShygZcjGDEsme1fUaB1Usvv3uekrFbZzW7BX61GrtbsVvoAiw03b7b9UREig7qITHyjs0agjRT
	MJW6Ej6YHsOkXCJbQoIHegKIW4fWxjsrvlsV9tPSqqNuhEhbe/PbU7YfC2/l8xuZr65GpDEC6VM
	7ho2CokRy/Zf4D1FHzxw2wU+afnKIbJifCKcSG5Tzn8tJGi9LjoA
X-Google-Smtp-Source: AGHT+IEVnfXH/zqEWQYeU+r8yG7C9+amgQVZq5itWp8zHXHAtKGqz7sdjWAI54+2mZwcCMJktSMncQ==
X-Received: by 2002:a17:902:d543:b0:231:b7e1:c977 with SMTP id d9443c01a7336-231de3763abmr230013975ad.29.1747737038053;
        Tue, 20 May 2025 03:30:38 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb0d4sm73773575ad.195.2025.05.20.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:30:37 -0700 (PDT)
Date: Tue, 20 May 2025 16:00:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: webgeek1234@gmail.com, "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/2] cpufreq: tegra124: Allow building as a module
Message-ID: <20250520103035.udl25zv2uriljrby@vireshk-i7>
References: <20250508-tegra124-cpufreq-v4-0-d142bcbd0234@gmail.com>
 <20250508-tegra124-cpufreq-v4-2-d142bcbd0234@gmail.com>
 <da080e61-4e54-4334-a239-1619bf8fea0c@nvidia.com>
 <20250519102618.4thbahapz3lfmfo5@vireshk-i7>
 <972984d6-a9b6-4847-be76-fca50782682a@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <972984d6-a9b6-4847-be76-fca50782682a@nvidia.com>

On 20-05-25, 11:03, Jon Hunter wrote:
> On 19/05/2025 11:26, Viresh Kumar wrote:
> > Not sure if we can do that. The clks belong to the CPU device, while
> > the devm_* functions are using &pdev->dev. The CPU device never goes
> > away and so the resources won't get freed if we use devm for the CPU
> > device.

That would have been the case, if we can actually do a devm_clk_get()
in the first place, but...

> I don't follow. If they are allocated in the probe using the pdev->dev
> device by using devm_clk_get() they should get freed when the platform
> device is removed.

... devm_clk_get(&pdev->dev, ...) won't work here IIUC. The clks
belong to the CPU device and not pdev->dev. That's why we are doing
of_clk_get_by_name() over the CPU device's OF node here.

Maybe I am wrong, but I don't see how devm_* can be used here for
clks.

-- 
viresh
