Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7646161321
	for <linux-tegra@vger.kernel.org>; Mon, 29 Jul 2024 18:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278758; cv=none; b=JMud/bLVScIz/PpUcjzFy4wwqzIbhOMhe3M9923MU+zceJjQ+UtyAxzRb/FIkm07mGrYSTZqFmA2dnM4QTO6dBMMaPTy9aMIGOuqYZ8hEwD+Tzo4MEqJLPzaDSEL35HPCJH75XHL1jkTNmerOH3ILp2X14aANLJi2pJrkbh78UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278758; c=relaxed/simple;
	bh=cmZkYoSI7q+Zo28nkXB10utErUFqfQqwB8/NfvwHTLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=liy2MZcaq+TdFaIWFtUPGv2gV9LDtooMLE1ZSKlvSorJMt2rLesOfAroIg+g4bQYWYr/nYsTOaRgXdshv4XpQer286VUNKiy/7FF+GIAwBtOAwnQyGqEAl1lLxuCd81eiXw2HAGn23LZjCTV7M3GRvWqxuZUIX3p4V3XeaRIaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M3yPC7b4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M3yPC7b4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4280c55e488so12994935e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 29 Jul 2024 11:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722278755; x=1722883555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JwAII8/eqnPqXD1nuym1wg/czKUg9JcpmlXBdjhnLE=;
        b=M3yPC7b4/6F2zqtiHKSFi9XWX80ubUu0p8/O7sJ3d1CEMY2wsTirhOHs83yviy+0uw
         7KGZ3Pk8XcT4GzWot4L69kPQlDmNmTgZWqF4Fc0T3LdODNA7hDi7zypv0up1OwNUU6F7
         YMZDplijUJP7xbL2cSPsdP7IY+RGkabI+jhbxSrwbzkTUCRtVNlelb3Vo6IF+jTytJ5S
         itMkpt16ccDjSbxg9AsaCg/i2shtDwHgjtkilJ1VbBVU4ksRX14Q5aEOMNvFuz0ZvMK3
         JINm8qHRhZhKtNT4jg7TXkpPh/Y4Rp+LNpGvDC+T+tWZP/0phPBGIjyb7ixZDnOThy59
         cYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722278755; x=1722883555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JwAII8/eqnPqXD1nuym1wg/czKUg9JcpmlXBdjhnLE=;
        b=nUdZ77fiOOlisnRieLIYCKFHAe7RaRWTh2lpyVWmVHgqVAh9dzaN/6G6JKtXi8Fdc4
         99kqEUrCxmdrc0o7OBb8ZeBz5eKdQFxzasEL1U4S4hzpTkIC67R9heg3uBRuPDqzo1pB
         RKeiqJRckVzo6OT1FCSaxW9doUj60TQSWzgUwg0Nk3U0WPo50TzFVm4SQlrgtC5slQvJ
         yzv/aqDFmGUi+EQKcBvgYtHWSXSqUmL9Tbw/TLftfirR74UiRKKWwQjSGGYeI+Qul23Y
         jw7a/MixLxzViOFWVVaX/T1tl9h9pq1pANa2qYi7NGUimvi9pbRekllvSdTCpEhnHv4U
         ZW4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVFKR4jeWZhu3jj83duaI6DIE/RghDugo9ZwKOvYbMUJC13ibfNbEIvFqzpdpphUf8SX54/Vunybmc617ikBgYrC8vp+NwQZZuaXY=
X-Gm-Message-State: AOJu0YzeS6U5WMazETXClVoK2PnCvojXAXHKmN3YM9m1IJYz0FIAkDVC
	EFMyBLNnK205Oyykrlw5ymVe2xaXCRfAPEjaBCdCATlxCoMMLbere6nHJGQGLco=
X-Google-Smtp-Source: AGHT+IFpFSKKNuHmfASCd+fYxW7X6C+3Zt8IHdPsv6k0dFaWDunHATz4eTrYP8Hx30Rm5AjV5USswA==
X-Received: by 2002:a05:600c:3b07:b0:426:5e32:4857 with SMTP id 5b1f17b1804b1-42811d66212mr55242895e9.0.1722278754996;
        Mon, 29 Jul 2024 11:45:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857f23sm12842757f8f.78.2024.07.29.11.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:45:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 0/7] memory: tegra: Cleanup Tegra210 EMC frequency scaling
Date: Mon, 29 Jul 2024 20:45:50 +0200
Message-ID: <172227869537.353608.6053884899325569791.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
References: <20240704-tegra210_emcfreq-v4-0-3e450503c555@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Jul 2024 12:31:19 +0100, Diogo Ivo wrote:
> This patch series consists of a general cleanup of the Tegra210 EMC
> frequency scaling code for revision 7.
> 
> Currently the code is relying heavily on a function, update_clock_tree_delay(),
> that is responsible for too many things, making it long and confusing.
> The general idea with these patches is to simplify this function and its
> surrounding code, making it more modular.
> 
> [...]

OK, I found v2 and v3, downloaded and compared. It would have been much easier
if `b4 diff` just worked, so please be sure to send patches in canonical way so
maintainer's workflow is easy.

Applied, thanks!

[1/7] memory: tegra: Remove periodic compensation duplicate calls
      https://git.kernel.org/krzk/linux-mem-ctrl/c/649f4783dcda7400bbed866140df504d09a3b135
[2/7] memory: tegra: Move DQSOSC measurement to common place
      https://git.kernel.org/krzk/linux-mem-ctrl/c/7b4dcb8888e1660d590ec13463ba71ec5bbf6333
[3/7] memory: tegra: Reword and correct comments
      https://git.kernel.org/krzk/linux-mem-ctrl/c/c5f83622ccd0158cf16c6be8ba56f178c99776a5
[4/7] memory: tegra: Change macros to interpret parameter as integer
      https://git.kernel.org/krzk/linux-mem-ctrl/c/a238f62b3666558f38d8abf688d0fecf4ccb48ee
[5/7] memory: tegra: Loop update_clock_tree_delay()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/adc720820f963047210efc4fe1c1ff068b4bd773
[6/7] memory: tegra: Move compare/update current delay values to a function
      https://git.kernel.org/krzk/linux-mem-ctrl/c/b109656e9ca399d6899152eb40efac2bdd3b4202
[7/7] memory: tegra: Rework update_clock_tree_delay()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/ddb869ea237eb4e1c882c8768675fad53623b062

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
