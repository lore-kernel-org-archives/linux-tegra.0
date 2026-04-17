Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56FB2A1B2
	for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 06:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408786; cv=pass; b=JbFF+r6lc7fgChLyZqCJYhuLWbWlsw5vB5Sdg7J8IeiN85xfJcUARn6zWoTKslN4yGfzCLhNP/Zh/l51gw+RCQy2A/bebzM5ZEyvxC+RbNrnSdt5jFBXTfgODKQUezS+NumYcpiTqm1gXx2Ild0tzefW65hZddnmYPL+jQQBmD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408786; c=relaxed/simple;
	bh=RCRjSgJm3KwWFKtPgSKvfy+sw1dQJ8qsB6Bkm6WrNVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwUH5lYTkY6J0oIIlx8JbA2hznGgvSeYjmx9HabCLJBTMqWWg118LKSvobQ5AgMKp4Zp23Y9SVNHaNtwd3lCqkveNqfx3zzJy38hCpyUhY1POpr0EQdYVbhm5tHu/aHBv4fU2QeRXEQZOZAQcXtC8QRIe2j/FNcIiuR9H+PqzQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQka4rSb; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQka4rSb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so202066f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2026 23:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776408782; cv=none;
        d=google.com; s=arc-20240605;
        b=ZpqtIY9QbdFbIVohPIILkbnoPIW63zi6OZ5PaJolYdn8KzPjiTlZh8uS3NmQZ2cPV1
         ZtjZ2MC3+TOL6g99NXwntN8JCTyVbAvL49f8lSfxRh1sywoorORQPXRT2Es+B4gXkh/3
         dL9VBunmXJFdb5XosSa8PrKbi8r/BfNMI0Efc5mXV+A84FQyqXaBR2JW/HXGeFzSlzvp
         s5BTS2T/WgXbvAWFyRKtHqaW8mjERBJQFxnYcEn8a9wkhyVGzOfAffnY4LNAFFhsPPsZ
         625keq9xzJbLx26Vu2OZBDfvNVQkrWBxbomeMuNSlIZX8/o5fBy8PTo2tQ7PU15VdfLk
         nU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8U+WOJv2yvWPYUUfMhDGPMV15Mhn6imfX8H3e1n54UQ=;
        fh=UJtQMxcSA6U0+G77D6/7kopIMZBRAbtdAlHb7Mf7wkM=;
        b=HqAJyp45Q+o0DaBOOm+H8+GinYaCS52N0g8FalSZegK7Hc8VMG7X02ziioDnDDGwIp
         Q0yMsh6Iyo+7GhbD2fHPrpMN4gqgheKnjXUWKsh3bR439X5XMRisEcTWC1RifkHqC+mC
         tRauNLhokKzmdjk3eHZMGOPJL/bLTuxuC/UNDBTI29mJaVJovd4QLElcnlzkAr1zMNgT
         mktKIaO0yKANxoESbMNiqcf+NKYZf8MxTW73SEnB31qAH+BFT1NYCgc4qOf45L5DJ0gE
         Foi5VDfHVlUJ7qaMZQMvjX67cBiCUauDpsthHLCuwq1jC5x0SOEyrgNU98ycdh2k+VOz
         Hf8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776408782; x=1777013582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8U+WOJv2yvWPYUUfMhDGPMV15Mhn6imfX8H3e1n54UQ=;
        b=fQka4rSbVdhgCX1iSRmAfV51QKhKJtmL4ReNreTu56aortp1j6aahTJsN9MeeP11rj
         GWMgUEJ+jq8Bx3UtggnTVInCkuRAud/yTlI55vUOi5IdVgjDGsK24/RLMYgB3gHyBuMi
         Gzovgy/YifbjwDk67ZSfvROlLHgQERQF9/oF7h5edy9xy/qp6Bbmx55DWKPbRAkVJFNI
         lll3ydBogNECustdy0lcgVK6MSixh6HZkeAGjIAQH3IE1LUdNb3eGiI1aE/5Ht78H5C+
         CsRSMhluTwCeEl/dYOaOEVRMyIRAO1yhDudnayP+GGLLpekyqAdH9W7kjXNwweNaWjDk
         g1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776408782; x=1777013582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8U+WOJv2yvWPYUUfMhDGPMV15Mhn6imfX8H3e1n54UQ=;
        b=UctF1QY2+mYX7A/Gp0E27O0SnWMjkYDNg5Vn8jztPQU4qwtWT6tJEeIVGUrNul+ctJ
         TibihLp0R9qhe0Kw5yY2wJ5pvwmCwdU9Sy57KG/rRQ8ushiQYdn5VPGsYCxWoOw7J40u
         jWdRXwG8mWL/vFlwLPpnP4i1bMLMqs5qI3tDamDqeXMgq5wMns8CjSjtfo75KL1vp8Dq
         hpWh+w0+uXpB+AC19f4kpL+kHLHW7tP99GUpQoWYTEYsG4xWJzNXrzTveOSuwnIXHQ/Q
         fHEjXmipB8gH8qknYq0gCC3av11/pjMKNCVeuIDZpweUk9bg+xnk1rnvOph+1YIN1F1g
         yqYA==
X-Forwarded-Encrypted: i=1; AFNElJ90kOTv3QqOz3sF4fmQqQcPGSCE1cWsg7G3s9WbVK/Z4qIPKWwxB4rnLbvItAgC6vQojqihr4fUM1T4NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSMHO3wwsGKrUnTvF6LlVum/GuzN6iagETmBlzP/lqol5zgCLL
	uhe/s/Mjpbt2MW8HOdcxKdidJd2gk+DkXcjTHohGR5RspW9m1jtQqe+XeDQyMF0SQ+LTsBbcDS+
	DGV3SnMKLRgPKR6ZIV/0GrOkHv4GViRs=
X-Gm-Gg: AeBDietMgzTbwvGpV/cVj2QeP9XxoyTdcOu4GRXR+wOwzTpqmAtJM0USwdl/VqWwqyP
	NUZpIQZ0lYn9ssGLcIpOdTCYtUeZ+CAm4RK2EppSPRSPH+Yi3JzumUJdDl2y3Y1Iq7TiNzp+7P1
	UOquXeRba+4wNTVX+laXpzH7WYl4FUcR6lnZIQfiZLNQF5k5Td6MPLE4GVwj2RmvZhh2oluX3eE
	LZ/G1NZbScmfhtbe+91x6x1wsxafLqYuh6ycdvf9UJtetyg06PlIbmhtyrLgVpPJDisLEqFxEW1
	xtXD/pV78xMsZzteTK8=
X-Received: by 2002:a5d:5f43:0:b0:43d:73d4:b27 with SMTP id
 ffacd0b85a97d-43fe3e1575dmr2125969f8f.32.1776408781948; Thu, 16 Apr 2026
 23:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126185818.78003-1-clamor95@gmail.com> <20260126185818.78003-2-clamor95@gmail.com>
 <acadwXDbBi4y99e2@orome>
In-Reply-To: <acadwXDbBi4y99e2@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 17 Apr 2026 09:52:50 +0300
X-Gm-Features: AQROBzDJUsv0c10KEk-OckCv0HeNslGwyNfIIEYLdh9v3XdESuYcNKHmFmVOi_E
Message-ID: <CAPVz0n3SXHdTTE55MvwZeogYaTgg9mD8Jh3Yy3snnSkjgfcyJQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] clk: tegra: set up proper EMC clock implementation
 for Tegra114
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 17:10 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Jan 26, 2026 at 08:58:18PM +0200, Svyatoslav Ryhel wrote:
> > Remove current emc and emc_mux clocks and replace them with the proper =
EMC
> > clock implementation for correct EMC driver support.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> > ---
> >  drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
> >  1 file changed, 25 insertions(+), 14 deletions(-)
>
> Acked-by: Thierry Reding <treding@nvidia.com>

Hello clock subsystem maintainers!

May this patch be picked if everyone is fine with it? It is pretty
important for Tegra114 EMC driver to work properly.

Best regards,
Svyatoslav R.
