Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B08C77B60
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 15:05:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238049AbjDEPFD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 11:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233443AbjDEPFC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 11:05:02 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24130CE
        for <linux-tegra@vger.kernel.org>; Wed,  5 Apr 2023 08:05:01 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e18so36523640wra.9
        for <linux-tegra@vger.kernel.org>; Wed, 05 Apr 2023 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680707099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJ/TIkMhk2bPX1HK0lvdvOcV5MO27OCyBCUDQZH39zI=;
        b=lFm0/BjykT3G1eDy8yG3/f/+9hGtVDN4Ior/kfWUUde8UGG5JzHhgamuK6EFwY2lc+
         wLuYU/tJnhfhNKZT0niU/VoR/UWzGDgkiHGBS2G9qwlqSPvyNzy2+a7hN3pGshfblGSN
         XTlX8rewe3AvIk7sUIGnGYUDNED0dzQVHuJ46eALpdbdFZtOaiRxE7LOPSok+zs+SwUT
         A/+i7Lq9wYLZwujAWUDsE8zAFgiXNFVmRFS15VROcrUQ6QXk9e7SWu62aUfFaIuwF99c
         v9LZC2fu5b53cYqqFh/NMV3pT1jSq+pN/c3GeuDYCK7aIcnC2uZ7j/VyIuqC31fvRLY9
         zaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680707099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJ/TIkMhk2bPX1HK0lvdvOcV5MO27OCyBCUDQZH39zI=;
        b=N8OONKCQrysHPDLSWIARokM/gnTv5qvfHr7rWCT+yJLO4nzCgOwK60q0Slss5nX//3
         HfdyiiF+omt8xkYZ7SHIISuZfUjumt+tZxWYnyF++GYSVO1ij9zxdQCx0Bb+CFJO5ae3
         SlNIx9411DnTo/Nxb/DEintc1oGB8et5T6pD8V/ngU+C5BMgVuIfPw5KmBTGBQxdozSN
         6aeH8wSEAMOyfq67dfdrcPMsIKyxl1wUu1GNgqzQqOXJ0wpZMMZc/QlwPGXczcshZQfL
         bfxY8zqdppnAbs5L3ZlHPlzI1jnDNFsJBpkrYo4co+bn6agejakFDB3pp+zpVJNbamaL
         uzyw==
X-Gm-Message-State: AAQBX9cQlids0vAKzHquJZSLUiuAUcTkhZ0845n4EZbtYfupRkQbwXct
        KW5eJW+jMdfo3jK4N4nVipg=
X-Google-Smtp-Source: AKy350Zo6+JFFWEOk1JLcS1QaNH29U9mO7wq3L+rrdvlL2uVVg3IQgJKzxWpEkaxN9bsHkxZp+1N8g==
X-Received: by 2002:adf:f8ca:0:b0:2cf:ed87:37c9 with SMTP id f10-20020adff8ca000000b002cfed8737c9mr2045804wrq.11.1680707099119;
        Wed, 05 Apr 2023 08:04:59 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d5407000000b002e6423cb207sm14146577wrv.112.2023.04.05.08.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:04:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     daniel@ffwll.ch, Thomas Zimmermann <tzimmermann@suse.de>,
        jonathanh@nvidia.com, javierm@redhat.com, airlied@gmail.com,
        thierry.reding@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/7] drm/tegra: Convert fbdev to DRM client
Date:   Wed,  5 Apr 2023 17:04:58 +0200
Message-Id: <168070704247.1047612.15878020832415463467.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330083607.12834-1-tzimmermann@suse.de>
References: <20230330083607.12834-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Thu, 30 Mar 2023 10:36:00 +0200, Thomas Zimmermann wrote:
> Convert tegra's fbdev code to struct drm_client. Replaces the current
> ad-hoc integration. The conversion includes a number of cleanups. As
> with most other drivers' fbdev emulation, fbdev in tegra is now just
> another DRM client that runs after the DRM device has been registered.
> 
> Once all drivers' fbdev emulation has been converted to struct drm_client,
> we can attempt to add additional in-kernel clients. A DRM-based dmesg
> log or a bootsplash are commonly mentioned. DRM can then switch easily
> among the existing clients if/when required.
> 
> [...]

Applied, thanks!

[1/7] drm/tegra: Include <linux/of.h>
      commit: 162b2ae95e0887ea75883bc419d55dd714b8fbf5
[2/7] drm/tegra: Include <linux/i2c.h>
      commit: 0e4ec6d97a2c6e96a5ec8d0edc00aa658238ed3f
[3/7] drm/tegra: Removed fb from struct tegra_fbdev
      commit: 5705d5b6a21e75c095df29deec8a13aa6b59f83c
[4/7] drm/tegra: Remove struct tegra_fbdev
      commit: fc5646b848222601d8be78b66b6498130437abe1
[5/7] drm/tegra: Hide fbdev support behind config option
      commit: 63ab4848d1d2eda1658ae82a3cb6eb7e03d28cec
[6/7] drm/tegra: Initialize fbdev DRM client
      commit: d9d1e306e70db905f29d05952c1499fd3c6ef6ef
[7/7] drm/tegra: Implement fbdev emulation as in-kernel client
      commit: 8e5113c627334ed32748d95ababd548171d2333d

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
