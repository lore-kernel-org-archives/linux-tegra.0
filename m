Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7ED6C761A6
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 08:06:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233983AbjDDIG2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 04:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbjDDIG1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 04:06:27 -0400
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E6C12C
        for <linux-tegra@vger.kernel.org>; Tue,  4 Apr 2023 01:06:20 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0B063581E42;
        Tue,  4 Apr 2023 04:06:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 04:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680595577; x=1680602777; bh=wvCuyZAuwEh94yyPjnRpCKIdQGJiyQn4/4B
        DEJQFbU0=; b=AtkH6rvUj5U5huHejp3uB3Zz5g/hfaZcg4lsnDaWzOdc/s6GMft
        NwOliXjFRM9vVv/5coyHFJSjD5zmTN/T37LeiJs0b2AZvqX/rt4tsMCrt/N/mUKn
        zRYtB4SI2VlvljEIKLsNOMgFgM6qyxGJDGJPN0945PL9ga3Ca/7lyRfVSG32mbeN
        LyeAFhMO7GP0Qj/HN/9Vez66bmAZNzuq0Q4iE8Wh1SaaaCaGIyR1YfW+Wuoivgzr
        /K48Uzq20/2G8SU91+mJb7xFLPNS7sY1U+r9OYBjgGGCWyxVevi31hiFgyJ3JIeS
        0XXwam1+YzQ9WmyBH56dK3lhq0DPrrvXMzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680595577; x=1680602777; bh=wvCuyZAuwEh94yyPjnRpCKIdQGJiyQn4/4B
        DEJQFbU0=; b=UaMS3EDcjVFS4oxlGIxcvqHEj0KmZmkMx1ngoKgbdfNCdsqPX+l
        iqLDWwLjLB0rpf+Ve7rB2O4d4xQicHN2vw6D+Q7JB4R2qBHP3aWVEYjXwJZT4nG6
        Q9tEMq3jw28REojZB3Vhj7GSZ3b4x8ItQlK9nxgs77UR+uiXU1jWjH0XPom35e9e
        7JjotqVoOu5S7nndrLkQ9/28cmv95coqNcScMuksL7V8NuS/li3XMoRCdAspyM/2
        hnhiWenn5ndLvQh4BHZZiq5zTucX1DhUayFte6tbFRfJAD799vNFlnFT8jkcxZN0
        FRy2ZIekTz5ZU6GGZYXol2pqjVipgsKy7Hg==
X-ME-Sender: <xms:edorZHIIqODZo1ouiFGUdwEfH5urh1EIj0JkdajfjuRlvdvRs039SQ>
    <xme:edorZLIgMIyLPRMpb66mIZt06QdaBBMEuuNbk0r_DDNIBz0HcQD1V61hjniM3zcQF
    HhreuYgxcKdovAMXEA>
X-ME-Received: <xmr:edorZPsvVmVs6jpuUnK5ghI97GyKWkpiB0SO0kXc_7VImZXehAfR201wB8M0zovQsenzlIc6mmnxCd16rbn0ztyMNt1I5gE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeikedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgr
    gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
    frrghtthgvrhhnpeelleefieelleetteefvdeikeeffeffvefhtdevgfehveduveehjedv
    vdeiledtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:edorZAZcFb_guoENutFxYld2KfQ381xhFJ-Z-w0jCc_rcxw-HlztJQ>
    <xmx:edorZOZWkdIO5ImT_hOE3FG8G4LsDz_sZ6DCxNM2E5KgFcP0ncmQ6g>
    <xmx:edorZEBA40wmGZl3MFznaF1dW2twdxRLJ1IHsvCRgI9ZIBTCKhhM1A>
    <xmx:edorZLJD1KYskIfRNoT51A9Zhc-Mk2yGgI6jyzWZrXY3Q9hLaZiJKw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 04:06:16 -0400 (EDT)
Date:   Tue, 4 Apr 2023 10:06:14 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Ville Syrjala <ville.syrjala@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Emma Anholt <emma@anholt.net>, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/scdc-helper: Pimp SCDC debugs
Message-ID: <20230404080614.zhfm5cq5uzx26ha5@houat>
References: <20230329171402.2772-1-ville.syrjala@linux.intel.com>
 <20230403223652.18848-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230403223652.18848-1-ville.syrjala@linux.intel.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Apr 04, 2023 at 01:36:52AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> Include the device and connector information in the SCDC
> debugs. Makes it easier to figure out who did what.
>=20
> v2: Rely on connector->ddc (Maxime)
>=20
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime
