Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221D2BE646;
	Wed,  3 Sep 2025 16:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756915947; cv=none; b=qorBiNkdV85vVa2FLVSygbo065HruIeC+3yJ105knRK/MoLL40231kmpNNV4ve+6HtDnDzuwALhy7yc0tD9imqCxdp5Huw4kTdfgHSYrOasWJvK0ZGTknvAcnJKGTYVN2/Qc/pJJHxRgssslw0qhMrmxkxA1o39Mn9QamRK7IKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756915947; c=relaxed/simple;
	bh=c5SrGvIiXz36QZActioetkFJi0lAw1vS03dG6Q6OdRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZuZlq75OqsmqCLxLnbrI/thn29Yf3c9kKxtyoMCpF27tqZrLLvU/sIGBMr1hvRmw6Ll/BNfunfjfa2l27mTrfS4AmWIvh7YeFFYrlm2VwNeTgoCI7xi/BlUwL1dtAfhvXKZbPxMMdRcdWXh6FCWA62D0Cr7gTICZBkS2mgCH+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OknD3L55; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OknD3L55"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3cdfb1ff7aeso77040f8f.2;
        Wed, 03 Sep 2025 09:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756915943; x=1757520743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mSH3Zacp/f+cickpwsilQ+TYRotewL36J8+/+EeU+iA=;
        b=OknD3L55UgloZy3oRTWnlr6wPtZDHSLbRAQ5NS3itNXtw2f0QmRs1FROZX0kZGrKq/
         2jSZeSrKR6S7Mglea6Yegnz965QFyHISDVx5fYOt9eBcP+hPHEJvpP2UEl8ZGgl1Wg7E
         qs9FckFRstH35LY+sPgZSpE+emVokBD2hk5me8HWQJAhRM6GdOV7U77TuARryU6UCkhU
         O2xAdVytUGgt2gGVih/ESDgrJOAoLlfx9tULz1nAp5blET0H9hCYs+9ZaW+lh9ZU1/iJ
         sgeu5CSXssMY5TqoQ6ZsFP19PB1WN/sDxpRdg2Iwi2F5UWSZRaN8Y5s2edjjEAkO7StI
         QSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915943; x=1757520743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSH3Zacp/f+cickpwsilQ+TYRotewL36J8+/+EeU+iA=;
        b=YZCfjt7QD8ad7FY4YRsWbp9gUWYt1w0heM0H0aXbeYYdoEQ/vjGgXN7nIxQ5yHC9XT
         Ti02Raf6pVWfF4p4B9DppXYQO0kqA0eNnHbAEfNeCl+pQfmKMWJbAcpkL0aGVQmEREbF
         wgYmkE0d+g7c6TprzxVNjr36NpwafIxwunFWI5VqV/xyNICWfu1UI+xgPVUkaSt+yDav
         EDHuyUO+QMr7GUfbdOuIxP10GXCjvLfQqDjsdKMTYPOttYe+lMANEPJHl+ObyvQqtobK
         5tEp8mB97gk4OfTOLn99YEOHnp38IhZRXzX5916IPT65D+hLXiac/hP/PGxSR2I1R91j
         L/NA==
X-Forwarded-Encrypted: i=1; AJvYcCVy4E7Hc95mdFNdhxW2HRpvto90LeOKh6h+aEEG/x0FLVygWrE4EFN+LAu3hePpvucOfNJ5lYfnSNNs0BQ=@vger.kernel.org, AJvYcCWeAyOBiQZosUFGTuvTjK7xWXmNLa4CF3DOgp6yJ7IvP8DLJnTURuKO/MZA8k/CQCMV1EE/P9phTCMB@vger.kernel.org
X-Gm-Message-State: AOJu0YxoW88Mw/C1wy2frqO+WQSR0v8TTyIu9I11RURrXa6Dok1b0AKo
	E4QBkCAlvhTUwOOaKz/gRr4ZTIzXJWcbJpYeUUVFJyLQSoAp1GKS9L0z
X-Gm-Gg: ASbGncuty2ihdD34zwitFeCakrWRzdDltBZbXkKTv1bra65+x2cj/x9mC3SlaH2xMmt
	RXk9m/LfrLDZ0CD7U1RZCu2PRmFC3MCW45KrClgdj7GyYdXMZ4tVSNbp+OV8j8rGdVUH9QvhgXK
	Y2ur95dkaw8xEPNTrKU85+asM2s0TzroDHT8+wr7ZpRMSWPFRI8lPwdgclCzPK+giT5uYkYmH46
	t/CD002dKIkU0NJepboksyP25AMgxCNjOfaqUPQnAdcpERU7yS2rex7iMkyErsBiW99a9MfO/+l
	p3ATE4bWtM+kCIu886tGFix5p5Es22mIVoifgJl3Xg3bVY6p/W0j3MTYywx5X/4jAl8GPoiFUwq
	tIlnUu0CGrO7qbrmsE37mOXY+eDKSfH8lDuCLYvadXnLy+0fvV9PXYAKkgQmz16WlV6+zF8sitn
	RVJY2PwKuHuvRwefQyujo=
X-Google-Smtp-Source: AGHT+IHY1b3uufepgZb7f9ysqZmKK+/Hd8xA7Sv2qwFfaxBcYfbZY2Np9JxcRK+tnTw30ZuHhEZrcA==
X-Received: by 2002:a05:6000:2410:b0:3d8:e1de:7e4f with SMTP id ffacd0b85a97d-3d8e1edc849mr6275167f8f.21.1756915943185;
        Wed, 03 Sep 2025 09:12:23 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm23960790f8f.61.2025.09.03.09.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:12:22 -0700 (PDT)
Date: Wed, 3 Sep 2025 18:12:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: Frank van der Linden <fvdl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
Message-ID: <g34tb2ontlnazift3sik5dqs75a7k2bhzo74kknkxoegv4q5vb@jsqo7v6awovf>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-4-thierry.reding@gmail.com>
 <CAPTztWa7kcx8bBEJEKvnjcD4v1-eDLVxMd9C10XiBQi4CDLfHg@mail.gmail.com>
 <e513c127-d4f4-4e93-8d4b-23d1e4fdceb5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nfbiwxgfuwekt25w"
Content-Disposition: inline
In-Reply-To: <e513c127-d4f4-4e93-8d4b-23d1e4fdceb5@redhat.com>


--nfbiwxgfuwekt25w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 09:04:24PM +0200, David Hildenbrand wrote:
>=20
> > > +>> +struct cma *__init cma_create(phys_addr_t base, phys_addr_t size,
> > > +                             unsigned int order_per_bit, const char =
*name)
> > > +{
> > > +       struct cma *cma;
> > > +       int ret;
> > > +
> > > +       ret =3D cma_check_memory(base, size);
> > > +       if (ret < 0)
> > > +               return ERR_PTR(ret);
> > > +
> > > +       cma =3D kzalloc(sizeof(*cma), GFP_KERNEL);
> > > +       if (!cma)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       cma_init_area(cma, name, size, order_per_bit);
> > > +       cma->ranges[0].base_pfn =3D PFN_DOWN(base);
> > > +       cma->ranges[0].early_pfn =3D PFN_DOWN(base);
> > > +       cma->ranges[0].count =3D cma->count;
> > > +       cma->nranges =3D 1;
> > > +
> > > +       cma_activate_area(cma);
> > > +
> > > +       return cma;
> > > +}
> > > +
> > > +void cma_free(struct cma *cma)
> > > +{
> > > +       kfree(cma);
> > > +}
> > > --
> > > 2.50.0
> >=20
> >=20
> > I agree that supporting dynamic CMA areas would be good. However, by
> > doing it like this, these CMA areas are invisible to the rest of the
> > system. E.g. cma_for_each_area() does not know about them. It seems a
> > bit inconsistent that there will now be some areas that are globally
> > known, and some that are not.
>=20
> Yeah, I'm not a fan of that.
>=20
> What is the big problem we are trying to solve here? Why do they have to =
be
> dynamic, why do they even have to support freeing?

Freeing isn't necessarily something that I've needed. It just seemed
like there wasn't really a good reason not to support it. The current
implementation here is not sufficient, though, because we'd need to
properly undo everything that cma_activate_area() does. I think the
cleanup: block in cma_activate_area() is probably sufficient.

The problem that I'm trying to solve is that currently, depending on the
use-case the kernel configuration needs to be changed and the kernel
rebuilt in order to support it. However there doesn't seem to be a good
technical reason for that limitation. The only reason it is this way
seems to be that, well, it's always been this way.

Thierry

--nfbiwxgfuwekt25w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi4aOMACgkQ3SOs138+
s6EWag//TG8GKL8D+KtYbrfxxwO/AEt7PxS9tKNaQ4uX/W4JVPtJSVqumPpLlATz
kSWcKAk8uyNWVRifoC26e2FU+eTup+VsLHQK/3g6/EEv0rt/jn5mJWu91ckJuH+N
nWHOeXCqeuGYN01d2wYby1PZ6Mtvbe6PlBifyLpvoAsUpN1n4HvE1CWu45gZIR5d
2WqzOWqLtDf4dyhpPKzu3xwXMgms8SyLEY64ulTMjg02QvIFPhJ/EN3VMs20tuX7
1UBiq4yw7ylaSoKAUdFEB9sOq4tpnoi9YY9fgoMhnCvwP5wZFwKbqYIhfGqzEGWo
Yad3Oba0P1qxdCFeOabbitgjRtZQO8pJNfGuJImpP4fE8Bz547KcSbcORfZvu16h
lJENGR4OXALHeSbgAELkUWTBnxAEHs356KGRoIxOarNda5xvFHp9joOODPz5s/j8
kIeQjrt23Vl4uqqlzr2n8ZwIQY6Whc2OuPnY/1/sKenSXKrqnfTudaRnsPMFQXPQ
ae+Iq9kecL40EJmZx03IkKwsxZ1dqfr4h0K9cQRa+mj5Xg+1TXfTXfcsaDLiqZeg
a1sQbf3ZbKYz88yJmRp2UrbJMGkqjnuwvvD2MkLtxqTS2pIl/sUGx/ltZDu592uU
dfOddTVrqV/MBj0YtLFpU4cFY/4pdIkqP01sN61Bbn+jvYFcceA=
=8yPm
-----END PGP SIGNATURE-----

--nfbiwxgfuwekt25w--
