Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF01D1E62
	for <linux-tegra@vger.kernel.org>; Wed, 23 Oct 2024 18:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729709110; cv=none; b=uCUWrZgELXt44RfkEtI/FAZc3QqGAkesssv2S4m1WRzIRjWm+7fCqAuJ4e3Nc63VfQvAGqjglBDXoSZw13QN4+oDGi2DnzhEux2yN608+mp8vx+FNEzpuOyVUEBX4frGAvDhRYrJ7z3KU6hVf5BjP9pfQIX22m1bcp9c2bpp5zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729709110; c=relaxed/simple;
	bh=b9NwgqiPijcxe+rH2hf1VDuereYmfE3ICe6f2s34nvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOfrPII8Tkuh/ycZaIBcbsC4TIdrUWXE8q+0oGboPL1zxBchJM+FmGVZAhF3AM7zNIBE6JRY8ameVC0CUqIkuswqreleZ6JGHXwTTVVILBDIb1TvRSWxmgxXmmMlxTHgVxB/uYb9oJNUD5PQqDczAjZ1fFN5GsU2cUlApyTyo0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pS8ItPWY; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pS8ItPWY"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e93d551a3so107572b3a.1
        for <linux-tegra@vger.kernel.org>; Wed, 23 Oct 2024 11:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729709108; x=1730313908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeEzIbcTN9Qo6z/WsUu5E7xET1l3eAfufIwhM53Y5us=;
        b=pS8ItPWYn7rBPNf0Pn1yTxU+SGBds/Njkz/TzwmBkZrTuqU1WsSSTPGQE5LTRb/OYO
         N3CcNuWzvaN8uduvn39yDav8rDnb8XdN3sMwjyYWNVGq//VjD0WNncR+6p1p0TYJmfMZ
         UrwehHfbQGwbJrkp1TZwo+blAu3NWhq8VyxvkA2TW8byi0xmzoZ3AY7VbCoiPhE2dqOE
         93yoVwsEWsh/HFyxd1LDb64s0/5LHqbwgBYy4edUrNAfQ9ZcBfiKF6tJxWCjqLN7j5Mo
         5Ba8Mt6UcS5g3JrSwys2EPu9qdbT9jmlpREkITLTYJHZ49VtPw8dR8KzW6zizn54Innw
         h4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729709108; x=1730313908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeEzIbcTN9Qo6z/WsUu5E7xET1l3eAfufIwhM53Y5us=;
        b=pSJa77hZSXrNGQ6pa9EOMQJ+mU1jm0o164UGbLwTt5Z18Ru544Zb4NWWDMLMYVt0ig
         B2q8V6Q1v7uXpLsNNIgD71wV/MC2khC29rPckvSkhAVMq9oDpuLTdcMkdpqNM7+V2f8p
         SzKxy8utj5zxRGIhwF+zDJ6Hc5SJDDyf4aP81TLJWthdArWy6HSfQDkQw5c/5UUngZL7
         rZpbAKXqe8z0coIX0FFZPa+CvxGvkcsBcYstxo85Auz8TeAnyrpTcEeD01QrsXuge3dO
         PRGyFldqm9ewupny1w75NjJ+kM2UuL3p8ULrhpndZHLWvARfFoj6bnnX4quBPT15moPS
         of9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoEWRwfwkH+DWR1C/BWcfESbG2po9CRykWUuOL2YfTKVjN+M+Y0+8vn92dZlYr6EbmxtxVBKCxiW8ssA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6fskCoAtuUFfvSKppDR1h+ZSM5twIIabGW8PWFibSZq0WhvuH
	koF3MczepJ/uDcO0st9v8v5NbHcJyy3svDA0ecCGnO7r+/qXTKZAPbRN+j25o6Xc/KsS1IxsWgY
	vdGhuAXv/Kc4kzbytbUQdqgLKYuROT19SY/hCRczyEs+nlTN7pm9Q
X-Google-Smtp-Source: AGHT+IERGNFvesrjfkA68h18NkTDtTEV1fRw3F/7aiylrOx6fyBXV9N+orq1T0sVvVFSF5V9RYn6zKm5KrhQxkmAhno=
X-Received: by 2002:aa7:88cb:0:b0:71d:f2e3:a878 with SMTP id
 d2e1a72fcca58-72030b70485mr4902092b3a.5.1729709108125; Wed, 23 Oct 2024
 11:45:08 -0700 (PDT)
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
 <5312c3c8-8e23-4f4b-88d5-3962f67da572@nvidia.com> <CAGETcx99h+HzL__E8w5VWgn9NrjdMk3KAdeijJXmdDF6fm7NOQ@mail.gmail.com>
In-Reply-To: <CAGETcx99h+HzL__E8w5VWgn9NrjdMk3KAdeijJXmdDF6fm7NOQ@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 23 Oct 2024 11:44:29 -0700
Message-ID: <CAGETcx-cgst26+2bRScx7mmJtOmrHzEfg0eVxzqHfQDTewy_yA@mail.gmail.com>
Subject: Re: [PATCH] driver core: Don't try to create links if they are not needed
To: Jon Hunter <jonathanh@nvidia.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Btw, Nicholas and Jon, can you give a Nack for the patches that are
removing the error logging?

-Saravana

On Wed, Oct 23, 2024 at 11:34=E2=80=AFAM Saravana Kannan <saravanak@google.=
com> wrote:
>
> On Wed, Oct 23, 2024 at 7:09=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com>=
 wrote:
> >
> >
> > On 23/10/2024 14:58, N=C3=ADcolas F. R. A. Prado wrote:
> >
> > ...
> >
> > > I'm guessing a similar change to what Saravana suggested for the
> > > of_dp_aux_populate_bus() helper is needed here:
> > >
> > > diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> > > index cfdb54b6070a..0a2096085971 100644
> > > --- a/drivers/phy/tegra/xusb.c
> > > +++ b/drivers/phy/tegra/xusb.c
> > > @@ -543,7 +543,7 @@ static int tegra_xusb_port_init(struct tegra_xusb=
_port *port,
> > >
> > >          device_initialize(&port->dev);
> > >          port->dev.type =3D &tegra_xusb_port_type;
> > > -       port->dev.of_node =3D of_node_get(np);
> > > +       device_set_node(&port->dev, of_fwnode_handle(of_node_get(np))=
);
> > >          port->dev.parent =3D padctl->dev;
> > >
> > >          err =3D dev_set_name(&port->dev, "%s-%u", name, index);
> > >
> > >
> > > As a side note, I wonder if it would be possible to detect these mist=
akes... But
> > > I'm guessing there are legitimate situations where there's no fwnode.
> >
> >
> > Yes! That does indeed fix the issue.
> >
> > Saravana, let me know if you can send a patch? I would but I can't say =
I
> > understand that actual issue.
>
> Heh... didn't know you were hitting the exact same issue. I'll send
> out a patch. Okay to add your tested by too?
>
> -Saravana
