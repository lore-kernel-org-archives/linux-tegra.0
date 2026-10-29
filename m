Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793268721;
	b=NeT4uk3VGJUCRRHkByGECQ1wo3J6YrjSBjj+YKRBdEAlwLw3L2F/S4A+D4Ccbc729Hks
	 cYcberG+assrG4WNi6/WNAOCjbsbcMHZB3xOaxd9VJOh9mJ1jKJ4/AdffnHM6/akNrzIz
	 Wq/Emba/v0CCp3vUeU2FPQWrdEXF0g7A+4LXohc13mxsOpkdnVLSBv0EwrJAciGZiQI/0
	 j+yvSoOQviGDqqfjXsHgnS8FVRQ6n0AOWV/PVImsstduBZ72ewJcse6u2D+KJ0uHQ5T/D
	 Z4f7XtRGQ5xZ5onoQQkUqbCNMRu93GWGDcAjabxkhZPofQ4IYJZDXhqlbg1LC5l+WNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7s60NUUwdXZLJ5wOWPuuDFc73pKrbdpj75fVNegY9N0=;
	b=r2LUFfGHQfQMCX1NEwbRMNWmWGQP3dFHVHD+HNHCMLJq2ARJn42BI7+FpIA5QO9uyRnC
	 TX2lUASJ5bmGoZbO5NaYC1Psk4wkoQOC0nF3QrRPmzeOtRcfq7r1sG8YARNAm1F7J+1lm
	 flgq/m9rtiWJhtnX1wdD0l3dXo4oFCu9chGseiBoAPEnr8EpT4bNNId16GtLywNaekaB5
	 YPOG+9njl4u4Zn8qrHCoATfcd/T2Tta6xCbThJ4vDGSC8oJi16oS7rNEarPGbYFa59kir
	 ztq/BrUTX7BgFfO/SEUpMFCM7V1K5WZX6NNeBL0zxVw+zrvhxsMCCTUFDuIR4j2Zk4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2sBbzu2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D9C606A31F
	for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 10:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D9C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2sBbzu2
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35b2c599f43so4204817eec.0
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 03:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793268720; cv=none;
        d=google.com; s=arc-20260327;
        b=ic10oj2yq7+7EemlpFGFHLa7m60LvHgCmmY+WQifBshqrNAHvahfEEUeFTzM4+ROHU
         gh78B0Hmu3H5b4I3QpFrBJIPSDS5Iy0ryVH9yUbkwwbpZvPO1Mzi2DbRJw3f00uXJ7ey
         TMQQcd+0C5FhfqEgm3GRkO0BPCaGXiWmbZHvcfx5v3Ahyb5R2+brNjt1E+BibK9G4MqU
         IzlYyGhEhy2qEYB/rYVi+ms7/7w4MtiAQNn7U6oaYhs8DdJyEMUXr/UQTSRK51Q3K7sI
         zXGV78T/N5N+z/6+cpct48FxdDq8wH8LZQ6w7t2NdUCulrMWkA/ddZs6ERVUH4dTyeKr
         BcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7s60NUUwdXZLJ5wOWPuuDFc73pKrbdpj75fVNegY9N0=;
        fh=Ip06zAWe6ybjyW+CJeD1f36PJHzII0V11ouBx5NIsvk=;
        b=Dkcd5EJYCvbM3XVQUZjCW6gx5MFyfEy9QR6jYzDBvSGIb5kkFmWbfd536fLuQ8SHqQ
         8m1FC+9SPO8df+zWocZ1eMdVipMOE/c1IVXF1FQETVkm5TQQHQcU2xwd7bj+L2fvzunO
         gKn0Kh8uBtafPsiNCzQxI7mhFzaQTsZ695I1X8/shDmogf3vHlN8HyIu4OHmwJatf7Fz
         etGMY8RWbS+gCHdJClPsSyER5L0XtlF5mkZnQLXRVleC59tlFQgWZ40TooUZUDTlMoJX
         78jsx78cMVoR98KnhpoBOqBZJv6KcGN5kvdvYXGnIrOyOZNLkzmJMtpLUc5K9unc+nSc
         9jSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268720; x=1793873520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7s60NUUwdXZLJ5wOWPuuDFc73pKrbdpj75fVNegY9N0=;
        b=u2sBbzu2hkGqyQz96k0avHJnOd0ePQgrM+7rXIY5CaAiiyZJB7fbos+LVo4+Z+VJie
         mfAk52msiWbRDYHSp6K9F0r3vBVAu42VWJJcIswYAYEyddym4KipIWcJYlkp0v7JFUHa
         k3ysl41ONGLKIb+TkwkfXEuupnVYF5//5j061LJHXetcAlOvsUOPH6qQWPgEteyujjbk
         j5jaHwJArz0QdE8bFA4OOAr9Ey0Qm8lid05av05lDTQ9eH0RF0QJbM7I7Q/+KzxUNVQ7
         KpVI1eN/Yc8p8K+7W2df991+0sj/x6HGrbPlXbQCBSgjIoZCtd4sLnyYEm3nyAEBrykc
         JUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268720; x=1793873520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7s60NUUwdXZLJ5wOWPuuDFc73pKrbdpj75fVNegY9N0=;
        b=q9gA/NCB3t/IbKcTyQFFvltUj/dWPGtlEEboMYR2ffAMOieZpm39RoOJwP6zEkmDIr
         6Etw3tVhCGAAFywGBI+6F+pg2sR4eJ68FeX4LixRn0aunhZiEpmmQPGd4Ce2Uj6qlqAH
         IIWY89gOam2vXJtLZnAWL2X8GFk+6fiNDLR1XgliFTa/0q2huzjDnCb0okEg0XtLRR/f
         fmlLrTXoX5BteukSQcqTwNknYSZltUaTnKEzUZ9PWYz0pf7VDoZLqwY8dfuImCELhsQH
         YXlU3xHc0xBzWVa6OPUIwpPjHlfn71mRo1dfv/SJ5UH7TmqKof2r0FOmYvSmymC3wUKs
         7Igg==
X-Forwarded-Encrypted: i=1; AKwUvByTstCQoD9beHUJHu4mM1+RJkt+6VmkpTRihVSf6dsLD5vdStc/xn/xnvORhbYWj3rYACRc0zqrtrPifg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKh1uff5KLIby9jxKJbTcX0YL/8NxZwbYt9NiWAIfIN/JJHLw/e
	w7wErF8JaGP6VZcbS1v4y5jj+dGa+iKgxoY9Cnh/maRRrP1pe7H+CIPyebuU92u1m2cDWEE5dI+
	eCM3Lzww3VfNTELNgCNfswB6i05m0EqY=
X-Gm-Gg: AYBFou05rAJWUB00qGCd21NhzXnxytjpd1FHypMVrp+5IuRL7j44ns5XQ8eUJesfcvH
	OWK4ku1h66Gq+aMolsE/mwN8tuV/luTi1QD2QLsxVmSYxRED7joKl3zehM98tbbQW7eghWyAvd8
	0VDh9MFxfvVm7JZP6YAYXIMXl4EFTQALHTPKhYIvzMxXROVpYUJ2iDnuLd29nziUtW+nxIklWg9
	WwKvFdMQNJOmKuJbF/RGhZm3gIh20+XuzUl6NTTvlMcaFZGvik9YBKvPyayLGZEbCbSafxqaLJt
	crCjV+25k9wxliClg+0vs5rsbvDGjBZsIVl+MR+rtqDlg6fIkKLiMfZKxEgZFTHp4y8YTao2puh
	8ym5Q637EqlqMnf9Cy9cfuRPT4gE32g1vjwjXpv8zyS2WhCxaV5y3TGUG6cjYjuZP3JOH6g==
X-Received: by 2002:a05:693c:87c6:10b0:366:fabf:6273 with SMTP id
 5a478bee46e88-36a20459a30mr7592769eec.22.1793268719830; Thu, 29 Oct 2026
 03:11:59 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-upstream-speedo-t114-v1-0-81457cc9d94c@tsv-stahl-riesa.de>
 <20261029-upstream-speedo-t114-v1-2-81457cc9d94c@tsv-stahl-riesa.de>
In-Reply-To: <20261029-upstream-speedo-t114-v1-2-81457cc9d94c@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 29 Oct 2026 12:11:47 +0200
X-Gm-Features: AclHuK8mutFrWjpw6_PPdHUAyItvpAhM72OsxTaC6ggH-p4KNaOHRql6Fdiss_A
Message-ID: <CAPVz0n3TSeed-SgBbvsXtPJtx5CGzuYcruqOiKVaijBu2w+HVg@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc/tegra: fuse: Store Tegra114 CPU and SoC speedo values
To: admin@tsv-stahl-riesa.de
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 29 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
3 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> The Tegra114 CPU DFLL computes its OPP voltages from the CVB tables
> added in commit 5aba939e80f4 ("clk: tegra: dfll: Add CVB tables for
> Tegra114"), using tegra_sku_info.cpu_speedo_value. The Tegra114 speedo
> code computes this value but never stores it, so the DFLL uses speedo
> 0 and only the c0 coefficient remains. For CPU speedo IDs 1 to 3 c0 is
> 2190643 to 3395401, so "mv * 1000" in round_cvb_voltage() overflows and
> the OPP voltages are wrong.
>
> This is currently hidden by a zero voltage step with Palmas regulators,
> fixed in the next patch. With both fixes the CPU OPPs range from 1000 mV
> to 1270 mV on a device with CPU speedo 1742, which matches the vendor
> kernel.
>
> Store the SoC speedo value as well, as Tegra124 and Tegra210 do.
>
> Fixes: 5aba939e80f4 ("clk: tegra: dfll: Add CVB tables for Tegra114")
> Cc: stable@vger.kernel.org
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/soc/tegra/fuse/speedo-tegra114.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra114.c b/drivers/soc/tegra=
/fuse/speedo-tegra114.c
> index 1e6c2b5be759..8bf1a1b1287a 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra114.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra114.c
> @@ -92,6 +92,9 @@ void __init tegra114_init_speedo_data(struct tegra_sku_=
info *sku_info)
>         cpu_speedo_val =3D tegra_fuse_read_early(FUSE_CPU_SPEEDO_1) + 102=
4;
>         soc_speedo_val =3D tegra_fuse_read_early(FUSE_SOC_SPEEDO_0);
>
> +       sku_info->cpu_speedo_value =3D cpu_speedo_val;
> +       sku_info->soc_speedo_value =3D soc_speedo_val;
> +
>         for (i =3D 0; i < CPU_PROCESS_CORNERS; i++)
>                 if (cpu_speedo_val < cpu_process_speedos[threshold][i])
>                         break;
>
> --
> 2.56.0
>

Thanks!

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
