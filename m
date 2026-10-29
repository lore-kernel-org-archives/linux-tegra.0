Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793268694;
	b=UKSYRhdCGjF7OfDY9m1uG54JLBU+Qha6J2/YJIdzVvYX0FT6QQXM+BXDuIRa2gJ1oxoM
	 N1VWRj7vB/PvmWslHI1XSVQt/3SEgk4XrA4kv+JErFsTX7yoni4f0dGEEZGRXToChNfa9
	 Ng/OzuyEH3cWy8oCYctQnN3QtcRHiIhTbFe3fdloM6rTMmOPYREJyWPnYd6EIsY/IbQI5
	 36VIhd9UfLT6f65KMQpsNSLmBFu7ih8pyXxTk7ZkjNDLAcfQc4I9vLu8S5PqxILedbHKa
	 Qlf9YYRrs+KUojTIiu26XmTPCXV0eBwlW5wAInKRXkY9Oi4vjDCbzJuDjBJYDTE2RLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jgkJopx5kExqkUv6b/vCU6btPQBGSF/P3vuAWpTWJb4=;
	b=f5Oj1bm1zg/5pPd17PaMpz2HeYFeLlDAjmvA1KOw2qgRP4Uc/eNFq2ypuVCaHtoamQCz
	 cPtIFC0Hlq9r4OKPnfAgO7qK7+vuKHHvppH+/4H7AIESCGq6erf1UTtxJzIsOen08i2DF
	 Rl4sMVs0KK76L1Q8EkT5pOJvhxyRz0Bg+k7tj8T5YFvu9LF6WPwrdSz3Mvsr5KrimJ+FS
	 X7JTWhng0ozk7tVXW7nHZjBdx+QhxHUI/3ENgd3bppmSz7Okf6vtBg5+7xwjV5ZMR931V
	 ja6JbN9mS3c30kR+RXd6C5G6sg1Tq39TIvYREKctV0DWmYD8zkYlqMIWtTX1WaQOYbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+uDtHfY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF1A606A31D
	for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 10:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF1A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+uDtHfY
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35b2c599f43so4204079eec.0
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 03:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793268693; cv=none;
        d=google.com; s=arc-20260327;
        b=PNAoEYjbiPoKczxdYKmBFrDhaTB2Q3Quvde6Q0ZUnYonHFLal3e4QUOdF3hO29fiXk
         ORTJrgN2NwJ6HZxpf0xH8RprYAZYfHBqtQu2nx8E3oKLxgxnl/8v8Kd/GlIgb4gm0il1
         s+MmEnFKD9sZKTa3+GWIBrdr7TlykfLClKkhVjgC6rhBfRJpKcgGBHmkNc4uxTtabp65
         /Yx4gXCPGToKzAE6cuzrjSvfiewtfAGKOYlG8I5Hk/uJc+J8D5cU4XefOcvewufHk+mR
         ytzn4jZpds1DsF6w3VqdgvCusOVmimaPho6jNKielUsm9OT669tEx8H1euLxSWhmSMsP
         zbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jgkJopx5kExqkUv6b/vCU6btPQBGSF/P3vuAWpTWJb4=;
        fh=kjd2X5ZX80VVxxaklzX0Ubzu6ZJB4uQZgsB6KKFnYC0=;
        b=pIlN3Y9s3H2Idz9Yo1U7bS409ye3STP/fY7wBziFJkogH11JVuM3DYedDkp7VXyWdf
         fHuKLcbIjfE8pp/6U6XX+N36ZrNQgtHim4rRlnR5HpizHzOG2NJpcmxQOOPDJnfv6OUI
         KNxhBWc+2GSbG03PS/UOESkgkGq1UeWoIH9ciYV7Wq12e7bhXt8lB+z72a9A2/Dq8787
         iimZn/8R+WpWN9L4a/bka/M+AUOI+3tPeR0xBwXPSvtjw7dd0jMqv0kxBLqcvV7UJ90U
         IbGXLRPCSDjJUlUS7ZsrXf68R3RAj6FS00G9GWUOriP9xfEMs7wZcq9e2CczU/APxmmk
         sgyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268693; x=1793873493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jgkJopx5kExqkUv6b/vCU6btPQBGSF/P3vuAWpTWJb4=;
        b=m+uDtHfYNrebraUeNO71Kwkxzuqpdu3zCHQC48XO/a+1chRZiH7mHXPDqLP8HQ2yiH
         Tr0GNTkJJBfuOJDO/AX4VaktcSnRFMWJDv5mItb9Db77+hvYsFIxDorsRWc563PDbMSC
         WFf/XcMi0JTg23ul4cIHTqnY3lIIPwrFyN6/bltmGyVtwoQ6kqzgzklFux4nuOjGKS+i
         tPeerm8onxx4BYHYLafWUxDHX2QG6ZEOT640AX6ke/L3iW4tOH5g27ApyIfQllKU9Y6G
         y8HuQZBr1vP3B3fbPuvMufo+5KSREll/cupagNW82ra5HvG1N466DCf/4msA6IkJseEM
         2HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268693; x=1793873493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgkJopx5kExqkUv6b/vCU6btPQBGSF/P3vuAWpTWJb4=;
        b=vOt/FPV8ZkRlEDJpWUAgKyH5KydIPIFj4Gft3tDKHCgTTIBKnH3VuSTO5oUMPN+DM6
         8SspTjKePfRNuH5VCf/5+jm7nNyBfFcjqfTPR39onERbklozEUhLpQ9b51YW/60wc+jp
         FK2eUlmG5zkiil1CBIhqVGLlqKg/PnmA1+vkoxozN/sbl4ctTRLhV7cdNvTV9oNOmLzM
         Tm29XnEf166XIJUU6rfbgpToeV4X1d/OHWgyPPKyXNKmBi43N5bkFFjoF643z3l4N8nb
         dsyXILiBo/bnslCkJVhVRKyj3V280AbxxYJlj60Fsh85DJC5L7qpLH1Hw5qRwb04yQf5
         VJxg==
X-Forwarded-Encrypted: i=1; AKwUvBx90n4W+wl343zl7aMCrIwI2ns1KXct8CAITHQJkoMIm22Px9u28IBQjc5QH6ETe5Gkm/H7qOXx2AK41A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLNsUhdnqZezjgn8b7Ml4/sO7kQQxBnwFeV+y43N0PYSGT8MXZW
	D3ey/jHlw3XwchB7UPVPFC9vCVJeave0l26Nkqiqle3jbHw2pRGuXaQS040aOAv0srN5zmolbgm
	HlAq421l0X4eaiav2q/QnjHjMyubfVBM=
X-Gm-Gg: AYBFou32i9tXgXrfgPvH/lpXtkdQip0yYRZXlLCqxya3gLw5ICYelN1gfdWiHQwEUEr
	nrIHJrSmGXGglJmxQ9f1KO+BQXj/dbCw/mtnf4tPcscfvPNzCOgrj9pSO1N4rsl7oJzDM1MasFh
	4VGOHFo3Y4wghlgRYLwq2t2dwq2sKiTnh5kYShaB/2Ls6ECc/022EDdRk49UJQVTBVN6cP3mUGG
	R7w33WtKsD9cGO7N15LzCS/Py5oKcXvbPStnj2z+EH8cU6f0HQcrCMe96uKmh819rs22KiF1ePc
	N5ngK0AmFzVNY7O+KZQohdEYqM4XzdyoVHpw/OpFi/dUUxAjuuCUmcV8Biqpn4TAHWOKdjxhwXB
	uRgbbJZ3RpIlBycXKnnXOBSGxIrWrKEEg2x7NK2ZYMNlpnnJ83rGYTj2n8MUbIjHuJdIgMA==
X-Received: by 2002:a05:7301:618b:20b0:366:83dd:46f3 with SMTP id
 5a478bee46e88-36a20434490mr7778201eec.14.1793268693130; Thu, 29 Oct 2026
 03:11:33 -0700 (PDT)
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
 <20261029-upstream-speedo-t114-v1-1-81457cc9d94c@tsv-stahl-riesa.de>
In-Reply-To: <20261029-upstream-speedo-t114-v1-1-81457cc9d94c@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 29 Oct 2026 12:11:20 +0200
X-Gm-Features: AclHuK8_mii-vqm8jDLm-mNdMkH2Er6-ZHBho7KaLFga9WcAe3FyT06Xlc5Ki2w
Message-ID: <CAPVz0n3tFvEycAAhjA5ZqoBrx8MsJwDuBssAzLMrFnicSQ+eMg@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc/tegra: fuse: Fix Tegra114 speedo fuse offsets
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
> tegra_fuse_read_early() takes offsets relative to the start of the fuse
> words at FUSE_BEGIN (0x100). When the fuse driver moved out of
> mach-tegra, the Tegra30 speedo code was converted to such offsets
> (FUSE_SPEEDO_CALIB_0 0x114 became 0x14), and the Tegra124 code uses
> them as well. The Tegra114 code kept the absolute offsets from the
> vendor kernel, so since then it reads the CPU and SoC speedo values and
> the A01 CPU2/3 fuses 0x100 bytes too far.
>
> On a Tegra Note 7 (Tegra114 A02, SKU 5) the fuses at the correct
> offsets 0x2c and 0x34 read 718 and 1156. That gives CPU speedo 1742 and
> SoC speedo 1156, which is exactly what the vendor kernel prints for this
> device. The current code reads 172094 and 0, and so reports SoC process
> 0 instead of 1.
>
> Today only the reported process IDs depend on these values, since the
> Tegra114 core OPPs are selected by the SoC speedo ID and the CPU DVFS
> tables apply to all process IDs. The CPU speedo value is needed,
> however, to compute correct CPU DFLL voltages, which the next patch
> fixes.
>
> Fixes: 783c8f4c8445 ("soc/tegra: Add efuse driver for Tegra")
> Cc: stable@vger.kernel.org
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/soc/tegra/fuse/speedo-tegra114.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra114.c b/drivers/soc/tegra=
/fuse/speedo-tegra114.c
> index 6695702bdb4c..1e6c2b5be759 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra114.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra114.c
> @@ -14,6 +14,11 @@
>  #define SOC_PROCESS_CORNERS    2
>  #define CPU_PROCESS_CORNERS    2
>
> +#define FUSE_CPU_SPEEDO_1      0x2c
> +#define FUSE_SOC_SPEEDO_0      0x34
> +#define FUSE_OPT_CPU23_DISABLE 0x16c
> +#define FUSE_OPT_CPU23_REENABLE        0x170
> +
>  enum {
>         THRESHOLD_INDEX_0,
>         THRESHOLD_INDEX_1,
> @@ -63,8 +68,8 @@ static void __init rev_sku_to_speedo_ids(struct tegra_s=
ku_info *sku_info,
>         }
>
>         if (rev =3D=3D TEGRA_REVISION_A01) {
> -               tmp =3D tegra_fuse_read_early(0x270) << 1;
> -               tmp |=3D tegra_fuse_read_early(0x26c);
> +               tmp =3D tegra_fuse_read_early(FUSE_OPT_CPU23_REENABLE) <<=
 1;
> +               tmp |=3D tegra_fuse_read_early(FUSE_OPT_CPU23_DISABLE);
>                 if (!tmp)
>                         sku_info->cpu_speedo_id =3D 0;
>         }
> @@ -84,8 +89,8 @@ void __init tegra114_init_speedo_data(struct tegra_sku_=
info *sku_info)
>
>         rev_sku_to_speedo_ids(sku_info, &threshold);
>
> -       cpu_speedo_val =3D tegra_fuse_read_early(0x12c) + 1024;
> -       soc_speedo_val =3D tegra_fuse_read_early(0x134);
> +       cpu_speedo_val =3D tegra_fuse_read_early(FUSE_CPU_SPEEDO_1) + 102=
4;
> +       soc_speedo_val =3D tegra_fuse_read_early(FUSE_SOC_SPEEDO_0);
>
>         for (i =3D 0; i < CPU_PROCESS_CORNERS; i++)
>                 if (cpu_speedo_val < cpu_process_speedos[threshold][i])
>
> --
> 2.56.0

Thanks!

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
