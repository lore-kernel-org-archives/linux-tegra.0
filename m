Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CAC278158;
	Thu,  6 Mar 2025 18:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284800; cv=none; b=pQ8D0UfBLTr5z6Qnm8EYMLo1bhc32cvK1F15wKEHw4+Kz+nGB5DpACAYHD0LmJFBDKRzXbg4l3aVKLJVLRPf3ZkPPIhOfDAb+f3qS96z8I80b91DyTHApb1rTBTo293c8LLDtKU4gghOM3h3xzZ3bLRgYhTIpqc26x6GaST36V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284800; c=relaxed/simple;
	bh=EVr+mP55XoH0XviBXbcka/95/f1BtJ3c9cR9hYR+L0c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MovbIcDkFq8IC0wq2hTsdekDjuF+r/gecas4OtOxBcgw2xRABsaBiK2xHHJCN9kh4hrWndm6foDt5tiBqjgy1JwzSyCA7Nf4+3G1SLXkkXRG1+JF7iccMObVKEa2dNnvML8bR7nTjYOJfONk5mo77X2AgsTEPtY8VirWQL0wLtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+uj9W2T; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+uj9W2T"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390f69e71c8so684547f8f.0;
        Thu, 06 Mar 2025 10:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741284796; x=1741889596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WM6XsR+FCi3oVZdQFbq5hq9EeEJYAwuc2HQEr8qjJck=;
        b=c+uj9W2TGliSFmtMINlfEGxFZ3kK7aNWmflfrxk4ZrSe/PZJqhVkDT6Fqa61TykGqf
         8MLkxHUM/gr4EMC1AC3HeeJ0X4d1I/UNmEkQ8egdrQG5Vre9lWwfBvy5rEXCwEdHG+Rs
         T2PdKA9t6e7sAM0xZHCxx6XO1TT1ksRpa/CiUDW38LbCgll+YJak4Oc5T6PRwGsP5gHL
         eIU5rghGzRDVtzJ6hL+CO0s+1kGfgiXWdV+k29qt+9IrK7yoHxQyFRXvon1xtrzDKvis
         8T6NoEoxjRMum/A1qKQ2i9NBt4Ti0IfvAhNjAdOoP8d1FqhUF9sluzR1tAvl0s6iWWeD
         J9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741284796; x=1741889596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WM6XsR+FCi3oVZdQFbq5hq9EeEJYAwuc2HQEr8qjJck=;
        b=ktO2XRdBXXuHK0cEa46/fAv2BbgnSPbJwVJG+UviLCkEp8+FR/66NlvJxPMOEo6nCS
         S2K9aEEuqvGDNEdKMHYKmVvqPFofNK5j/CIin6rGqzcp1W5GrtCMxpScWlqvl4yDmCRk
         S0UxLvHnhWuxsaMqn5+z+o6T6+5k0QBVe8R9SWuInQMMHrO5fmOJsqdPjNd1Tz/0dUGo
         ipYy9OsgfwcXU0VvBYbFxkJq0IQwOz7xxV1A9+QZxleycUChluogldPuXTzn3md3oajo
         lL57Yf7cYQ5onNeNFUeinxBYMwBhdDcpfRdRFgMw8mJ52eYX+nq7tnaUjk9/85uo1xj4
         QHug==
X-Forwarded-Encrypted: i=1; AJvYcCUK6ud0ax/O0JbqXPD0jrxW1CqzvwWfc/w0+HBxgx0GPhtwGTE36H2PtbJbfbeB0H9w7XyvXTdvykVC2Rk=@vger.kernel.org, AJvYcCXm7qwGRHWOGN+Ft4H9h/Bs95oDvKH8C5wJRgvDxW4KgJ5/TSb821i5oa2b8h90EnViGYKQBKCcNbpmWCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbgLVJjS7ZGBfO4+Hyewnv6UKzcRHoVXdsfJPtrND6tCsvwCHa
	4BX9I2vXIj37lfjmPEw1gULvJ+2acoCWpGfpSybuR8Y6P/GgQRqGAgf/fw==
X-Gm-Gg: ASbGncuPryFil8lbOQv/fCNfVJKi1f0sKP/c/yNoPvZgMynQGUhHl1rncCckgJs6t16
	YnVcmurnZ0+S0++m4CSGAh+RkzKX0oXC74C0FiVnsc03tuF1K8f5m52118YMr2TOreCMwnd9q03
	EHWcZw4FJm0OdWO6pWRuomYhdkhwxYeJqRj1/Vj8uA0zOQS/rP9WUttcQ1P6ShUTmKT0GCBAjMV
	rbcOkuVXoVHmoHupcJcd/hhltRHrKOiI4SXT1DJN+OkoK3WgWHGyZrDTkZRRUKrrQrPi23z+157
	cFpUWDKvx0vngswAPUim3UWjZQCrWJroT/OdHdTc93kMecZUQxGbQWQ8uq9X1i4AXYmoUcrkhVv
	3khRz0hrXcCcW+rZZmZ/Smtx7NxohH3L7lXYo
X-Google-Smtp-Source: AGHT+IHwnSpVgeGxEDzzBl9LZA0NVqRAFhN9N7CakekbdEKT/Ia5kmGdDFbU1EjkYIuLQub8ls+rHQ==
X-Received: by 2002:a05:6000:2108:b0:390:ef45:1a36 with SMTP id ffacd0b85a97d-391320f49b7mr320707f8f.19.1741284796146;
        Thu, 06 Mar 2025 10:13:16 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c103aa5sm2751462f8f.94.2025.03.06.10.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 10:13:15 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soc: tegra: Use str_enable_disable-like helpers
Date: Thu,  6 Mar 2025 19:13:13 +0100
Message-ID: <174128478440.2031308.15667094912348711160.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250114203638.1013670-1-krzysztof.kozlowski@linaro.org>
References: <20250114203638.1013670-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 14 Jan 2025 21:36:38 +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> [...]

Applied, thanks!

[1/1] soc: tegra: Use str_enable_disable-like helpers
      commit: 5e63dfe213d01cdf0bb2786ae3d5ac613182a433

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
