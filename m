Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561913E478
	for <linux-tegra@vger.kernel.org>; Sat, 20 Apr 2024 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713654034; cv=none; b=R8oYNSiZoe68Xddeb09cFQf2dPpcez7Ao5i3CcyvEL0XSru3ShasdlOmWnVtg5gOulIu8J7ZnzYY5KiHCbEBArTXavhmRJaHwClkpOMfzxeNvwRQRTTdT+Zq9ZDn5h9WmvVfcwkddy10uOoXfQkj/RrHBlJkWiM7Z1L5CngdLWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713654034; c=relaxed/simple;
	bh=4W4kNBK/xrEcrUApwzCM7sLtC45HuF/KUzFjcCmXLt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQyl6bT5+lcjnktFTpRqqoM94d+5KlTzz1spM1VYYSXiaM33sr+VIsZOIPoHLFOuHo0zbu+BTzSTmtIGUMlMnufYrCbMyS5u5eno1vgNBTasuIUUQ2FzkLw7cYrM6pDVzLwpyzMfWI8vaoofiaXzxm9r6Vb1JaH7E74W1m7A8Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yr5uPDGS; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yr5uPDGS"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e69a51a33so3115628a12.1
        for <linux-tegra@vger.kernel.org>; Sat, 20 Apr 2024 16:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713654030; x=1714258830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gS/avcdT3uZE+/g4l+u7eNrKfkVrRBnHoxOYygE+RDE=;
        b=yr5uPDGSisSRWg2BdtLz4v/8WoQaybLA7Pyun9XdF+c2IjnCoJEE+28J0xFgKDDFUA
         jLy+1Ozibv+WHlOotmMQIzz7Z9UDCUBXKnvHmD+40IFh6LhkgWnkb1sUyD07WI/dK5eI
         74ZZo9DP3bxK1rUBP+g3y+19ehWxbKCnYUZQnB/EwNq5QPEXaiRutWzZOdPjzStM7pvA
         +x15lAWyTKucfjzbirdYgmDwy4ZLQ9i8De9vBC77mdCD3xJYXzOGrj4JhacqcTQJOBPB
         uXsFxQ8ML2FJwIgERF7kFGec4d6/ZxJHi/FPJa0cwiwotn1wXqNSdkVOuJKN1Q5ZonZJ
         9GOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713654030; x=1714258830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gS/avcdT3uZE+/g4l+u7eNrKfkVrRBnHoxOYygE+RDE=;
        b=smUC3l4Li9ri1fur1dJpk8kJBto9FVKDSIMLMGieOHiKrIhvT8E5K+Pv4Nt1zvoCB8
         YfhtD1iJ/wGsSZtEBTv5bSzw3zufD8WkuEiA7UvswTDJLNmVEc3X16GL0puP0notzkmJ
         v0ttnZr4TewuxVV8+dhp7Mv1aBOzcLwmVUoABHywVNXoglHHKnnKj3rUNtaq0PKpJhcG
         vKCYtcEV/bytu+bkktQIHm2cjiQ7H0mReYqTacSd2F37MqpyoIdfpenLN3piuIYsbKID
         lh04t6lDTgAyPfKMM7WnXRbkYDYfOpEqh7vXV0OiOcDgk8/tJ1VmNAkSSCJJn0dO/NSY
         bm+g==
X-Forwarded-Encrypted: i=1; AJvYcCU3YhBMjMiEt1j00/Re4j3EhoUq6SPg+p9F4JnAQLQp4s7rtqOxO3X6ui9Za82b4IkC6q0enIuhuTa3RerC4fYAOOOSjQtJbhFqtxA=
X-Gm-Message-State: AOJu0Yy1Bygjj1voQaGcxn6J4E6k1Y73M7uc9oAmDtrUeWb5I8oc5pTe
	MYOtw0FywZ42pgpdSFEJohy+pQyJe3Kn6YcU9ZChpMtummI1UrS/5VNUt647w9c=
X-Google-Smtp-Source: AGHT+IH4lwqPioLpoIzW6dLhOLlXPP3zMShUOxH0TJXNnW3DIij9PpcqOmEnmKfQrSavTUI2UaMo9Q==
X-Received: by 2002:a50:9ece:0:b0:570:cd6:8ef with SMTP id a72-20020a509ece000000b005700cd608efmr4297896edf.29.1713654029517;
        Sat, 20 Apr 2024 16:00:29 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id eo9-20020a056402530900b00571ef2c1308sm913940edb.12.2024.04.20.16.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:00:29 -0700 (PDT)
Message-ID: <9f44c386-4be9-4904-bf67-f0e664773baa@linaro.org>
Date: Sun, 21 Apr 2024 00:00:27 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/26] media: pci: mgb4: Refactor struct resources
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> The struct resource end field is inclusive not exclusive, this is, the
> size is (end - start) +1.

", this is," doesn't parse on my end

"i.e" => that is, would be more appropriate I think.

"The struct resource end field is inclusive not exclusive of the size" 
which I still think is a confusing statement.

Perhaps something much easier to understand is called for

"The struct resource end field signifies the end address not the 
relative offset from the start field i.e size == (end - start) + 1.

Amend the .end field to specify the end address not the relative size 
from the offset as is currently given."

Other than that, I think its reasonable to assume the mapping != 0 - 
0x100 inclusive.

Please consider updating your commit log and if you do add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
