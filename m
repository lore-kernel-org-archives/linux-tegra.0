Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1DA2F7457
	for <linux-tegra@vger.kernel.org>; Fri, 10 Oct 2025 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760108094; cv=none; b=OdUpnQHLwQwf+AaWjTnrwW43a/Mvq6lHEGhPSQRiV6S/+TGpF3ZiDrd3z3l6RPsyVwIzkxRj+9mJiQAMCJOElp6QrHrFa+QoDXZ5igbXyOGMvhu70GgVuDLrkRl9N0+pwqS1gVooOZLAPL9ZMNTrn+zgIcwmmXuS6Di+0CJuBz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760108094; c=relaxed/simple;
	bh=fSzNGvN8Odca+vaIJOa7B+9E5YxraxYKgj1v2RlgWfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFXeiqsES6UBzF5SQ5N3y8ojR/k9ndvXGlHXltT2MWMoF0E+13ihDNCrwrO7tpuzhEpb0UDFFAm03eTApqM3usidNm1HknxnFaPHZubqhw18KvQuLD6mchODW8J/y+zmypnT80/lry74w4PZ8DCQF5XW2VKAcHP6nzGWy1q3WS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUhm7YSj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUhm7YSj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e504975dbso13058125e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Oct 2025 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760108091; x=1760712891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fSzNGvN8Odca+vaIJOa7B+9E5YxraxYKgj1v2RlgWfo=;
        b=OUhm7YSjRnlMapYtDiGwvdqa+WNOUbpPdozzNww6YjYukE2hTOk7nsY4JY6iXAXCW3
         QvkEX/K1zB/0kW49rG0F/8Hg8G1BXBYFAc4Uzdka/DJdBYcVrth5M6vESg9Aupcb7vyK
         12/+M0dfu1gduPz2eIgC3ehqJaI0ZitQj4EdpF70+x6E16vgU8c+V7Nmp3W6BFKE+X0U
         ycj2dD2xBskU0K/CeLg7mttuakhvgP4DLe4SJllv2ejQaApdGB97Fea3d+IFuP8Ofj6s
         htouc7Nrw2goegsaJJZV3fqkr68lXs3jEJfhITtP4C4x6CzCyKVMq5xOnIDRfuxqmRd+
         u1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760108091; x=1760712891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSzNGvN8Odca+vaIJOa7B+9E5YxraxYKgj1v2RlgWfo=;
        b=BlPfP6GOKGD+noHuy459CX7uabmbI3ahXQ2WSjKwBzdq1rjayEgNanan05YWIocbML
         1j655x4gxetRJ4TKH58KIYEdUyxaTfj9eR80nsyBIHyS/NmIcrZU0W12S+TXkQw/B/cE
         zAxyVOBPAuVbMiS3oxQbHdbQuBRFrJ2qNT6yF1xVe/QuyubiMIh0ScrFU2yjy4f5KWAL
         qXCPC+hXIIG6m9rAoH8PcL2bJ1mxWMrlhf5ZqfVFeuZ9+X2WTEI/Xhkktn8C2Xfns8bB
         cKl5d9mZ2jvQ9J9mF/gmIVZXcDgsF0bvSM6uyFK6UP8bu1wm1diHrWRx00RgJMbha5hV
         oCDw==
X-Forwarded-Encrypted: i=1; AJvYcCVDlrn+jL3X6aMSGJVmnkxGDimvsfxyWLMIWHI8lwGO8R9NuI8z08BJ3X6UBWKuTlHwxrYlA2dsoeqVZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrqGziNUoT+GWc8S9kSB9HLQkLuTDI5EMYHMB/lr/cRCZwR0Z1
	KehhxyS63Ks/xL2fcNHsuRviOkSAT6IJ0QATLFmXhXUsN/gsWaHghRUHTaSFMA==
X-Gm-Gg: ASbGncssCPUwzpW4n6SYt0TPz3mrfb13zWuUCIewFY2E+M5m+W3g7/98CL+DOoW5UJg
	BHvQgPUvTmv4nAuvgmLIsKvgu8wBQf8WRklVx4UH/zkxqk8Z+No0WBinW5N1bKCTL2eH/wbvHBv
	+eZFlhIVIuuR0qzsS7lp0HxUoGJ0mFrCOmmaM9Rn2goJv0i7YSDXmPJATKP0QsEcOz3uq/KVKVb
	mW9MijQsBduNJus1tf/DyufDwM53Yu8yQRD0rV7ekHbyrH29luWEkdA4XEMSkJtcmdRKpxavVar
	9BPq8kZKUR8HwQf3PA6MAV6PbXNw85caX8e60QM/zEmOeDfTbcXEJbZP8uT3JP/V6DXR9WxYVl3
	fJsBO6NZfR81KuzXnThkOlDssdtgVPf4QhDyaA/eyGiIDsPpaPfd2v08Iu4oZARJzSPKQQfGSi7
	SvaRr0Um/nGrk7771VJqgzlshBVQhN
X-Google-Smtp-Source: AGHT+IEXkrDyUy97suKtDlq7eFA2ZJryfwfSk6MT1wtjJwB/9DlAxb8oq4wEf+SbzWkvD8LgIsrrzQ==
X-Received: by 2002:a05:600c:3b0c:b0:46f:b42e:e391 with SMTP id 5b1f17b1804b1-46fb42ee4admr31215605e9.38.1760108090951;
        Fri, 10 Oct 2025 07:54:50 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b99fsm52826395e9.3.2025.10.10.07.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 07:54:49 -0700 (PDT)
Date: Fri, 10 Oct 2025 16:54:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: IRQ thread timeouts and affinity
Message-ID: <q2g5abyqniku2uxbjsndiwcidx5cqxbqaixcvdhkurupdnhu7q@pyhpxylwrtrs>
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
 <86qzvcxi3j.wl-maz@kernel.org>
 <loeliplxuvek4nh4plt4hup3ibqorpiv4eljiiwltgmyqa4nki@xpzymugslcvf>
 <86o6qgxayt.wl-maz@kernel.org>
 <86ms60x7w7.wl-maz@kernel.org>
 <us2hfdn7jpfepdmwk2p62w64p7xagaeoemg3hdt2vm54emtwlv@m6fkuti7hvfa>
 <86bjmeyh5m.wl-maz@kernel.org>
 <c7bb79c1-c760-4b44-97c3-86e1c34fff40@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lamoghzxow5fsofh"
Content-Disposition: inline
In-Reply-To: <c7bb79c1-c760-4b44-97c3-86e1c34fff40@nvidia.com>


--lamoghzxow5fsofh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: IRQ thread timeouts and affinity
MIME-Version: 1.0

On Fri, Oct 10, 2025 at 03:38:59PM +0100, Jon Hunter wrote:
>=20
> On 10/10/2025 15:18, Marc Zyngier wrote:
>=20
> ...
>=20
> > CPU hotplug is the main area of concern, and I'm pretty sure it breaks
> > this distribution mechanism (or the other way around). Another thing
> > is that if firmware isn't aware that 1:N interrupts can (or should)
> > wake-up a CPU from sleep, bad things will happen. Given that nobody
> > uses 1:N, you can bet that any bit of privileged SW (TF-A,
> > hypervisors) is likely to be buggy (I've already spotted bugs in KVM
> > around this).
>=20
> Thierry, do we ever hotplug CPUs on this device? If not, I am wondering if
> something like this, for now, could only be enabled for devices that don't
> hotplug CPUs. Maybe tied to the kernel config (ie. CONFIG_HOTPLUG_CPU)? J=
ust
> a thought ...

I've only had limited exposure to this, so I don't know all of the use-
cases. People can buy these devices and do anything they want with it,
so I think we have to account for the general case.

Thierry

--lamoghzxow5fsofh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjpHjQACgkQ3SOs138+
s6GxLBAAopBt0WNEut1yocnXx82oxmvWddArsqmrMJnBQ6mqe9JJGWc4O6e2pNR6
+732iu5IcFLfZFG4+XkkUD844lfy+hlvz60KQX+2/0jTZ76TS5S7bZAhD6Zu2lWp
wBoZnJdoWG9nfElAiVcXC6P7HKlxt9zlYDqFfJSi2+PV6cGTNnTu+OtQCzsO05Z6
ywktFlU5r2DFr8NWqaxcfPWOkvx2yAJhDAuJ2FbiSsmknSN/Ot4A3uw5jRMsWoZ9
VuPjsJGVo0FQTJxFkMaP2Cm+vNSciLe0UM9Bfe5yxV6epJz+NjgLuRxCRL/6Tr9S
SP5BUtsXwfHt1eIQjuiHD+q8rXOmrRZ7K+yQ58BicIATTTV6kQZkTFT2mWpp/5tN
ksNlZ4ylBuKM5hks00q8TtoHeazb+QHuAoq9SMuGC59fsYOgn0V93TN17PSQY2rP
tWuDZ9Ok+viij4T8PyNeAEZU4xK0Cff/maiIRtdtwtI//QLjl/gJN7Yw4JU4UuxB
4/8UG0usLACCbHGyq15eNa31zvUUbxLcHpJXIoHTqYTRuzKeVZ/+aeO23YBUNogz
SBwhWJijs3OpKnwsK31CfX+dHnJeI1RxvNpQXjpF2zDcHafaCdzrZAgpfOug6q5F
gWX/MeIEbRhEPD5iojBNQYYmLj9ey4BwZG4GlVTlMhJC7VTNz7A=
=EfpF
-----END PGP SIGNATURE-----

--lamoghzxow5fsofh--
