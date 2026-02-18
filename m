Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212583033C2
	for <linux-tegra@vger.kernel.org>; Wed, 18 Feb 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412219; cv=none; b=YE81V/q8xOroQ2Q6VPeJYujiA67eJuJ1dPQMwQ43LdK20T/BwYW/V78xeG7+GCSW4f1o1RzljYH0oY/7kkwbgtjqUfbechEmdtuWgnzCEu6TFscC+Vf5un6u3PtvDAu/KT6rnqjjxEOBqdr3M2RpCdMt1bKVmNFGQnmjPd8rO9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412219; c=relaxed/simple;
	bh=TQq+1P0U/jPyP7dzYbDaUc30sKVyeKQWH7aeE4w65uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6C5bjcqeutfD95UlfCtIvkkdT9oGrFDkZYnGqiRmCbwx+tzx5eFVv+mO84vjkrayoQlfVHuVYpu/9dlM9+i3h3b69QlrMuY8xyh9UYh2Ftm4kKmHpfwcFLLV2NqA/e93XkrQelxX6GKHlBX6BzQs6ssbA0S6CMtVUdrJNXhrJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cU24d4+r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TiUG1oz2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cU24d4+r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TiUG1oz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771412217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g5EhFzRS9kh8aYP/2UGoHhJQm5CJn7dpEnQsAb/ZMSE=;
	b=cU24d4+rQUm2uGbHlnP1g2cSEJgrTg4WyjJfNexcjCJ3rBDQ1yGVHBo0QKRZ7EyHF51VOK
	m6rjaJjCyeJPhiVxPMqB+NN95jNMLeMcxdgEefAekypN308VxETZ8WGXPiOVxUHZ7j9Bwy
	mqUdLzBxddSdCCb4IhZsrkuHBpoCnAg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-86W6-in5PuGmMvXVR7cBZg-1; Wed, 18 Feb 2026 05:56:55 -0500
X-MC-Unique: 86W6-in5PuGmMvXVR7cBZg-1
X-Mimecast-MFC-AGG-ID: 86W6-in5PuGmMvXVR7cBZg_1771412214
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43635708e98so3381757f8f.2
        for <linux-tegra@vger.kernel.org>; Wed, 18 Feb 2026 02:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771412214; x=1772017014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g5EhFzRS9kh8aYP/2UGoHhJQm5CJn7dpEnQsAb/ZMSE=;
        b=TiUG1oz2estUXxUViF+BxA4uMI1OxJWd5TMPlmzWFM40W8DmqcN8h2X7/ydEy+5S4T
         RcjegxUsdb1NdQyMWejQ8jNdQVc+3R70YpTp41uPVek/crK8t6dIhmeKhXuuk7+s9B93
         XXD4GPjhvDxwPpjEPfPLreTOznnmypg848hfhWLaC90YyybjggBed4/Gg82CcSXWUc3z
         c0oWBYGwK4Sbf4XCgZRs/eTQEketZ2EurieQ4P3Vot4QMqRzBPDP25Q9Y19Hr+3Uxu56
         eE/yYkbA9McioMKt7bThMyASu1OYd1uM6QCTauQnnS8uAASwUPwLhK6IAgFmnGAE7Ma7
         qdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771412214; x=1772017014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5EhFzRS9kh8aYP/2UGoHhJQm5CJn7dpEnQsAb/ZMSE=;
        b=bhCryMnevZPtvBrn9XVWphXXYdtVvwb6eXcMjkX4P5YHuYXaY4TaIyaE7gK41UzeBk
         pg1WWLcHeabBRn1pzZ9Mgh0IkX399QbX7Qeujqx/vp7g11BILCXf07PM/g0GAJBUcdBU
         eIPMOL2yvKqydR1/5hFiZpq1cPGXh6DMRCHF0CrtkpHITn41YWf+Cdpl+eH1WzekHdkW
         G+6bMZpIWwdJdY7fb1vcm2+O+dvrl7EdNQChjdDgeJT8zi3O9hGa81MurZuc6mh9+pT0
         sb3W3EcPEExziN8/lFtYcP7Dow33oJ2pSZfwoX3V8fjaw/Ohi25MRdvbGVRhmKP1slJK
         PiHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwo3uEN/OqdKn41wwz/ItAUj6TVf9a2wFsXDHFgOwDKZpr5biC1pGigKqZ3kBgM3hQCEEOQ685eDFnjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU7Wk3KEGciYnjcMNWL/tSBhoeHTofnrt+ZaEuhl8MX+rwd0R3
	K0vPSweiaH5/zMydV4DLRPnN5PLKkk8SlOu1EidBuK67GxXr+EMMk77ZfHDLQ4bUPRR4+gPCM7j
	Wi+RxAR14mpGhilvdR+mRfs/dVS3bdQD5Zz6d4gWxxBQs6y2j9sSg9yylR4OeCYcw
X-Gm-Gg: AZuq6aJyk/328Siqn7XWXIQsn8kXlj8dFAMsu4T9IJJvvhmzGIRAuZim2mwdfxVCE7l
	Z7RSh+waiJyDk7triHRjO8WEQaZu9UyM7S5SZeMe53rcnz8IGSYhNMVdVWu1o4TZpHWHsx46SfX
	o2GANQ7veBd5iiq6kvgVQoAD5aiiACXNO5LjDWI6vw5DB0sYBJx30e8+rZfsCNXsMWaz23gQPHv
	lJV3ml3hxkZhxz8OPVQjcZwa9QGA/bj4kG50qafAEG6lfv/pduyfOuEx5fxjfH910Ul36ZuuyFb
	zEKFh5hvwpFznrHvSnd7wLnqE2OvgyxLK2UKxDmddA+jmh95SUkyxoWXbTMSY408l3P10CkFBA=
	=
X-Received: by 2002:a05:6000:2c0c:b0:437:8ff8:fea3 with SMTP id ffacd0b85a97d-4379db66593mr24384207f8f.21.1771412214106;
        Wed, 18 Feb 2026 02:56:54 -0800 (PST)
X-Received: by 2002:a05:6000:2c0c:b0:437:8ff8:fea3 with SMTP id ffacd0b85a97d-4379db66593mr24384146f8f.21.1771412213558;
        Wed, 18 Feb 2026 02:56:53 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc85csm40735722f8f.22.2026.02.18.02.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 02:56:53 -0800 (PST)
Date: Wed, 18 Feb 2026 11:56:52 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on
 Tegra234
Message-ID: <20260218-magnificent-flying-coucal-a4f1c0@houat>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-8-thierry.reding@kernel.org>
 <20260123-slim-seal-of-luxury-bdb58b@houat>
 <aY3oyMhkbxhgMbfi@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3lkrnqpcfmpi4l5q"
Content-Disposition: inline
In-Reply-To: <aY3oyMhkbxhgMbfi@orome>


--3lkrnqpcfmpi4l5q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on
 Tegra234
MIME-Version: 1.0

On Thu, Feb 12, 2026 at 03:51:29PM +0100, Thierry Reding wrote:
> On Fri, Jan 23, 2026 at 02:28:50PM +0100, Maxime Ripard wrote:
> > On Thu, Jan 22, 2026 at 05:10:06PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > This node contains two sets of properties, one for the case where the
> > > VPR is resizable (in which case the VPR region will be dynamically
> > > allocated at boot time) and another case where the VPR is fixed in si=
ze
> > > and initialized by early firmware.
> > >=20
> > > The firmware running on the device is responsible for updating the no=
de
> > > with the real physical address for the fixed VPR case and remove the
> > > properties needed only for resizable VPR. Similarly, if the VPR is
> > > resizable, the firmware should remove the "reg" property since it is =
no
> > > longer needed.
> > >=20
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 34 ++++++++++++++++++++++=
++
> > >  1 file changed, 34 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra234.dtsi
> > > index 850c473235e3..62a5dfde9e38 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > > @@ -29,6 +29,40 @@ aliases {
> > >  		i2c8 =3D &dp_aux_ch3_i2c;
> > >  	};
> > > =20
> > > +	reserved-memory {
> > > +		#address-cells =3D <2>;
> > > +		#size-cells =3D <2>;
> > > +		ranges;
> > > +
> > > +		vpr: video-protection-region@0 {
> > > +			compatible =3D "nvidia,tegra-video-protection-region";
> >=20
> > The heap name doesn't follow the documented convention, see
> > https://docs.kernel.org/userspace-api/dma-buf-heaps.html#naming-convent=
ion
>=20
> I could change this to protected@0, which would make the name of the
> exported heap "protected".

protected-video would work too, but yeah, as long as it's unique, this
works.

Maxime

--3lkrnqpcfmpi4l5q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZWa7wAKCRAnX84Zoj2+
dvUhAYCm3FfvWk95XHH2FpeLOwuwKc6yGIbEd2DSsZvfEyoEj29SyLApBrBuUbbF
1e/ifR4BgM0QdBWXEmJb3YcqxnY/OdqsBvatOWUWz2hoGC3/GAFLKTRWhVfS1lbP
wk++E+B39w==
=Z//1
-----END PGP SIGNATURE-----

--3lkrnqpcfmpi4l5q--

