Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA38154C0B
	for <linux-tegra@vger.kernel.org>; Wed, 23 Oct 2024 18:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729708536; cv=none; b=Td2dKaQkRCl/2oPlMs2eOaJDuCXyPbFyfTfMHvDbNHNtWJDuYEdlEPbicF7Qjas5OYRjvL9Jr7iuL6GudhRAgSIb1nOaSQch97SfE2CHbaReGQmSyZP88l6WHt7H8NN7qHYwDlh69/NEjN/EX3KZtKV2JY2egDejUeAD/wZ6ej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729708536; c=relaxed/simple;
	bh=0L6Fo4K9NgHv8i5PCQQ4vyQlOs5FV8m8/fYvg1PUNBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXem6RY53INW/BedLGtsa4MAIsw8rK/5x05m4O8s+TphPxBuL8rH7t0c+eSPRtXdwwG7XRp6ArUl5xGasOI6jvE3t0dTpbBOek+LZecdw0O+P3IY7U3Dx2rT7CpErGWtRRR7Cx/yToJ4ln8ZSWiVNj2WsAEKgdyC6rPpqQ4X7JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ST1fwlEw; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ST1fwlEw"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e93d551a3so101413b3a.1
        for <linux-tegra@vger.kernel.org>; Wed, 23 Oct 2024 11:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729708535; x=1730313335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATgprlMjNwxjA4AVQDhwpKd/NZLVQH8yZorXHnRUkTg=;
        b=ST1fwlEwuJKYhnUrgwu1dJ4pfFT1fZgOcDjBZHR/6P8Aaj4J6ID0rYestVTeielwFd
         XvLmdwtWLtI8ODFH7xNKjkkJ9NOhoHyUI36E/8wKeLbMDZXmgcxEuPzuyJayZVq3nkdZ
         x7qoTL5/6ozJ8WYu4Q2inUHAIQE9OOL+GLSayEe07rJqTQ693tHnJjyxFp6N2o1FCqK5
         55FCNq20f+OjTX50BcjexENAFxyhOah8jVArPD0HuxUKWPxSGy8Y3rtTpwEQHj3a1dK9
         zF1p5xwPfyLFSbGAOagi/9qYw2NuUFrPPb3OxeCfBxj8A7nOmxl3ZLt2OO/WWCo0b56L
         9K6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729708535; x=1730313335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ATgprlMjNwxjA4AVQDhwpKd/NZLVQH8yZorXHnRUkTg=;
        b=Mk139LQj4m76G5fDlD36hZpU3TXg2XUrgxBeIVY4TuDxCyXuWF1y0ll/HuDOkJOq0f
         qZ8XkKSkyUYA8FF54KmMn7GyzkCeBFLwj+hfO6Ruz0WwS5xzNvK+Mrwn4H5ssvx1/Pl5
         yXSOGuAFVt8RpO+sU8WNdCNN/Eeq74fqR38buy69HE2J8drDOjlCMCom9VaTF2lETYIt
         k5kYBxCkx8egCXwOVVF/mfusxfg1sdk9NRMKIamH9EwSUEwk+XDtOAohuA2nvPTtWkwU
         TxCLr1Q7mlOZ5nm7LcEqD1L2gbNVtDfY7fy5TB5ySkz+PPrnIUnR1DhquIOYOJHgQ3+P
         CUYg==
X-Forwarded-Encrypted: i=1; AJvYcCUO4EOG08KazryRcoym5q/LriNU+KdnPWqGTr+pJp1kYOziIdVfljFwOpKd1qFuFnKMzBo/Fn16jpqIyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfsPUODifT7094CzQs9vFLNpDt4GAtLAJmqiHIZrHug9Vsq95P
	gwrHD0ztWN5yWkWS7IJKgosj3P08LOxuRW9hBntWOBJUoxCnOU+Iu00WSV/64QuhQTGCVXnRAT2
	Fb1DFqBHaUt/UCovm1xYuu4pg3ZxWKK53uyDA
X-Google-Smtp-Source: AGHT+IHCk1cGUQblCg9rbEUgLXdaWwHY7jPL5QNMQ1Vd2wUFsKZFfhKwZP11vdfLA9E/oL106yX09If73+c3EjrEwfI=
X-Received: by 2002:a05:6a21:1519:b0:1d9:77a0:20c7 with SMTP id
 adf61e73a8af0-1d9789e7227mr4317904637.0.1729708534347; Wed, 23 Oct 2024
 11:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910130019.35081-1-jonathanh@nvidia.com> <2024091152-impound-salt-c748@gregkh>
 <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com> <2024091627-online-favored-7a9f@gregkh>
 <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com> <CAGETcx8E9FddpwMO4+oqeEc0RVMLbUOs2m+=B900xzrLvEkSXw@mail.gmail.com>
 <2c42677c-5e8e-4805-b6a5-0a5baa3e55b5@nvidia.com> <d9aadede-dfac-410a-b65b-e295c9a64951@notapiano>
 <CAGETcx-_z4hxyNSwT-D1MKNzAjOGSX+o7x5G8J0KkiUyy+RkDQ@mail.gmail.com>
 <8b4723ba-fffe-4616-8055-02a9cf6f2894@nvidia.com> <f979aff2-34f4-4f6d-bb9a-03a02afc4635@notapiano>
 <5312c3c8-8e23-4f4b-88d5-3962f67da572@nvidia.com>
In-Reply-To: <5312c3c8-8e23-4f4b-88d5-3962f67da572@nvidia.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 23 Oct 2024 11:34:55 -0700
Message-ID: <CAGETcx99h+HzL__E8w5VWgn9NrjdMk3KAdeijJXmdDF6fm7NOQ@mail.gmail.com>
Subject: Re: [PATCH] driver core: Don't try to create links if they are not needed
To: Jon Hunter <jonathanh@nvidia.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 7:09=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 23/10/2024 14:58, N=C3=ADcolas F. R. A. Prado wrote:
>
> ...
>
> > I'm guessing a similar change to what Saravana suggested for the
> > of_dp_aux_populate_bus() helper is needed here:
> >
> > diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> > index cfdb54b6070a..0a2096085971 100644
> > --- a/drivers/phy/tegra/xusb.c
> > +++ b/drivers/phy/tegra/xusb.c
> > @@ -543,7 +543,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_p=
ort *port,
> >
> >          device_initialize(&port->dev);
> >          port->dev.type =3D &tegra_xusb_port_type;
> > -       port->dev.of_node =3D of_node_get(np);
> > +       device_set_node(&port->dev, of_fwnode_handle(of_node_get(np)));
> >          port->dev.parent =3D padctl->dev;
> >
> >          err =3D dev_set_name(&port->dev, "%s-%u", name, index);
> >
> >
> > As a side note, I wonder if it would be possible to detect these mistak=
es... But
> > I'm guessing there are legitimate situations where there's no fwnode.
>
>
> Yes! That does indeed fix the issue.
>
> Saravana, let me know if you can send a patch? I would but I can't say I
> understand that actual issue.

Heh... didn't know you were hitting the exact same issue. I'll send
out a patch. Okay to add your tested by too?

-Saravana
