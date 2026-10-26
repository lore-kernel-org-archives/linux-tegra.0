Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793004245;
	b=iy4Ip+PIXEyx3lx93YenLEP7Z/EOUESfaEKHW7rTung44ROacNS98bpccRGl9w+cbH+w
	 Ao9A5LhFIEscBjYDNRVAOzvYcZxfWvZUXHCoDuHJ9kbl4tnG+b1T7fniQTbmlivEjoXNq
	 A9Dt7aMSYlta61kA9+wewurihi2QSRAIjUzu8DX9lIxlFrtFnk8UTTZUPeZic57Pw0z1R
	 Ev9gHyZ3hMfgCblD7MM+z8YGP5lERL0VoyhJeoF+MWebbUaxjVFgjaGKAC6wPjFEmIdel
	 xUTQEwDbZLVfSxQdTnFqMAqUYAUjMB+rA+Clv8My8TCQ1jddGxhMcD43Ru25Sj4aQcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vuokd8eYBXkkOY3FeEgoxbWH+3rJnsQeEdkSp7QA0lo=;
	b=sl7xYIsQs0cQYuNHjsG4Ip9DTHXLhQMErVBxNKs72SDXfjy85fSVa+D16bKKsBPfFo2J
	 mq3R8PXc3MLMZR4uHsqjVk9IAxCkHiFaXOYYHYCrjiJ4Mtl8jXydJ9gxhBtO1naGGqlgO
	 VOLjqFc9hhCbzDFyybFv4YZzi/gs+Ny9v9fOs5RriPgIxlG49INYWmDbMMyROdGZjZ8No
	 jzdBse38+FhJBQIDHl5w4GSz+m/96Mr0kbH8+0y3m6R+CAdy14NsHypi2JFEecD9gN16w
	 sNnIV3EZxNGvkp/05+rpC1nzLKMFy5mB8JuZeCRheyE5d3rXhcufpjwOZM0e9mfY7Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DdEl3zIQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A01C606A31B
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 08:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A01C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DdEl3zIQ
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso8148184eec.0
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 01:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793004244; cv=none;
        d=google.com; s=arc-20260327;
        b=bDq22No1Ib0ySXTNgblkC6RqYRWrvxmhIdrbaLlloq3BCmoIkTJ4VllizmQWqJtuyz
         c95Nv5NIPUgHyn2ORvycVzHEBF69/ZLz69kV/zjpz00Z55DTk6n8R8EeQCrppldBXX1L
         iIAHq43ay3gr4269Kaq9U1kl0jSbIXZ8D6Jv7J9kWc8uZ02QlUnjQQvJVHUJCiE3INNK
         tzcao7Fe6q8lH2V+RosZ5y2raIQzTF83e6tLryRBaq8KMXhnOQVMk+pZrWYHhwWeZqP0
         4NLpUZmlU0YjUw0YJPnZkcftnsaQqtjbLOT0OK5AOlzKUjQ+bAzvF1RVB4Lpr7LgBLO9
         eZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vuokd8eYBXkkOY3FeEgoxbWH+3rJnsQeEdkSp7QA0lo=;
        fh=euFXRajvZjJ6coJsktIJRPAaKEWY1chtyMNlGJ/vkgU=;
        b=ccD7ouj4hm5+VWqnO7+O9EZFVlQoDtDN15hvyP5Xdgm7gvHaml/5HZGBhMYPEqYe0i
         izbS4yM9UN7UC7KDmsmO5xfYSqnyofxP/Vhp3Gm888YTYJDgp3ND8DGySoOj6EfTQY+I
         pVENBV6P0gsYp2SwTigxlnPtCLxnuJUzGG139aLAcWuL9jyO1LEq4xPDoxI4qq3USWuY
         NA0oN2sd7m3SokSzoe+9qdaGLznqfRdxh+jxRES354Ud3yIzpOKm4+Jq6FJ6fnLrp+RB
         SAviU51awwL+vZRamfVl01Di8zE6+n9aLlR07eXk0rkcJiymHBP4cvprnHtGtwDJgN9c
         DqQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004244; x=1793609044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vuokd8eYBXkkOY3FeEgoxbWH+3rJnsQeEdkSp7QA0lo=;
        b=DdEl3zIQt0j6Wl24x/rH/CtH549T/6yz3arfh7UpUrcj6VkIpoMyYOJF0NDjpQo/t8
         KnIkRGw3mQKSuSLcmgmm1QRxFD7nafFegrsx97gfdpMPw9bSIdSMJkgN5ULAzH6PPtJR
         +1211R5Q3Zhp+ThE+b19e6KHxhmdDbYmR0W8ghuKMj2H4lP20As3vXQ213+vhFNpMZcs
         fzuE65p6rZWd3qQGy9q9CvG9GkFrGbtlh5Caj3W9g200O15HUM0hg1BMgN74DerPrTbJ
         oOhZzxb0gPAZQ9lk1EkvIZown3WXZ+qA2Xj8kSrVd1RwXvQviFh0pvX8/AIpiShu5UJ1
         rDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004244; x=1793609044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vuokd8eYBXkkOY3FeEgoxbWH+3rJnsQeEdkSp7QA0lo=;
        b=eHOAnSAp07bUHmONlrvwbrZ/OxAorbMB0uyepyaijhx0QkgMQ4/21x9OQKMY1GR9Ug
         N99FuwR9i7SJUW0l2F6k+TyzdM4C1SPB1auQOP41pAlMVrFiQFSis87BM9YN2qHT87TP
         ZsINGYEc9+biQccpdQEWNW/0yIlDbsIpq48Bm70Mz5pm7+4sFoyY51hDIBLRLoyeDY3X
         Qt2PKF92x39XnZBlR0R1LYs7HDIgDWWszSeVO6JFUOAhkZZxP3SHPckR+e1+jKQ+eMss
         4052+YaTH3MHbbtC6jFcqXuoKR2G/j5o48U9d1bqys1fvqyZ1zZzC/5fB2TNrWWhUSSI
         RlgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaqtnw6nyYP7AD80Q1L9BfXCfs08WkuALQhvrHg6nv4R5quUqzsTyonPmpfAbRSE9oNbNc79iwAOj6FQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK6yBPveNSrFJVOLUK5E4EfBNJltFa9lUUaMxxXMOnxfxSO2mf8
	SVEt+mrFSbyHvgd1Q+/wtK3UcJxjtgbZQWbxei28rcaNmEi0WdjQi8auyQliFhnTKOEm1ymCLdi
	pkvkaXbaG/O3xMgph4sA5yo7H4fcepPg=
X-Gm-Gg: AYBFou3RgbHoy36Pr1go43SeyEC9wn1ws2r5sQ48leaLhMfVXE8L0h+xy2+oW7l9Lw8
	zgKB06lPhBGmlgHocRoWzagOuY0aORNzkIYf3OUWZUdh+Bzsr0E3UBHKvgdeXz7YA9CQWUITvYE
	YvwbxY7mSVsxmWKG2WEL4RwRtaSnJ7eWou3ReH/U9bfg3XI5wioMYlcyZnH9NA05X0W3MbeqdsV
	f0oQ0caV4YxlTvnWjJ7yoULcWpO8Ei6O9fE3XgB94MD9o5unlFBfH9EmqlXPwMy2/qebHbRrtHv
	xaPZ7Ut5+3Nx/9maKa07+OE2Nkrs6+0Cejl7RMLGDUJbyIUmEPfM9uEAKEs/8ZAgMHltpSZob5u
	sRg4dqdil5v8na9SwIlYjDe1MyLzeGYISZso/dpU6JVyZSGdldIdZG4hTAhLkSRekM+8vKA==
X-Received: by 2002:a05:693c:250d:b0:366:8efb:bab9 with SMTP id
 5a478bee46e88-369e848362amr9301864eec.11.1793004244117; Mon, 26 Oct 2026
 01:44:04 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-dalmore-fixes-mipical-clk-v2-1-0a2d1118f930@nvidia.com>
 <510d6922-5aad-4b54-8085-9a769a1a934b@tsv-stahl-riesa.de>
In-Reply-To: <510d6922-5aad-4b54-8085-9a769a1a934b@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 26 Oct 2026 10:43:50 +0200
X-Gm-Features: AclHuK9FgW54R73JYrxQZ7QKLMuuRD6TDEnSd96dbrON3jVaOynr209LUb-EVxw
Message-ID: <CAPVz0n32UN5QtoHCCJtHtdcF29BYcP=2pPnhYo3yYy+2pBioDw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: tegra: Fix Tegra114 MIPI calibration clock parent
To: Patrick Fischer <admin@tsv-stahl-riesa.de>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 26 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:1=
6 Patrick Fischer <admin@tsv-stahl-riesa.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 25, 2026 at 10:45:41AM +0900, Mikko Perttunen wrote:
> > Fixes: 07314fc108e1 ("clk: tegra: Special-case mipi-cal parent on
> Tegra114")
> > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>
> Sorry, I replied to v1 earlier by mistake. Carrying the tag over to v2,
> the code is unchanged:
>
> Tested-by: Patrick Fischer <admin@tsv-stahl-riesa.de> # Tegra Note 7 (P16=
40)
>
> Thanks,
> Patrick

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
