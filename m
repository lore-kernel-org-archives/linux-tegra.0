Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F80242A8C;
	Thu,  6 Mar 2025 20:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741291620; cv=none; b=V9dyEfZ08KkPpK2y0Ozwj9ph5mUDC1OPBTl6wrc9JHTNv0x7sU5xszFLACOQxyE6g6W2TMo2j2c3FvUvZbC9/Zg2nKq29cQPxVQXOKGAVZ9Ub4G3UDDNGsrAKtwvdnwAJm5cI3PzCTqroKl0r9PkuDpcfAVxeStVfWoLP16+gW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741291620; c=relaxed/simple;
	bh=sdkT02jNcS0kZespb84Kp2RIi1ofiLBxjATolU61Mq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNIFw3F2WvSMjlxJEp7BmIBi55Ijhve+1NXX3AsbZlj/9RArOglbBl9BBtRKrOgc7EIQWGkzou4uEMc5GjZ7P2NboFwNsawRy+7X4cRJ3uqVjZyzcTeqf9O/PdPa2wNsAGtTwMI7dbgs2OTsZ7mkPW4SW4tXtCVbZIRgJeWZfCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ba5JXzJh; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ba5JXzJh"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5495888f12eso1361582e87.0;
        Thu, 06 Mar 2025 12:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741291615; x=1741896415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JRaihiIVCnkowWXGgsHIbBoXLF7FM0TLnnmIMsCpwNQ=;
        b=Ba5JXzJh16ltvMfKl23nggz8ccGzaZYPZczQsIzKqXpQDSBdGSEZYZIP02MQDrAg04
         d6V5XCzvI35kQD4A/GoG4hn4WsDmgAsuFvYSfVh13eAJPSF9bRbvwWGeZoGnPHR4EaZ6
         m6pNVbGx0vl5gvJd6rnzaXA5eoxZwPvJocQgfBEPacqqAid4Z7Y4aUvJ1TBW/FkTRSgQ
         /HYUDGXRSEVozyJZWq/DKN8ZJMSDojzaeZ7BvEAg56CZ0NnP0zGEsrIvLJ2fTPGGPmpc
         jYuP2dGGy/yfAv8kAzeg9rKCx0ytrXt0N6wAwVAwS6LGMNFf7JqboDPGcGdNrj5Xt+BM
         IRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741291615; x=1741896415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRaihiIVCnkowWXGgsHIbBoXLF7FM0TLnnmIMsCpwNQ=;
        b=E4YN02CU0Z45SS/cQHFkh8yQZHiocVC+LQ6bB8A8UipJptkfdX4PWKY0GD5t6nGkZx
         SYFW/6hCXObIB7ptfeOl47cGtpNudWdjNIovRXLCKMw6kQSii8b7bpm0GNBZrdnvVz6w
         89PZVg0gvqoEPmXBrSFTVa2W9rntDqNlMxCdcIefk1ozUBPP56PV8uFFG3pGO3SJg3as
         x9vneYhyxRVFp7Whpy/IPY8goe42g/uFu/XZ4fgAlnD4RpjRf+xRM66MIZiekRgWnxx5
         fBA6Fqo9YkD44c+Vy3LrrUx4EVQZGthyYOID8GJ9K+guYvvzUCZxQIhy2t+9zYGf0HjD
         um1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWb/8HSSG2WhpaempML/Q5l5BZNjbuJY3VrtRbj4drD1ODn/2ucf8j2LNPg848rld9gPxUpdYXnLKn@vger.kernel.org, AJvYcCW3da5wy5ikSecmMkms0y5SYb+DNjEsKPMMJeG7/hpwk0BQY0aHT4bEHTKaDHxpiE22gnD1C4OZ+CCN@vger.kernel.org, AJvYcCWMq1/59oBlloh7Hv8l3gVzblLVkdM188fMWPsjx/rLZaHe08GnJEJNJci6lZXGN+i1vapXg0dx7um7RQiJ@vger.kernel.org, AJvYcCWuNz8OBYWrIBTJjFU2SWwQb6dntbr1vHHE7lFUSpAsW17nm447uAoOputfAJ5flmsH9Nc0fQuh99EzW5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0k2T5PRsv+gLTbazvBmwetdgSqvcEuAzkq+Fjwpuup54QVWLH
	3MjGyRHWsB4iH9E6x09058luO+TF/VqacBiS3XD1BKCmRTQH1rxh
X-Gm-Gg: ASbGncvHEq+3XNYZKGGZzbqZXYLs50N7dqRnCiAuefNwrWStAhN7A2khj4znnkCjnIQ
	3Qj+Bae14O3B+jJFsKRYsMQflGRzBqCBN7PG398d7onQNGqbQGPH3hZ6Meec5XgCaWhIcCouyeB
	12kabaEnAdixy2ApDo3S1Eqs8lMGjzTeMbURLJ/16kyJdESv2Mpt3mMzF+/82VxsKE+lWWAtuhR
	4shbw9x3tkoZfbL1XiztKztwrnXvEbQyJkb/lZEULUNzdRVARSlMZYScfBhvd6BoiN9YoYMP/wh
	oNvKugafCj+ebwNv9HOchG9kMq8snUd61QwphF4GQ44CaYuY+sU18x5Mp7Zpz5i6WlP/ttBl6Uj
	sbsNWlXfR8w==
X-Google-Smtp-Source: AGHT+IHny4LHnfSKwvHyf2ZJEoh1X3YqmWiY9P/tjCCfHQlD7eb6btN+FHrNOfcIFgN4DNeoJcLJVQ==
X-Received: by 2002:a05:6512:3b8f:b0:548:5095:e3a3 with SMTP id 2adb3069b0e04-54990ec5d18mr142683e87.46.1741291615185;
        Thu, 06 Mar 2025 12:06:55 -0800 (PST)
Received: from [192.168.2.145] (109-252-148-237.dynamic.spd-mgts.ru. [109.252.148.237])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-30be98f2690sm3013111fa.41.2025.03.06.12.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 12:06:54 -0800 (PST)
Message-ID: <a2170519-ec9d-4453-a2ee-0cd46d94d52b@gmail.com>
Date: Thu, 6 Mar 2025 23:06:52 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/9] memory: tegra: Add Tegra114 EMC driver
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Georgi Djakov <djakov@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250225143501.68966-1-clamor95@gmail.com>
 <20250225143501.68966-8-clamor95@gmail.com>
 <04be5106-0d93-449c-b8a9-d8b3dc15ef24@gmail.com>
 <CAPVz0n1ZTDZnZHu6R_YVfhDqkjcMV0xH1UHVih=bgv9DGoZ2nw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <CAPVz0n1ZTDZnZHu6R_YVfhDqkjcMV0xH1UHVih=bgv9DGoZ2nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

06.03.2025 22:48, Svyatoslav Ryhel пишет:
> чт, 6 бер. 2025 р. о 21:42 Dmitry Osipenko <digetx@gmail.com> пише:
>>
>> 25.02.2025 17:34, Svyatoslav Ryhel пишет:
>>> +     /* Read register to wait until programming has settled */
>>> +     readl(emc->regs + EMC_INTSTATUS);
>>
>> Tegra4 TRM says this must be MC register and not EMC
>>
> 
> Are you sure? Tegra4 has no MC_INTSTATUS but it has EMC_INTSTATUS

Can be any MC register, downstream driver reads MC_EMEM_ADR_CFG.
