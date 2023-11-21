Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dOE6k9H0"
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C747AFA
	for <linux-tegra@vger.kernel.org>; Tue, 21 Nov 2023 01:10:58 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a00b01955acso159787966b.1
        for <linux-tegra@vger.kernel.org>; Tue, 21 Nov 2023 01:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700557857; x=1701162657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7xc71/uWCWZaMJ73tDTNpkDmxDDi7teb0OVK/0/j5w=;
        b=dOE6k9H0BTRL/ckfIn/y2t5c5N8r/rO7R0+srDRY492q4LDf5Tk+A/WcRrkdCdourQ
         fhU/pTrGQAdYyqaiJtqCVg2Go1sIckihAHNEl1gnICv42zB/t/FRVqV/9UGZUypaSLVr
         LF+jXWaumI5oMI0DEv2C0KIevo1kwAzn51kGT21qxDN3X6PPbGAmWpavSUmPsFo6k4Jd
         1LpajFzfszHvYJof8rJxEHmzMAzWNDsfOaWlo30EfUfHwvmrR3QFLZTgSug5bIPF9eri
         TeKncy5D1cGTIAth/TpLTY/k+MmRTPwygtbQxfNrk/e7eD9ydg6cINXM9HA0NnDm2elk
         0oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700557857; x=1701162657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7xc71/uWCWZaMJ73tDTNpkDmxDDi7teb0OVK/0/j5w=;
        b=R2m7JhYi1ptMhmWBcBSfq5zNPNE6R1TOLJ3jJCjEKNUcO2peVkHDYvijuPzlBY+jxH
         s5GWnnFmHO2DcMV2OWLOyiUHelhjSXQVy+0JSe6zwxPJD4oHi5LdrkUABCeKPd/5k+yW
         5Feg9mPAnHqm3YkoBAZJl/TFWQVFzJwMjBHnuB+YWYJ0qg/qY/Z1IOpVrbumwuITNA73
         j6h4JqT2LNaAWYXHT8pNmeRj+/mP0k+1zZ7unrjSvIv/38E9oil+bo/TK+tRAuS8eW/l
         OlQBWsXiXg+O/46g3npRflc/WiIVVbMc5A5Djs/teVFJHQyWGOek3A0C/JwIxduyHM3L
         iH3g==
X-Gm-Message-State: AOJu0YwxatWzNAA+jNYPtqQJf5iZInRUUJsbxLWhMI4HDn7BEjRiEi1T
	Q/DlylJWDCBdGd4pWeDo//Cxog==
X-Google-Smtp-Source: AGHT+IH1uDCwryO04lmdqWRd8gjR6p5Oa5n6BLcA4LHrrRRD9n0nBAu5Ct36TUC532zjlwcKEemCQg==
X-Received: by 2002:a17:907:d311:b0:9ae:4776:5a3a with SMTP id vg17-20020a170907d31100b009ae47765a3amr8755878ejc.39.1700557857256;
        Tue, 21 Nov 2023 01:10:57 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id gq16-20020a170906e25000b009fca9484a62sm2808152ejb.200.2023.11.21.01.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 01:10:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	dmitry.osipenko@collabora.com,
	Ashish Mhetre <amhetre@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Patch V2 1/2] memory: tegra: Add SID override programming for MC clients
Date: Tue, 21 Nov 2023 10:10:54 +0100
Message-Id: <170055785090.12509.16016411464441236858.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107112713.21399-1-amhetre@nvidia.com>
References: <20231107112713.21399-1-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Nov 2023 16:57:12 +0530, Ashish Mhetre wrote:
> For some devices the bootloader/firmware may set up the device in
> bypass. Memory clients like display needs kernel to program SID after
> resume because bootloader/firmware programs the SID of display device to
> bypass. In order to make sure that kernel IOMMU mappings for these
> devices work after resume, add SID override programming support for all
> memory clients on memory controller resume.
> 
> [...]

Applied, thanks!

[1/2] memory: tegra: Add SID override programming for MC clients
      https://git.kernel.org/krzk/linux-mem-ctrl/c/fe3b082a6eb8b1526ed7397c849d6b2a6baeb6a1
[2/2] memory: tegra: Skip SID programming if SID registers aren't set
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0d6c918011ce4764ed277de4726a468b7ffe5fed

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
