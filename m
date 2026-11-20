Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160665;
	b=XedovBA1vUKWMdTXmTK37kduH/9m4F9yA9O7LyTJ4X8+PTHCyRokw9jv2YCscKyBf3yn
	 R2TYGjELYcwaMkaCaAwjGCUezUpq3oDp9CU0YFF2wuhiErEXCcw/hQeLM18B1ctBs4ZIs
	 xT7nYX/ZXv9q3fiX+LUhA/BZRprbLmz/5hcvN2mdAg0v2tx1oLZq8vh3SCn9/U9ArW0ZV
	 ifTjx35cWhRLiewm5NvflMXnN9ySs5db0QTuY/XhdFpuE+FGzhusecKJQ7JSuEi0AMZOj
	 ol7VxWlt2sf4C4pJUp+aia554S+np/BRuvRHo7BWqmdzWmi5EZuJuEehTbl8jRWJplQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YhIr5RkufI76Hp177M5SL/nPXC4WeO/bah0MoOu9yac=;
	b=R8cSJHWp2tMyaJKcdHHY/kWOQhp5f8H9CzohA4JZuTGa+sxm4pjgWN42WKnHoCsbGFWi
	 cq02T41lDr3qsQZpVgGPjWr3YNEXiivKYkW12ehCGLL/bnTAv7RyvElM8WoImHqENW9YK
	 J4cSgWseuMgCTRaKQib1LBP3zXgntpjeevTEo4ZjSakHDJJeGN15nHPjfOLTWnoEulXBF
	 Nwzza9opNmgV9012bkoSQnT3zYbe97FdM2FfbuWqgEmOTsu4XzvWnLbn/ieg5vnGX8UnQ
	 LosrofW2CxMr1vA5hDMnPTtZI9WYnpJjYtNyYtjJAl7riwjFoyzkrouPJab6ElUC2Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MVdH0dbZ;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A4F606A33A
	for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 07:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A4F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MVdH0dbZ
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so876758c88.0
        for <linux-tegra@vger.kernel.org>; Thu, 19 Nov 2026 23:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795160659; x=1795765459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhIr5RkufI76Hp177M5SL/nPXC4WeO/bah0MoOu9yac=;
        b=MVdH0dbZECMyRVts4clMgTTtsiSNkQYMFVjvvp2uQ0gO+y1c1szeDBPX/F8uygQrj2
         SbfdAavURbpFr4fbi+sgpKV6Tddic53/AVIVaKgT8cps3fcivdrokWALa1iMft0nh9GS
         zybLQByYLe3b/CeAFZsS3ekpM+tsWIDsSuXTz0AcHjctFr1lue+uApIkOIU/GqeNqyXg
         cfYoslTPciTg5C51zrlXYz+BpV2r9fJPjsQOQ0Av/l6rCUmF1q0SqtRXDkV4d16oFXof
         WGYfZ2nyv126pilNMGwRY66ySZPAo6Dfw/gMG2s5Jfdgiwkeo+j3ZGp70xpYpx4KNoK5
         sP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160659; x=1795765459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhIr5RkufI76Hp177M5SL/nPXC4WeO/bah0MoOu9yac=;
        b=hWWU1zyluB39hBiMzgwJN4ORRi/wP0ftfACTkocc0k/46o9yrSwTPaWdxNPypXpbHZ
         Q7CxTd/lDyufcqoag+QveiQxfkv2tmJSvFvTF7iHm1BzsNW38WbWqWzeZr8fMj4Yy20C
         qFnQgp03/Ak1tpmO/ddxG0SIv5R6Vw1AIXLzyzzOaQ4NFhYIkQ/KtuslOl7+krV1Hu7r
         LvLlBEhv2L8hbm+UVIyhxs4kYLXY29I9isCQTUzOTMA7i/Wt1djHLBpqeYVRYPF5DJht
         ZVCf9Ec8cbOB+kx8DtH6kgG+ajzNjpti8LTFt7qsUNz+tPjbcjbezCFrL0N7FaYFLCdU
         pEZw==
X-Forwarded-Encrypted: i=1; AL+hErFmZ5Wy7oqlvf31nbkhIV8Az+X51aaDQJzKvbm4jtOkWZQ7Vt+lWQEYuPdrP1kF2/4wv9TCuHQ6PIPNwA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+G73wlM0hOt5WiZkYt2k+73JT7ynNm6+qRomXzEBSMxc5jDlMJ
	MDMOo+nFXp1rb6UGIO7hzqZwLmn4yYfbJh3Eu2LxyyUTyGCJQfjQRoOoSUwKxyVJ5AA=
X-Gm-Gg: AYBFou3QFNrDwLKX1dS7dxUsOBoVS5UW8jScdu39+KuFz+duWsjBUna1B9izHAcNJSa
	kFatQPLHsdM364eMqJDj8f+dFtWP/BOc9QXpQWg3ucXMa2BNqzWFF7z0FxTg6uIgeaYLZrRWmO6
	wLbdZdwvGYRXibroIP1MUX8uLZSNiBt/qXbe3VL23yXPaBnshfT2ERtiPu3b9l0y52NeugxxNvx
	X1AuUmJqfMaaR+EcmwlyRPuKZfBJwPuy0U15bOd+WbiFzFt5Bayt724g8ylBHpDGS+k8LXkbufG
	YbrWwZNoZ1m5xRIXGUUp0yPAtUoGBCxdVUTpX0ifupVFeZmyLCTaJEy8JBdh0W+duIUDUHWd4iO
	XYew10dUvjIvHfN9GEXxNTQ+9dKkJOHiLol9kA+SM1oxoArWea+dCaIBrhyxhhqAWHAKtisXA3T
	FSFcEYUJ7Vy9E0NobJWdI7RKQdH//F5mofSGexOruczs8BhHCGRdS1kn8A5RtIN97tIqaYpW1WL
	doehWfd0jOIWbLXXQSjhQVaNQ5SjY9XHD/5ZC3PJSz8nWrbKuKwl+2NoHZKhZzPd5RRrgxoV6Wu
	QISkTvOwEKnQ2rqAo9N4tBHey6/vdg==
X-Received: by 2002:a05:7022:f50f:b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b5567b2091mr1764911c88.1.1795160658571;
        Thu, 19 Nov 2026 23:44:18 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556831d45sm6769427c88.11.2026.11.19.23.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:44:17 -0800 (PST)
Date: Fri, 20 Nov 2026 13:14:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	zhongqiu.han@oss.qualcomm.com, conor+dt@kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [PATCH v3 0/9] cpufreq: tegra194: add Tegra264 support
Message-ID: <av_6T3bqEygaKK3q@vireshk-B250M-D3H>
References: <20261119111217.902071-1-sumitg@nvidia.com>
 <av_R-8aMX7lL83ln@vireshk-B250M-D3H>
 <61d207b2-3155-4613-bc9e-588c68f276fd@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61d207b2-3155-4613-bc9e-588c68f276fd@nvidia.com>

On 20-11-26, 13:06, Sumit Gupta wrote:
> v3 was on linux-next, which has commit 4dd10fbbeb9c ("treewide: Convert
> devm_kmalloc() family to the devm_kmalloc_obj() family") from v7.4-rc2.
> 
> Your branch seems to be on v7.4-rc1, so v4 on it would conflict with
> that commit in mainline. Should I send v4 on your branch, or would you
> prefer to move it to v7.4-rc2 or later first?

I moved to rc2.

Applied. Thanks.

-- 
viresh
