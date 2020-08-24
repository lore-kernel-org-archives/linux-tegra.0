Return-Path: <SRS0=inwd=CC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C830C433E3
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Aug 2020 22:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B0EE2078A
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Aug 2020 22:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598306708;
	bh=kj3kGz6BUdppP34j2wcNL4NLP3wVgcKhzup4kMsl0Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=YK6pUt/aUAAatj5RQ7neeZV91Eo6qimtcAGizBUHEjX6py29qhbLiEqOLGJQK0J3h
	 OCS2Q7Ju16WWHew+w039dZV4OqkdH43ieObNkjnFyv/2dfhIrsRRQvf/P5DNOfmPAN
	 fqiOE8VKMwPwju6OS9uuuC9hetVOLDL+Hbwqov0k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgHXWFH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Aug 2020 18:05:07 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:41740 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHXWFH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Aug 2020 18:05:07 -0400
Received: by mail-il1-f194.google.com with SMTP id q14so8705667ilj.8;
        Mon, 24 Aug 2020 15:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sFe5hS4R8bzVnSFiZ1b3x8cFglxnF6BgXKj0AUobzKk=;
        b=pmj78AGjrb0lsO+Z1oSfN09n0Df0DDyWs/0Y9c44oT8WYS/T0P+u/6tG6WWKdCkya9
         HH8twDwAWJ4XeksZBqpfHZKYoaLfcpzBULgMdraG9BZ1KKc3bwYadyPSEUahLmjOJNuj
         CPb6PQXUlC1DEieTlH20y71nta0bNPSZdr24r/au6kRBSRzDkKTkun1MwAzI9MNtMjKc
         UDK0ylL2U2UZ18/HOFx8JAzLC+7nBT7Nh1cmmfw7QD2o9j0wp7j90pMUswCGgu9H1YfH
         90lEFGXi7MVPD/vbv76kMFSZRdfCu4xs2pRZPmcOCip8RTNjrKTpLn+KwCyldCFZqNOl
         NMAQ==
X-Gm-Message-State: AOAM531I4KgqKqGDqEhgQI12JvpxExKnt+3V0J1K7mgStgijTsEr+l2z
        KkQG/HMLA1E5lfrcML92Fun5C20rHQ==
X-Google-Smtp-Source: ABdhPJwB/Zp/LseOVmt6zKgBt2vF28u1bV7H82s0vjbj5nSKgQSpKWhHMiGBaQ1KGQQIirQp+BMNxg==
X-Received: by 2002:a05:6e02:82:: with SMTP id l2mr6497112ilm.130.1598306706106;
        Mon, 24 Aug 2020 15:05:06 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id c16sm8195649ila.29.2020.08.24.15.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 15:05:05 -0700 (PDT)
Received: (nullmailer pid 3393256 invoked by uid 1000);
        Mon, 24 Aug 2020 22:05:04 -0000
Date:   Mon, 24 Aug 2020 16:05:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     treding@nvidia.com, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3 resend] dt-bindings: Bindings for reserved memory for
 BPMP mail
Message-ID: <20200824220504.GA3335062@bogus>
References: <20200807162006.17333-1-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200807162006.17333-1-pdeschrijver@nvidia.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Aug 07, 2020 at 07:20:06PM +0300, Peter De Schrijver wrote:
> Tegra234 will use DRAM to store the messages exchanged between Linux and
> BPMP firmware rather than sysram as used in Tegra186 and Tegra194. The
> kernel will be informed about the size and location of the DRAM area to
> be used using the DT reserved memory bindings.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  .../firmware/nvidia,tegra186-bpmp.txt         | 38 ++++++++++++++++++-
>  .../reserved-memory/tegra234-bpmp-shmem.txt   | 33 ++++++++++++++++

New bindings need to be DT schema now.

>  2 files changed, 69 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/tegra234-bpmp-shmem.txt
