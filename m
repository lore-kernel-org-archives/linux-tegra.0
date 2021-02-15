Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2ABC433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Feb 2021 10:27:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7487964E04
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Feb 2021 10:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhBOK0v (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Feb 2021 05:26:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhBOK0j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Feb 2021 05:26:39 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1CD4C061786;
        Mon, 15 Feb 2021 02:25:58 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id r21so8197255wrr.9;
        Mon, 15 Feb 2021 02:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z9SliCCRum/3A2E2ZMNlI9m+hPoUUx4IbBiUL26CGt4=;
        b=XmYapkqPECCZQ2urP7izpjxwLyQJGPa8zDUV3C5e8uDSsQB6IFaZE8Ld7RFtvmEdLC
         +IMr0tT7+eve+w26+I/NErozvBO8U3PwdPvpmvtwN+cTaHKUf/meRJCmnnTR9KPXD4Bc
         vvJQkfqcvu4L02plGHnXIrzbgRqs9zQ/UaUyZBlfFrDIKY9lwFOrQrzhFw3Xk+c8tEua
         LSRDeoTQPz4vQTjTydCHi3x7CuaISpuj+M9OsOOvz/MslR6G5deopedI4gqFxSvVP2+f
         /zzrE4G30+pdmtJlL1L3l+ebqai06+Y4Sjhu1YBwK3vfnVS16n0u4fGCE4RYX+KAjOEc
         jG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z9SliCCRum/3A2E2ZMNlI9m+hPoUUx4IbBiUL26CGt4=;
        b=miORlS2QrJkYZCekEQ2VqrSRuBC1Zb7busc5VXcYiMByBEVHhdRK/iz05YFcNL3/DH
         YoT79/LkvPKpYmHQ1K9e/MlLx0cqwtbAfsnsC8gYp3Vfby0oQZGaDfSt06kYdPC/5Zpm
         /IxHqNMfAeWAYRxbAmYFA6T1mFWrYhesezYdkKjw2S+7TyB3RMjqj24LnOlBygZt7lOI
         YpszGbwYBXpmt2ch3AjrnqQZVWnS9oPedRgZx7XbdBZxH/A2J+KJXV1oxku5poEYp6JO
         KW/YnUijjIlk6aOm8qtU7NXlh7kxIuvpZcRHmjbebr7kcL0jU3PC0wOn4dUFh6GMbCnv
         Th0Q==
X-Gm-Message-State: AOAM532CLmpGEDiEp8A4fY7GIysIqSChIZ2XKvRAFEwGRkW9hRc/TzPS
        rGAAb2L7mZYRRSqcDlnluHqqfI/Xsz8=
X-Google-Smtp-Source: ABdhPJxjPOB8Gm2aMkGNZx+mNq7QWQir4NmLrHP2dOTubysE7eypcREIqAJZbaCXxS9zmJnTV7aZtw==
X-Received: by 2002:adf:f7c5:: with SMTP id a5mr18324488wrq.243.1613384757517;
        Mon, 15 Feb 2021 02:25:57 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g136sm10467906wme.10.2021.02.15.02.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 02:25:56 -0800 (PST)
Date:   Mon, 15 Feb 2021 11:25:55 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Fatih Yildirim <yildirim.fatih@gmail.com>
Cc:     marvin24@gmx.de, gregkh@linuxfoundation.org,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH -next] staging: nvec: minor coding style fix
Message-ID: <YCpMM4HhAGkpHIX7@ulmo.localdomain>
References: <20210212073423.20562-1-yildirim.fatih@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Umw6Y6994BHCIjmo"
Content-Disposition: inline
In-Reply-To: <20210212073423.20562-1-yildirim.fatih@gmail.com>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Umw6Y6994BHCIjmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2021 at 10:34:23AM +0300, Fatih Yildirim wrote:
> Fix for the below coding style warning.
> Warning: Move const after static - use 'static const int'
>=20
> Signed-off-by: Fatih Yildirim <yildirim.fatih@gmail.com>
> ---
>  drivers/staging/nvec/nvec_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--Umw6Y6994BHCIjmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAqTDIACgkQ3SOs138+
s6GukQ//RtPgmq0gdQENuJQ8oYCYYuLbk/GyI6GciGBnKVAXRMaj1d0TmhVmEF0s
aB871tDOVfpuQwCl4wyCKSdcKR0ABq2mS0S04KHqP6vP7yQJTAjLLqzQLy7oLjAJ
R8un8u9upWqK8xGdL9nCiD5CRWCRX9TZ6CG6IV8Xw6mTefz3zrBwmwc3hmXJjLlQ
AyM8nGUU0FZVPa4Pvzu6d2oIPoZNdbIJSduz8Qo3yI7Cwhr3+9Qhrl0WgHSCWHKU
QOnr8SPmw+zEegpOJFCfpg7TlxR8EDvnrPLVCOQLMznkyIws8uVv/kLjoSmHDIEv
2WHthxJtyis/TxLlbbpE4tUHiJ5bg0JZdx50ssweJmtxBYp9FI97S3UTPXBViGZ1
PxrfIdFyW6zO5npGKP80Es0S/HnhznbVUljucwWk5vquDWQERDffkIDGD3ApBHxc
OVb6DaKHboha3YgQnqnFaJ+q1oHJ0Tu4k0unOjz8KKkTkSLNsfJfW/jxnsr491Fl
9VEqo7LpquJyqwcr0/Fto0YBPhC90uJKM2do1tuDb2m1k0QeFf4gg2dLwR9uYDGk
E8PfgH34Uyqomytd3cNuge60VO5U1Af3Drzm661cHkjtlX9HC1cnbavzrKiRbw8t
OtnuZv0dGkQQPWO/A154IUXZVAwZRFJTN4vvLThW8y6J6ia7f90=
=XqYj
-----END PGP SIGNATURE-----

--Umw6Y6994BHCIjmo--
