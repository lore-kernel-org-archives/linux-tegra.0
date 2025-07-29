Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDB9298249
	for <linux-tegra@vger.kernel.org>; Tue, 29 Jul 2025 15:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804233; cv=none; b=VHyFisHzJOtauKtJxy41sTcwI2GAvb4Coro9fbbnIKkORU8Aau8NwYcX7C/u048d49CG3CNC6vEkLybIrbnUnqf3ud9u7ESSa93SH6D6c2qyCYEEMFJn+/sbfMC38ofbd2wbkA5gPogFGPtJQslKwcQUmBGy5VoQY5etpTULnJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804233; c=relaxed/simple;
	bh=aK6DAz9Rn0pDYgiJ1D2IiPEmn4lLliKNp9Wz4+oN35M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iov/YuWq/vNHBrn3dRDiar94RNa7fxL2cyNAfP4HcS4j0H4lnxHTfm8qq9QcJ+y/nK+Tckkh8DYv2qZ1/pdbrIbRBrsZJRh+7xemPRbsjsb1P51fsh+vkpd+DWLxYgAgP9k/EzPjAU+4MBBuUnSB4NhXA9JKlD3HWk69Vw4BIhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPI4LHww; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPI4LHww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECD9C4CEEF
	for <linux-tegra@vger.kernel.org>; Tue, 29 Jul 2025 15:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753804233;
	bh=aK6DAz9Rn0pDYgiJ1D2IiPEmn4lLliKNp9Wz4+oN35M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lPI4LHwwHOQ2Wt8nfJevocXVAFV6ajMwsEeiggmp0I+IXq4S1tm5V482RrhO1/t1p
	 idaxPaxYZ634U2NBH8HUFs6A2Onw4vYmFNAYBvzJgGL/Ge4smEUTYBtifvnbrKlr19
	 XS/4JnuLjmULYdEmXoCK6CMEPFHg0Ugo+LF0BpUQJphxrpYTxmMqrvGe6sbgoFL39n
	 KOx3zZ9EzTd80NpapYsY4ogu9NRgP7uSA6RsXzUTJ+HSi5rDPGydtCYEi6+SbcakXo
	 FT5pKLUEi4sp0LMEYJ68r5HRyr/MiXC0BRjkiziyeZ59pWk7atXVo/83SbBDruiTp7
	 G6XF6OPBF+gEg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6153a19dddfso3928631a12.1
        for <linux-tegra@vger.kernel.org>; Tue, 29 Jul 2025 08:50:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlpOcDg1YjAtRcF/dKgduhp8aApI5WgsRsS/5fk0C0clh0ImEtY9w+hd7x9MUvJK1OZIXiX0KvWgODgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YysGISoassSKeKBzASB2YX3t9iMywmxxhvJF8ivsDKh2FJyahH5
	EcTgqjJXfHvWAGh67aeda+OqIs9u2v0VDT7pczO4YmKXbK9e99Y8CDuljW108Ic3HggP7xNtK+n
	KMV3LQQjSUTRfGPTsNHr+tFDETD1BHg==
X-Google-Smtp-Source: AGHT+IFpnX4zAwAcMmUlt7CP0m7q6CUGeWm7lrOf3wWfeQsBq1H9hV41PIARVuFU7MdhixziRf0bJIRKcOGCwUJgUZE=
X-Received: by 2002:a17:906:c416:b0:af7:5b84:86f0 with SMTP id
 a640c23a62f3a-af75ba30b82mr335218166b.47.1753804231617; Tue, 29 Jul 2025
 08:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729145911.2984981-1-thierry.reding@gmail.com>
In-Reply-To: <20250729145911.2984981-1-thierry.reding@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Jul 2025 10:50:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKQx4fNsPpoDdceKyG-maqHU=WUchROpiapo55M3q8MMg@mail.gmail.com>
X-Gm-Features: Ac12FXziQboO7kFs4KmDDBT4Onnj1VNuZbBP2V8ALV0tkhRq7nwWaRPgGQZTg2s
Message-ID: <CAL_JsqKQx4fNsPpoDdceKyG-maqHU=WUchROpiapo55M3q8MMg@mail.gmail.com>
Subject: Re: [PATCH] firmware: tegra: Do not warn on missing memory-region property
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 9:59=E2=80=AFAM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> The IPC shared memory can reside in system memory or SRAM. In the latter
> case the memory-region property is expected not to be present, so do not
> warn about it.

Then shouldn't the only warning be you couldn't find either one? The
exact reason shouldn't be that important.

>
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Fixes: dbe4efea38d0 ("firmware: tegra: bpmp: Use of_reserved_mem_region_t=
o_resource() for "memory-region"")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/firmware/tegra/bpmp-tegra186.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/te=
gra/bpmp-tegra186.c
> index 7cfc5fdfa49d..64863db7a715 100644
> --- a/drivers/firmware/tegra/bpmp-tegra186.c
> +++ b/drivers/firmware/tegra/bpmp-tegra186.c
> @@ -198,7 +198,10 @@ static int tegra186_bpmp_dram_init(struct tegra_bpmp=
 *bpmp)
>
>         err =3D of_reserved_mem_region_to_resource(bpmp->dev->of_node, 0,=
 &res);
>         if (err < 0) {
> -               dev_warn(bpmp->dev, "failed to parse memory region: %d\n"=
, err);
> +               if (err !=3D -ENODEV)
> +                       dev_warn(bpmp->dev,
> +                                "failed to parse memory region: %d\n", e=
rr);
> +
>                 return err;
>         }
>
> --
> 2.50.0
>
