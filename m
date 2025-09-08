Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AAD303A3A
	for <linux-tegra@vger.kernel.org>; Mon,  8 Sep 2025 17:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757351657; cv=none; b=J091HpZjWFltYWcjfAiXSfcCuXe4cH7yFP5qoXawkld4RUvVzzuXSlvYc4S9B8id3pByiWNpojhhVXbC1iN9PiTl6HG6UDAHu2ljTAA5efaV2rykyae9Ufab1h9m4Bv6BdNyOe0JOK+Xpr3hJ9S1eAfqfQ++WRYGI3BTZWTW63E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757351657; c=relaxed/simple;
	bh=XAyaXExBHHyEnvOLdcbX1YFf9QB8u/bLAjINL6U04o0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyoqjqayJ4HQ6lIjidAP+VKeTDDhHYxtlQmvwNOkzD2V01/wqq67Z5/Mz3O/9jJbECdd6XTCoC8A+as0h+6+KCTE+2I3ngrCW/kRh7SCSL0p1XdgCeY/40/ThfVSrdcYv8xv1MzI+jpJ2vI0J3VJPFCpPBXMpaXJAw4bUr/52PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fXkqZ9Bf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fXkqZ9Bf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757351655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XAyaXExBHHyEnvOLdcbX1YFf9QB8u/bLAjINL6U04o0=;
	b=fXkqZ9BfK2QKH1XTcWS7o8/15ZU3ZONM/1Wy5PRs8BNjwsW7gLXJQZYni9kILBCsmrm0H0
	4/FbzME5GzjebdE9naFgmz6SfAjCiuzWFeMBA8YNjzsRUf3BjYFC34YpBemmHDLyiCu94m
	pp/gQg2Sa2YyvqHP55FY+YjyB+8AogA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-NgM1qz3cNYeslyWrISGGyg-1; Mon, 08 Sep 2025 13:14:13 -0400
X-MC-Unique: NgM1qz3cNYeslyWrISGGyg-1
X-Mimecast-MFC-AGG-ID: NgM1qz3cNYeslyWrISGGyg_1757351653
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7296c012f86so96901966d6.3
        for <linux-tegra@vger.kernel.org>; Mon, 08 Sep 2025 10:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757351653; x=1757956453;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAyaXExBHHyEnvOLdcbX1YFf9QB8u/bLAjINL6U04o0=;
        b=eAdfRmeQC5vsoD8zGI5+esLLk70wMyMxKYaVoYA//+lo1kmy+P/T3YmgqZa9T9rWGj
         0xGApFFhK5oAVAYvibWlzo00NMsRutm8wXDNrnj/GdUFE1cN++3r2FT2h09TtrFnyVl3
         1kQT8VbWixKLLj/A8w/mA6QmEdSQw31VStJrbU3ritaex0MyvGGZ/jdaGvZljNCZpfmr
         q9Hit8xujvnq/ZDClgniv1ZdhY7znF6vmwvGc9vCiN0AEob4XWXE76esXmfUUEcvRmBW
         l+rGparL8/mM0y/nAA2PwAlxmqmC6hwRh/6aQ6RWQgIqmBkD8l2kh1hJb5TKluyLaDQ0
         juvw==
X-Forwarded-Encrypted: i=1; AJvYcCXA0SUzQnDn0iNHkgiUl+sOY8Aa291eMrTiVjkEg2ZCuxF0PLXWiog1+WUnpK9QfG+ZLVF6iWzBXcbbBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzU5xmWVr7D/u4keqOH1YZXXw3s1qwUK8Few8x7WzYVkCqALdc
	uviff+LAoY0JA3ntmuq9XBra4EQcCjjV93ovJDk4S18XyyciW9fL/wEUqXpkEEpsZiFXviGieHl
	jgGMptL7RM+cNLjiflhfXqe2k2oQpsTQu+vrYImxz4XrVIBIK2JKyOGzIxs1RQ0f8
X-Gm-Gg: ASbGncsXACWOHWwDKMdoLpk1iQVIFsgieFzt5VSEDfjoSjAChjU3Au2cNJ9THyqEUVg
	5NQiRTrdKOyQ6oy0YiwCzwa256nrW5lKMnBrEeBQbau+7X2SWz9eGPMRGZ7S76a4Q7XrMxmhsbL
	VijeAW7mDK02fEnLUAsvlUVdP2ieYLuwoedLE3IoIBuDV/zyKptTbidkmQYt4uT6rErXdHm2AhC
	tn209o+Pdr9zOGR5ziRoEPpCLhy55VxKZe7KzAQOtAecnHy8PMQ+xI4YNxPkHs5u7l/VuF0EOvu
	zgPw2JoRdndrQLwAuyc7QSXYK7fWqxG6eewWi5m7R6/7DLFWasEUFW0uvds=
X-Received: by 2002:a05:6214:20aa:b0:722:2301:2ee with SMTP id 6a1803df08f44-738f96e2caamr80296666d6.0.1757351652870;
        Mon, 08 Sep 2025 10:14:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/UTbWr2hlWmDxJPVRufiEbt8Dyg8jyOvQQrGKw1mgRo0M+bnVYnjj3OE05uOoCLpdPB1ImA==
X-Received: by 2002:a05:6214:20aa:b0:722:2301:2ee with SMTP id 6a1803df08f44-738f96e2caamr80296366d6.0.1757351652329;
        Mon, 08 Sep 2025 10:14:12 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7426533bdeasm44952456d6.39.2025.09.08.10.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:14:10 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:14:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] clk: tegra: convert from clk round_rate() to
 determine_rate()
Message-ID: <aL8O4HeQWm9b8FUn@x1>
References: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Sep 03, 2025 at 11:15:01AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the clk/tegra subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.

I included this series in this pull request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian


