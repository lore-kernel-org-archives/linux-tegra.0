Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265B22FAC14
	for <linux-tegra@vger.kernel.org>; Tue, 14 Oct 2025 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760439025; cv=none; b=hRz/OptpYBxdS+0CzuB/RWc05cmtWvWrc66K2/Ej0cFoI3Hr4XXrUCxjIB1mTfwZXQ871vClOPlmJDUaPZfXQ3ygC7LzkR8dqHJbFr5e3LH3aLYF+thWKrocr6yO1UjMCMRoymDZhT2zT//N6QxA+GV+Y6GIV2hc9RtBntF+g9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760439025; c=relaxed/simple;
	bh=OsAT+//A7xxrcqc3BwTPqIQEwFp06t38UryCM1+xuf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZh1cpLrJeiYCkD1RQEODjZXIpBoipxen7VB+yM1sjqUq9UBgBWklVvR6YBUHZabHlmVClgPs7+xOCrZTxX0Dicsp4c9CI70Pu9119iJdfnH0Ypmo1ABu3CFmXA8Cyn8YAqO0yh3nEqIvSifUF/2U80ydE4d4CbfklNaTrAmQe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SP2GU09j; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SP2GU09j"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e4473d7f6so33414875e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 14 Oct 2025 03:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760439022; x=1761043822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9oi5CZpumOfRO5UxrA3d1k5hJRdlXZM8E6FYaZHFNcA=;
        b=SP2GU09jaGj+QUgC0bNK6tbdQSQwOqXxJdTDq/Omm1Q3feuAsVold8AwjWLUri3eTq
         h3bGtZkpJrBi+1LSg+tUfG/Qy6Bo2r+e229A9ti1iq74NzawjkbRtGv4NDiMumbJwcEG
         7iKrfOtlk2an8TgL7jJZ4Jo+/IOdzjkatmH0fVLFgm+vlSIZc7eKB9qiz1AUXeEZu5wI
         rlSyuJuVK4PsZFTyEeN4aN2mf7EDSQaJR0bg7pUtY1Oo9/rWSVRW3tUqCOLM0qpcSJj1
         UTXhhMXXscGegWB6N9C+62kh2TS3oO6aCDWe+B/2uYhaaPr43H2P8bGbyOFVJzIjgztJ
         zhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760439022; x=1761043822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oi5CZpumOfRO5UxrA3d1k5hJRdlXZM8E6FYaZHFNcA=;
        b=mzkwY4TprOrUDzaJcj51+/BbBNotNkrHyDK1APIsVc6kOSMpGvXtZAwM/VA+jEbu2l
         60h8Rr3bZL49pxDh426RV3ACk3pPqcaus+DF23qJBriapa+QXofzyUsGoqfFzDJuGqtC
         4EVyoD2sibMORu7rjQ88Fs4nIINtiSTxZF/9uMDdDycoKhIgcPdc65NLSZWHg0nW3o3A
         FgDHbNcGpU4zeFiZtGIwrc38uQ07ShfNkMEtF8OU89oxXV2RMiLwqt+7EhPKJX3/d3tc
         Te6VZ0Du2Vknj5zyyo24bBGcPovUpBEx0sJaGK045sFH3J0AByI6nlYfUAWaRAMYXbhV
         Z6og==
X-Forwarded-Encrypted: i=1; AJvYcCX7C6tOktXWNXt/C3fFUO80VTQ2vFBhmyEfXjgIBNecRgf30+QwG96Rb0w1uaa1QCaCUD3b7FYTdnBliQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSWlPlbRCIpaU/oWlzRiT8nTSujqMDrXPXnS05nIopRQdt5Frc
	Hyr634CE90ToDjr/U3v2qwrALpks9kOCP04iP+uboiK9XZZXB6kRfaan
X-Gm-Gg: ASbGncsLdPSZ72jhcEYirdIH9NOSyuP4uQkJPqPqtW2kHhGpK1uMp8BF3FMRF49AI77
	GnRIlQDJR+RBzEvz/vgAF6UVvHTdhlGo1uVZr0ESOdLkzrMAZJKk9hyTDpkIHPR03uYPgTtL2ue
	bFlyBd2S+QArKjJctZ6ei32dckRsdZbfqfbQh7K1sukzJCdKsGqxsKYyiPYgtyhNieHDs61UPV4
	LtRAmj6nfEbYgeRITMFDe76VXHvT24RCEOh4mwBgxzx7U45+o9DYMToiMUDZ5jQGBeIPUteM3p7
	ondNGUHggQAJTyqqOaEgASOjRxWQ8jzEnPq/BV9xVVILMaIQrYRvVHjQcv80pko4g0cZzeGjGfn
	A3Jw8r+Apw7h/hSNLQFhVvmFX9nLq/zcc8pMW2R4HDtTU8mMA1Ye6F8+BEWjxsr/Ysy8ImaOfWi
	QqMPt9HRaZzdr/MgOVNh2oKt3PVgRD4RRgwjKkXBI=
X-Google-Smtp-Source: AGHT+IHvthsh5d4gJ2f4pjbU+SaIy+7Qg5DdE7atHEiRKh31T49BVgFbO+XVGKpTwhTDtvlqb5L5oQ==
X-Received: by 2002:a05:600c:4e01:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-46fa9b090d0mr198199315e9.30.1760439021936;
        Tue, 14 Oct 2025 03:50:21 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb49be017sm230015965e9.13.2025.10.14.03.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:50:20 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:50:18 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: IRQ thread timeouts and affinity
Message-ID: <6hb5vyl5xxsxfcwk4v3xpq277wusj5jq4tubdpjocpjc5smj3w@wx574kluhedj>
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
 <86qzvcxi3j.wl-maz@kernel.org>
 <loeliplxuvek4nh4plt4hup3ibqorpiv4eljiiwltgmyqa4nki@xpzymugslcvf>
 <86o6qgxayt.wl-maz@kernel.org>
 <86ms60x7w7.wl-maz@kernel.org>
 <us2hfdn7jpfepdmwk2p62w64p7xagaeoemg3hdt2vm54emtwlv@m6fkuti7hvfa>
 <86bjmeyh5m.wl-maz@kernel.org>
 <graeplkpsgbolpnnq2pndpdb7fymyy7zvm37osbdtre347tns2@mjbgzwterefv>
 <87sefpoj10.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2s53ukplucxdxja3"
Content-Disposition: inline
In-Reply-To: <87sefpoj10.wl-maz@kernel.org>


--2s53ukplucxdxja3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: IRQ thread timeouts and affinity
MIME-Version: 1.0

On Sat, Oct 11, 2025 at 11:00:11AM +0100, Marc Zyngier wrote:
> On Fri, 10 Oct 2025 16:03:01 +0100,
> Thierry Reding <thierry.reding@gmail.com> wrote:
> >=20
> > On Fri, Oct 10, 2025 at 03:18:13PM +0100, Marc Zyngier wrote:
> > >=20
> > > CPU hotplug is the main area of concern, and I'm pretty sure it breaks
> > > this distribution mechanism (or the other way around). Another thing
> > > is that if firmware isn't aware that 1:N interrupts can (or should)
> > > wake-up a CPU from sleep, bad things will happen. Given that nobody
> > > uses 1:N, you can bet that any bit of privileged SW (TF-A,
> > > hypervisors) is likely to be buggy (I've already spotted bugs in KVM
> > > around this).
> >=20
> > Okay, I can find out if CPU hotplug is a common use-case on these
> > devices, or if we can run some tests with that.
>=20
> It's not so much whether CPU hotplug is of any use to your particular
> box, but whether this has any detrimental impact on *any* machine
> doing CPU hotplug.
>=20
> To be clear, this stuff doesn't go in if something breaks, no matter
> how small.

Of course. I do want to find a way to move forward with this, so I'm
trying to find ways to check what impact this would have in conjunction
with CPU hotplug.

I've done some minimal testing on a Tegra264 device where we have less
CPUs. With your patch applied, I see that most interrupts are nicely
distributed across CPUs. I'm going to use the serial interrupt as an
example since it reliably triggers when I test on a system. Here's an
extract after boot:

	# cat /proc/interrupts
	           CPU0       CPU1       CPU2       CPU3       CPU4       CPU5    =
   CPU6       CPU7
	 25:         42         44         41         29         37         36    =
     39         36    GICv3 547 Level     c4e0000.serial

I then took CPU 1 offline:

	# echo 0 > /sys/devices/system/cpu/cpu1/online

After that it looks like the GIC automatically reverts to using the
first CPU, since after a little while:

	# cat /proc/interrupts
	           CPU0       CPU2       CPU3       CPU4       CPU5       CPU6    =
   CPU7
	 25:        186         66         52         64         58         67    =
     62    GICv3 547 Level     c4e0000.serial

The interrupt count for CPUs 2-7 no longer increments after taking CPU 1
offline. Interestingly, bringing CPU 1 back online doesn't have an
impact, so it doesn't go back to enabling 1:N mode.

Nothing did seem to break. Obviously this doesn't show anything about
the performance yet, but it looks like at least things don't crash and
burn.

Anything else that you think I can test? Do we have a way of restoring
1:N when all CPUs are back online?

Thierry

--2s53ukplucxdxja3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjuKuYACgkQ3SOs138+
s6GjZxAAh0EtrqoNH2ELSK/goEd24inBc3Eoe37rgmkFvxq4QmjXZaEktcd2MVKQ
PpYu00CutOwfzM202AXfZRem5KI2hg8pOLu9ZE/Y0GLaZsMyY9KmefuYNbRpuFFY
ls/pYtncY0xRPfzF1KpSg/y3UhIt9l67KXjrTLcIgem/RXFhhIVGBbuabbcA0b8N
+3SD9lEqdVWByEB0skf4okYqSZK0aXN4gxBrm8G03fYDuuVtM/w5nvYLJTUMgTJh
qMS0kNvVX3JOjaXvYt4HGZIcIi6cHLgK3PHAydGQ0A+rBdSRbSycXBF6hGpOViuY
Cna1CRTsu1X/CPwmKyVRyxx+jfWMV25WEs4wr+LKMePNvcQswJep6jc3eTUEBGCV
bD10EcJUNKz7jUs+Du7fc5zMY5NNzYmI7PGFGpfOIRr/Fjzwq3KbWIQNfBca5QBr
aixPjI57v4Z9y58nPt1IDY4mk6jlMzB9p6FfhzRY5VyBChrjS8gnukhs7Heq7l5H
uwhfVeYjB74NRns+V0Pcb3fKtt8xd6vx3w5U0oZQmhezfs9TITmJc7U3JQkgRNp2
wApK8ECbCcA56N07U1jB5ihAsS3u/bbqWONgIAg6ldIBOYmBjuGvkNF02E9xNEu/
SVcGFetyr9+PkcKbDfpVaKfxZPMtUxune9hno2u3QO9bylAQw/0=
=QFps
-----END PGP SIGNATURE-----

--2s53ukplucxdxja3--
