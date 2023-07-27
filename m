Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80549C05052
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jul 2023 15:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbjG0PSN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234620AbjG0PSG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 11:18:06 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5495A19A7;
        Thu, 27 Jul 2023 08:18:05 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so4903926a12.1;
        Thu, 27 Jul 2023 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690471084; x=1691075884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij0zwrJl+jKzGXRJqhSfCNc7P1MNBHLMCT9rtsyaalg=;
        b=g+4wi9dcsNhnW2igpaSlliuWgqX01BqJ7EU4IuOBDLrh4d6W17HTLFIcEk/nGYkno1
         JEEN0UX5LCZsWyHohPUHaX7uCRF0fVGsb1zAFuw+dAqzVlPLyR1UEgWOKrMnoP2ylTAZ
         7IDADaoAVUkpH7Svd80TlhaOVlz7JTNT1fs1g3tNos/sjn6M73pwUw6+DeePnvJYjrB5
         fVr10CodopMcRCStH6nAGRByRII3c6CGL7CgAaUchE5VCy60xV96YWU8C+tVFz7WYkM+
         HI1JgQB98K5FSei69Be78CoVyH/Pkdf5ZRVKkLo+604FJR1tuxqB/x3N38tbyS9rCmQj
         drpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690471084; x=1691075884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ij0zwrJl+jKzGXRJqhSfCNc7P1MNBHLMCT9rtsyaalg=;
        b=dvpAz/kAEKxcJstn4jsr8fFuZmRyOY0/cyfeDFVh1QDF8RQ+fNZKHtsv2ujGQnC0Kf
         g0DzMRgTSCOykHvPWWWtu2JKLy/y9bcBkkOd0iZCVKdJn+q3VEIRa3W/zYVFd3XinnL+
         w9vdMKkNEPALavDmPjmTaIy8K15z8XRoKWnW/LCXwfZY/PbmaoXrXdoQnizwFoclG2hv
         xjS+EUa8TJri4stkH5GCsajeRzFa7QShluwCkcC+pifcqvLVdrt5CtShxBOop5RJjgTy
         2lVCxubLkOySa0m3vLOg1efS6JoQyVqiOwjja3teDbl+dWCZrSx+gTt2rDk6aVsgLaBV
         Fx/Q==
X-Gm-Message-State: ABy/qLa25/2YXDGtyJIdDaCtiCvC2y3t9tV4kPovjYQn2hM+MLQTYJGm
        qIRXPmuOQZe7xL7FmWnY95M=
X-Google-Smtp-Source: APBJJlHH7kIanpz17+5reDEWBDHfh9P1YfG0wZ0iyBCYXnjNF9ZW59AN0MXEmDS0ww+TZBn6VtqKog==
X-Received: by 2002:a05:6402:348b:b0:51e:2e6f:70fb with SMTP id v11-20020a056402348b00b0051e2e6f70fbmr3607953edc.6.1690471083631;
        Thu, 27 Jul 2023 08:18:03 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f5-20020a50ee85000000b005227f4530fdsm744337edr.37.2023.07.27.08.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 08:18:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH 1/3] dt-bindings: display: panel: Move Chunghwa CLAA070WP03XG to LVDS
Date:   Thu, 27 Jul 2023 17:17:59 +0200
Message-ID: <169047096702.3031511.846316777516525998.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726185010.2294709-1-thierry.reding@gmail.com>
References: <20230726185010.2294709-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Wed, 26 Jul 2023 20:50:08 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Chunghwa CLAA070WP03XG is an LVDS panel, so move it to the correct
> bindings file.
> 
> 

Applied, thanks!

[3/3] ARM: tegra: Provide specific compatible string for Nexus 7 panel
      commit: c9a706ab227ef59cc49923358513251ca4965563

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
