Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F0938A705
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443580; cv=none; b=Z7E5/Rf8ogAMzw4uTfWI0oIRPGMY5PvDbkLI85WEn7KZhZLTE53NQE96HP8IvGF2pX5yIJYtIvpTlXMRQNOZL+pOfNkM4b+SvP2v93r07xsocv6rqmd5qBJHd6iuoT+Q/722MAizZeSb2amqYEqSG/6GOULUmIUzQLnkpestuQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443580; c=relaxed/simple;
	bh=NvlfqQkFSjiKefhGJg1nl4VUtTSqxowA+e2w6Haf9IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4lxIBnsKaZ+Uziz7SfU+Nz+mPKqfjBmpEhEqJJvcz4KceyYeffF8bXRH+km2trBdVzLCjWaN8w3tqvlNrvUln07cDmIQGU6bUIN6ZNjlaOUkj88yvrEG41g43wjz3lUwOP07eva4XEKNCdJAek2GHdl5uefwkYFklnOAMUfelA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6xbHYjB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6xbHYjB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483703e4b08so36616685e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 02 Mar 2026 01:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772443578; x=1773048378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8OftFQTV8naufyqWqKOJ13Y+eOJO1ch+XainGBjNPzc=;
        b=X6xbHYjBBMbIc1HYXMx9KPgwRFm5AuJV8rkuFMkIqLoDh2Gw1Cgy00KJWZcr+B+SVc
         KVsWvl/mN2wFCh3V9TRcB7pgc8IT0zq0H5Gn03bZKV0/O3U8pOv3532OqwUURkqXsnCv
         8Dr0oa6I/dJ4aAuXF5CS/88HWjEdpfGE+jsEsyPjIq/9C4//dqwCW9emdCVovMA+IcTq
         FEChXHnRZc+qD2U3JAI5zbrnSWmO57dbnfcLcHplbueQEdw8peR9NpDWz1KBO03NGLt5
         La/op+yLkPrapNusYiSwrQoScLgda1zw7MkvO0V81SBD4mvbDyTwZH9P4g1jotQXHF6u
         NOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443578; x=1773048378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OftFQTV8naufyqWqKOJ13Y+eOJO1ch+XainGBjNPzc=;
        b=fpZ6do3gYo9jaFiGP9w9b5YZBGsfLtdpidt43vdmbNyvvr7nNMkRJr8W5AXXCTpUXy
         7oaJT1fD0xL149sdw0ZrlgOBtUkO8AXsW9ENn2lwKU724Ud+Infb9tHj8YnyDfFcm+wd
         EqWmfxnVZhoDq5nRW3GwdFLbosTKAGB/bKwgQZxEn3i60MaSdd/bh6iT8URptjFaoC+2
         XvKnDnTZ6abcZHsnOHvPRxOlF5DgzATj8PbrZTMYkYYvPyCkxIitE161sG9jLlSfCaCh
         i9gH+a7B18OHs09HPWukIVe4Hu6yDcnBWNpN8sMxCL4XNyIMXjgQZqeM5uPOZluwdge8
         53ww==
X-Forwarded-Encrypted: i=1; AJvYcCWtp8sPEg2LdYbifX4FzJLnWy4VvjSvHzxxKrxT3rzpLFiyFxFMlGnH5m7JXDoANzInpGQ3fGr7z4xPCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YykwqrU6BAm72oAdmH5e4cZqFo5Y7THjCWxM2nE40WZ4ELclpjN
	BlRxL3vhThOgHFeJdy4jX+4c+tZmvyZLZQTatPajQhzOnWPqZ906NrzcSbbTBqNB+39bc93dXJE
	G4+3l
X-Gm-Gg: ATEYQzxl05C386/sdj84RQd1pV1c1jZzMZE/mujoR//ba1FWipTJoZyUOnI7OWMS9kY
	PSpYDPTcge5F+NA88qNQEWGC16hbBUvYt6mIsNWdyY72tc45Glba3ChKOiHvA6gLcWIh5sCZytF
	pRnJ+qf8Dm+PF4W4bet+jVYTD/j0nvCBSwqejqzKjQtQfRi2da5wKXqmZcZfo1O1eIbevjBYXI8
	cSDZ1xU4k/XqgX1DODDgpTgT5om7rD/WwLOtaJclbLp1qcMy48dyn3rszHWoOky+mEypdc3w1ji
	4Uo0brf7WHbPT529FeNO3wiuXvtt0u4KMlCZ8EvvrCdNE644tvcHnXYdzYJL0VTsPa4lY4Aklex
	PQvEa+Q2oFzxIZ1f9cxVembktArVeEpb9mawYBav8AAfmShoeoXmjk2O9r9b6PAO5j8wCoWxmD+
	bqeCxom2pKQAj+dCkig7ITy/NXTd80LcsypQIbxKQ=
X-Received: by 2002:a05:600c:c8c:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-483c992e3a4mr187337525e9.9.1772443577584;
        Mon, 02 Mar 2026 01:26:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b0549600sm11507548f8f.35.2026.03.02.01.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:26:17 -0800 (PST)
Date: Mon, 2 Mar 2026 12:26:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: kbd: use -EINVAL instead of -1
Message-ID: <aaVXtbHMfUFJW_Tu@stanley.mountain>
References: <20260228202008.40063-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228202008.40063-1-officialsohamkute@gmail.com>

On Sun, Mar 01, 2026 at 01:50:08AM +0530, Soham Kute wrote:
> Return proper error code -EINVAL instead of -1 when
> the event type or code is not supported.
> 
> Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
> ---

Could you do some analysis to see if this affects runtime?  You'll need
to review the callers to see what they do with error codes.  In this
case they ignore them.

One thing which could help would be to build the Smatch cross function
DB.  But it takes a long time so do it overnight.
https://github.com/error27/smatch
https://github.com/error27/smatch/blob/master/Documentation/smatch.rst
cd ~/path/to/kernel_dir ~/path/to/smatch_dir/smatch_scripts/build_kernel_data.sh

$ ~/progs/smatch/devel/smatch_data/db/smdb.py nvec_kbd_event | grep INTER
drivers/input/input.c |  input_event_dispose | (struct input_dev)->event |           INTERNAL | -1 |                 | int(*)(struct input_dev*, uint, uint, int)
drivers/input/input.c |     input_dev_toggle | (struct input_dev)->event |           INTERNAL | -1 |                 | int(*)(struct input_dev*, uint, uint, int)
drivers/input/input.c |     input_dev_toggle | (struct input_dev)->event |           INTERNAL | -1 |                 | int(*)(struct input_dev*, uint, uint, int)
drivers/input/input.c |     input_dev_toggle | (struct input_dev)->event |           INTERNAL | -1 |                 | int(*)(struct input_dev*, uint, uint, int)
drivers/input/input.c |     input_dev_toggle | (struct input_dev)->event |           INTERNAL | -1 |                 | int(*)(struct input_dev*, uint, uint, int)
drivers/hid/hid-holtek-kbd.c | holtek_kbd_input_event | (struct input_dev)->event |           INTERNAL | -1 |                 | int(*)(struct input_dev*, uint, uint, int)
$

regards,
dan carpenter

