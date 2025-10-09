Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C71225A38
	for <linux-tegra@vger.kernel.org>; Thu,  9 Oct 2025 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025926; cv=none; b=DSYtPEN+j0RVT1c8Kzvrpze9VYDQNYHs3AtVustScb4n4yUhVzbeyh4lwvAQo/e950AsS0OWZWgQTw/VF0aOv1sa+dceptmeYBscWVa2laD1dJm1kmBAI+WtTOtulZR44ZUeIOTpql405hInWUE1XlXdaXa7VoEax4BzawAHQnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025926; c=relaxed/simple;
	bh=unAvA+RbShXheJ36o53ulWGdqzWHeRH1pf34YmMcgVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7HOYGd9VSvK0ZZprFa1+AkztgGpOoqculsTjtk8MIZyTUbpUZ69LsijzbJFqZolAUf7EyvRhZHI7H7JIBe6SEEpWFWjUqefCkRz69jsLwymN0EfF/YWgyb+zU09zm1DKIei+Fb1BCpFva89RHvzpUbJkIiJ4BSE/PwZ23j+Sfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifOsoQ9B; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifOsoQ9B"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so729726f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 09 Oct 2025 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760025923; x=1760630723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=re2LVHmQYfMPpDvoOEi22gcukJgsAd89KFwqYXVYUWo=;
        b=ifOsoQ9Bjt0E9HV5CtTQF+ZqSx3hysVQiNevi3TI9H9w5qZzA8TMeGO3gl9F1EvTXO
         p86QgtzUsP3dLvu9U7vFtcZMpqN2ldZkWXW7vLL250XLA18zsXL8uC1ad8rc4r3crRGB
         JptGFD6kps0yY1rdYcmfdIQjsohGofx7pWs///Tbsr1a8FFQ1/DrXtAFmG1WqMN1XFAX
         CSbZ8WubFZGQO6JEBTY2d8k88nj/xdwAb0f0wm0bU2wgrgmaz3CRlN2rHIJjhg1vF2XT
         czADiY3sAvSgXhELP5O5HVSa5gJYHF7ngTqAy4o4Jy+99kknUxlAEnTomo9L2XaMboUx
         p0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760025923; x=1760630723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re2LVHmQYfMPpDvoOEi22gcukJgsAd89KFwqYXVYUWo=;
        b=t7lVITz0QDlxggaN1WjWRtfmHlfTYd/kb4uD7Db5mP35iAwNF9IinN+6OU/Bgk3pK7
         68ozA7Cz0joo0zfzDyR1wqV+DiikXWCFkDXETM9vpsnmZjvV3okFbuXMOqEOHYFReJvp
         8cG7xdh3WxXnRB3T4pMTWnXZty+ANy4przoegJ4tWk5cwaycCdhfZ6Jg+Do2zYulUa4U
         DsQwbyWFTl8a2rm5/0m2UytklInizF7z2JAr7wsFaDqCN4lhaypcoAOgIZDqonuMR5Dq
         sIH22gygWIap5m8ZM/8bynDKoi95X7jU78UgyRTdfHjqpXc0DjXoH+8rqFavtt7iQPOR
         goKg==
X-Forwarded-Encrypted: i=1; AJvYcCV3AOadvwuAM8q9U6g7BGzzHLxZ4sZ7gPbKuaeIANO7fThlnYY78bMJZABL/6pD6kKI0tayesrUwAkuaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgArfLPIisYinC6UXCPCQUD6pBCI54iDURXlZm3+m5ulAeAzSs
	nBOlEo+qdQQkJJ/u/IfvofBZQihLXVWLOpFK6uU+StRoRgEpcwPTNyLw
X-Gm-Gg: ASbGncsEiAXOogw5XkpC5JQG5/a0IuguPqM+LBXHQbaAIB6MUWAiIV0FDreAt3cJ4W/
	iK1Xud6J1yPtocGlmYyFTFxPDWerUwiWjtGyE7fkHhrTwckvmMPkPs+w3aLLVIpOI8xzxdEnwab
	CXB9CSswzkAQAJLjU/DnDwmE+dlzP48k2TVDuw7LzeFRWS72X1uq7WSmt+8zl7sNIrnPHd4cbwz
	jyE7dI6f2S+D0dN4RjT7kkwSQu+fqHuUDA/8OCXmCwcCWw+H+uwcZ5xR74DaQZeD4JO9pwfDEK9
	lHyTZV1ogQqquAYWLh/bc9wT9J9qCmAg4VBxYgLJ/AQcxk3w8ARxC4Ac6efuAQMjrXwA4rU51Pw
	lzr0wVkNkFr/4K9jwhda0aTwOIPy+BCtOaGqGdtj50BfthSob5cf0ERh1YfgQ8r/beuubuNUVQW
	4SdC6UCWRZb3Er4fHfdDJ3K2XWf3lDFvjjHg==
X-Google-Smtp-Source: AGHT+IFOzFZCAz1bvnO194N0WES7OEH7GfUA/BRjdohTZijoPsQbpfZni9sA7IHmHQ3LMF15FxD4jA==
X-Received: by 2002:a5d:5d03:0:b0:3d1:6d7a:ab24 with SMTP id ffacd0b85a97d-42667177c28mr5473434f8f.17.1760025922451;
        Thu, 09 Oct 2025 09:05:22 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426cd99fd4esm30074f8f.42.2025.10.09.09.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:05:17 -0700 (PDT)
Date: Thu, 9 Oct 2025 18:05:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: IRQ thread timeouts and affinity
Message-ID: <loeliplxuvek4nh4plt4hup3ibqorpiv4eljiiwltgmyqa4nki@xpzymugslcvf>
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
 <86qzvcxi3j.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ytjgx34t7yap2p7t"
Content-Disposition: inline
In-Reply-To: <86qzvcxi3j.wl-maz@kernel.org>


--ytjgx34t7yap2p7t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: IRQ thread timeouts and affinity
MIME-Version: 1.0

On Thu, Oct 09, 2025 at 03:30:56PM +0100, Marc Zyngier wrote:
> Hi Thierry,
>=20
> On Thu, 09 Oct 2025 12:38:55 +0100,
> Thierry Reding <thierry.reding@gmail.com> wrote:
> >=20
> > Which brings me to the actual question: what is the right way to solve
> > this? I had, maybe naively, assumed that the default CPU affinity, which
> > includes all available CPUs, would be sufficient to have interrupts
> > balanced across all of those CPUs, but that doesn't appear to be the
> > case. At least not with the GIC (v3) driver which selects one CPU (CPU 0
> > in this particular case) from the affinity mask to set the "effective
> > affinity", which then dictates where IRQs are handled and where the
> > corresponding IRQ thread function is run.
>=20
> There's a (GIC-specific) answer to that, and that's the "1 of N"
> distribution model. The problem is that it is a massive headache (it
> completely breaks with per-CPU context).

Heh, that started out as a very promising first paragraph but turned
ugly very quickly... =3D)

> We could try and hack this in somehow, but defining a reasonable API
> is complicated. The set of CPUs receiving 1:N interrupts is a *global*
> set, which means you cannot have one interrupt targeting CPUs 0-1, and
> another targeting CPUs 2-3. You can only have a single set for all 1:N
> interrupts. How would you define such a set in a platform agnostic
> manner so that a random driver could use this? I definitely don't want
> to have a GIC-specific API.

I see. I've been thinking that maybe the only way to solve this is using
some sort of policy. A very simple policy might be: use CPU 0 as the
"default" interrupt (much like it is now) because like you said there
might be assumptions built-in that break when the interrupt is scheduled
elsewhere. But then let individual drivers opt into the 1:N set, which
would perhaps span all available CPUs but the first one. From an API PoV
this would just be a flag that's passed to request_irq() (or one of its
derivatives).

> Overall, there is quite a lot of work to be done in this space: the
> machine I'm typing this from doesn't have affinity control *at
> all*. Any interrupt can target any CPU,

Well, that actually sounds pretty nice for the use-case that we have...

>                                         and if Linux doesn't expect
> that, tough.

=2E.. but yeah, it may also break things.

>               Don't even think of managed interrupts on that sort of
> systems...

I've seen some of the hardware drivers on the Grace devices distribute
interrupts across multiple CPUs, but they do so via managed interrupts
and multiple queues. I was trying to think if maybe that could be used
for cases like QSPI as well. It's similar to just using a fixed CPU
affinity, so it's hardly a great solution. I also didn't see anything
outside of network and PCI use this (there's one exception in SATA),
so I don't know if it's something that just isn't a good idea outside
of multi-queue devices or if simply nobody has considered it.

irqbalance sounds like it would work to avoid the worst, and it has
built-in support to exclude certain CPUs from the balancing set. At the
same time this seems like something that the kernel would be much better
equipped to handle than a userspace daemon. Has anyone ever attempted to
create an irqbalance but within the kernel?

I should probably go look at how this works on x86 or PowerPC systems. I
keep thinking that this cannot be a new problem, so other solutions must
already exist.

Thierry

--ytjgx34t7yap2p7t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjn3TcACgkQ3SOs138+
s6G8yRAAv041zNcMgGZ0avjjb7ZaT6br0d8spAZRKqEUblfT6ypcmLRDIdQikbIJ
7l+LrNKGk0onNtvCoGVuMqdc5HWEpYc+ur4eu2DGX6qFcrTckGZYDNJRwgmSc8LU
mx2xRjZL9+8p1p/ZJ5ZtCjS0o2A6SkxHPCGZmU586GHNvdOyzi5mj8W2mL5520c9
W/GiZkPYJmNJOz7XxxdfENmx9UDbsBlw98mEWa/4WX2vNpqwjjx6DvjqEZbLd4L0
SuN/+ptQJ6rdGEosaWnurFUoEuAJP6kwQFeYrs6eEEoG4SAheVMCoBsXtU2S0aME
ZzRLjDOdlgjlJBcBzeEMCN5KE4u13rni8DmDfp+mvwlb7GOxaVDkMKUXty10Z1bm
Suu9F8w0dkyMdIVHPbxYDYV5UGCLRB23fTVgeJ8XnAEgBviinkoiZiBkpAZ/mivm
985PDzT8AB2RLsVdb9E2k6pwlD1ShsCunyssQHDj3QqfhKv16QLLyEFq5agJ8mJ0
Au6aDjn4d2NYERVvUI3RoCeogRvfk8vVdiymMxoV+jdwxvUYzoHCmAcNHlCyzoFe
jYeCeYyEIEAYKMg4zSofqW2+EqYvMmQ98PK0Vt5Mh0yhsFw+yoL7dwWJbfFQgvBa
DWj6h+sChHu5/hq/rwXkBS8xiacKru+DMcjCRwz0k2iMPkAaVM0=
=N60K
-----END PGP SIGNATURE-----

--ytjgx34t7yap2p7t--
