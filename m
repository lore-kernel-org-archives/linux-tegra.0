Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4685EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Jul 2023 14:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbjGNOwf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Jul 2023 10:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235235AbjGNOwe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jul 2023 10:52:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439661BD4;
        Fri, 14 Jul 2023 07:52:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so3365413e87.2;
        Fri, 14 Jul 2023 07:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689346351; x=1691938351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+63zxq+/vb/ooO5mOHfkIKljG/BDJD6/rDoJDD4yF4=;
        b=nRXQAneJXtWCUrCikkQQCiaMq0uRb37TeZDR4/RqPYHpzjL8g/kDZiM4f/FQ3Mv+4f
         pjZeZH9RnQ4WLliu9NvP+LaRP+06ecTCHxTIu0Fbclx+kn2NVl/s3/y5PV0+SlE9B6FK
         qq138//7x5ytFIV+/Y2NSPr1GY8lNfFj7PIwOC2uV25hp0puTLGeLIlQwD6IQxyKMBpm
         Mr2K5JA9bYrV3MYPduF4HeuOS3eEq4xvUTnFH1g46jSxf/JqLzsT4Nc2BNI9WK1JlKtx
         T1lX2iB19Wj4HspM7lqIzfqmdZnUlXXGNnk7Pk8vn3TRlOoxcS5+sAynvz6lkSIpwhEC
         N5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689346351; x=1691938351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+63zxq+/vb/ooO5mOHfkIKljG/BDJD6/rDoJDD4yF4=;
        b=UWoMoa2CU+DPUVKcJnw6sx8JdzlsWAW4K8tgdYq7ttc245jIYVFNTaaUycfZVvV9xR
         UNZkQwMj34q1OJ2stLWDSAjuTa/2ZqI7sIOFHTn6UmvJawYtFH3PXxqK6O0ab5WyOctI
         vD52AHwN7SAY4cTZ1TUQQgHjr0FmHdBfLJh7nJVrf8IjTnKBfD0yhDFjzhBbFqj6/5du
         Vo93s5uw3S2MnKvBmwc4hp/ON0Vx9OdGxNPy+AWIR1SjZhiW0CcVl//HWIM37zMXxnKn
         JWNtwk1hlstupBYqAJZBfCRjPtxl9jHdlgorzBJGSLva9WPSC30ssps0jOprFBKian5K
         UKow==
X-Gm-Message-State: ABy/qLZX9zefZFGSuyA2YcwEK3fBjYXgP4Q4d7Fz1jpoxSqLTFL3TYXT
        WwxW9rCWpt4v7XUnYLzfqNg=
X-Google-Smtp-Source: APBJJlHfm0ISeA2BOTvP9HovVHMKEww6eTOvNRoiFruQ8E4WNScWP6gVoVZYOlbU/OCdBZeH+O8rzQ==
X-Received: by 2002:a05:6512:31d3:b0:4f8:5792:3802 with SMTP id j19-20020a05651231d300b004f857923802mr4464626lfe.10.1689346351201;
        Fri, 14 Jul 2023 07:52:31 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l19-20020aa7d953000000b0051de018af1esm5880234eds.59.2023.07.14.07.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 07:52:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: [PATCH] arm64: tegra: Fix HSUART for Smaug
Date:   Fri, 14 Jul 2023 16:52:25 +0200
Message-ID: <168934632796.2822346.3024686778789394351.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714101018.10617-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230714101018.10617-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Fri, 14 Jul 2023 11:10:17 +0100, Diogo Ivo wrote:
> After commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
> reset-names") was applied, the HSUART failed to probe and the following
> error is seen:
> 
>  serial-tegra 70006300.serial: Couldn't get the reset
>  serial-tegra: probe of 70006300.serial failed with error -2
> 
> [...]

Applied, thanks!

[1/1] arm64: tegra: Fix HSUART for Smaug
      commit: 590bfe51838f6345a6a3288507661dc9b7208464

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
