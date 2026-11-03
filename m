Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793696537;
	b=U+OqXrTnfG5cGXTCsHclggjznbLQtDpFagFb5cqrdXyNjheClDTSxLTLgUDXabkjqTLt
	 GHdW178RQbfvdJ90+GDQe9D6eVUEa9j7JurRyzPKYx9bQHJaHsp+8aoXTomH3MiFYu+QT
	 TMhhMNTxNZ6A2eSM6ZGTI1t+jAB86JQwUR2IDG88Ck7C+PQ0NYYEEiYRlRIlr4UyW0T5M
	 GvO60HpXj0vqOZI0nQvmiwrkhLst4hgBuMRChQ4mOYHUCjoPfz8BQKWwwfOWdNgXVUpsr
	 13YAFWg4p7etHMeoJcl0H1jxt8HwmRoBLpe62c59WYz87GvkPCfE69LEIvJInxsaHCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I5KjhCza7OLCRkoYMN0mD1Q2oGVJGpZNaMPYaatrZlM=;
	b=L+CbsuPEJxjaGTPw9q/gPcuF5uNinPhvfaWaIVuTZwmgt/a7ZUjrDyNTZEK9O0HhhDsq
	 ck+6VTBakgqVhC/rvEAwOJJ1FNg4C6TlSgp96SJPy3bGlXkSSJl7NjvfjSp6DTwhs9M7O
	 7O3JcM3iiwitJ1bQUwsYnk/gOy+IxRlZsJYm2Bv9Ryr0gp1Wg41VIo12NJFTzlYnRO0F3
	 qB1LytRtcoK06/Ee2OEVXz6WlMlo5wvPOOS0S34YB/NS+FUyMKG4iV4E0IvlHvBeDf6Qj
	 lPx7MF+PzOz0/OJLVvWDVQRzCvkNc7YBARW8fzXDWE47wTfVMUJRvdQj8QKG+R3/6Nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ciwGRpx2;
	arc=fail smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E53606A334
	for <linux-tegra@vger.kernel.org>; Tue,  3 Nov 2026 09:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E53606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ciwGRpx2
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5554191eec.0
        for <linux-tegra@vger.kernel.org>; Tue, 03 Nov 2026 01:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793696537; cv=none;
        d=google.com; s=arc-20260327;
        b=NrEtBtizPTRAiSrF4qlzJ+baTk1O1OhBAqqDOnvKNIBdH20xGVvn1SzebhrxY02rKo
         Id4qQL7Zgo+LDSyiSYvZAJl/DpDzNeAYyvgzqfoRGC7SOGTqgBFJabWJAx4Cg74u3k6K
         oFBGcNkEyQvSm7LwSreABIEaW4eszYt3jvh3XOUDmVyrT1BvV9YiFJa/2I6yy07fXLni
         v1PKEGdmYpPgcfwq8u/paG3yRI2r0FDtPHki/KDwTKzLppDf7XMzLqJK6hAuE+bAvhio
         8JIeWsiC1qzh7JkhSB9hG4nPt/3XKTxKgd102SOecSlBd5DV9geZ78/6RygAuHRL6hMV
         GYmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I5KjhCza7OLCRkoYMN0mD1Q2oGVJGpZNaMPYaatrZlM=;
        fh=25auZgcWEusFdXONnRjHX2JO9bo9KT8VDlHJdOugmsI=;
        b=GoYkkVQt7K95sULreAx8vAgpsEZTtImgA0hRcgj3WQn17MHhki73SQMiepywpVbZGZ
         U/mS1bscWE8Wk8NJdhSV29qUlcEGYk6p4ZEtG/hHSh3DqxR1zswljqM/EOcdV5UFjyur
         +Urdx9FMGalg3rh5EZdyc2efnNYUbXHFov0BwVcbV5egtyTmfZZVwW547qYMWu6QRfAj
         SVzz6bi+AjFQhGyBKr9BkBLCETFoDDcB1f+03xPGZ172cH8xt+/vEOFZCga/2Dt8QV3/
         kEU6WdAXYy/JgC+lw9UWrHYdp5ZpxproP6MfeDxpPvldOu9bVdbkHs6WvGW2dORu8TgP
         phCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696537; x=1794301337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I5KjhCza7OLCRkoYMN0mD1Q2oGVJGpZNaMPYaatrZlM=;
        b=ciwGRpx2kcHNTz6ttmKCjLHvNvU4D+NrO24Iekv6nFHROsIHfJzjgzeFIvIop+cH9z
         rh0kL61fy6v4C5HPDGZYpdm8ehoxlvThnx4p2vZ5+6ij5RGxiAjHB8DiIc/iTexMqrpO
         u40ArrwZ8pGC1cU76kRdkxR+kJRe/HPVr0hbiWPjgf8ezUFsCYQTg2och8VmNHf5FcfY
         lwlVmvuFAR/1QyUGQjaQ4QIxCWXr0QUP7LMh0metD8NUvwKVGbk/5E5BzgLZcMkUGkkM
         ppJjttWc+JAv3zrtDfAaqElUmNrVKNW+l5+3Pc0he6clMhV6o15x35JflnwCHcfVwGA8
         Na+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696537; x=1794301337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5KjhCza7OLCRkoYMN0mD1Q2oGVJGpZNaMPYaatrZlM=;
        b=qj4jOAOFOzKOeybn+v2m2GLGmSANNOBwqIqdjGAYYW74QN3KPSViyVF4SxZxfhki2x
         PVubeYp0SoxN7Pq8jP42U8gMhN4ciHU+0FYeOoOQKqQxmLc5S3n2wz95JS0ol7KNFsno
         2JWhx7pswUt+nFsWoWud8+rludqyaZzxPfVK7til1DGHHx/K++XNqHDDaIM0XXTZoTX4
         fbyF6LjYun43Vh2KU3d7YwD5EE1MqJxXiVxZ/oDucccLWRpU3EmZkSwK0jKKdzZ2IVvP
         pxkk7ogJ6nhioGm5NKTn1LDm/54lCl3VxOJFhTfHa+7pQHH7VundtgfQ5EcwSWXZ41E/
         3Niw==
X-Forwarded-Encrypted: i=1; AKwUvBylwLYlncGztFLO24cAJxp6cefiIDVXig/7QfWc5Nm6X0nzojperY16bB0ax1WKhKywuWeA+ygrR2MSzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9WsiMVzh4MsnuhdB1E/CNgXAzytORbuB03SvvR71/lzjFJy7WS
	b9GjEk1nqFEzkI32ExL7asmqeLkNVDk1h44kzPU1PeGenJ+DHrS9L5O5P8IaCdI+f7El1O3Jua0
	nb1NBAltSvlsmm9PXnxiShchVSGTxKzU=
X-Gm-Gg: AYBFou1ak1JNuzvjINoi3tyW6UFrWj5+qfVc9UBZ3KmY6WR1e2ywAyyCsVxUCPRZql9
	VdwDfjmC+2hJRKnirf4GaDmS3g/Bp2agQvTa4wZOSiAcz32tz8KM+iXY50dirJEqTQMtp9Ko0tp
	njMbSiVnHFYeNeiMW0+ToLchE31BpZOOmhaN/G6JQY0dG35HzBkBFurMkPOPAk3sIkQ6d/Dz8/7
	ONngqzfB+e2/n556cKCxdo1W/rfzrMsztrEL/MafXxhnv4nmwpMbh5TwKQF8+4nIOk7TCFzYman
	YqEjOuxmr6qLrxOISN5SfzPh7RCuoUFXOnlD9DDqe99rH3JBwhsBU7okEwj1X5it9WEDkb/kGUL
	DGMRrLmx2ZOcXiWELSVdNcVzhtuTWSgnUnMSfm8mhXZf6zZNIKdwUJeJdtGk58HUBew+sfw==
X-Received: by 2002:a05:7301:1a05:b0:36a:11e7:a11a with SMTP id
 5a478bee46e88-36a4236241cmr19980626eec.12.1793696536533; Tue, 03 Nov 2026
 01:02:16 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <179362684510.3310106.12424997423646231725.b4-ty@b4>
 <HUi_TWCnQA2WP19xCg9CEw@nvidia.com>
In-Reply-To: <HUi_TWCnQA2WP19xCg9CEw@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Nov 2026 11:02:04 +0200
X-Gm-Features: AclHuK9kP2YZS9qM8orBh3iwFzVk5JoYyyundAYGnDH-DFMvjVyJq8oHL57nrh0
Message-ID: <CAPVz0n0fpR553WL7bRYKFcHgGrc2pauMsKs1PTnuZVpN8UM5oQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/7] drm/tegra: Add support for
 Tegra20/Tegra30 8-bit CPU interface
To: Mikko Perttunen <mperttunen@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 3 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:45=
 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, November 2, 2026 10:40=E2=80=AFPM Neil Armstrong wrote:
> > Hi,
> >
> > On Thu, 22 Oct 2026 16:22:52 +0300, Svyatoslav Ryhel wrote:
> > > The display controller in Tegra20/30 SoCs features an 8-bit SPI inter=
face
> > > that closely resembles the MIPI DBI Type B protocol and is referred t=
o as
> > > '8-bit CPU'.
> > >
> > > Add DC parametrization options needed for fine tuning by bridges.
> > > Add 8-bit CPU interface in form of a bridge linking to RGB port.
> > > Add 2 DBI Type B panels used in LG Optimus 2X which work with
> > > the 8-bit CPU interface.
> > >
> > > [...]
> >
> > Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (=
drm-misc-next)
> >
> > [1/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and L=
G LH400WV3 panels
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/46011a636=
fd729c99781533e265297748b5a0b0f
> > [2/7] drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9fe804e2a=
3001fd024c0809678d09c5e0ed359ee
> > [3/7] drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d87ca1bec=
bb095b6204cf657508c91e5e995d9b5
> >
> > --
> > Neil
> >
> >
>
> Unfortunately these panel drivers are not functional -- they rely on a
> contract with tegra-dc that we've changed in v5 of the series.
>
> Mikko
>

Panels are functional, but they require specific configuration
described by Mikko. This is not an issue. Since We are working on mipi
dbi bus for Type A and B devices I will just add commits converting
these panels to mipi dbi panel driver. They will be as an example how
to make/convert dbi type a/b panel drivers.
