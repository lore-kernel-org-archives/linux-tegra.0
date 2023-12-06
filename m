Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DiLJiqXQ"
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F121A5
	for <linux-tegra@vger.kernel.org>; Wed,  6 Dec 2023 02:26:38 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54cc60f3613so4299284a12.2
        for <linux-tegra@vger.kernel.org>; Wed, 06 Dec 2023 02:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701858397; x=1702463197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDy+n6DZZONz7Inpx6EuFE23fY20PYr8NtSpav6W7RY=;
        b=DiLJiqXQykd8bnlPd/9zPGeWhzgQzlC76hK40iiatbDLMP6vbr2QT2CfndB47tnlz1
         i8t7ylIUUm06oWkkw0kWn3Lo6kedAz4oETwwqnGXDKCI/Tm6rPmVrV4ZT9ShmnHvXgto
         Ilf0+jVeZrR5Tomqdaa5IoKSQ1vBO6GoPf3bGaH4dm4mWeI9dqylLpv2XlZ9DWgClX9U
         VgtykqNsEVJnXgEOJuqn9CpCD2IID5ymMG8lnolRPI4+6l3kCmiGeTDwpaaMrDrcQm4j
         jA5NmkryFvohyu8n8JcJtRR4jxctMIlRDMF2JVY76oTXQVQ40fcf57SvIuMR5b87qsUG
         CoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701858397; x=1702463197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDy+n6DZZONz7Inpx6EuFE23fY20PYr8NtSpav6W7RY=;
        b=R+EsgrU3yy35i1axsOdxFONIZlpZwZkfmUewSI5jjWWBR60Rb55fFzsHopXc6sM2l3
         OW5igTEAPXrRrVu0XB5Ut8c5x7lfWejdCby9zhpafq4oTBZlzgWTRoiOiikxIyht7U4T
         aWuEQZb4sFoaSxhWExkMwbHsauM80bd7oMHZGnDv0FnFz+WF+sFV73e/b6qEORDTP9V3
         kwhpxoII2hAW8tTmK4TjmNNOTQlBJ9qcZiEQxgQJJOt1thRAaN25Uz3+4LgkM5FBRctt
         0HUG2NKviif7Pj0OvENCQROwJV/HBoklCz9aKRynBkNCNLPxAQrNvItRPdLalPT5S/qb
         aB6g==
X-Gm-Message-State: AOJu0YxfEhJWk10HW6kH//i5nv4krDrbDJ7GbWzFgHVzomDXNJGTt7hq
	QG0zX23dQWYbcAvX9MRweQtCCw==
X-Google-Smtp-Source: AGHT+IGZ9zNC7+fuqik0stn8rmNgAuGqjXovyqNRxLhX1l/NZDc6Gn6PUkAbQI+yTicofVR/XdoGzw==
X-Received: by 2002:a50:8d51:0:b0:54d:b67:c48d with SMTP id t17-20020a508d51000000b0054d0b67c48dmr461804edt.75.1701858396510;
        Wed, 06 Dec 2023 02:26:36 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id w3-20020a50fa83000000b0054cb826a7e7sm2205503edr.19.2023.12.06.02.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 02:26:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	Ashish Mhetre <amhetre@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	rdunlap@infradead.org,
	sfr@canb.auug.org.au
Subject: Re: [PATCH] memory: tegra: Protect SID override call under CONFIG_IOMMU_API
Date: Wed,  6 Dec 2023 11:26:30 +0100
Message-Id: <170185836277.9445.10245763531734374698.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205060045.7985-1-amhetre@nvidia.com>
References: <20231205060045.7985-1-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 05 Dec 2023 11:30:45 +0530, Ashish Mhetre wrote:
> tegra186_mc_client_sid_override() is protected under CONFIG_IOMMU_API.
> Call to this function is being made from tegra186_mc_resume() without
> any protection which is leading to build failure when CONFIG_IOMMU_API
> is not set. Fix this by protecting SID override function call from
> tegra186_mc_resume() under CONFIG_IOMMU_API.
> 
> 
> [...]

Please remember about crediting people's effort. Applied with proper
Reported-by tags.

Applied, thanks!

[1/1] memory: tegra: Protect SID override call under CONFIG_IOMMU_API
      https://git.kernel.org/krzk/linux-mem-ctrl/c/4a23d0f9814c38308dc82b6dbc466666a400b27d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
