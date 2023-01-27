Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5125AC61D97
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 18:02:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234494AbjA0SCf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 13:02:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233171AbjA0SCe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 13:02:34 -0500
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A01C7CCB9
        for <linux-tegra@vger.kernel.org>; Fri, 27 Jan 2023 10:02:32 -0800 (PST)
Date:   Fri, 27 Jan 2023 18:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1674842549; x=1675101749;
        bh=G3N1dUBCoS3HUBukvqJJ/tzvPtsoCbWhZtyZKVUf/Uw=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=nZ7r7awSwyh0CWD7LR7Uo8G18yAuRzK/BHVOCsJCTwZuLv48eWgTHHODREcaEqVRK
         4AXYVehhR7ffzpiV0nx/eZr78rXRozRr0v/oesPTBuYDgRQWKbeNtHuJJ8Dhtcl+yq
         y1jTt0yuURsHGOb3B3g7RllVa45/XyiDsRJ4MUtfXuKVUsJ5dY3lOU5D2qogZ3dAtv
         W6MNwOP0Z/DjpodbcuRWJlESPN7PEsXsW3U0QVJcYZZHCmcALXzXOdlp37/vksAC73
         XST6c/9eEfZnB1QQXH/PSZsAce7Gnkf39/x2odP6Gs5mYjDdWFzskWx2sqgGtGk6Qf
         3orddiMWiXAAA==
To:     Thomas Zimmermann <tzimmermann@suse.de>
From:   Simon Ser <contact@emersion.fr>
Cc:     airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/10] drm/client: Test for connectors before sending hotplug event
Message-ID: <tc_igyYrgA_B5xJ15j6H2fQ00aA6vzd4nuQ8XusqeJqWWNZDJx8fFRgBAWoWOV8L5BEhjFDMYgANfdKXLqJZ0DMcsZfy8OUHDRatj36oOXo=@emersion.fr>
In-Reply-To: <20230125200415.14123-2-tzimmermann@suse.de>
References: <20230125200415.14123-1-tzimmermann@suse.de> <20230125200415.14123-2-tzimmermann@suse.de>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wednesday, January 25th, 2023 at 21:04, Thomas Zimmermann <tzimmermann@s=
use.de> wrote:

> Not having connectors indicates a driver bug.

Is it? What if all connectors are of the DP-MST type, ie. they are
created on-the-fly?
