Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2FD20E71B;
	Thu,  6 Mar 2025 19:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741290517; cv=none; b=l+D0o9RJTHd+nI5AWB8voPN/iff8Tg4Gp1Ck5TTEbmiiqCSIGOGD0J7ac4ciXBHrm5lBnUFDfKZ8+Wvo5U4C1zb827ns6nLVjvbE69AXZUipMSQ+/WOauSzoynT0wrXKCQrrjm1NbHrp0W4tjM+n1nY0P6mQhxeLO8l7+JDwjso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741290517; c=relaxed/simple;
	bh=6KlhLZJHxbMl3/LmwbEXaHYfqXDA8ofy5GnbEx0QOjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSZJ7+Af72kW08V25q2WPc4F4UretoGTVBClCURmlSsYbx4aAdKyfAaBtHiV+aEogGRPRWiaKVEPBboZPBVcb7GNwcAeNlr4ZSVIF3lyhWswD/pZQ9o1xmgn5FuRwuk3ybV5JCapFI1J3XCQ1WhEPtpFrjiEwjOJCHnNitYxkrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9RiLJkP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9RiLJkP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-390e702d481so574975f8f.1;
        Thu, 06 Mar 2025 11:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741290513; x=1741895313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwABPoxBGNDDl4dsMEfG8YvhAybcbbsFvKADV+Rz3OA=;
        b=c9RiLJkPxSHYpMSWc46rBTixTQHmDgNUt2SufKVa2mjvUDax0agHYc3VcYVOcZwjBw
         qz04KIZSo8D66JKVWhLxR7yw/jdMAzZZkBFEqTpfsNr1XgQyI4hPt7hHeMqNBjYUnunX
         NGEIsLdGTMTjwX+Fa5JNsm/fTyzLThmuWYG1i8X6OKsKmYYxlcPqCJ/8mtArqe1zhqat
         CE6VyjjBkzRxtExfAIsfTiNXsjrVJMtdDb43Za3HMxwX19mmpkN2RZ6j8zUlso9FslKK
         tOCX8c/CMiParJQkExrjNANMYEPG3LnD3nmxLaaojOHj1V3Er1U8gWJg71C1OQN59GN2
         +dQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741290513; x=1741895313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwABPoxBGNDDl4dsMEfG8YvhAybcbbsFvKADV+Rz3OA=;
        b=Zg1oP4NaCO3YnD3+dVUt9OBPWg1Ob1a1+yTFUE5yYoInxfy2g7gNK3KjafccQeLA7b
         gVla0S+96yIFnDfdDUGYpfDzMx+hI3Z+Lc1DEYycN5VlZ8ptnc1AcQMuTRRr3I5fap6R
         0WfRl1hTET921RrwdU3JTSAXaMDXbefF6oPf41mAa+7mMfXCUyb6vvhaeg7P4DtrqZRE
         tOvc4JJgA1cKYgMYOi58vrPp7LsX55SEhLC70p1gsOrCNzCO2LMlml09eVwcJCdRDQJL
         0vaKwMA9AQXI6Js8g4FrHbIRhVsn2ZxdZJx9G0xGmLkNlLvMTpzguqNbCcUC9KkyqyWZ
         Ydgg==
X-Forwarded-Encrypted: i=1; AJvYcCUO34sqNeScP86u9xozTZkVOxe04tFFGY6EqbwsCXblBPlnDZg9l9GUH4gqfCy/VxMlDipEECEepmQV/xnK@vger.kernel.org, AJvYcCUfn/4NOYW4Jn6BZDGjtHaLJZI1hs5fjHvbMocwZQglKx85/b9gpMPlI7yKU2XTN0PyAeg8fwotAWdF@vger.kernel.org, AJvYcCVdNOHx7jF+eyB8ZBK3Sfjj0BTr4gFF7l5kpfvhu83xpeKLtrdL7XENaBnWu3ynL5OoJMPKcuVBJRFl@vger.kernel.org, AJvYcCWq8Suh+9rRX9UOQaOzrDweq2O6T45/jc16MXyOdlcO5SbtHgOlfHDpNpn43pwLuKxA7FmmVrEvh2jcEWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKc+U3IyI0xK4wcbOmcHKdInziaVWp83yYF1xRLJaL63k4pnJH
	4qQGn7vQilqVmrqKCj9hV3W5cDVPtOpl5BwET6yfxmXEPs9vDksLM9tHzJNd5xtH5/sq437hJLI
	o1XArJj+SsXIl4b2ZPM1nTrVsq4M=
X-Gm-Gg: ASbGncsQ6prBK6bECUJ0fFHjDMR/604+9g1hnZOXNkwkiXVgYmQEbQwPs2OoEN1RjCc
	u6aNoVKUJIwgaqozd41lAPOfg3OQpncbNgobSxQm82l2WfIiMT/tfOSfjTtt4iB9Od+T38Gcwka
	8EhL2MYdbhT1ut81uMuRsp/aju72o=
X-Google-Smtp-Source: AGHT+IESx6J0fQPhrHzv5lys/ppFZv5l4yXAH23ndOkrFvwzwq/OeoVrFxPPglCoCuorF3oRyYLsUiZIFyRXuk0r6ks=
X-Received: by 2002:a5d:64c3:0:b0:391:31c8:ba58 with SMTP id
 ffacd0b85a97d-39132d16dd6mr307761f8f.10.1741290512846; Thu, 06 Mar 2025
 11:48:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225143501.68966-1-clamor95@gmail.com> <20250225143501.68966-8-clamor95@gmail.com>
 <04be5106-0d93-449c-b8a9-d8b3dc15ef24@gmail.com>
In-Reply-To: <04be5106-0d93-449c-b8a9-d8b3dc15ef24@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 6 Mar 2025 21:48:21 +0200
X-Gm-Features: AQ5f1JqPM8VmWqKAvqMUUYrU16-NlerNF4D8twXr8-KoJ5UNMcvW9sCYiBK9Y9U
Message-ID: <CAPVz0n1ZTDZnZHu6R_YVfhDqkjcMV0xH1UHVih=bgv9DGoZ2nw@mail.gmail.com>
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

=D1=87=D1=82, 6 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 21:42 Dmitr=
y Osipenko <digetx@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> 25.02.2025 17:34, Svyatoslav Ryhel =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > +     /* Read register to wait until programming has settled */
> > +     readl(emc->regs + EMC_INTSTATUS);
>
> Tegra4 TRM says this must be MC register and not EMC
>

Are you sure? Tegra4 has no MC_INTSTATUS but it has EMC_INTSTATUS
