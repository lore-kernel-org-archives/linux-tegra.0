Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E594F30EF6B
	for <linux-tegra@vger.kernel.org>; Fri,  3 Apr 2026 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234209; cv=pass; b=Cvu41qJDxilHsWAUXlrMiO7rur6mUpPqaGvtR2HPJ1Y2Y2dcxgUutws1Ptt0iMCO+mwdNzuFirtdt0QLXAdLUeiSmlv180oOyGZ27V1+/I3UwXBbckUAN8E5yZrhBsedGXq6I9JSCFdTeBgfAFD1h5XSnhCfiZa7kKGqaryysDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234209; c=relaxed/simple;
	bh=mhIYPi+ZTj650hQKyeIbVrsNYbY3op5BHueN/8Cl9Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIEbs1NDyW46ZhknENQ2rPQjUnoC3qF0FTgSw2iYiXSRCnwNguUGJ2TtmdWb4r6SbkdVh80ldtjMr8bW3R+sP9m8pwoBM0OFcibUAN3yqyk+cRBLCzRqgMSVLy6b2pFALL0gb7vSH72v0wsU48rzVAcBfE0oBX28q2SwYb7/MIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ky0li6vr; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ky0li6vr"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6836ab45de0so32315eaf.1
        for <linux-tegra@vger.kernel.org>; Fri, 03 Apr 2026 09:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775234207; cv=none;
        d=google.com; s=arc-20240605;
        b=HVutfWZD9fETMb/3d7optDVHqqDbM4KsXa/WhT2IswP5a8J39DmDWmKWixNDnIqIhI
         5yVKDkQTZgfl5AO1NYKyzlIv402VYrNry3K0WnlPXw/lbT0uYpkA5noqECqWaUX/cLqP
         QGy/Q9r7ctF/b0xG7r1KxHXnWOkngoo0pdQOUkxQhzf+T6g2QJJA1lkGq+3WB5z4ZEqz
         MpQRQtcvvkhyhowSu5LOdm0L/eemFIOex0pEE/zJdWfsNxMAv0b113weohNvoHMLb7uc
         rUSzTqsHQFegw19touvbcw29PyfE+kQISp6fpqe4ygVSK+uisBBW48RnD80ilQsyDHkS
         zvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mhIYPi+ZTj650hQKyeIbVrsNYbY3op5BHueN/8Cl9Xs=;
        fh=nPahoowW49gmYPlCGq/hi1mG1PsFQgfmAebmOCeb518=;
        b=dk+aYIT21Ed0QEW5gfQD3qhvjbhpqvR4qRDHuGi/kx3r8Uh2qX3QeWc9XqJmDanL7t
         WIybvXRicnhyaCRHvCaDYGuvruFgr8OD0kr8UfA2T5uFNqlO9NbEHhHlpIdrTH2nOWpE
         UlzXibJe0jgMzcoZwFR/7ZHJw3Rsj5v65DJ77SFm1LMRcvQB5z6Qz5hKcVUhupDOM8dl
         iAcads1y4xAIsNQVHlYHNlqQJwuTwtW4gxFRGJAw7C1Zzzls2LGwRTUIoj8pYx4ReaNO
         f6JuPbVOuIVJwwSnFGLfZ2pWJJ5Z3jpm1un8mQCfhP/QwOgqfDiHAbMv9BAQJAnch8g/
         v0Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775234207; x=1775839007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhIYPi+ZTj650hQKyeIbVrsNYbY3op5BHueN/8Cl9Xs=;
        b=ky0li6vrd2pYiGVkSaMFBf7mfkcpE93MZ/J0rRq50oOw38Aux76GJbxTk+hczSxbKg
         2sBqh05nGYid0jRDIQJTjihDRetjxLLJvX8pAvKcw2KHH3nn3yFZlt4jyS5nNKgeqJdx
         jgnbxig6Do3Cy8Ff/ZWjK4y1edRtu72jfGNoRim2+2q6i08CJfeZXEh2fyOxdEO+WdY3
         v7gRP2aK9fOyhGH0Tv+Slg1No9RwJlDv8YAjajPLLD0GbvN1JLWknp6lKSJtbxOE4ijF
         buR9YWKhCKtVKAnWtmDQylLjGkf8dNo6wDZ9RJyxSTraJsJ4EQAfqqdB6KCqYtDIHSoK
         Nh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234207; x=1775839007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhIYPi+ZTj650hQKyeIbVrsNYbY3op5BHueN/8Cl9Xs=;
        b=XxOWf8rT2Bpc5k8qoL/XrLEkKgs1KvEZVPYOoE8qb5qlm5fuAhsBuJZwZS85llF+86
         XsihehL3FvF3Qg9wxyo5TmM76qE5xLYu1FgE1694VHQGcNY57qMg12jjw0E3yk1QU/Bf
         aj4xRBYroAeUpUZJgTLeP+DDJq/7ml8qlIAjRXYbQcvSYmqHS20FJ94DYYSQyyMikzCx
         NmaWEzfAZmjC82mHunj+6uRu0AD6C91Js/gt1TY9AlTClf0qWB0IlOW66o2g+YG2+vTy
         G4PcSU4JqcOSd37RkoawsIMAZCDIJts2vLp9NPKrqIxdgyx+gpradlwscrCK0xtFFv4f
         hy5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV27C4KI7EwXHEFJmBMPnp1TfIJwuKWa4aYzcGNKZwPtBXa0zOpfbB4kp4fXZbPq9MtpLUpydJEhRecHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7y+936z9POkC+pL1BJfvfotZkVp1cny9cruaGT2uVZpTeOUa/
	FuTu+41pTZ6UYUM4ZRbU2Jyeqe6bXs1KoesBiTHPUjUo0JiE400h7DSMDgpOp1uYycBNufs4Jzk
	JBruBcZXVjKp3DvjpjXRUgAXa0JMOVz0=
X-Gm-Gg: ATEYQzweAaZpniToq1jZtsSlz2zLC7gZ/LvbED8kOxRuU/TMjLJ1EY1whjykqSn1/ST
	FzooHrKgwN4xAzjtqAOY7574bYgruMJtCinWg7AxacJCVhdBS6RxUMb0X8eO+jbF7UmTEucnyTY
	PmMWOnSDJJfIiht8jPaCDyRe+kQPz6ouQzsGj7Ln5792aa9yKtZB7XdKYtJ15LnTWlQqozBM4pE
	1qw0rGmV7oD3hYVpg6zl/OyxUkYVul/0AnVe6pvqzoLgQ292pYRtkfcCOft99RB+ldttEly5B9Y
	60VZ4NCk
X-Received: by 2002:a05:6820:f023:b0:67e:1259:aac4 with SMTP id
 006d021491bc7-6821d747f8bmr1924347eaf.26.1775234206887; Fri, 03 Apr 2026
 09:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABb+yY3hYcJ82QGor3w5KKHUGz9Pc1k64Jdf-94E4Yvv0DTeyQ@mail.gmail.com>
 <20260403151950.2592581-1-joonwonkang@google.com>
In-Reply-To: <20260403151950.2592581-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 3 Apr 2026 11:36:34 -0500
X-Gm-Features: AQROBzCNnfUiQJss0MRPovDqMc4MnIhdZ3NJ2hHQRVK29Ar7Ti2BAIx3xKRl0IM
Message-ID: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
To: Joonwon Kang <joonwonkang@google.com>
Cc: angelogioacchino.delregno@collabora.com, jonathanh@nvidia.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org, thierry.reding@gmail.com, 
	akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 10:19=E2=80=AFAM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@googl=
e.com> wrote:
> > >
> > > When the mailbox controller failed transmitting message, the error co=
de
> > > was only passed to the client's tx done handler and not to
> > > mbox_send_message(). For this reason, the function could return a fal=
se
> > > success. This commit resolves the issue by introducing the tx status =
and
> > > checking it before mbox_send_message() returns.
> > >
> > Can you please share the scenario when this becomes necessary? This
> > can potentially change the ground underneath some clients, so we have
> > to be sure this is really useful.
>
> I would say the problem here is generic enough to apply to all the cases =
where
> the send result needs to be checked. Since the return value of the send A=
PI is
> not the real send result, any users who believe that this blocking send A=
PI
> will return the real send result could fall for that. For example, users =
may
> think the send was successful even though it was not actually. I believe =
it is
> uncommon that users have to register a callback solely to get the send re=
sult
> even though they are using the blocking send API already. Also, I guess t=
here
> is no special reason why only the mailbox send API should work this way a=
mong
> other typical blocking send APIs. For these reasons, this patch makes the=
 send
> API return the real send result. This way, users will not need to registe=
r the
> redundant callback and I think the return value will align with their com=
mon
> expectation.
>
Clients submit a message into the Mailbox subsystem to be sent out to
the remote side which can happen immediately or later.
If submission fails, clients get immediately notified. If transmission
fails (which is now internal to the subsystem) it is reported to the
client by a callback.
If the API was called mbox_submit_message (which it actually is)
instead of mbox_send_message, there would be no confusion.
We can argue how good/bad the current implementation is, but the fact
is that it is here. And I am reluctant to cause churn without good
reason.
Again, as I said, any, _legal_, setup scenario will help me come over
my reluctance.

Thanks
Jassi
