Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793004634;
	b=KMll3ta9KJ9wxKv36+mRZHN78pqx6WfQ974IqenfLlL5NaW4mTgBip878Ad3n7tdMG45
	 GLr+VykB1I/X9cM/S64oOfW13/NxKMc/U/9C0DE04X3J5U5x+tniR/rQ4+v2Pv7z9x/0Z
	 bsrDVf5+Lql6WCUNu/T0t0EeB3LFneoPbBJpjsvwMA9hkjlbOk0zY4ZluCqF5L9AoIub/
	 FZ799ELv8587+9f/QXoGPhGJvQG9vVP11tjsoJeIdQASfdgdQN+3wjB6JUq7P6haCRVDT
	 QqfmtZpGbVNFRTKTXZxBMf/1I/yVDSja+NewPzurRPqE9exHNVRNF/lOSVe7FfmnKPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0xS2sklpUUUsLj11Ls/tuw9BnZ0uRdCDBYmfpAjGG9c=;
	b=lT9q1nLDNhVuWsI6TErmwSBpb43T4xHaxr+sdQY7f4JHGALSDcl+pMWIrHhmZn1vCOeO
	 mXkMtJfR8r3V4/gHOwIvU6NfIF7UDU13QDkvbG1ZthLIfwUsiAkTBvj/rmbCl0fDqXg30
	 rYuK1GPI5cxnVhwiC9f673eVeDGnj8qwEVhxAYruobpNBF+Nuq5JOEIyk+QgsUvoV2Dy7
	 e1eKpF/CcEfBP61R5o1PC4uPooCoEolYGDw5p1xof6SJaUxx0s8vlwbFizWb/3Q33LXVA
	 apdeeKpo8vv9cPv6MwO6VfWRlcRq6a9mEjCCgMrAuT5MqecjMyNjbDIC/kkPV6IHEfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nn0nVMTW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EF3606A32A
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 08:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24EF3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nn0nVMTW
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36661f953e4so5240798eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 01:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793004633; cv=none;
        d=google.com; s=arc-20260327;
        b=ITxJvtGBNBzIoJc+Bnb3eLI77Cdz25oBz86KNj7DmxLuiSZMqtQ+4MJGYWrkXKknln
         V7zJtgdU7UL5dtubxDrPDFSbgq2JBK4LSdX3Z4X+T6U654rdhQ8GsMmiZzNn36NlrD60
         mjYSlkEc5Uf+yOfdIOHmS5L/1+Rpg1Ju278En0jBTPgS4hOTOd/nV1rBlendPDq7Eb37
         CEs+3f3fsRB5hh2AqX89U7y6SOq2ObfJcqCtFvXdl2ak05rQdq8QKMy46YJTj/NJ78Ra
         RW8XJVUolPRDUS8OvckW4MhspJkaPCpCNINb3glO0KqT36jH+ueaKod62nQxrWL+QNOZ
         4wIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0xS2sklpUUUsLj11Ls/tuw9BnZ0uRdCDBYmfpAjGG9c=;
        fh=br7Qb+m+z6OOaadM8E1WemON/xUCR4lliti77di3dS0=;
        b=KWpHSQOQTeYntIiLK1GPXIyfj4eWfojhdQDOCKBaePwR5hq4dMJOYosHZuIx22CgOP
         and0T6bXEABfp4PRU2MzeLGxac/LVcZP00lhYiEs9qjeEbqBAsRBH9HNWSNB0o3hJmr7
         pzeLVv7MM4IqxH3hNpTH8zwEOJvoJOkd4gDem/wF+Is0dmWhx1KxrUqaEjijdWci1vQP
         YwgxRdnPE7rDx2qppmF7YXRWmIa0Mu+8T1YOgbn7VE1292dQj6GgiO9uJLKAtOsk+f7A
         JdP8cxF85kJyqyXf1TToIOs1Qb6gJ3iilvTv0lASnTZ4j+qtKWVRA8IQ3alP5q2JZB4m
         fYaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004633; x=1793609433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0xS2sklpUUUsLj11Ls/tuw9BnZ0uRdCDBYmfpAjGG9c=;
        b=nn0nVMTWa/ugZXPz401T/3tm2krdJPTQqU9DomZfF4YDxk/9Q9Uh6xz5nhH6qQ8P1E
         AeYL5P0ze3rc/tKbby7ir9sx5t0zkHCxvV2s/Z1mk1NnH9mt47jESv9zkkwMSVZbO7kN
         a6q3ybnwzDOLcS5B4C0qvq41i/h1wkclm4EbNTzFxQY95U9tpUabB500RG/Nx53/SglF
         Yaj/7W8im9IIiHbhzpwoGIqJWCpWQ/mk3MJ0BJocjD1/BYp+QawbLJpfI0kBLJxo/Azx
         baDB3XQzzCf9lfyV+uio/X8ICKiL89jsF8lex617pD3TS3z6DwNwC6bvmQXehcSeWAo7
         3J/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004633; x=1793609433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xS2sklpUUUsLj11Ls/tuw9BnZ0uRdCDBYmfpAjGG9c=;
        b=G9fJ7M0IzmgB/ynFMoQ8KyTLAPXZ0J81sRHuPb6GZldoy04wyRl3YIbJ8AQjig3f4N
         z9fzObts3eFiTQMDrImptyltnmjxnek3smv/UK92bPgAEOuHNfZ3mZN+kUOxMSddTIUO
         yd/4t+xk7JfsPBrw7Ve+qWyBZnw2om/a0D+WYX0nSel8SlB0rot2u9cUBcLBQ1JeopHN
         2IuSTmTJ7j7NyeXahLWCgPX3cxcJIibMpeTnPJtoVNEUzj+BD11W1NpLmckGTSOOzicQ
         RFbIAAQpbJ/EKfUXZuQTCL01pHApQ/RXIKOEMoopuYjcoZ8F8DYd6u4uW7kqao9FJX74
         LlQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzzF8nDehfuAVUZviDpJwN8WfNZsrPijjg482+8YBG/KTM2eP4YFlmt8T+/jUCwM/xndrWRFZI1lp9qA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJd6ucErElWPblA0aPLoFQJtj6SKRAbbL/9TqjzAbyH2gYX1uU8
	fJRUb0cKrmNpUYeE0Fq5BO/Q7FCeMFZYK1k92RG3aF68F/dEvb/01As41trlz2Hj6/zZIgnefwx
	KvcmB0AROWvAaPqYDbO9IlZ+z9fdzfgo=
X-Gm-Gg: AYBFou2spMnu1G1Nw2sH48FJ9/G0l2F/tiTifRgQXAiyUj0CHfe8La5P1aLXqb90/3A
	icpN6NT/hbOJuulL6kTrtmzEbAaW3+v72IOBwuM36q23hjKNigSSZZrdH8T1PvGnjqOVN8CSv1V
	8It/o1IgEPF81XXIOj1+Y6jXCHSI5SH1P015p5mc+QXvgtBopLZbDlc0XIdjMfT2dP/dbPR+xlY
	Imfq0H6nBN8BK1Bn68ZfIuKJ7d/G7wMxcKtZoQGeu5Lpc3MVulM+g5U5bDyvDF/ZPJx9kEw/M4D
	sXmFXsrD4951wqNYH1nP0yFF1Zmf0AYaYoS7HS2QbByaHw8assGT6j9jkTpIjKtwc10PrA8uonb
	aMhBgYAlX7cVRRwVFqCyyLLqhmYcHB3ODGwx18+aYGA02VEzCUPnmzpZ4YrVLjlhNQCLJNQ==
X-Received: by 2002:a05:693c:87d7:10b0:366:83dd:46f7 with SMTP id
 5a478bee46e88-369e84bc5bemr9492113eec.17.1793004632970; Mon, 26 Oct 2026
 01:50:32 -0700 (PDT)
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
 <20261025-upstream-serial-tegra-overflow-v1-1-267b5b7a79ee@tsv-stahl-riesa.de>
In-Reply-To: <20261025-upstream-serial-tegra-overflow-v1-1-267b5b7a79ee@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 26 Oct 2026 10:50:21 +0200
X-Gm-Features: AclHuK9eFB2IINUeequ9JiBD2-5Y_QxsonBBC6Q_QH-dQtxOvUA1C2K4ZB60Feg
Message-ID: <CAPVz0n1X3K_vtCNUg5k6oStVCfwZEpXJSSGJdk1OK24au1R-UQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] serial: tegra: Fix overflow in tegra_get_tolerance_rate()
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
> tegra_get_tolerance_rate() raises or lowers the UART clock rate by the
> tolerance from "nvidia,adjust-baud-rates", given in units of 0.01 %. It
> calculates rate * tolerance in a long, which is only 32 bits wide on
> 32-bit ARM. With a tolerance of 136 this overflows from a clock rate of
> about 15.8 MHz, i.e. from about 1 Mbaud, and the rate ends up adjusted
> in the wrong direction.
>
> The Tegra Note 7 (Tegra114) uses a tolerance of 136 for 1 to 4 Mbaud on
> its Bluetooth UART, as in the downstream device tree. For 3 Mbaud the
> driver asks for 47.79 MHz instead of 48.65 MHz, the clock rounds that
> down to 408 MHz / 9 =3D 45.33 MHz (-5.6 %), and the WL1801 controller
> stops answering after the switch to 3 Mbaud (HCI commands time out
> with -110). The same overflow gives 23.31 MHz instead of 24 MHz at
> 1.5 Mbaud; both rates were confirmed on the device.
>
> Do the multiplication in 64 bits. With that the driver asks for
> 48.65 MHz at 3 Mbaud and gets 48.00 MHz.
>
> Tested on the Tegra Note 7 with the tolerance of 136: Bluetooth comes
> up at 3 Mbaud, scans and connects to a paired device, and the HCI
> counters show no errors.
>
> 64-bit platforms are not affected.
>
> Fixes: f04a3cc8d455 ("serial: tegra: add support to adjust baud rate")
> Cc: stable@vger.kernel.org
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/tty/serial/serial-tegra.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988) and LG =
P895
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
