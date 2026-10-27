Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793126812;
	b=DGBo/5ir8/j//WXrbfmO86JHOrJ48S4hXm935JdbueEWQG28/UBJUImWHxrTNKgI9rfr
	 Skk3Jk+SNIXlb7lRpk2cHXgRyubGhJE7N3m299SFYUnGPZ/2iGLa9Pe8F0svIjkjk+g10
	 RL7Ek8FSkKK1Cv1xSHQyEhCwpnY7Ky3x7RNFjUj/RUBJQDVzk5n+DhJuz/IutrMD0bgi5
	 4Lk8AJSRQdTbmxutd1I1Nw9y+IzLWlFvfc0uPsDIxM7/7IVdiE80SkxxjGpRhlh6KbL9M
	 sLGa5KPmBriDrl1Um7EeF+h9owQo6rcJsW5YPFFakD1CCTlKuyScjECQg6DXn5jBg7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
	b=clGJJOkZkD9RRDtWej/3cNmfZDO6ZtGY2mYNX3L+SJR4Mlp+/hWueNERwjR5F/H9OC6c
	 58fuKLUcwhnepBwUXZhcALSzeUGCfeeaZcw35/IkqROqxBSLufDHZz/sEvB+wNjTbl2Jm
	 RXiCUI+lmi8lFrQeCNxr35ns/wNbV59cqtAaE8vbVtMFLk/Mul85irTQJwXF+fBneVkrE
	 3SV7g4eU0vwCDElf1JZkNZGf/gHwPM1pPpNRRAZnnk7BCmta4ORIKLcBAw/QTgQ30vxMy
	 c2bvdt67gVJOEHECmMTAsbC52gMn5KbUJt3ggpU08GxFv2GRiin0MADEE/6whHfRXnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2G7yvHa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375B5606A31A
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 18:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 375B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2G7yvHa
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so281834eec.1
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 11:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793126811; cv=none;
        d=google.com; s=arc-20260327;
        b=DeFKypl0VcwM3/Jp/26FGN3pVeqgvetnk7e1YS5zk6L+2HCL6fsMUrlJ0wTryTh9MR
         v3Fdqmf1Oor6da8DxxzVBhtMeqg3kh21S6viSpHUVIuTWq1XzHbwZWBZx6GO3fa7MCB/
         0uTI3Po9px+s0MKPBaIhsFqM2lP9VGh/exBGjxskiPcFcQK88hx/GLU48u72V04S5RnM
         8tnkPoEPs/5tqO2EhtkhmjrpbuLyTQouzG+ozzTXG09M3RrnygFzaWc4MIbN4xpmd0eT
         pJTDR4ILZ4rvbxgLzyNBl6LMUaIgI/rPllXZfdgzLVED6x0l5KG/+lk5ocA823yApGfm
         Giug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
        fh=AtpPFGfZ8Z+RMGGt6QZsFI498c9gUOqjG4SXflGO57Q=;
        b=QezBhbkW/qFdn95vpF79rSKoFwlhkKmayk+80/H2WsLDTXEwkyvoTolI8xNNu0yoL9
         A2FTZfuCIJSauiU/ErHc77ceNeVkoqK4Vlx97IgyFSaE420d1zG4KzEON3wSoZK2ZxlE
         CeuYwzjXyvyU9NF4kn21Hes+jUig14hdwL9tWeFas01NNBJi2YLv2u16qQPRiejGl3q2
         3h/MEQfXA1brGSDdgEL0U1NlEHa9vpO5nCQ14stLWQfNJs1b0oQbh8J4r/LACIAndUOZ
         aX9QGdGUM3XaLQtP6jqxomX5c69tdVVkwpdtSOSiPUiEcefHTnAR/Acu+7sZxen3m33A
         o3gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126811; x=1793731611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
        b=E2G7yvHaNkRxyW5X1e82+KIGXM5YEJiStgrdWIvG/gYSSS7qOXXR28A0GU3fx4B9qv
         39OttinzhaBsa0+GeHKfNbjNJIQz7h3J8bTmFKDp6du7ye2G+jDgrSN7sDv1jPFk/hE3
         o1BW1kG2DpmC26MFXaXofLL6r0i2h+Fh3zXcVQSF6dgwT+0hK7V8lP3VO9F1uZcL04jv
         WAOHHlYpkX56zN0B8hpKiKMIqT9WhrE9BOOBm6VyRUG+uOBWmVMkZeZOf17DJCocnc7D
         FlaAutXsgGENcLxSOMGA3Q3USXx4TGloK5IfEhnjEjIogrCqfYWQq3Kw1XP+nA2Shun/
         sIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126811; x=1793731611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
        b=jgxK/TvT4PJHB8KAREKiGutsaGFhI97ZvaBg0PcBJV6qHymBRlv67NtrIuTUASpDqO
         t6upXG4DIK6Ln9npCsg/s0nmgCUw7SgJkRAnaYPlbRsyAEvbw8Ac66Z3mew5+LLuqm+h
         iDY5w08iWob87qveK+7Nm9RV8f0lp+mnDSf6PMifQX/rP75hOX84cRz1mZkMgd3tqkTA
         tW+u9Y0igZCLJQ1lCanP8bRDemggEmqQ0yCIiiUxeQ55vkO23kFBW0RHOppxN03ZJGap
         740WLQwmwpqTni391P1vAKMc1ExRgKyYcAZ2F4HgNg/00BYf3jmQdR1AcMzEUO99xID9
         pNCA==
X-Forwarded-Encrypted: i=1; AKwUvBwj+E2mKZLIeVIKMTh3pQpHfiYuisn5EdDHx/vQvOcQyJrrFTyyLkr7WSgQGd1vL3HxvygAPjwqYP9YQw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKh+iEUz2S1jm2KMtTPaSg3ck+wSEcow80mwAjYbkf3Nv6EuBMa
	a5R0dh5oS98R1jiiU/8OWVLDckI7IVxNgL4k5dUPqaZTYBiGitA4xuXoBy/miOcMfzhdrTDumLs
	v5CX6BeN0f3q+d2rIG6ER01jtoiKlryI=
X-Gm-Gg: AYBFou2MrRYpZcPkhPyFwca2/uwDm0QO6SSLNJht3BVGe8PVXePYIC1yW5AzW6XrC/L
	JzHkLsYTTDM0xum0Ug8N2Lcjyw3PU6V7sbTlg6U7rpudR9nEvMZSKbnCabZtYVB3wiWG1AScmv3
	MNj/yCgK0wMYcrAeQZPBZISsQqqbVs/G3n9wGjOzByWgIbTnro0quFpfRtbl+wQ8Aiyyl6OQjUD
	3sDnvJnPGmBNKyxvb2lllVHzD+jfi6KTcS//JjxTd8+6bOi61hzdX+bwcjg+GR4YaUhsmVhNNiK
	X60WCcCDG8mH9jMtMUj/TdF8ml52zLUh4skdWIT4gMnSeUYaBlaK3RuGOaLoBECFqTROfdz/d07
	p4eWQnKazqINNkVHWDOWqTifvSdDfQh8vM6E2rbvKDHWHPSnoeGaiRqpK09MZdZzqdNzzyw==
X-Received: by 2002:a05:693c:638c:10b0:369:d8e1:7bb6 with SMTP id
 5a478bee46e88-36a203bc9dfmr355408eec.25.1793126811403; Tue, 27 Oct 2026
 11:46:51 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027120019.93611-1-clamor95@gmail.com> <20261027120019.93611-2-clamor95@gmail.com>
 <179312433904.199157.11834547028241710753.b4-review@b4>
In-Reply-To: <179312433904.199157.11834547028241710753.b4-review@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 20:46:40 +0200
X-Gm-Features: AclHuK-EdXsdf9foYz2HdBUkkAOJoPmsThEgknyKq7DwRpVYxIMIaZENdpZib5o
Message-ID: <CAPVz0n1be44e455tvaowB5H8mrYOyTyWof+PS-nmf7W5VyAtQA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] ASoC: dt-bindings: maxim,max98088: Document
 #sound-dai-cells property
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
	Leon Romanovsky <leon@kernel.org>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:0=
5 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > The Maxim MAX98088 codec provides a single DAI cell.
>
> The device has HiFi and Aux DAIs...
>
> > +  '#sound-dai-cells':
> > +    const: 1
>
> This makes sense for the device.
>

I must have set code correctly, but forgot to adjust the commit
message. I will update commit message in v2. I have to adjust wm8994
codec anyway.

> --
> Mark Brown <broonie@kernel.org>
