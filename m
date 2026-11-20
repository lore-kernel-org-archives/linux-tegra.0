Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795150337;
	b=z+i2t+YmBk35kGEBRBYeZvztvAqE1lKLXoZPFWGdvq0E/rh/hNEK//85Nen9RRq+V5cF
	 hUSZ6wlFgOgL54cJtTIp5JFU27/AYNywSQ5mkLrra8C8H4buasAWMfZajSxuoY4FO6J8G
	 RrKy7iuGdd2q25oZ1gRk3mtSei2mCyfWnogF+ZPrG78GvuY6HltK4w+9LRVuLPT/cXHHs
	 SkMhVbq73w4G8TISY7Ru2BMMTZAV1UZMycKGXrNq1NSzodmoH4RnG+Jb4FvRw27kaG7UA
	 K3zv9PJgGi8VZ+9i9IlNDwoLDODxy3NO+p+/HC/47GZzSfxJnFo5TPjJ4G/67UaIx/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795150337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+rPTbtnQOxgg4ps2+oCkkvTGsh362mR1Rpl2s/oucf8=;
	b=WLISHxNp/hwrjERxqihCsZkF2m4wo+M5ghm1rISs+7L585im6yDf/KovAA9833qTeIu5
	 zdmHZpNxRZGsy9mq6lWIpXx7tnGNUBFvUMik5FHJ5K2ZJ7tL0j/aTGGtBOpL1+GY8JGUR
	 cwrarZCzdlLomn7KHNrX3hLI3/YLzfPRtH++3ad80RV/JxnwwSvgeLdeeTAEoO36lkwtp
	 T8MjjWfG4VW5EzCDFRbRidRKbnK7Si1JjgDPyeLiKPCDMZpjdeC9iXkSApy3vDMs5qttf
	 iOS4QUe1bGNil7iN5aokNwIZf1t701LthEkKBONoAdhQf1dY6TEteKhSfPoah+2J0Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H98u83vO;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462E60A2601
	for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 04:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6462E60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H98u83vO
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a315ed211so517048eec.0
        for <linux-tegra@vger.kernel.org>; Thu, 19 Nov 2026 20:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795150335; x=1795755135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+rPTbtnQOxgg4ps2+oCkkvTGsh362mR1Rpl2s/oucf8=;
        b=H98u83vOkfalU240xjpIMlt+5Ai3M+igDGGqnu2J4T3WCinYN4eU3bjbNo25Xqf3GF
         3WH6R0e3kVkH/lk5gSMI2AGxA91HKrwcHgfdDz0M8AulF6QLgCJyNwyfULF/lonPCDpV
         en9LyytncUYqyVy7+z6lg1edwwhc3OKhtX1T6vT/fsk371aXcWn1SiWTLkkjkslB0t39
         Whymd2zckO97J5hdawRoOrwlTTgz81tt6o0BL4C1S1I2A4+TM6Vu6i14lqtkEWeMwjJl
         41lcd87Q2w4LfGGWkMEG2SpWDV3jUynqkUnltR20y+2qZLAKvbW8T4UfoJrFfaLLJOFL
         CxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795150335; x=1795755135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rPTbtnQOxgg4ps2+oCkkvTGsh362mR1Rpl2s/oucf8=;
        b=2TZWmtIMjvdpW0VF/iO3x16iycWv+ocwwebzOAxtzRypKDJajUSNP5GiRTc7EANxJD
         71IM5mTNameQQRB3/1xEM61M2RsS+agDnk4nKS996ftUOwVsCt9ATODLiX1UVqTuyGbe
         JPRvJheVoMe80Lx9WaYkcXAKKRH0RDOij8iFasqqv7/gu3FO4hN2KdJjkLOZXhOsGTYw
         UDKRk2Az3aGsn/u+C17CYMv4OaU0QdAcJ4OAXeDH0vJS/34YRJfveee3YJOC+scoxv+/
         e5mjKh2OBhk7qT6C0WOeby8q1qoIDhqS3HvWtTouAHk7j6SH++6IuObqkYqEry1q9qgs
         wpDQ==
X-Forwarded-Encrypted: i=1; AL+hErGIsC9k21eN+0GaK6bWdM7izVzHbBX87QBBc+TLP/m9DzyiwfYCZSsdRpInWRMskN+x62tTYNHI7T+jiQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z93Y+sHkuqbwKjF/HQI89uoEXPsi5OS1wEF17fGepfD7KnY9u0N
	s3LfFrIgbPyyhHq9apY4wTB4w/FkIW0hFu9pXikSAyemJQiqSMYb5SgB79Qm3S0yf6w=
X-Gm-Gg: AZFdTZc9zf2pQpteiS1OyNa6ZsL/xHLlg+pC9IZoEOOCq2N6B+UA/N3XtvZeLjAFrs7
	cqARub5l5HH60PWdrAgoyqf8jDDKbrezlvZ+IbmsymzOFCQpT/zo0Rz5vCrOBwRxcICsED9Fxki
	9t7KQqpoiAgoELOiRxR3yjLmbfz/2O6yAP/2tOF9OgGmdwut23ayf3F5m4GUfQtiAmzh+fj2xmK
	1WqoJcpqesz1MGj8/VVnbvRUAYz1aSdMNihdeP4gwjsrw37iRW6OrRo9l/8a4JQAR/eyrI7dYBu
	EYnfK8N3DaJynzQonMJ00WG8M1haW5N8vx/Iug9ZNgjmd6mS6EeXsWnF1ZMR55fqzijxffRffd9
	ma32UFp8kJMU9luBQ10xR65Yx19ZjV+O4aOaXKowsZQr7VH7V6pWrcIijDLFOY7qm2RqnXSC6f1
	UL8Ns845kPycOUAD0q/UbkM6iEe5T1bx036mITDf6AxgnYodRp1lsrwRhltyGvhJ0jKhQ69CASC
	wIp9xT4khVHO2Ar4sp0Ek543Yy3Mhmy5QJaVZS74O4kuthTxRvgyrFRI1LlMWu2478+T8txS7iO
	51X41EA+OCmZ5xHtChIDRoSk0SDI5Yz9nZNjQIbWAgYKa8GQinw=
X-Received: by 2002:a05:7300:51f8:b0:375:85ac:d14f with SMTP id 5a478bee46e88-384b3e786bdmr3144891eec.14.1795150335207;
        Thu, 19 Nov 2026 20:52:15 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm3768338eec.7.2026.11.19.20.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:52:14 -0800 (PST)
Date: Fri, 20 Nov 2026 10:22:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	zhongqiu.han@oss.qualcomm.com, conor+dt@kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [PATCH v3 0/9] cpufreq: tegra194: add Tegra264 support
Message-ID: <av_R-8aMX7lL83ln@vireshk-B250M-D3H>
References: <20261119111217.902071-1-sumitg@nvidia.com>
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
In-Reply-To: <20261119111217.902071-1-sumitg@nvidia.com>

On 19-11-26, 16:42, Sumit Gupta wrote:
> This series adds cpufreq support for Tegra264, which joins the SoCs
> already supported by the tegra194-cpufreq driver.

Please rebase over

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/arm/linux-next

The current series doesn't apply cleanly anymore.

-- 
viresh
