Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0918EE49A3
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Aug 2023 01:41:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbjHWBlR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Aug 2023 21:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjHWBlQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Aug 2023 21:41:16 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 18:41:14 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F04E4C
        for <linux-tegra@vger.kernel.org>; Tue, 22 Aug 2023 18:41:13 -0700 (PDT)
X-AuditID: cb7c291e-06dff70000002aeb-51-64e54b4aaff9
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 29.6B.10987.A4B45E46; Wed, 23 Aug 2023 04:56:59 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=gHF2w1OQWksRObt0TEJQ5UzvejA+AsrzTZBhcs/n+cpA2Kgm1gopGPmwm9NdxABpD
          BsOPLBtVA5EwXIJwT5pV7qLu9fB8Ox9cQCXNveyYDe8DAghASzeZeBrKzuIqDdXHl
          jlOUiAFLthDkLQEChnwoxQcBFysD38pUGef/ca8qQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=kL50LBYTvvcQe3bztW1SA1tKEnQZt70bwvvldqi3uua8VLbIlwH117c8lbM+/qbe1
          0UcZd5PPZK4MxkRexRSRv6FXBTRYFbsd1uBFOB6sdKM22Lhrz5WrG3jL22gFuvfUS
          ZgS7ZwjKp3/RmNOIpg+qltPaYhXhdk/IUxdPujEK8=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:08 +0500
Message-ID: <29.6B.10987.A4B45E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-tegra@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:22 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVyyUKGW9fb+2mKwe6/7BadX2axOTB6fN4k
        F8AYxWWTkpqTWZZapG+XwJWxZN0FloLdzBVt/YtYGhgfM3UxcnJICJhI/Dl2m7mLkYtDSGAP
        k8TKyVeYQBwWgdXMEguvXGAGqWIReMgs0f/VHaKqmVGi+8QjsASvgLXEjj8v2EFsZgE9iRtT
        p7BBxAUlTs58wgIR15ZYtvA1UD0HkK0m8bWrBCQsLCAm8WnaMnaQsIiAvERHeyBImE1AX2LF
        12ZGiLWqElNON4AdKiQgJbHxynq2CYz8s5Asm4Vk2Swky2YhLFvAyLKKUaK4MjcRGGjJJnrJ
        +bnFiSXFenmpJXoF2ZsYgUF4ukZTbgfj0kuJhxgFOBiVeHh/rnuSIsSaWAbUdYhRgoNZSYRX
        +vvDFCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8tkLPkoUE0hNLUrNTUwtSi2CyTBycUg2MQjts
        pt2+/eowC3fUSr2da0OYFk+6/MXr+WvLQywPH4ZfvHHqZstyfzuzFwGsPzurxJ1LzpxRusUV
        Xcjg/uXVkrnM7bytyS+nvCuNnfgvsG/71cOecvvCJx561OhjfNtFbL1y4KJL27Rnz3TcL/PJ
        Qpz3Y5fsSduz8r9dXiXZSWwW79GdvSbCRYmlOCPRUIu5qDgRAHRzzWo+AgAA
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

