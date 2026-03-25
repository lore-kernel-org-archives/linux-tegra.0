Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E95139099B
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 23:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774481370; cv=pass; b=PCO9aSrmAsAKSPcz5KxapoyfPbvqajUBPiB6l4ZggB6r2OPAKSvxqMWfBvqn36YlY4QGViWJ/48YOYccuoByAuTCAHra2qF5r+yP7kPnywW6eS58i5BWN14gAs7HLuGzEJZ6de/DlYPe4RbImFrpLCOfVNclbbvXqCdlolxj6rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774481370; c=relaxed/simple;
	bh=9PfOuH8Ct/5D7RdkrZwZ/TjP2xXwetK52YTBgVhbvFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/KvlLTRSFt95MraP7mWQXBrL8cV0FxtU1X9ZsOLjv2X+LXZvDcuHJy4wvuIA9EZ/8hUxhYOAxuaCgyKzAQ2ROhL1eoK18aM/2fR7xu7fPl53vO+WE08K1VPhMXgf5/Qj02L5IdXdFS0S9iTyxvSpaK1uX83tTXz4XGZXQurTco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GH6YqjaF; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH6YqjaF"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so459140a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 16:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774481367; cv=none;
        d=google.com; s=arc-20240605;
        b=X5MT8jWWsWXi3mVsOnzgwAyOdee371jxZJZegP5g8F3MOLSKzcU92gNKSae8txuBoE
         VAYJBhD5VHLduk1Uv6W5JKHKsoTVf1D35cLkyDtye0WpYBthT4ITTSAEUsQRnLzkOcBi
         ocfAiXj6nIhgZCWmCZYSjjMnYoT09xderRocOnQkHkZeZLo/G6UDVZ41SHvBf7p9hi+T
         zV5Lq1PRMqKKfi5aE/cPhZGLfTIW74CacnZ14GLSHfYoYAMLn9GnHgYgxONL+mv9hrCe
         eaUIRqoPaFwnzTJ46z4Vgs8YJf0rtwS0+zVzzOBFb23W1fFmA45K0lXVbhUsTum+2uUX
         Udcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CE1+v6tpKBUDw5Z0AisbXwa5/W6ogM5hGnxRKw1Lv10=;
        fh=KLd0H7+4iKQrIgtIW2qkcg4+qpFHKFWAWC42QJWvTWo=;
        b=laN4J4tksUKp6kPMsJ7rR/k/VvuodPgadJq9AFoIQyluM7vKphkjfpGQy/YawS+V3e
         3ByjDwMmq67VdrLkQi9T5fB7sVz0zLAP+zcwzNIcIJBujGEvlmrDGy5OATHZ/QhlFdCQ
         VrHBiDSjtSUmtYsssXY9hckH66SSwLxFV29YZZiT82su7NphI4rIHbvgQYjGOCbTQPRJ
         NEwHHi71B3uhhxa3cRYdDjlWLDMwe87plNYVMnLtEIMCVR/5MrFV2N6dhWulkQob9dEX
         ftem/UAdbeeU1ZzfUnmgWA+Qru3Q8DYIiu99lPWvotlSHndFbmUfWvfD8x7GhueQoXjZ
         rMJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774481367; x=1775086167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE1+v6tpKBUDw5Z0AisbXwa5/W6ogM5hGnxRKw1Lv10=;
        b=GH6YqjaFoP4jsE6Ea1HY70lAv8IM3YFTlETNh38noswH6+APU8mWczpNu0lIc2tYRP
         GE9cJGlmvX397OXsvHK5UzogrClYinJbimYeMUUxDRIddFuNnj/KKPG7wp5udezlhEAX
         cv+F9iyLPOfhFhY5qJiUPmQ6c+0KwN2H8aIyHKsp5Xp1PofysHzQkm8Pvh9nIzRVD8UA
         Yz6H/0Ok4h6+4llYbPd8z03kGBVzM7CriYRp1m/qpq9bqKD2ZlFiMUuh0NBnw4zce56i
         GunSPkS9vo3gObySEfh9OQWrZ/YntK0v9HEPUfGxn/y+pP6s4Dev7cwRzio8BJaX9Mdj
         Fw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774481367; x=1775086167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CE1+v6tpKBUDw5Z0AisbXwa5/W6ogM5hGnxRKw1Lv10=;
        b=FMlGTBEyEIAYv1Ad1ULfGIub9QGvy37+cWV1OxlKNOuQdiqxjaXEBxqmHRJzFOe0ZZ
         bmLXfFpIcbjXTz6LV4g+mHH3QILCpC7NueSEpJm4/yZxJ3WiAJXQOrMvU9Aoqqv/na/H
         FP/GVEb9LvSfe9L3gK/eOlFBwpUPOMQaA7moGoE3aetnssKpYDffYokIrUGVvpsL8WSl
         VhbXVfodvuwheqjSS1Ca3s32YMdM9sDc6Je5xhB4BpNgX1tROpin1UgsCZAuvBdtIOE1
         +3h4eIjYDgrK0VwHojz86dNGUwG6fcoPKWGiWMDkGoqyDL+7f+pdcUHb+k3PKwcbp3Bz
         eJuw==
X-Forwarded-Encrypted: i=1; AJvYcCUMecV/ZWYZDhsGVw8/w74KIHiRZ5d093RHI7QqhxJOLqQmwpD50pO6inv6pq89Gzp3wAo2niNPKlEL2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvjBJautn9mCkAsxWL5vjIObuFk6xldvQ3BTzQ2o5/NHnmy5Xu
	tMU/I+0H3TgKqU9vFiwQ/S8hOVFMihG0g+s1L3snuVzffbUL6FUUc7oF+D5476qt04syG5Czyla
	4VbRjIAfHMR1mkjqHhUHu72RcAmoiFQU=
X-Gm-Gg: ATEYQzyNtj5FoYKhH5C6QRvOo8tmkm+MXnzM/ML/KyjEDy/LQo9juCVq79m8kLeHj/5
	3Gh9/H9XJK3p/L8cA+qsAwo7XafFCspq/Mb4nRAZn4/+/3XoJudyW7XaT0fAJWERIhq/RNX2B5A
	ziv6OhMeExsPZL9VUlhnsFGPM03vCuUPYRT6B2kkJPYrE22W4EBuXQEe64Ox40gU5F96RnCqpH8
	99X4TVQIpHZ2FAAke9gkjRpFtvAHdxTS0v8hr9ED4/JdcU+z4LiB+2syU8S7AiK/QfMudGjjFAS
	z7uC1z1QD2+Y2fu8gIXcWo6aVMUWWHRIJx5GttnMBHb1XnjF/U/rZEh5SKAPsz3ayKqxqRkL4j7
	rPcOdyQ==
X-Received: by 2002:a17:907:1b21:b0:b98:5b2:77f7 with SMTP id
 a640c23a62f3a-b9a3f15dabfmr338827766b.12.1774481366307; Wed, 25 Mar 2026
 16:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324211629.26924-1-rosenp@gmail.com> <acOPMJVsxpBltqGX@ryzen> <63d71f4c-97c0-4c2f-ac92-0a643fcdf75f@nvidia.com>
In-Reply-To: <63d71f4c-97c0-4c2f-ac92-0a643fcdf75f@nvidia.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 25 Mar 2026 16:29:15 -0700
X-Gm-Features: AQROBzARloAI-Ejm7HMIY4aVogCSDARNAJeQ6vsUaeQqP-i5QcBTlQ1inxF_Po0
Message-ID: <CAKxU2N-Yxir-XcH4QB__nwmyyFy02ZC2L7vKUNCNmJvwQwc2gg@mail.gmail.com>
Subject: Re: [PATCH] ata: ahci_tegra: remove kcalloc
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	Damien Le Moal <dlemoal@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 3:17=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 25/03/2026 07:30, Niklas Cassel wrote:
> > Hello Rosen,
> >
> > subject is a bit misleading:
> > "remove kcalloc"
> > you are removing devm_kcalloc(), so device managed.
> >
> >
> > On Tue, Mar 24, 2026 at 02:16:29PM -0700, Rosen Penev wrote:
> >> Combine allocations into one by using a flexible array member.
> >>
> >> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >> ---
> >>   drivers/ata/ahci_tegra.c | 15 ++++++---------
> >>   1 file changed, 6 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
> >> index 44584eed6374..5972fe04ff3f 100644
> >> --- a/drivers/ata/ahci_tegra.c
> >> +++ b/drivers/ata/ahci_tegra.c
> >> @@ -175,8 +175,9 @@ struct tegra_ahci_priv {
> >>      struct reset_control       *sata_cold_rst;
> >>      /* Needs special handling, cannot use ahci_platform */
> >>      struct clk                 *sata_clk;
> >> -    struct regulator_bulk_data *supplies;
> >>      const struct tegra_ahci_soc *soc;
> >> +
> >> +    struct regulator_bulk_data supplies[];
> >
> > Personally I'm not a big fan of flexible array members, as there can be
> > only one. And if you use it you want to use counted_by().
> >
> > Yes, there are two device managed allocations. But is that so bad?
> >
> > Since it is device managed, it will get freed on device removal anyway.
>
> FWIW I am not a big fan of this either. It is not an obvious bang for
> the buck for me. The one downside I see is that it does leave the door
> open for someone accidentally putting another variable after the
> flexible array member. Yes we should catch this in review, but there
> really should be at least a comment saying this must be the final member
> of the struct.
That will eventually become a compile time error. Currently there are
a bunch of those cases that need to get fixed before that happens.
Hardening people are working on it.
>
> Jon
>
> --
> nvpublic
>
