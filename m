Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50815687D;
	Sun, 12 Jul 2026 15:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870910; cv=none; b=to2UV/MNQdlTMjH9VZp2i6TqYVl8F0+BWK832Jni2k7vK8GAyOozkDmMlDzYoeZgbsM0sNes+fclIlod9wNuLsZLuHtoxlpnG5fJvAcLuJ6Ec0//fMMFOiHvKwJ8wc4Tg0BE7Zfn5JDUqaTCSuiP5Q4YQ1Ae53zrqCgsp8uJUWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870910; c=relaxed/simple;
	bh=schomdNhbeiKbo4HPXAv1Qi4ca+tJ81pgBJvh9gUUDg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a6rTCUDBaFTiRbv2mD5P1kz2Opt8our55h4QDo/r3KwrXe/CF8411ACarS4EbB5BJCiR+iw0uXWqcJc0CtY9YazYvdkxc3qeEKZSo77rRX8xu4vUx0elJhCeTfFCHC6NiGnjpYe++8Pjjo8H0uz7Bdjk8lRkOOSUU27orqySOQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=ly8QDOmo; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="ly8QDOmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783870906; x=1784475706; i=marvin24@gmx.de;
	bh=jv8euJsiVACSZBQLqfjIQNjggpUm158t4ddg/+4PIWg=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ly8QDOmo8c4OhKttdoE4oi50C3m1H3q54TJ3Eh/SjIUstbkWHDt8LBgdAa9W1WKo
	 s3x2eTfExcXqZd+95d1GQ3OUiKfjrpdwCzM6ah1NS+NWQTqwMvi2dkXzGNJrA3GLO
	 oDUSW9jPToi9ElPhwHn+kuunB9EmqtAONVgYAf+YsfGl3ZkywPeYlF0QzRtXzZw8M
	 7HRTUPa2+LzeSQRQh+aG4avLhZ+drepOsna5Omo+AC2Fc2OqLhxw/YiHj5Zj6LKj0
	 Y1kAbYWp8AW0E2wnvzYZxRhHbq4CmQ9DaQ85P4jBswgdyvt6nCLaw45f9Kr2NagpY
	 sa9VqsqbYlN0wx02Cw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOiHf-1wPTNd2D9D-00KZHu; Sun, 12
 Jul 2026 17:41:46 +0200
Date: Sun, 12 Jul 2026 17:41:45 +0200 (CEST)
From: Marc Dietrich <marvin24@gmx.de>
To: Igor Putko <igorpetindev@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net, 
    linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: nvec_power: use GFP_KERNEL in probe()
In-Reply-To: <20260710150113.3041-1-igorpetindev@gmail.com>
Message-ID: <1aad35a4-e5b9-c352-50ca-6dfa29ba3707@gmx.de>
References: <20260710150113.3041-1-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:GE+jIyrTtjvtmEU1RQwX/NElWPvxhGFUuf0VyV5mdjnDF7wsfUc
 NIr3qsYbVioh0irV3H7ADz7KWDVHzCGRABtY+5QA2raBdQUsJyHlHap0kI9Cfk1wcxsCzh6
 s+sfRJcFoDceS0X/F6bLnPiRhpgOgwCvsLMRkm3aSEGwGwEuuhdYc7qmTs2TFd9TkGpnsQP
 ZPW1gPkF9Ql2CJKw7mH0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EvohJFvZjNo=;XKhCYZaTBH6Pq3lVU5R/6pxHqyM
 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
 HdQJZy78ScLyrxwztpesQDfWLed5kx5kTPJbPgp
Content-Transfer-Encoding: quoted-printable

Hello Igore,

On Fri, 10 Jul 2026, Igor Putko wrote:

> nvec_power_probe() calls devm_kzalloc() with GFP_NOWAIT, which
> disables direct reclaim and is meant for atomic context. probe()
> runs in normal process context and may sleep, so this needlessly
> risks a spurious -ENOMEM under memory pressure instead of just
> waiting for reclaim like every other probe() allocation does.
>
> nvec.c's own tegra_nvec_probe() already uses GFP_KERNEL for the
> identical pattern, confirming this is an oversight, not intentional.

I also see not reason to use GFP_NOWAIT here, even if it is unlikely to=20
cause problems in this code path, as it is used during bootup where there=
=20
should be "plenty" of RAM available. But I think it is a cleaner solution=
=20
to do memory allocations. So
Acked-by: Marc Dietrich <marvin24@gmx.de>

> Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> ---
> drivers/staging/nvec/nvec_power.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nv=
ec_power.c
> index 2faab9fde..c514d51a9 100644
> --- a/drivers/staging/nvec/nvec_power.c
> +++ b/drivers/staging/nvec/nvec_power.c
> @@ -377,7 +377,7 @@ static int nvec_power_probe(struct platform_device *=
pdev)
> 	struct nvec_chip *nvec =3D dev_get_drvdata(pdev->dev.parent);
> 	struct power_supply_config psy_cfg =3D {};
>
> -	power =3D devm_kzalloc(&pdev->dev, sizeof(struct nvec_power), GFP_NOWA=
IT);
> +	power =3D devm_kzalloc(&pdev->dev, sizeof(struct nvec_power), GFP_KERN=
EL);
> 	if (!power)
> 		return -ENOMEM;
>
> --=20
> 2.47.3
>
>
