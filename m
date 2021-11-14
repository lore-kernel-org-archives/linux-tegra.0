Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774D4C433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 11:24:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44A8461167
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 11:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhKNL1p (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 06:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhKNL1o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 06:27:44 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64CE6C061746
        for <linux-tegra@vger.kernel.org>; Sun, 14 Nov 2021 03:24:50 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id q74so37550734ybq.11
        for <linux-tegra@vger.kernel.org>; Sun, 14 Nov 2021 03:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=l2AjIcA200luhAvIV6Y4Gf8Evv6mr+gMr0zSOMeBGF0=;
        b=a10H46oD3V1AbsfG8PMl0HwoONTGb8bAkMFY8orJxsQ+BUa0JJBb6KpBN+jzf7llUy
         nX5dZAJe+pZQrNePjhfM1zn3A1pNcIWmptqB5OXarexkXlg40QezBxqg1r94ESS1Mgzn
         PSqlyIa/edrsYCSnnHH8gz5HIgTzRGnaWzYOFSbyyw/pT1rMJiySjJKyOautB2QTqYOt
         /a659cdqc+jJC9TfZkSXZD6foa7fBSJ8gHBJFV4/yu3YH7Hk6KmB8KQnGZ8UXMZnxZdS
         a4n1ZBO4SBW38tDkTMhGHEwcHIUa/cvTWSaFQ2ep8ZNK7VTq2LNoYfO+xcHkwgmRDWPW
         Ftnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=l2AjIcA200luhAvIV6Y4Gf8Evv6mr+gMr0zSOMeBGF0=;
        b=t4aWHf6eEboItUj3R7nlTnQb5GBPIqeBeOArEw59sWPLFQ0YODAVYMTVv6BZPCbz/2
         SqgMENRoio8wtT5RbFZA+Ql09MAe6YpSkS9flm0Ex6y4wqF8u9K1XaC/2Oj9rmmJ1Ntd
         e5O7WIRIRv7oXkXBsjR7wsuQOh+2KtW6g+n1vmKgmES1rHIawCXFXvt6VZ3ppTmfLNnh
         qII1gF6zieq+UpgyGr6CyF/mg9R9/Kt+Mty/Up9yg0BO+hZZYGP85Dti3xZqgFrFzWD2
         RQBq3wSvHusYeSeJFcQarXTE3Ao2o0sm9VU+1bewvBPkuWZQcxM8snTCLq+5rPHhElPS
         tV8Q==
X-Gm-Message-State: AOAM531/16QqkpWF4QqqYnFur7+aA7QtYwNd21tRRFuhVRWhpwgJbcpy
        2L0HBYbo/aBdfzeYHIJuKzv7tWuEuRvPQDSMrnP82eX4QAM=
X-Google-Smtp-Source: ABdhPJyE4oHiy109V6Da2sWTjzAYZQ7GBKmd+/OV3SgQFeS6GxoLHNxPXwa37MQepZiyfq0DCHFq/96+N2Frt8+Uq4M=
X-Received: by 2002:a5b:d0e:: with SMTP id y14mr29173873ybp.23.1636889089469;
 Sun, 14 Nov 2021 03:24:49 -0800 (PST)
MIME-Version: 1.0
From:   Turritopsis Dohrnii Teo En Ming <ceo.teo.en.ming@gmail.com>
Date:   Sun, 14 Nov 2021 19:24:46 +0800
Message-ID: <CAMEJMGEOKULcvNBKZ6XE3_vqLRUM_=H6a_ywQ86J1qtahDm-4A@mail.gmail.com>
Subject: I discovered that Aruba Instant On 1930 24G 4SFP/SFP+ JL682A Switch
 is Running an Operating System with Linux Kernel 4.4.120!
To:     linux-tegra@vger.kernel.org
Cc:     ceo@teo-en-ming-corp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Subject: I discovered that Aruba Instant On 1930 24G 4SFP/SFP+ JL682A
Switch is Running an Operating System with Linux Kernel 4.4.120!

Good day from Singapore,

I discovered that Aruba Instant On 1930 24G 4SFP/SFP+ JL682A Switch is
Running an Operating System with Linux Kernel 4.4.120!

INTRODUCTION
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

My name is Mr. Turritopsis Dohrnii Teo En Ming, 43 years old as of 14
Nov 2021. I live in Singapore. Presently I am an IT Consultant with a
Systems Integrator (SI)/computer firm in Singapore. I am also a Linux
and open source software and information technology enthusiast.

You can read my autobiography on my redundant blogs. The title of my
autobiography is:

=E2=80=9CAutobiography of Singaporean Targeted Individual Mr. Turritopsis
Dohrnii Teo En Ming (Very First Draft, Lots More to Add in Future)=E2=80=9D

Links to my redundant blogs (Blogger and WordPress) can be found in my
email signature below. These are my main blogs.

I have three other redundant blogs, namely:

https://teo-en-ming.tumblr.com/

https://teo-en-ming.medium.com/

https://teo-en-ming.livejournal.com/

Future/subsequent versions of my autobiography will be published on my
redundant blogs.

My Blog Books (in PDF format) are also available for download on my
redundant blogs.

Over the years, I have published many guides, howtos, tutorials, and
information technology articles on my redundant blogs. I hope that
they are of use to information technology professionals.

Thank you very much.




-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link:
https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html

***************************************************************************=
*****************

Singaporean Targeted Individual Mr. Turritopsis Dohrnii Teo En Ming's
Academic Qualifications as at 14 Feb 2019 and refugee seeking attempts
at the United Nations Refugee Agency Bangkok (21 Mar 2017), in Taiwan
(5 Aug 2019) and Australia (25 Dec 2019 to 9 Jan 2020):

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----
