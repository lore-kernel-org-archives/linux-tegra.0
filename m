Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6450713F43A;
	Fri, 14 Mar 2025 08:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940289; cv=none; b=tis0sm0KyCzyCM2BiXzsWqKEM9+TO6IRzk9R3ODQelKgBYPNobCO3cdfEj0YB261Izs0p5TP5x9Ol8opnkK5N7M98keXYYml/foL2BV4a3woh2zeKfzuWSRvkk3Ashi9Cb8Ft/jRM1tSCHchM8xqr4/4rOEO/CxdtAx4yqr1SYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940289; c=relaxed/simple;
	bh=bUjE1grgqPjBCZ1jCnPOwHeG5CEobwCIGC2F2LNcNaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTNZWghHaTjFevAVCwI8CL/SXxgIgm28aA3gAs6hgly+az5cA50Djr2xK6J7zn6as2gGzkn+tVuEnQYwmvMM9ZzIgI63uI+0/w940paSgYaoDLI2WsM20CY4EwOo/1XHNVgddlU4FA78b9vRW9QYMlTQzZTuxEgOR5T5T85ZvME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asaFkOz2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asaFkOz2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913d129c1aso1439328f8f.0;
        Fri, 14 Mar 2025 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741940286; x=1742545086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUjE1grgqPjBCZ1jCnPOwHeG5CEobwCIGC2F2LNcNaI=;
        b=asaFkOz2VhZtxD+VSln6Bnd1vVQMYlqa0COwOJoaE3I3hrXYn2HOb40+mdnZTzr0nr
         j8hfy/nstGEeOjoynlHkn9kvvxpRnmzxbcYupvstAadZUaIPkpuYbSTufuEeiXK/vxXR
         wuCNkcfChgejkJQBwlB4dWLGHMVLr/vcwpBj94Wh1+ZMoRFoaW45ujEWKxGbfoWMAIYq
         72Fm4cxC4T1ms4NaZTJG+Ektba6EPn0E9L0rYoAQBtTrMAQhSHn42n0Ki1l3tW3tQXDs
         0HNmDRJYsaZmms5SnjVMlrvh7InB9noH8L0xR34kkNmx/Rkol8MHhTOMX+PWQjUTprEk
         VQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940286; x=1742545086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUjE1grgqPjBCZ1jCnPOwHeG5CEobwCIGC2F2LNcNaI=;
        b=bO1/lixxOWiDTUWdMjofSi1Xg+Aeq+vP865spwsWbMDwGkratirmV6qP6IWeUGzmjv
         iwU5+tcJMWbfyza22zN9Kmalqn8IOQfue2YS1BsKv8cPLOnTsIWTZNxK3MBwgFN3JAY5
         XYYEH364khFYbGp/7Mhj54vo8EkxxzV1YY3QejT6gQBm4yQSbYjODwWAbtiGtLOimYVV
         Hi3B5PR7MS80V3SgCM2UmeFA3JwyfN8oaMBq3v4hnZaj03NBGD6fuAcYlTB/aQfDfejj
         0o5s2bbtuhXctJfmHOOrisdmRcXg6UTh15UL/wGdKG9ewZYbn/TGgoDFX/P9ewloF82R
         fPqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPLEjie8NlvKnJgmEA4ph++DFNJ2sj5pxninPNbQvAuIm3NdGPB6QDRpoizttigpIvwuGvdOs2zNkJ@vger.kernel.org, AJvYcCWmzf7dLPJlp7Rsuxpp8OGXj5e7mWS85oIO3aiPqr3LTVjk86t5BdUIAWiDSVp1jgUqr1YwL6AOMgIocDU=@vger.kernel.org, AJvYcCX03O42AwEeBgU8SgbPCKF9qs9GoNQFRHCGzjgNNgXkks9S3SsyCCJcbCUgDhqwAqNgolmlj4dpA+hoDBdy@vger.kernel.org
X-Gm-Message-State: AOJu0YzHA/1yXku+/Cs8erAEWWJW1eCqmXkvctAHUNDLF/PQb3Eyi8gf
	fhLUXu6dgvpdF15TkV4gdYea44YXi+QP+SFa59DIhXO8YyCkNsslHoFexvR9Ptpp7sgoHSa/wo0
	NIoRgzL8ZDgwU0niLKuK2VMx/loY=
X-Gm-Gg: ASbGnctAT7RoDjb6NMx4D3Wx3P+FU8CVWwzX2U/9sB6sqp0yGE0eV2cYubenYcvL1H0
	2wOuHqBdfW4w4971VhE9h0NxXXE5k+/HsRGymsN4EkGFil57yLiDOcCE+ca1NH8VQxEn7ncXrsL
	G9Be37E7kEmwW6Ce3CYLWK8rf+Ubrxd3FRdqMObQ==
X-Google-Smtp-Source: AGHT+IFoOF9dFap5NyPlVNrmNSY0W1yMPSPjydwo61FQLNvZuDqkAAkBQSYn/BXaytlaU+a1SlitKD0/2MoFwE52w4w=
X-Received: by 2002:a05:6000:1acb:b0:390:f5c8:1079 with SMTP id
 ffacd0b85a97d-395b9b10df3mr5321175f8f.24.1741940285731; Fri, 14 Mar 2025
 01:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314074557.16367-1-clamor95@gmail.com> <20250314074557.16367-2-clamor95@gmail.com>
 <d2c41dbd-ca11-4e06-9081-db772f8cdd2c@kernel.org> <CAPVz0n1fNnkbfCc7-kB2RAJjDVQZU=zUBuBzqyynO54np4Wi5g@mail.gmail.com>
 <09089b80-ac68-4113-ab6a-3ff94c85e895@kernel.org>
In-Reply-To: <09089b80-ac68-4113-ab6a-3ff94c85e895@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 14 Mar 2025 10:17:54 +0200
X-Gm-Features: AQ5f1JpXUkZH_NaTlrNp48ivu0VEBI2PC9Exh4m2Wwar6maqyU53cGARfOLhaqI
Message-ID: <CAPVz0n0o8dVkzm2UYKghb1yiXs+N1txR7-_anbJdBXJ+vGS6Cw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: tegra: document EPP, ISP,
 MPE and TSEC for Tegra114 and Tegra124
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 14 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 10:11 Krzy=
sztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 14/03/2025 08:59, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 14 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:56 =
Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On 14/03/2025 08:45, Svyatoslav Ryhel wrote:
> >>> The current EPP, ISP and MPE schemas are largely compatible with Tegr=
a114
> >>> and Tegra124, requiring only minor adjustments. Additionally, the TSE=
C
> >>> schema for the Security engine, which is available from Tegra114 onwa=
rds,
> >>> is included.
> >>>
> >>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >>
> >> <form letter>
> >> This is a friendly reminder during the review process.
> >>
> >> It seems my or other reviewer's previous comments were not fully
> >> addressed. Maybe the feedback got lost between the quotes, maybe you
> >> just forgot to apply it. Please go back to the previous discussion and
> >> either implement all requested changes or keep discussing them.
> >>
> >> Thank you.
> >> </form letter>
> >>
> >
> > I kept reset-names for TSEC since it seems that it is needed, ask
>
>
> reset-names are not needed and the rest is not applied. I don't see
> opp-table either.

You are exaggerating, I have either changed as you asked or removed
property if I cannot provide needed change. About reset-name I
mentioned in the changelog and I would like to hear what Thierry
thinks about this. About opp-table be more specific please, do I need
to provide an opp table in the example, or include some yaml
reference, or what? That would be really helpful.

>
> You didn't bother to acknowledge nor respond to comments, so it is
> expected you will implement it fully. Not me to keep checking if you
> read each comment and decided to silently ignore it.
>
>
> Best regards,
> Krzysztof
