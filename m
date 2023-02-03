Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63199C636D4
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Feb 2023 04:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbjBCEHE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Feb 2023 23:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbjBCEHD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Feb 2023 23:07:03 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64246392AE
        for <linux-tegra@vger.kernel.org>; Thu,  2 Feb 2023 20:07:01 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id a9so2355345ljr.13
        for <linux-tegra@vger.kernel.org>; Thu, 02 Feb 2023 20:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdXrl6jFXUFLX/Fs8Y8vVeX1SCyz5eISp65do85FsLM=;
        b=giRO/0Lr8QjY/NuoJqnrqZWr0LmwzOD3jmpWfjm5JbisDUMhfSppPvF2poel/JwAng
         z4I+JYUG7niuOyibxKh4v/3DLvyOThvU/qNORVgp+KVuoz54UqGmtwi7Phws3zAMdMLT
         2wtKpfMfkLkWzEntG6phV1GBOsNd1jIgusi5Q9a4MXoBpD5I/ivxHpW0RFF0tZBcadWU
         5yAfyHKkkwfKmtyGy3xvsOivT7CzvDAxKI6UujeqXBQNYK4w5nf92OBQGRxUwJuQW47o
         vuQb8gkyWXKJ9ThQKaYAH2nv/31pRGdD1fz3VyK0Py5zaedLNB6D0HYgVCkxL2LMTXat
         FYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdXrl6jFXUFLX/Fs8Y8vVeX1SCyz5eISp65do85FsLM=;
        b=JPjhQZKCce/rbRyBBERxue5ieVLN4+xBZazGLZWhU6eUpevRfipo3nBEPLmhPKtBC7
         x8qYjm/RG3lwhCxxzSYIVLm30TuRZF2WYRiu4FpO5h7Ja/ct4r43OY9owoaGxFv6eDJA
         tJ91eYfiYjRIzj8sv1DsszYUVJVnKj+QA99XueNIVGEv0xx8kkwqnpPT2zsRLX75RBUs
         SZsRIfUj2MCpe5MjnN0ZzJs2Yc6RwglSevMLivAhoSf2PAe7MgL0Iu27NpSQNfdP7TRp
         K9GJ31gvmFx6UGzrFNW+Jp0UwYQPRnCxqZW8odaYN9YeMb8nmx/ecIPx+6UW9QuNQ9lV
         MC9g==
X-Gm-Message-State: AO0yUKVKyMkdJFwNeKgs9LpcwFvN1730m7A8N0DJWWxeCL/CdU4M66nA
        gH0Jb1Lu7VUdqSERbOEzJRit5WHrH38Gup7MnaUQUg==
X-Google-Smtp-Source: AK7set8ePtCHM1Iq3qNLDJDujeHBggdkNrTSmEo6kURlW1fNmHwpxqtfcCcjPvkRToDgjzFMlniM4/dhmf794eZbSl0=
X-Received: by 2002:a2e:a4c3:0:b0:28e:92b2:a04a with SMTP id
 p3-20020a2ea4c3000000b0028e92b2a04amr1366705ljm.34.1675397219676; Thu, 02 Feb
 2023 20:06:59 -0800 (PST)
MIME-Version: 1.0
References: <20230201101559.15529-1-johan+linaro@kernel.org> <20230201101559.15529-9-johan+linaro@kernel.org>
In-Reply-To: <20230201101559.15529-9-johan+linaro@kernel.org>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Fri, 3 Feb 2023 12:06:57 +0800
Message-ID: <CABymUCMgmyLRGo+b4ZiVJacxc=hnfo7iiYBNj2i5UPrq3XL0nQ@mail.gmail.com>
Subject: Re: [PATCH 08/23] interconnect: qcom: rpm: fix registration race
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Johan Hovold <johan+linaro@kernel.org> =E4=BA=8E2023=E5=B9=B42=E6=9C=881=E6=
=97=A5=E5=91=A8=E4=B8=89 18:16=E5=86=99=E9=81=93=EF=BC=9A
>
> The current interconnect provider registration interface is inherently
> racy as nodes are not added until the after adding the provider. This
> can specifically cause racing DT lookups to fail.
>
> Switch to using the new API where the provider is not registered until
> after it has been fully initialised.
>
> Fixes: 62feb14ee8a3 ("interconnect: qcom: Consolidate interconnect RPM su=
pport")
> Fixes: 30c8fa3ec61a ("interconnect: qcom: Add MSM8916 interconnect provid=
er driver")
> Cc: stable@vger.kernel.org      # 5.7
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/interconnect/qcom/icc-rpm.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
Reviewed-by: Jun Nie <jun.nie@linaro.org>
