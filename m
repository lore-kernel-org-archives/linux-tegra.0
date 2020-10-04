Return-Path: <SRS0=Zq/d=DL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F74C4363C
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 12:07:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A16F82064B
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 12:07:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgbZ1qeL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbgJDMHN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 4 Oct 2020 08:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgJDMHN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Oct 2020 08:07:13 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE9BC0613CE;
        Sun,  4 Oct 2020 05:07:12 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id e22so1082623ejr.4;
        Sun, 04 Oct 2020 05:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=45jk6Z733HWqApSo+qj6X5f3naI+dJqrk/jno2Cqa3o=;
        b=lgbZ1qeL+YPApzN8ics7/HFQZOdUm+1G4KkDTQWF1WnI9BiId3YPeK5F1K11kE9BnY
         pCZ7Pb8xWNdvGx/X30Ot2aUG3g+ERxZyMidyHu/0JjC51ilDnwN3fmYrDMUZPIVzGNK8
         MpfIlB/7c5/AHbl3B8KBk+umAno0Zs8W8mAs0ozIWVx4CfMIZY/6nxQu1gqyVZmfh83j
         8zj2v79UqvCXfwmCmA2OOLl3G6bMXN9IH90uKBN6geHEPEa99mlhq9A/bWOIYyfrJ1lT
         mu/HVnX5KTjyrEjL6ui8dIRhveNbk41Kx1Rf/SowfAsJSGgx9osE2O9frDikOCOCqTZ+
         uxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=45jk6Z733HWqApSo+qj6X5f3naI+dJqrk/jno2Cqa3o=;
        b=SIpbVrRT+kdGUwSj0dHp9K3bD43idjgPEixPvEdD2bgdywjdfN6mHIsKRNFw6yRnM+
         T+FbBUgrMpkW2UXsEQX8X6kk6qL49nOJ/Yz5VoNFN5YbopgZdAxLCfcIHSLWvMiBmlG3
         8LN0ygWm95Wv3UbNB5R998xO2YyCTEcup57R9VCQKvRpAaj8/hbZexKqdYpcrkbjH+L/
         c+pykLC+QfDW8pobthCUKT7nAymtpJmWmSpnrB62YgUK+LariNxk5Cepke1CBc+Gnaty
         y0N7uqwGbSltH9nyLK1Bik/1RjciJ6asEJcE1uuQMDdvrawRpRXmB80YkwI6608y63uL
         d5SA==
X-Gm-Message-State: AOAM533bXVURXGCIKVN9dhX7jgaBjx69nf39cwUVHm4+T3U5POqkMvbb
        v8Yytxv7YZuknHQoxHuJIeKNRJ8C0+9kFn8SypK9dIJQecVCcg==
X-Google-Smtp-Source: ABdhPJxEzYjBQJnbDDxnZw+DfVDDSASnguYYFnWB6DU1pEdnNjkB8dVykAYblVTsnMxrpSIGcJIl8+u4140X+r7ccbo=
X-Received: by 2002:a17:906:c1c6:: with SMTP id bw6mr10932816ejb.374.1601813231107;
 Sun, 04 Oct 2020 05:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYoRFBOA0b8tZgZpvbWkrtNrcyDXt9zHCF7yqtm2heYSXQ@mail.gmail.com>
 <6be9a256-697d-b991-294e-95282a53f10a@infradead.org>
In-Reply-To: <6be9a256-697d-b991-294e-95282a53f10a@infradead.org>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Sun, 4 Oct 2020 08:06:59 -0400
Message-ID: <CAMdYzYpQoBCMR5DOZ96FWNySLnPEEcM84f80UBBiy2Jsby-V0w@mail.gmail.com>
Subject: Re: [BUG] slab: double free detected in cache 'kmalloc-128', objp daff5780
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Shakeel Butt <shakeelb@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 15, 2020 at 1:00 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 9/15/20 4:41 AM, Peter Geis wrote:
> > [33633.566567] [<c0111a6c>] (unwind_backtrace) from [<c010b95c>]
> > (show_stack+0x10/0x14)
>
> Hi Peter,
>
> In the future, could you prevent long lines from being line-wrapped?
> E.g., the 2 lines above should all be on one line.
> It is much harder to read as it was posted.

Apologies, I'll be sure to use an external client for bug reports from now on.

>
> thanks.
> --
> ~Randy
>

This issue appears to have been resolved by:
678ff6a7afcc mm: slab: fix potential double free in ___cache_free

Thank you.
