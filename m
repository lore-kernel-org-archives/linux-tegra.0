Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FE0129A74
	for <linux-tegra@vger.kernel.org>; Mon, 26 Feb 2024 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708956276; cv=none; b=GYE0KI/vy51SYyJZ6vCBsYozgZcpRHfWIbKheJ8ugi3XE8k/sYAT7zzkGzZq/hLNy1LkNKK2nwu9+LmaBxBYUiMzXPRdazjibVslwWsLLreC7TBLVgCZ12eiX2KSmXdrk3MufpSdHHGwmCPeMLpLTkJPnkkxdLhpHQFIn+L677E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708956276; c=relaxed/simple;
	bh=MV88xQYTBP/DgwbU2EV4eVXGMtITc5XggDZp2Alcw0s=;
	h=Content-Type:Mime-Version:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=IlhhlLRanxwjW3soWGjlbtBzM2a987E5c7eSwTqDpaZ+GECHFvuL3xxhaKo6/w9vv9qC+At0LsTkPfXtHP+4CeFZ86v6hXKbq5YeIWKBJ5qfr55t8EQyG4eXQ/cDHBgLyYsdiZXWt3WgUFpuxTwMdy8ne3dMpqOm4GG4vd9lwqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml+neA7X; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml+neA7X"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-563c0f13cabso3984927a12.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Feb 2024 06:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708956273; x=1709561073; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tAiN0detzWZ3hHmBt5uFja5IC1NM7+otJ/WL2NRqHYo=;
        b=ml+neA7X9OjcYVswt98siN4VzD83McOnLKtecDM2cLKaZ1i9RUMSjUv2LTqLX8kPx0
         FqE3bieLt7DubonUIo+kuGF6dXLg3D0xpO+H06Mt1uheTIDKSUMu9482Z1Q24L5t2+Zj
         VITFsE4pOFfhXWcVXOKFpw9wIQKj94NlXgpAAte/tg+GScrYVbt8OA6DcmZJg8z/wywM
         ditGJ62tA+PfmMY5vFf3PZ5sqIaXaD2YPRkNUCgRcMqvegNTF8Y9XZ6fCJuBQ2uvgql3
         0h+zL/pMKt2P5e3oEsZOCZ+O1DqjZ+MLgwouphpSeOM19/tBg1KW7rpfsrTYQ3w3KAFA
         lb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956273; x=1709561073;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tAiN0detzWZ3hHmBt5uFja5IC1NM7+otJ/WL2NRqHYo=;
        b=kbIFht2i9Rl7B3f/DkRFGVjoOgzT0FU6DzDTYMx+o3aqiSU4fhYhdM/7833g+yu4Qp
         /X1uSsbqJUv2308HXRGD6rxUgHxqCXoFP3aLms8uN/iL0DolOAAJQ/bhpUGNOz7zHU3b
         cFrJTLbdJORAJRAID43iPwRD/Ui5yG2qJhnGdHQjFzF9luxfRQEe4PWJZ9hEr5FLqlbb
         KySUuY3YNePpeEdDn+5FOVrNTZXSs5c6OwrlqOW9r27hqgJzGY35vwQhlktAbxnfs0+t
         55OWulHyRIExXfyRg3wowLecCnQ4ylLX/edVpyh/8iFxMU+K3BhavVBOggvMz0io6EGw
         /6yA==
X-Forwarded-Encrypted: i=1; AJvYcCUsK8+P42P/sYFp2WUPbCIRyGp+CSIpgCkinLW7jadqbkIyBTRN6wgf+ANSwGX0rq/ixrtkEfA2RnGk6wR7jk+19mdSUVPv9MQZs24=
X-Gm-Message-State: AOJu0YwhcNPcLXq8rxvG0mqlICdnlvmERPUhi7Qwua3e5u3OhVZ2ch6Y
	5wx47Co3I9Zc9PPrs+aTfbzivWLANgSOAbDY717EO5We1gZ1WxIl
X-Google-Smtp-Source: AGHT+IEI/VOZwZG+uUCEpb3XjAbwgzrT73wyba5zBMiTXClBxtfyLvOkEpHrmbHUOL6NxHjkY0ooLA==
X-Received: by 2002:a17:906:3609:b0:a3e:f00c:ee25 with SMTP id q9-20020a170906360900b00a3ef00cee25mr4143311ejb.25.1708956272948;
        Mon, 26 Feb 2024 06:04:32 -0800 (PST)
Received: from localhost (p200300e41f222300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:2300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id vx10-20020a170907a78a00b00a42eb84c7c2sm2433810ejc.142.2024.02.26.06.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 06:04:32 -0800 (PST)
Content-Type: multipart/signed;
 boundary=21fd96626809da916ba0f390cabfbc1b4443582b04b01fefba0f3fde58c9;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Mon, 26 Feb 2024 15:04:31 +0100
Message-Id: <CZF2FT4A3ZT8.1DMY9VF0YQVKU@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Robert Foss" <rfoss@kernel.org>, "Javier Martinez Canillas"
 <javierm@redhat.com>
Cc: "Thomas Zimmermann" <tzimmermann@suse.de>, "Jon Hunter"
 <jonathanh@nvidia.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2] drm/tegra: Remove existing framebuffer only if we
 support display
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240223150333.1401582-1-thierry.reding@gmail.com>
 <a6e73f3f-9bd6-40c4-abfa-84a22de07c23@suse.de>
 <877cirpidw.fsf@minerva.mail-host-address-is-not-set>
 <CAN6tsi4b+77udoHNhKjo8PFo9hdgrPYPz62D3f+rBqqw4Oymzg@mail.gmail.com>
In-Reply-To: <CAN6tsi4b+77udoHNhKjo8PFo9hdgrPYPz62D3f+rBqqw4Oymzg@mail.gmail.com>

--21fd96626809da916ba0f390cabfbc1b4443582b04b01fefba0f3fde58c9
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 26, 2024 at 1:08 PM CET, Robert Foss wrote:
> On Mon, Feb 26, 2024 at 12:36=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> >
> > Thomas Zimmermann <tzimmermann@suse.de> writes:
> >
> > > Hi
> > >
> > > Am 23.02.24 um 16:03 schrieb Thierry Reding:
> > >> From: Thierry Reding <treding@nvidia.com>
> > >>
> > >> Tegra DRM doesn't support display on Tegra234 and later, so make sur=
e
> > >> not to remove any existing framebuffers in that case.
> > >>
> > >> v2: - add comments explaining how this situation can come about
> > >>      - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits
> > >>
>
> Fixes: 6848c291a54f ("drm/aperture: Convert drivers to aperture interface=
s")
>
> Maybe this is more of a philosophical question, but either the
> introduction of this hardware generation is where this regression was
> introduced or this possibly this commit.
>
> Either way, I'd like to get this into the drm-misc-fixes branch.

That commit looks about right. Technically Tegra234 support was
introduced in Linux 5.10 but the first platform where you we would've
seen this wasn't added until 5.17. The above commit is from 5.14, which
puts it about right in between there, so I think that's fine.

Backporting to anything before 5.14 would need to be manual and isn't
worth it.

Thierry

--21fd96626809da916ba0f390cabfbc1b4443582b04b01fefba0f3fde58c9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXcmnAACgkQ3SOs138+
s6G7GxAAoGo5C81PAEchitwz+i2g1btUbe/YFjwV0DcgY7hFm9S7f91RcPzKP3wE
G0BcpmT4hYwEOxJzoz6awk4O6P5riWUXGzwuiSSY0FYbKU3WGJfVsQJ5gRsI2Y9U
n2+xwCn8XBQwfoWk9yGWA0ngOGxEDlehhWZpfJ/cUGu+6c7FHrNF0MSNJy2BKseZ
05/pzfZLkR4zOw/5yQg+RPGOwUqyuOeyeD2KHHCE99Pzm8XdnMs7rkfjY6/W6FGr
EY9vkkG/9yK1Vh+3/3Fn7DEnVi5ToOzby/ckRL3SYs+LHRyIjks3NjqX3eP7fOsp
eYxv6RmZ8xlQ+EBoZP49i/ICyVinkjsFu9YLjwYFZSC7x9oCkQNaGmI0uPxr96ab
kAS5fSDJZKNtBSLZiFyxRiBKFBMCu+AnERYK9dfqfEott+txmKyWQ2smAXQBtYNp
q9CY310+/RJH9bNQf8Xr08c41x1rCm8usKrN8BAJ9kMryCUmYz4RDYa8vFPeXs8w
87mc3LhJ2FYkTs5WhkG1thYUQ8gWm3yKmVj+2ahr2QVCYIZFPT0WxtrCfR6eeNrE
/tMIy0jzVCGzrcjumWGJlshpOzHn6wVPOFkzvhu8WxIk324U9Y8iVfwzBu5Zuq02
j9aMrfk9JZQq8ONiHVWjCPBWFhuASQitLnr60JIubLCTQ4DNhTc=
=QwiT
-----END PGP SIGNATURE-----

--21fd96626809da916ba0f390cabfbc1b4443582b04b01fefba0f3fde58c9--
