Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F397346F;
	Fri,  7 Mar 2025 06:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741330696; cv=none; b=UUHAlW6zWk0PdZBEuOCGJFkZMZ8Qa7QkkmOaSPWsiOkpL+mGY5q39jLWCU8QQ7BkrFYjEtfb63HTedEarxH4s1WBAchywmzLMKwlvB8KgWZoK3FcdgspSi+8yGnxW0Wiql+xcBrsUnLCTKfn20QIm+POmn2jT77HjA5DKl3WHvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741330696; c=relaxed/simple;
	bh=PiXd/45wF5pZwmRSHv2Zl90XxcOIcIo1yRbez2da2NY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1nfOAClztz+Hzqqku7l5IvlRc6M8DNqS0csmk5XyOKKeEDvyv2XxLNolZP34qYsYZ4CPA5Iy/FU8a+S/dZLq9yhVufOweNVSKgnxJJTNg/1KHm4kI+SLsabxL4+yIXvNVqbBFaUyPvB0ehU6xshKgI/56hqc9KmYJ3GaqWjndc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqapLK0v; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqapLK0v"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390e88caa4dso806980f8f.1;
        Thu, 06 Mar 2025 22:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741330693; x=1741935493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=disXzokau1gUQ+hfEjMpewIrRbZ8/qNkRCbJd7tHiss=;
        b=SqapLK0vnPzhTtZd/GlFA9XvMKIk3QYt+XrBsHDWLANPVbl0LEDg7vGhAxInmrlcdj
         01AP8gV5lyuW4DZe1e0PQwiO7n4Aq6aGjz+RkbuXqdD0uO/IhU/zL/na37lPo35Rib9J
         Dlo87EK16+9jkE48EC5fKqIQuAU5vfMnw28XlVNkZpis/qLBOHyzKTpBonE+HhTlJ7q1
         z3AiMfHZ0OKeXbmYZjvMGhx5t8v9ph4HKUJ1fMcY2dT19zQAGdDl7Oe0s+FX2X6k1+f0
         KU0527SEfGydn07oljHBu48/eIri9/y8HD5KR4OnGq7pBTFZKj0Hdagq5dPRvTwq7jsE
         AX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741330693; x=1741935493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=disXzokau1gUQ+hfEjMpewIrRbZ8/qNkRCbJd7tHiss=;
        b=dIp03v5b1WRNxVXgmUI64VxEBQBAO7NJU9TfRoLjE+R+eIbc1zpmvqAvtOBtDcQWWX
         ODSpyyhh46XPeK3OcriO1kh66kDj7zP5hPADRQUAaMBKAsdIUogf64N+32eJH02M0qsq
         z5CK6axV2aEs4ARemlWrXMxDrNZGX5tmGmKUCOpn2en4JaCEinKFv3+jxo1YK1Lrh2o0
         YizoCqPSR6AwNr3X/RMDdtoS0fQTKbWMECQJpNbu8alLZPBzUjcgX9GfWVEKGV3P1jWG
         0IQtGMj+0u6pntsiNHb8iHTsJOYqQ29zbpmL1VTab4K2MMtJQZrXLxjZCBKye7nUT7nT
         Kb5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDI5LxYSCuqdH2sMxnodIHnY4w9RLsBtQrZ6UUeeUt3aN9v4MoZ+LuI8TJTBKvz34KzgrBT1bqR3k3tBw=@vger.kernel.org, AJvYcCVJxns86zlC2LDv9sC1o3enuUIo4lC8xFJh1cuYjdtq/MJXRfOiYJN+vpLT9Ka7qI/AV1G0tDAYhw9J@vger.kernel.org, AJvYcCWj5iZNTCERBG2Lt3eiKn6C8y0bvM9rJ+u1FMwQeW8MUI4znht7SatS9swHtBpKI1ij0hnM7LUV0NbgRc8e@vger.kernel.org, AJvYcCXY0I+A2WY4urPJNU/Qr7xojT0KnWlEzlbFFpZ9my1SxK9lXdQ1emiRnFQau/A67zsz6iU4a3dz2byG@vger.kernel.org
X-Gm-Message-State: AOJu0YzEiMVB1rrnP/x+E2j2FwNopvD0FbDyOImQTkKqQhm9g1OEJFra
	RIbpOR9nOrXOyHWRSH3zHbIyxvUWB+S6+1ddt2Ho52M28f0QsgUVHuecoRXIA6pTLQHS6jFxD+L
	WhQFLLvx2pi/PQf7BdgcrOczkYuw=
X-Gm-Gg: ASbGnctsolgQyo4WWP2irOy5sG2lL0OwzEkyrcv2jClG6sVyEJ4V3Sv4q9aX3L9mn9v
	qjHOgpQQAm1OC90NL32Z9JNUeuGXJrxqZHqnf2QaKE8/mnbNTgNzNp+i9LmltU520Acr8Qg27w2
	Yb+ROBa2HXSYdROKGUeD5lgfChZSo=
X-Google-Smtp-Source: AGHT+IG1Kf4GDRiX3+bXqKFTJ7wPU+tbu1U0QznMuTGnfavR7i0imOCxuT5vQOwR5UpE6/+tyRPUNF9Ucmq4PfQqNtA=
X-Received: by 2002:a05:6000:2ac:b0:391:2f2f:818 with SMTP id
 ffacd0b85a97d-39132d78446mr981403f8f.9.1741330693076; Thu, 06 Mar 2025
 22:58:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225143501.68966-1-clamor95@gmail.com> <20250225143501.68966-8-clamor95@gmail.com>
 <04be5106-0d93-449c-b8a9-d8b3dc15ef24@gmail.com> <CAPVz0n1ZTDZnZHu6R_YVfhDqkjcMV0xH1UHVih=bgv9DGoZ2nw@mail.gmail.com>
 <a2170519-ec9d-4453-a2ee-0cd46d94d52b@gmail.com>
In-Reply-To: <a2170519-ec9d-4453-a2ee-0cd46d94d52b@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 7 Mar 2025 08:58:01 +0200
X-Gm-Features: AQ5f1Jp8kv9xn3VaS_UorhKcaXLUiDZXcb4wlrrq9us8IIWVA8fVhdhXxb2AG9E
Message-ID: <CAPVz0n36onhJ2fRP+RotE5LTufphuuNtL91Rywqvv1jqta=s-g@mail.gmail.com>
Subject: Re: [PATCH v1 7/9] memory: tegra: Add Tegra114 EMC driver
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Georgi Djakov <djakov@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 6 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 22:06 Dmitr=
y Osipenko <digetx@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> 06.03.2025 22:48, Svyatoslav Ryhel =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > =D1=87=D1=82, 6 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 21:42 D=
mitry Osipenko <digetx@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> 25.02.2025 17:34, Svyatoslav Ryhel =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> +     /* Read register to wait until programming has settled */
> >>> +     readl(emc->regs + EMC_INTSTATUS);
> >>
> >> Tegra4 TRM says this must be MC register and not EMC
> >>
> >
> > Are you sure? Tegra4 has no MC_INTSTATUS but it has EMC_INTSTATUS
>
> Can be any MC register, downstream driver reads MC_EMEM_ADR_CFG.

I can confirm this, thank you for pointing out.
