Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E5CC6FD1C
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Mar 2023 20:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbjCTUpT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 20 Mar 2023 16:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbjCTUpR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Mar 2023 16:45:17 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3ADB77A;
        Mon, 20 Mar 2023 13:45:01 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id d2so5434260vso.9;
        Mon, 20 Mar 2023 13:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679345094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1YjP/Zk6FCdqVHKgbRSV/1d1XgZS3xJf8BXfq0fpQY=;
        b=MPYbH7mZTQUmhgN9Gf30SqfW+NyV9PH8ZAo3C84LPtiXpMDpuEbenmEawkyrGGu57d
         s/j3C3dIfZSWVdDqYNt+k+bH7opWSQZzqznEXhaqxy8+Pwxs900z4yD3SVlTCykGJueE
         fe3qa8f72lCk8t4s7UFX/+g7P6kW8WK8ljaWVtw+wLfSNuPTCC/K50eTrlgJjq6TWN16
         2SqaGI1ZFg4eEr9MQTnpRKsJudLigze2BRPNH2wOdf/ZEXqHmd9bgUcRM113lT6dQD2n
         MSA5w4/CjZeLl0z4Xe5XzrMGce/wszR4ox8DbsCu0KTWgKmkMoxCaxLij5FPmqyO7w7+
         pCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679345094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1YjP/Zk6FCdqVHKgbRSV/1d1XgZS3xJf8BXfq0fpQY=;
        b=cVfrRH64bUA+a+YuZDW5apBH7ElnrEoafeuzD/h40p5P4imtntF+4znFEQzXc7P/l5
         FCtN7xRxEucU2fkoO/VWvTEEZQlbf0vj+Jy0csp/BdugqEECl+JYFSXX0icN6IJxnsZA
         ijXMTI5NW6zQXGxjVtXOPAiU6w5h+oKqYEZHWpXZ+Vih0BshSqplvS73j4Ujgk3DwrOd
         55ZKEibwaL0y5VsnXTarWkiqOJ+/bVK93BDxgZjvdfGrLLLQ0CaD3Oge2UMnCpatQ5At
         UnXVDfhz4WCa/807k7de+QvNPNmOWEOlaOpMv24c6d+c3vxiP+PuUSg6vWJJUDMY+ANP
         KrGQ==
X-Gm-Message-State: AO0yUKXHHTTYa/Ev9r0geYu0C1BNtfcGoAbktMCJKjFaORjVJr77DWCv
        2muHYlowqpTjrldwOV3cpFnLfWucw4YfK/XPBos=
X-Google-Smtp-Source: AK7set9lFBjxCuuFQup7dKxg7SgEWGROImUC6Vl49/ffuZ02xlbb8aX2mkcjd44R8OlzS6oQ+ej4dzrjjy8pYLbcKdo=
X-Received: by 2002:a67:c306:0:b0:425:d57c:bbd6 with SMTP id
 r6-20020a67c306000000b00425d57cbbd6mr296921vsj.0.1679345094135; Mon, 20 Mar
 2023 13:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230316164703.1157813-1-bbara93@gmail.com> <0c2913b7-b393-e7d8-604e-fbf127e7d26a@collabora.com>
In-Reply-To: <0c2913b7-b393-e7d8-604e-fbf127e7d26a@collabora.com>
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Mon, 20 Mar 2023 21:44:43 +0100
Message-ID: <CAJpcXm5cBDhsA6b7mTVEmJy96ZFVNzoscB0o2iVThdDDErOABw@mail.gmail.com>
Subject: Re: [PATCH] mfd: tps6586x: register restart handler
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     lee@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
        treding@nvidia.com, richard.leitner@linux.dev,
        benjamin.bara@skidata.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Mar 18, 2023 at 8:15=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> There are newer devm_register_power_off/restart_handler() helpers in
> kernel [1]. Will be great if you'll use them in v2.

Thanks!
I will change my implementation to use devm_register_restart_handler() and
update the current pm_power_off to devm_register_power_off_handler().

Best regards,
Benjamin
