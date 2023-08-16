Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F64C04E69
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Aug 2023 16:21:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344636AbjHPQUf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Aug 2023 12:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344711AbjHPQUe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Aug 2023 12:20:34 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F000C1;
        Wed, 16 Aug 2023 09:20:32 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-317716a4622so5895337f8f.1;
        Wed, 16 Aug 2023 09:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692202831; x=1692807631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr372B6xG0YFL1cuWCcRIeJoXbm9PfgvqsuUJBw4FB4=;
        b=H96mpF/h9or1ZxZ0D9y8RNlK7cy26IbMBFr40AVULKyZUDWL7DvG7I9CZlnp7lcZ1a
         rwRmWmopJHtdHJdVM1vz+sLFiOvDWgATh4kyrYkHlzLTd1vnluxBPpoVpH5Cix9Pqaha
         ID3yueST12toM0cruZu+EI44OoIRRVWeixjeg8mfNJ1zAKPAXLUhfunXXK9m3HytzjhH
         ugEP46dtA3b1exCKh3Dp7eYTBWRA/bVz3FZHgcMUt+lgKf8cDFgeFW3yo/iZYSU2zXaF
         SUUF3ltAY+0ShmfsEQj1y/Wat8Cs87BQ15EEhz3fTM00s1Gepf8yXg3qxdifd052z0MI
         NCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692202831; x=1692807631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr372B6xG0YFL1cuWCcRIeJoXbm9PfgvqsuUJBw4FB4=;
        b=lAfrZCz8uuH74ZfUmFfNKM9g4w5gpUkOzigq9JJOyyrOs4pOFuEYa8TDpI3i6bkH1A
         ZGl0NMBP853/A3lOcDU0kaO6rm6nR1Gk5FSPbqkSWp0gayGuBGDmS6C0dmOQpawo7/j4
         2aX9Vx+BwAZ8aVkSQSb3iGRf0uN+qDOTeVmi+y9tokf9j2YoA/nhB5vMl97tzg720aHp
         0e9iDppQq+vnnrog8Uu41sHOQLEi+/dp0MtHc9FGE/uRc1Vx5F1FmLePGZgQNaMLWzqt
         STeff4XI74w6X3SfzSSXzohoDZZQtGNBIQc0uXed+CQ2Vdl031UsXTbeojceifhjDD1+
         S2Dg==
X-Gm-Message-State: AOJu0YwF1NA8OuK8zYUr3gEO1p61qAF31ChegXk00hj0qQ2+h+A1TGby
        CpTDGBn5X4q/emq6T0xJk8Y=
X-Google-Smtp-Source: AGHT+IGTqnn5UfndwGEc3WNwEUKK+QWzqrjHER8Y+AWZqqZyQh7peJvHcsqxB80jwE54VuChRJFfBg==
X-Received: by 2002:adf:f648:0:b0:317:7448:6613 with SMTP id x8-20020adff648000000b0031774486613mr1686158wrp.55.1692202830840;
        Wed, 16 Aug 2023 09:20:30 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g8-20020a7bc4c8000000b003fe505319ffsm24384632wmk.18.2023.08.16.09.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 09:20:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: arm: tegra: pmc: Improve property descriptions
Date:   Wed, 16 Aug 2023 18:20:28 +0200
Message-ID: <169220281140.3328068.8778220691335526129.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726162744.2113008-1-thierry.reding@gmail.com>
References: <20230726162744.2113008-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Wed, 26 Jul 2023 18:27:38 +0200, Thierry Reding wrote:
> Reformat the description of various properties to make them more
> consistent with existing ones. Make use of json-schema's ability to
> provide a description for individual list items to make improve the
> documentation further.
> 
> 

Applied, thanks!

[1/7] dt-bindings: arm: tegra: pmc: Improve property descriptions
      commit: 0d2c8f5507480ba5255ab60312820b49814afd63
[2/7] dt-bindings: arm: tegra: pmc: Remove useless boilerplate descriptions
      commit: 5dfaacd234fd07ec0891edc2207cc85f44305626
[3/7] dt-bindings: arm: tegra: pmc: Move additionalProperties
      commit: f69187cceb3a7cb3f4eb73180dea1df265835932
[4/7] dt-bindings: arm: tegra: pmc: Increase maximum number of clocks per powergate
      commit: 7b42c3a3bcb655331810ea95ac71a0f692857e2f
[5/7] dt-bindings: arm: tegra: pmc: Restructure pad configuration node schema
      commit: fe893e08d37d7779e604f5bfb5c00d84c5cbd52d
[6/7] dt-bindings: arm: tegra: pmc: Reformat example
      commit: cf66bae6e35ccf65aa5f9335a4a0021304f746f8
[7/7] dt-bindings: arm: tegra: pmc: Relicense and move into soc/tegra directory
      commit: 9d697e4b743080f560e3eee54599853e8ee8fa25

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
