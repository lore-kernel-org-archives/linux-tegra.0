Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC92D4119FD;
	Wed, 12 Aug 2026 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527032; cv=none; b=uJm2cQzk3sHiB+n2XJclZL2yEOIlgAR77IDbE7t/PQLlzxAC2fn9ObQswQjKgUr3LCSDlRQbrg8Je/HD6pp6sIvIhcur5cts/nr1Tf6e6tjvjRk6Qw2yaDQ5OdOzVFl6xG1dqeCNobzLZLryucMPrvIptaY1aP01dL8uVb7+7sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527032; c=relaxed/simple;
	bh=K9JMIPR9aJdFpfyoFLIu4SALHqOGNjdbaa3qgrUNtQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtzwNJR36DnUtF8u+PbMVCdHmMSAjBLBXbud1vgsY9av8/YGSeA9HZn1OHbUVk5c5v1SyLwKssF4VQy7FHTDHY99HCASgBZFBjylJDPM6n3SEV8p100SJVKOFf39mnRjrL9hWF1LHgGkePUqiE4+ivwWAUOXOUC4OMwqxwk+2JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmcJybml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmcJybml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9471F00A3E;
	Wed, 12 Aug 2026 09:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786527031;
	bh=71ksmePZH3v7p0cYufmoYHyDtG33QmHyGWGOtYqztcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fmcJybmlh+zd5aDfJu+Cbo9ixoolh0ousolElslLjb2GbU9T1oLbUTObK7uss3mur
	 KduYY3zKs0F4Xc2/R5EtbIEsyoEhRVzsxTC2uyikZg/TPgwAVY9tYkpGA99SPQsG+m
	 6ZcHoXQdQyHoedsr7uUUM4gjEGJqlTeOMwdkEFwulpn2F8aURgzX/uDgtRZdxz0Svk
	 LzQfm9nXmU1s6knkT4DOyENBk8NJvPn+I86h4yv3c96telXJKb8TlXCywc7lRlNfoe
	 J9n+FlsZH9ymtjkdrUuRJD+oXYa6238tSl1+N52ckpy1AKEw1Ty75Y5VlyibcgGJDH
	 rf2WsIP7ec1Dg==
Date: Wed, 12 Aug 2026 11:30:28 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: jonathanh@nvidia.com, Aniruddha Rao <anrao@nvidia.com>, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] firmware: tegra: bpmp: Add ACPI support
Message-ID: <anw8GfvJTgYOV7xn@orome>
References: <20260722110544.193551-1-anrao@nvidia.com>
 <20260722110544.193551-3-anrao@nvidia.com>
 <yp4_Hg6NTM6XvmUccLSv1w@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pj4wjzf7h252f5az"
Content-Disposition: inline
In-Reply-To: <yp4_Hg6NTM6XvmUccLSv1w@nvidia.com>


--pj4wjzf7h252f5az
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/5] firmware: tegra: bpmp: Add ACPI support
MIME-Version: 1.0

On Thu, Jul 23, 2026 at 02:10:23PM +0900, Mikko Perttunen wrote:
> On Wednesday, July 22, 2026 8:05=E2=80=AFPM Aniruddha Rao wrote:
[...]
> > diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpm=
p.c
[...]
> > @@ -428,6 +521,18 @@ int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
> >  	return tegra_bpmp_channel_read(channel, msg->rx.data, msg->rx.size,
> >  				       &msg->rx.ret);
> >  }
> > +
> > +int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
> > +			struct tegra_bpmp_message *msg)
> > +{
> > +	if (WARN_ON(irqs_disabled()))
> > +		return -EPERM;
> > +
> > +	if (ACPI_HANDLE(bpmp->dev))
> > +		return tegra_bpmp_transfer_acpi(bpmp, msg);
> > +
> > +	return __tegra_bpmp_transfer(bpmp, msg);
> > +}
>=20
> Having separate __tegra_bpmp_transfer and tegra_bpmp_transfer seems=20
> unnecessary to me. I think we can just have tegra_bpmp_transfer call=20
> tegra_bpmp_transfer_acpi after the tegra_bpmp_message_valid check?

We've had some internal discussions about this and I think we can pull
in the message validity check into this function since it's common
between the ACPI and the non-ACPI implementation. Similarly, that __
prefix may be confusing. It's often used to refer to some internal
helper, mostly for unlocked operations, so it does make some sense here,
but using something like tegra_bpmp_transfer_channel() (I have a slight
preference for this, because technically you could use this on non-DT
systems as well, provided you get channel setup from some other firmware
interface) or tegra_bpmp_transfer_dt() would make it clearer that this
is the alternative to ACPI.

Thierry

--pj4wjzf7h252f5az
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmp8PTEACgkQ3SOs138+
s6G9IA//R4ApZ3WmhNdErjQhX1OTqeYMC7TriRE2pnij++vE6c6hLRLMtWP/Bon1
zcMXu6a37ZmjIlVRIZU7IOgUW9ttLMb1qmXsqAV5OHh7JX8fjMfkDG5bdVemzVuk
Yio84pj1e1nZq55ailTX/yQmNBhOZLLpnFLGhdRVuiOWBXXEb3d9SWUtFmQvPSTg
FmSP9xLKHmYQuofNa9bzxPCpV2zrH6RNGJ7w+HSiXtGrzUp7UNAv82MB5I3F3DU/
1CwHbU6DVu9sW+PBVm57ALWhGJfppcBPDnHaq3uFIP0X67lc2UrR507oTJfcLooj
yci2yo+WP/e7wkM2rIkM2amVZPPuiTO6Efnjfas6FxI5HSX2fDPGxtYtQondC4sC
zAvt6xOsRTYUVhpNE5vqTPlXopDzcxb5SyNUxoedm2n5hMSvNCg1EjxiJJurnV17
wrR46qEZ0MLjMbGD8jjIBTALk5PYl/v5cc0NXb6LjKkLQ53TVmYAN4VBxWnSpS0P
iBOMqxAdpy1yp60Fz6eyaLtjBOX45voiLe+AARMCasLdkNqQTL+0tFrK5zPytIKk
CF/n7iEKyujqkw3CFXpFN1I2a1iel27SEiyw3waE725NXOFnymcJ//I5kgqy+uao
A4BeOCmyGuPr3X5i4JVMudxxvElnhm5XFJibYSr/yosTHtdSQMo=
=eqnS
-----END PGP SIGNATURE-----

--pj4wjzf7h252f5az--
