Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1CE401A13
	for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156194; cv=none; b=hPdqnWAOEkMqB2HO3y/4Og2SLx8IaVhmzTA5KiImhLoTJNk4bcVou6dWRjMfMDVBF5pTE8pQ5+/aT1f0z9utE7lf8u6r15cMNuvD58ntozxOZQ3jkPlEbofGbPyWtMyEpzIJEtW73bjoDhC3not3Q7GdiLcGL6eNH5izzuk/jck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156194; c=relaxed/simple;
	bh=VrO0yBQQdwabPAskQcTlcwcJS7C62is/NjAMMY/StHU=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HnpwMxnz+zhVa1F7WTmfuF1MagzNYR/aM/P1rm+fhJvTrdSNf4aN++wpwaoCM29nXHxkk4Ze4XiM6mKAnc8HrBoX8MqPhHV5j5F5TTpuu5WPGcSTBqMXaP4P8IOrw2rTTQKjqrPK+N6tFNf5JOJJyYTk6G6B7ETpI6ohdCG5EEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJiFroVO; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJiFroVO"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e27035206so2579719b3a.3
        for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 05:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785156192; x=1785760992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKrnHJ/zkmSszgdE5PzXsaOxi77PgVXbDJ7BJN7kTtE=;
        b=cJiFroVO/qms9CGHFXfjxPhwe+o+3KnUyhGQnNHNO8yjoLf1eMvpAoEQfPnUuL+ltr
         NHnJ0eEuLVXeBl0Msk6FIQJCfKdNQyrn++rNkMbc4BpY46hgwRvlWL6IZKY+6mjEXqKY
         LdYQLzelTDVA3b5UkUQmfs9bgGb2FI2LwqhvGeRgzeY7k3Z97QB5ZcZFhc76MbYCYDpI
         dLgM3ggmQ/bu/3AGMoM2FyI+MkSGVhdbTK0Q4j1nO64zkMLX4IMkJiEJLfvMT9DXl5Cc
         fUSweHe08PHVl3De012c1cieJG6DWeA/eeGLPxLR5VO7c8wpxn3R/ssluGvEvlMVvkg0
         Trlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156192; x=1785760992;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKrnHJ/zkmSszgdE5PzXsaOxi77PgVXbDJ7BJN7kTtE=;
        b=WGmqp1fTBINFjg5T3C8TkBwGBPLnAoHBGvRrFn/eL6zIoOlovyRaik+owviqHq9WtJ
         sGutnBZWTS8nYtvv/Z1QU6zFOEpuBz2CWgvO84XWX7yAZu05VSbdxl4Y8Q5wcvw0AkXI
         gOdnWCXAae5MjqQk1ape1A6511YCQKb0R98rdr5o6uBLOygothymGNBIa2u2X0cPkH0T
         pQ6W9nh0+SZKXkhJ8+ZjdKGsCtFoAuazzW1Q1I93YAl8dT1RiyvQe4JIPa5/dT2thAAa
         oVYrflwzO8K0zuCqrJM0pxE2mCf4TnNcfCnzEDchdfO739olzkISx8mbzrwS2ddqkO+d
         lv2Q==
X-Forwarded-Encrypted: i=1; AHgh+RrWEchyEXBri80xJ8wwwbdcuzvhQFxiBLXNKRdYPz38vpav53TjnGDMWvMQ2GUP2XUGGwBGIerJt7wo1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlsTiGmOGeAvfn2aPpOVcJNMiRT5vnvlP/VNPoGc36gLMIHnx2
	DPhftRTMyFDHJADS3czHCOe3Gw1OK/Sb41sl0DgDYwyuy6jyG4uVCG/I
X-Gm-Gg: AR+sD11mF/lqF7S/QrngeNvmcU4n9SgLfhyxOsLfGVKaoLQJqxp7X8Aq7G9IdPMDjZL
	FWuJDr2qF8m+AxbcylPGMDDXL5iCV21mDySoj6+Jtt3kC66wvm4bzEpeYPZWLRKPw1iE+fIrbIe
	eoVHCNrYykfdb3ZSltX4BZVDgV+RC1VflXEpcrOhrclZh6WyyhCCW40UHg/FsseTYJIefOpi8bM
	dy/8mzP41RjNA3QvXYXmnPPIjGNJjBsE5W9qmTAfhmYahEry5G8OXEKN4flpwvvDJgCJ+X5Dd+I
	qitEbbBmbFpMRvp1jyBohonIyBScyv1LhthFLf9xm/jbNeOxghqCKf+Ce9P117RjB8mGc4yjPqF
	6VBLl9SSdGv2VVq3VnSKok5seZAVQ0VtmLe2wNuHhrmhLKXt+E1QdBhKsbdywfFNXGKNEJdHm41
	r0po5O9+g/
X-Received: by 2002:a05:6a00:1f12:b0:848:2d1d:836f with SMTP id d2e1a72fcca58-84e59449d00mr6615290b3a.28.1785156192339;
        Mon, 27 Jul 2026 05:43:12 -0700 (PDT)
Received: from luca_send.eml ([101.9.192.104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d68asm2992595b3a.46.2026.07.27.05.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:43:12 -0700 (PDT)
Message-ID: <20260727204307.24353.alvinhuang0603@gmail.com>
Date: Mon, 27 Jul 2026 20:43:07 +0800
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: tegra-video: vi: fix probe failure on skipped last port
In-Reply-To: <20260707152425.571254-1-alvinhuang0603@gmail.com>
References: <20260707152425.571254-1-alvinhuang0603@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon Jul 27, 2026 at 1:10 PM CEST, Luca Ceresoli wrote:
> Do you have a real use case where ths failure happens?

No, I found it by reading the code.  I went back and checked the in-tree
tegra DTs that have vi ports: lg-x3 (p880), nexus7-grouper and
asus-transformer all link the port through to a CSI channel endpoint with
data-lanes, which parses fine, and asus-tf600t has no remote-endpoint so
it skips on the !parent path, which leaves ret alone.  So no in-tree board
hits this.

> Also, mixing two different return values may solve a bug but makes for more
> intricated. I'd rather second a fix based on moving the whole foreach loop
> body into a subfunction, and make the foreach loop body as simple as
> calling the subfunction and handling returned errors. This would fix the
> code making it more readbale.

Agreed.  This one was already committed to media.git/next on Jul 18
though, so I would rather send the subfunction split as a cleanup on top
than respin it, which also keeps the stable backport small.  I have that
version building here and can post it.

If you would rather have the committed patch dropped and replaced by a v2
with the refactor, say so and I will send that instead.

Thanks,
Hao-Qun
