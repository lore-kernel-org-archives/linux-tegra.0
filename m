Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CA210F9
	for <linux-tegra@vger.kernel.org>; Wed,  2 Oct 2024 00:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727830051; cv=none; b=fTHhJSSzFWD6nqE4z/UENeW25lpwl9gz5KxRAawl932tkspaPzsohsxWcFPU/zNZwWtsRybXzZFxKFCMw2/NDuYiUTun0+vzlQtS4PFd8xJiDTGMyRnF0wPcg2ynJFmvyAd/zwukDaIfvtCwsGTmf9WeI9sKcIo9WpUIxVrGMMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727830051; c=relaxed/simple;
	bh=rbKWC4k3ppkAQHLunY4hwBnSXoSYNwqrCWs3TQKZUJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+f8qtc1sKOg1HelEA+WyH/Gc4Md/hHky8xNGujCLZa/wMnIYh6/JwoHUzMKzUHDEPpSA8V2X4Kg8Tgg2x+UFFCr5Mk+R23F59QlAZzSCvjsEzACY1nGbIkd+FSpeJvAeKmhiWh1azFJxFP64EKkh/3FZv0zQ2k92e4ssK038Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3LYqW5n; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3LYqW5n"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-2e0d9b70455so3795526a91.3
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2024 17:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727830050; x=1728434850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22TxkdZjj03G5CY6/gSt01KcrQ6SrH96ld+f7LuKkG8=;
        b=h3LYqW5n/ZGCl2O8QXogBC3hLibdCurW6JPemqpP9IqmMIJyNLdss4hVXMBFX7BmBY
         Gmf2xZFCjR4KnjgKd8WIOLijgCgxwPVjxtO0VrINo4CWfEKRHk/BI5YoAHFkSU0IvDd+
         JAPAU0StUxYNDLjmzmgfIIc/FG/LVu4cGAuGp8zkOjkD8KjTDKbz38PSwp7+Iw/t5pyJ
         JSNQ6Ko2i2RW3bY9pPztfHkjruxtFXbPB6BMS+FBUI5+llwmxTbMdM9oH8vGxi2gLJq6
         sp1C5/GxmzInzYgc4VU4ZLV4cM9VNgOAVvPoHK8/uH4UEXCKuP0JgvJOiqBDwdTKAwk2
         4M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727830050; x=1728434850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22TxkdZjj03G5CY6/gSt01KcrQ6SrH96ld+f7LuKkG8=;
        b=CGPm7EEuE8cwTC2iMSz2UHUwUsJakS2JGXf5GmlmB+JNWi7sfGQG0k989UXTOuzASx
         n9N3B5LI/I5pmWt6GbPPkynArn9wdzWdcNisU06K3gwQUC6IPEiWKnSfh5ttuUT/wD4P
         AlfbjXZbSvtWqFJYlJaxfnT9AZ89+N7f0a5RDOawQFxvkOe133fpAjMMR9QaXv+M1LDX
         y26ftG16doKF4bQbPwYjpXIYDTqWk06AOVlxTVZoZ8X93L+PXpga3eNT4oy8O/P41oht
         7pfQVt6vQDVGzZO6WjEHmbU9f5MfaQux7tZP7FZmtbKUFWcikaQyfnwOCgDJ77XBX9vV
         uypg==
X-Forwarded-Encrypted: i=1; AJvYcCWo7ezLa5QSWpwTa87sbdAoXPzFzwQgbHnzDX1SJAPDSCWBw8+WX7y+VfpWhOqQEWuwwgFHq1K/puoT2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxYokbrFixDO8Ky8TZrfvWnt4Wu+lNdAzczSgCqg+/jC82G9nM
	8I3zEwlwTpCKybjHCZWTnTcV9/eajL8Lg8PLD2VfrSgXFiIfhudXOltIxJWJN4XG++k927vCeXu
	DklaAYX94/BLaa/4ni/FsjxwnVhaBHs4rw1Aa49Q8
X-Google-Smtp-Source: AGHT+IGI3BrXlvG2iJC+fz9hHQGKYlf6N15cxz48qdGpswosSdO/OG+/gH2Pww/0Nn5noPHo00tshbBEOV9+YrEhriY=
X-Received: by 2002:a17:90b:4a4f:b0:2d8:9255:396d with SMTP id
 98e67ed59e1d1-2e182cb29b5mr1888501a91.0.1727830049822; Tue, 01 Oct 2024
 17:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001190953.31152-1-zichenxie0106@gmail.com>
 <e8810b65-8ae7-4d47-a89b-a1471b70409a@linaro.org> <CANdh5G5EUhT5N17QofverJyR2QxRDt+BAn7pvThkxgC0S=OB8Q@mail.gmail.com>
 <171a2cad-35ab-4a81-a9a3-ee73a762f321@linaro.org> <b82f6079-b349-487c-9e9e-a836933dea34@linaro.org>
 <CANdh5G5T43sS7wKxgkUGUgKcqSdeZoVTHWiC5qU9SKvk2Mq4iw@mail.gmail.com> <8bbcec57-b542-4513-b59e-eca9d22f07ba@linaro.org>
In-Reply-To: <8bbcec57-b542-4513-b59e-eca9d22f07ba@linaro.org>
From: Zichen Xie <zichenxie0106@gmail.com>
Date: Tue, 1 Oct 2024 19:47:19 -0500
Message-ID: <CANdh5G4nX_PoRsWmCo1=TzoFA6k--29iJFgL-N_B_0anziAskg@mail.gmail.com>
Subject: Re: [PATCH] firmware: tegra: bpmp: Fix freeing uninitialized pointers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, sumitg@nvidia.com, 
	linux-tegra@vger.kernel.org, Zijie Zhao <zzjas98@gmail.com>, 
	Chenyuan Yang <chenyuan0y@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the explanation and sorry for not realizing the correct
deallocation function.

I found in another email thread that the NULL initialization following
the __free() was mainly for readability but not safety. Sorry for the
confusion.

We are working on a static analysis tool and wanted to report
potential bugs. We directly sent a patch trying to reduce developer=E2=80=
=99s
burden but didn=E2=80=99t not realize the correct use of Reported-by tag. W=
e
will be more careful in the future.

Best,
Zichen

On Tue, Oct 1, 2024 at 3:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/10/2024 22:09, Zichen Xie wrote:
> > I don't think device_node() is a correct freeing function here:
> > 'struct device_node *np __free(device_node);'
> > even if I'm not an expert in Kernel.
> >
> > And I think it could be more convincing to explain 'why', rather than
> > simply highlighting the errors repeatedly.
>
> If you ever bothered to compile your code, you would see why.
>
> None of your arguments make any sense. Your code tries to perform
> initialization, just before assignment so it is completely unnecessary.
> I don't understand why you could not spot that obvious part of the code,
> because this is just C. For obvious reasons I won't be spending my time
> to explain why this:
>
> some_ptr *ptr =3D NULL;
> ptr =3D foo;
> if () ...
>    return ...;
>
> is wrong. You just did not read the code, not built it.
>
> Best regards,
> Krzysztof
>
