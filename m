Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5160A1E5B68;
	Mon, 27 Jul 2026 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141037; cv=none; b=GMRslTXzYVDfPlloVeMEH/naFdH4E7Vl7cDoUvYKWXu1vDXlcqN2g7843c/aXrhrMPXPmADKc+eZNh7N/HTgW8SperKJCgDL5JDmow1Bp8+FIjjxKmur7LT3neXTt0THtahgoPLbevQkaUTjM1D1x+jmWEGTyZOYoLhnuxFjEjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141037; c=relaxed/simple;
	bh=Alz2OQREC8gmXTIP6uUvgejacsivsVH8Als6GHlRz7Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=rptdkPPmk6ejCSMkOqyCc0UfysePAkDKVpMgosxgYgcxe4/M1WIbJXosmeiFvqwuoJ/re+8gKfAcWLNMtf6DIDqhs/rVlxLkYDp9FrEkh/Kq+zpgEtHQmHLDmLf8zGaGVH+RpgHQdhBHFyO5jCstRYYBkY0BmIkkODTn7/0rgp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=depvD9Q+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="depvD9Q+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B36891A1283;
	Mon, 27 Jul 2026 08:30:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 872D7601BE;
	Mon, 27 Jul 2026 08:30:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7A4E11C12285;
	Mon, 27 Jul 2026 10:30:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785141028; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Alz2OQREC8gmXTIP6uUvgejacsivsVH8Als6GHlRz7Q=;
	b=depvD9Q+HUe9YcngAMayfBUgh4bq2xbpzwOsgI2nma0CS2jUoIHXNhONln6wsvcqymKCmU
	G6e0AEfKSRsWDBf8+tLuE5IBghfpMcLwFej0X599UmQeB44Y0Z+NBmUyDKEITA+1lH9/ld
	B98YYm9zCeyjt3vnmYRJ4UtFltyBgMuqiRVQsbjbNe/OfR3I39evrTywH4LbT84b9qg0QG
	hnH4m6auL0S+uBsmeMsCU+oWKv4x+hhVRYnXm/aymnetVmpZ4usMgqbkuXSZNQo84V5yEC
	bsjCoQXpciPbSt+TKDZLYglLMmYbz0lTDRzW9XjfQVBiXCxU+gBvG3NFBCD0Vw==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 10:30:25 +0200
Message-Id: <DK97OHV30O4F.PB1P6HJQ9UPI@bootlin.com>
To: "Cong Nguyen" <congnt264@gmail.com>, "Thierry Reding"
 <thierry.reding@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] staging: media: tegra-video: fix syncpoint leak in
 tegra20 channel init
Cc: "Jonathan Hunter" <jonathanh@nvidia.com>, "Sowjanya Komatineni"
 <skomatineni@nvidia.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Svyatoslav Ryhel" <clamor95@gmail.com>,
 <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260726100408.3262831-1-congnt264@gmail.com>
In-Reply-To: <20260726100408.3262831-1-congnt264@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Sun Jul 26, 2026 at 12:04 PM CEST, Cong Nguyen wrote:
> tegra20_channel_host1x_syncpt_init() requests two host1x syncpoints. It
> stored the first one (mw ack) into chan->mw_ack_sp[0] and only then
> requested the second one (frame start). If the second request failed the
> function returned without releasing the first syncpoint, leaking it: the
> caller tegra_channel_init() bails out with a bare "return ret" on a
> syncpt init failure and does not run its free_syncpts error path (that
> path only covers failures after syncpoint init has fully succeeded), and
> the channel is subsequently torn down via the kfree()-only path, so
> nothing ever releases the orphaned syncpoint.
>
> Release the already-acquired syncpoint on the error path, and only
> publish the syncpoints into the channel once both have been successfully
> requested, so chan->mw_ack_sp[0] never holds a released handle. This
> matches the handling in tegra210_channel_host1x_syncpt_init().
>
> Fixes: 0e2c4117c351 ("staging: media: tegra-video: add CSI support for Te=
gra20 and Tegra30")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
