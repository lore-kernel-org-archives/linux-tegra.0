Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539C2C41513
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Aug 2023 16:57:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233949AbjHPQ4p (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Aug 2023 12:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344996AbjHPQ4U (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Aug 2023 12:56:20 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B011BE7
        for <linux-tegra@vger.kernel.org>; Wed, 16 Aug 2023 09:56:19 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fe4cdb724cso63513295e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 16 Aug 2023 09:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692204978; x=1692809778;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJ/7Ue64ruuo8T+szNkGJZsk2gUYlOBeVjiXucVPa+Q=;
        b=VMTtyyFLbaM8ukHAPJMeiQFvUX98mL+upTHrbM2TGki1GaW8qNRkiEvW6Mz6tM4x16
         KNGQzUCE+1lW9g3rI45gGogF8Jz87QpuIqQt5NT1jFrQtkifHhfC1v5Cg+E6URHXRDuI
         6Pl1JJRtBTKvL3+JeVrUPAMN7sdCxFzkty/eu6L6ouZL1UZzTEaLdrkERPQjPsafFs/L
         /7TKs/0gz8pqc963c9uCF07LluiafM68H8Elie42pa+gSt0siq/p89ATD0I1X4sZbPM7
         h56uUpoLbJd0dK0K4RvGxA2K/Ret12VRy9KY96d2GLg+/qVzE+sn22x42VgqOaWfSFZy
         7khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692204978; x=1692809778;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ/7Ue64ruuo8T+szNkGJZsk2gUYlOBeVjiXucVPa+Q=;
        b=RqUYtfdRuO4y0LlqEv3jceOXxaQh88mYbku+thVHfowv2z4zkmf06O6M1ry2DNl8oE
         JShwmhuHyJz/Xpf5jz/ZPre47PUdk9RWfBUFyuVgX3qdQozQ8bJlzTpJZ0VFDvFQZS1A
         sZ7V49/7wsLy2h+UAvQklhAxJMhavB0TCn94vzP4NRoJ4fetHkjfqX2gfGV1XxVot+CH
         iznUqFhrpgbqPfsEtjgmbhEyUGqI5H+3Kf5IIJiQ5yIeng7TaNWDWurPHNrL1DaNvpmp
         TQx/GqqocOta2JSOmFsy6bU37aGAVWhmRD629z4Z1VIRVcrR6hrT3eQLQ5zctMB56z6X
         chqA==
X-Gm-Message-State: AOJu0YxCymeiwamGJ+bPm+SWFWVGUXbqCL/kaXMJwVaKr0r/C3Tb/DYg
        YfzYXgUlV9/M5MvFIv35NVWNKg==
X-Google-Smtp-Source: AGHT+IGRD2GPdHF+WwbQeFKbhUDof/P08J1k3Vva93Q9LEWKai3kN+RBUYPs+ZycDdnTV78cytNS8g==
X-Received: by 2002:a1c:4b08:0:b0:3fb:e206:ca5f with SMTP id y8-20020a1c4b08000000b003fbe206ca5fmr1891670wma.31.1692204978103;
        Wed, 16 Aug 2023 09:56:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k7-20020adfe3c7000000b003176c6e87b1sm21935525wrm.81.2023.08.16.09.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 09:56:17 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, thierry.reding@gmail.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: (subset) [PATCH v3 0/5] Add JDI LPM102A188A display panel
 support
Message-Id: <169220497726.2977065.3236775969816366659.b4-ty@linaro.org>
Date:   Wed, 16 Aug 2023 18:56:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On Mon, 07 Aug 2023 14:33:00 +0100, Diogo Ivo wrote:
> These patches add support for the JDI LPM102A188A display panel,
> found in the Google Pixel C.
> 
> Patch 1 adds the DT bindings for the panel.
> 
> Patch 2 adds the panel driver, which is based on the downstream
> kernel driver published by Google and developed by Sean Paul.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/5] dt-bindings: display: Add bindings for JDI LPM102A188A
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a913a739ab6e6ef10c0c47cb85dd4a105b3d9df7
[2/5] drm/panel: Add driver for JDI LPM102A188A
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=25205087df1ffe06ccea9302944ed1f77dc68c6f

-- 
Neil

