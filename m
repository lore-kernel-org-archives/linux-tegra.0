Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1FAC4320A
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 17:13:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA34361102
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 17:13:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhHMROQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Aug 2021 13:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbhHMROB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Aug 2021 13:14:01 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F11C0617AD
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 10:12:26 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w20so21047300lfu.7
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EK2QHzhhuN/O2UQnpl9ve787B6n3t7/cuJMIjcHYeJE=;
        b=mUI9ONFAGfPuc7gnxUMBpZeBkavQpT52RooygNTOVj158zech4dgbCodvbz6ego1ay
         cghkbH6fh+FsnXmludUdub4wtlyQW4V+pqTmYyhvcgpKhzyxPdzTny5Ug2iyRQ5wR9lD
         Wi54/Zz1I6I8ax3mF3XFBZAt+6RuId7MhjdIHbpP9vmltIGtsS1CWGuVTORXusqWuO4m
         /Vivmk/dr1RSc2MjGNVMo9pNLClsr9fRi7TDBfQ9oYW27R+jCiQxT/EGTBgfNt8j+jq1
         QFc65AnGphkr14sG/n7ScYNVwP/NgMrUIayEJ6pgDS73kkLrUgro05NzVxdrYVI/rvPn
         ov+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EK2QHzhhuN/O2UQnpl9ve787B6n3t7/cuJMIjcHYeJE=;
        b=U6/E6SIHmmeOPmJHjroP9WoGMqEyBqqBB7jmFtfwub0AjMCyow6yrnUw4L+OfM5weS
         Dsh711fAhC1iZ8V151OdrMEnho2wxN0g1HB1XyA4uVBdbfC7RftbKC0ddFN1mVT4wC/F
         1ft6tYfBNjbVYXMzl5hTw8hnKIkIeJQoHru/7A4x17smVyma0pzyGDRZgi9elsvkjDFA
         UTnvbpKS99JVjbtystzVufF8n+bFbTTQODpDUujElAYQS2n8PLxPC9Sn1yonlpunnOjd
         t7sctAPZZuqteLjKxO8VLrY7Aw83Ww1FLhDKu8Vl/kRd5SsVfdoe9FpFBdLsT/nySeUX
         yJ6Q==
X-Gm-Message-State: AOAM533lyZwblGxtUa/RcKjVUyoChhAhjgbGgORrtqXV8L/TI4OTLrR5
        zWTz7Nu0f7k/Tob+naGnH6Y=
X-Google-Smtp-Source: ABdhPJwKNfOBII7Cpre9ntlYryUHxH54qlj6Nlh3GxmBjp6A5NEe1i33Dza+dhph507VaP//fp7RkA==
X-Received: by 2002:a05:6512:3501:: with SMTP id h1mr2436532lfs.446.1628874745048;
        Fri, 13 Aug 2021 10:12:25 -0700 (PDT)
Received: from [192.168.2.145] (46-138-117-53.dynamic.spd-mgts.ru. [46.138.117.53])
        by smtp.googlemail.com with ESMTPSA id g4sm215821lja.64.2021.08.13.10.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 10:12:24 -0700 (PDT)
Subject: Re: [tegra-drm:drm/tegra/for-next 16/17]
 drivers/gpu/drm/tegra/dc.c:1843:53: warning: variable 'new_dc_state' set but
 not used
To:     Thierry Reding <treding@nvidia.com>
Cc:     kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <202108140028.U2Z9tWIN-lkp@intel.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6a4b2b81-cf37-5a0b-bb6a-4857d1a4ffc5@gmail.com>
Date:   Fri, 13 Aug 2021 20:12:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202108140028.U2Z9tWIN-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.08.2021 19:36, kernel test robot пишет:
> tree:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
> head:   ad85b0843ee4536593415ca890d7fb52cd7f1fbe
> commit: 04d5d5df9df79f9045e76404775fc8a084aac23d [16/17] drm/tegra: dc: Support memory bandwidth management
> config: arm-defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add tegra-drm git://anongit.freedesktop.org/tegra/linux.git
>         git fetch --no-tags tegra-drm drm/tegra/for-next
>         git checkout 04d5d5df9df79f9045e76404775fc8a084aac23d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=arm 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/gpu/drm/tegra/dc.c: In function 'tegra_crtc_update_memory_bandwidth':
>>> drivers/gpu/drm/tegra/dc.c:1843:53: warning: variable 'new_dc_state' set but not used [-Wunused-but-set-variable]
>     1843 |         const struct tegra_dc_state *old_dc_state, *new_dc_state;
>          |                                                     ^~~~~~~~~~~~
>>> drivers/gpu/drm/tegra/dc.c:1843:38: warning: variable 'old_dc_state' set but not used [-Wunused-but-set-variable]
>     1843 |         const struct tegra_dc_state *old_dc_state, *new_dc_state;
>          |                                      ^~~~~~~~~~~~
>    drivers/gpu/drm/tegra/dc.c: In function 'tegra_crtc_calculate_memory_bandwidth':
>>> drivers/gpu/drm/tegra/dc.c:2223:38: warning: variable 'old_state' set but not used [-Wunused-but-set-variable]
>     2223 |         const struct drm_crtc_state *old_state;
>          |                                      ^~~~~~~~~
> 
> 
> vim +/new_dc_state +1843 drivers/gpu/drm/tegra/dc.c
> 
>   1836	
>   1837	static void
>   1838	tegra_crtc_update_memory_bandwidth(struct drm_crtc *crtc,
>   1839					   struct drm_atomic_state *state,
>   1840					   bool prepare_bandwidth_transition)
>   1841	{
>   1842		const struct tegra_plane_state *old_tegra_state, *new_tegra_state;
>> 1843		const struct tegra_dc_state *old_dc_state, *new_dc_state;
>   1844		u32 i, new_avg_bw, old_avg_bw, new_peak_bw, old_peak_bw;
>   1845		const struct drm_plane_state *old_plane_state;
>   1846		const struct drm_crtc_state *old_crtc_state;
>   1847		struct tegra_dc_window window, old_window;
>   1848		struct tegra_dc *dc = to_tegra_dc(crtc);
>   1849		struct tegra_plane *tegra;
>   1850		struct drm_plane *plane;
>   1851	
>   1852		if (dc->soc->has_nvdisplay)
>   1853			return;
>   1854	
>   1855		old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
>   1856		old_dc_state = to_const_dc_state(old_crtc_state);
>   1857		new_dc_state = to_const_dc_state(crtc->state);

I probably should update compiler or set W=1 to get that warning. These variables were used in older versions of the patch and they can be removed now.

Please amend the patch with this:

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 9ebb1b6840c6..e2b806369eac 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1908,7 +1908,6 @@ tegra_crtc_update_memory_bandwidth(struct drm_crtc *crtc,
 				   bool prepare_bandwidth_transition)
 {
 	const struct tegra_plane_state *old_tegra_state, *new_tegra_state;
-	const struct tegra_dc_state *old_dc_state, *new_dc_state;
 	u32 i, new_avg_bw, old_avg_bw, new_peak_bw, old_peak_bw;
 	const struct drm_plane_state *old_plane_state;
 	const struct drm_crtc_state *old_crtc_state;
@@ -1921,8 +1920,6 @@ tegra_crtc_update_memory_bandwidth(struct drm_crtc *crtc,
 		return;
 
 	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
-	old_dc_state = to_const_dc_state(old_crtc_state);
-	new_dc_state = to_const_dc_state(crtc->state);
 
 	if (!crtc->state->active) {
 		if (!old_crtc_state->active)
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 26ad1e448c44..871cfb0cd31c 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -35,12 +35,6 @@ static inline struct tegra_dc_state *to_dc_state(struct drm_crtc_state *state)
 	return NULL;
 }
 
-static inline const struct tegra_dc_state *
-to_const_dc_state(const struct drm_crtc_state *state)
-{
-	return to_dc_state((struct drm_crtc_state *)state);
-}
-
 struct tegra_dc_stats {
 	unsigned long frames;
 	unsigned long vblank;


