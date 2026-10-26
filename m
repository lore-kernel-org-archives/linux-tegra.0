Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793004664;
	b=4ADGvaJGAq5koP6onPdPUZYdIUwpGqwb7JTwSg6ZAWduwm+9u9Jo4nBh7/G30Wh+HtgX
	 WR6R+f7VGVhaT72f2Gr0M5sD3I9FQeo9rHG42g4qGQe9byLr4lbyZyCBnU+/Sb85pR6Bv
	 8hmtxHQLy1ZXjwSKmCcrnJjNd6slrpof/bpKSW1GdCsnHB8PaMh8yk+ArAefF9431G3uP
	 AHqduN3+qj9sdfX83bZ87C2akj/csMO1xfPSubPN/Y+IzxhvxGmvDYXncP7EYh77l3DDr
	 xALUxlycXEfvNrgBUOtQjQ0X1w+IaNGiRfIHijgYkO6srEJCttj8qzUT1t16rZ/cksA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AkYXn6onLTJUFDnVxOEC6DFAsMb9fumAoXKz09PsQuM=;
	b=n2ZWWpiJ4x2hQ0SuoiCfnwTp7BI+DArmZFAnwaGmFe3+taznaid995qPOier1jxgBZ+k
	 SHDUsqx0Sg5P9nVZqkcslwKRxrGeSFWVK5uBjv/g5H9qGZxB9LU7RRA67VyWSNexQYyiF
	 AQX2DT5opE0Ya2RElzAmC8M3FVAmOJMrkTsaGSNObgohueG8PF1O0ZPrWPcZrKaPIkNjf
	 3JqxiZIEAMOZWzm8vPqmuibGpzlG0RYFhNGmPycC0tFnHbQUHjko+kVU3NXabEcHZdtWW
	 RXJraJuIxnySCvfvZOouBkbAbACRUZaXg8nRW/fO9IlVfhsEQtjPCOfnCkzUjCvoulQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oh2lU9lh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AED606A31B
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 08:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0AED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oh2lU9lh
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3514b90bb89so6547659eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 01:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793004663; cv=none;
        d=google.com; s=arc-20260327;
        b=D1gY+g/j6HvLWsFWv63rFOB1UILggRc3c/8x1gC7y3U7z2xn5rYPsgi5CqRgcXjE9D
         sTwsyebC0WKo3X+svQn4yjnUnlm9OSLk4bfbzKXnB/vFOMBOS3YrACIWMHe7LGb/Hf+9
         8EBA18Z9Pskm5t7w3i37hJrf+pDUwaQn8pbaxtw5uHdMWpTbir1a3ORCQ2I5i5cBO5cZ
         6DtP/111hLEdAHbC0IfxIlKGN9qTzCuZEi/ZX8nNiL6L4RTVeczRhCD/qDbZb2jzftEG
         z/eta9p7eUHe660j1pKBHwNP01MN3TXFzI1FDE2i2abfD67M1nZ9P/OWO1S1fvogp6o2
         mwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AkYXn6onLTJUFDnVxOEC6DFAsMb9fumAoXKz09PsQuM=;
        fh=y4gNFOdO6BHqFf+zL/iZpvFrzpW4fvNRzPq6XFnhHfE=;
        b=ZjrFef17ee5LXS/kjRezTc8Tl/CA9aYEf3ULOkk/R8kH+xl/7i6s5PYqplBTT/Vgwm
         6R1v+0WIwyC5WcQMJviw7azSXQyVVH+EbMw+xcNW/jDLeBGo1YNS2aFLTb3GwUBZyy3b
         zMJh/dDbYARWwH91Sohc7ygpFiNp5BNCjJ3QxWhsfHYyTDF+FeyvCozh25S7kNk3LKQB
         QgxdS1thMrRoN1alwJ1OpT9U2qlL0MYlxjbdyLw2Sn3PslrA1bFl4Dc689zw0/qAMP6A
         jJb6oEvPt0sjYMwdV/+3sKOyk55rYT24Tjz/hrD65AzyEc45NB62sJC2K4bQRUpx/gjL
         8LAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004663; x=1793609463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AkYXn6onLTJUFDnVxOEC6DFAsMb9fumAoXKz09PsQuM=;
        b=oh2lU9lh2XW5bOMIoZggPWD/M/w208pLutnXYKtqzP4b2JJ18pW6eKn/KP+fPwj4R3
         mJpwRBZtjw5JnMaXltAZ3+pKOxs/hLeOtkp5pZfFcWLpzypC6IJXH421xJ2LMwnfRlKp
         iU4DLNYUBFycQEAnXJlnNPoJS/84qHhQ0TZfCFg9RlzuSsaiCGLhH94a7bdHammdeDc6
         w0HeWoPpOek8aeQyfPlzrX/2hl8c9V8en0t0VIeqVCoRISPKKz5KQLH55rtOfwuA6nfy
         GVVqgUyBUKDqBbhrnLFbZMZ8sE0jKUvp9DqEXfi/mqUnrtrB2jK4BD/iWysVxfpDWVfD
         1P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004663; x=1793609463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AkYXn6onLTJUFDnVxOEC6DFAsMb9fumAoXKz09PsQuM=;
        b=UH2ONbrORXyrhteh2lSeZY4qSbsPFlkLhjR8z8roqaWhHUzBPLF+/EZSSkP3xpnG7H
         a/Eu7Q2btptiDh/yL98q6otO1ZPvyeUvENrYUAplAfQvr8RdgniOc447LY9VJ4X2S02k
         oJy7MlHzcnvwAWboUffbMPg7vhHe91MifS3hmww0Lvd/QPsBiva/xWfrLCWzqG9Hgml/
         Er7Ko1w1lklf39dm2p7dgCCltbi7Abk+gxj0qH5ryZ1pfQMNjXPKx16i9SfSZG7+1PYY
         lUJ/40OpiznG6g9UYsWaTOwRK6JWpm+sFxRs/GEx2E0r6o/D/qOTueAEqUfPViTn4O0K
         AoxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvij2tLPWQVORCRlYuEzDeKWbuL4KiRLlTkWUTCrWeu/8b8cALpteveJb4V0jdskX798WcTUe3InBVOA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLzPX1uXSd/B0TFIU9K0cDp2mDCBnEcB69LIdc0kIvWPezcJy8r
	5Xa8phCg88n4mucRx+ySQgJot7buGbjk+h62df8BF7C4mdiUxITruZe3jFCzfaSLXYsXHL3JnpN
	oJU6yEfGmvoP/YgcC316RfqFqFEI/MHM=
X-Gm-Gg: AYBFou17XlMq7p7pdFXbrNy3RfyEBjsRvebSAt3l+/NVrVAgQgWT6dER6/r6B1Ii655
	StrVhmtQIjasVFWZUwrP7G9S+06syDQFzU0WzJRgcY7/JiSVW/TWKz17Z65BVsw57marZGmlx8J
	fme3kNwnuNjzZdVJGGxGSRV1GyAr2L//qYmA2UGYXX5mP8wtvCSRsRtFCKPCGuCGDOEesQLZCU5
	+r3mjPIkupp1xz0Gr3RKxI2YrFoc0SABDG5zsHRKV9sbemv4eaJgf0Z9WP86kKQBddA80wQz34X
	ig3qEYevKZGiHgOPvOpN6LqyfPEXiTCWll6JSIQKlrg4uyK1zFnWsV1Yh5/3ohFf7ts8rLD/gDs
	fqVfssNFP2IfPdpwCrtaXFKiJxGrgiBdgv3Sh9UGF7/31vOpIHr9NauXS81Sw/84hI/jHjg==
X-Received: by 2002:a05:7301:db85:b0:369:d486:457f with SMTP id
 5a478bee46e88-369e834e14amr8992878eec.2.1793004662453; Mon, 26 Oct 2026
 01:51:02 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-upstream-serial-tegra-overflow-v1-0-267b5b7a79ee@tsv-stahl-riesa.de>
 <20261025-upstream-serial-tegra-overflow-v1-2-267b5b7a79ee@tsv-stahl-riesa.de>
In-Reply-To: <20261025-upstream-serial-tegra-overflow-v1-2-267b5b7a79ee@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 26 Oct 2026 10:50:51 +0200
X-Gm-Features: AclHuK-MLwyI42-tjUetBxMw3Pp3JS4p0iAKrtkhDYxpLMnE-AgEIVtlDEnzRGY
Message-ID: <CAPVz0n0bc8Ox8jLmeGZTHhT9+=xKmw-poX0gM+e2SE55zYf26w@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: tegra: Fix overflow in tegra_check_rate_in_range()
To: admin@tsv-stahl-riesa.de
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Shardar Shariff Md <smohammed@nvidia.com>, 
	Krishna Yarlagadda <kyarlagadda@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 26 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:5=
0 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> tegra_check_rate_in_range() calculates the deviation of the configured
> from the required clock rate as (configured_rate - required_rate) *
> 10000 in a long, which is only 32 bits wide on 32-bit ARM. This
> overflows as soon as the two rates differ by more than about 214.7 kHz,
> so the check lets through exactly the large deviations it is meant to
> catch.
>
> On the Tegra Note 7 (Tegra114) the Bluetooth UART ran at 45.33 MHz
> instead of 48 MHz at 3 Mbaud (-5.6 %, see the previous patch). The
> check calculated -0.18 % and let it pass, although the limit is 4 %.
>
> Do the multiplication in 64 bits.
>
> Tested on the Tegra Note 7 with a tolerance of -500 for 1 to 4 Mbaud,
> which gives 45.33 MHz at 3 Mbaud: the driver now logs
> "configured baud rate is out of range by -555" and does not apply the
> rate. With the tolerance of 136 (48.00 MHz) it logs nothing.
>
> 64-bit platforms are not affected.
>
> Fixes: d781ec21bae6 ("serial: tegra: report clk rate errors")
> Cc: stable@vger.kernel.org
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/tty/serial/serial-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988) and LG =
P895
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
