Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1400826059F
	for <linux-tegra@vger.kernel.org>; Tue, 19 Aug 2025 06:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755583558; cv=none; b=Nkn3koViB8m3yw37znBWBSCPyFQurLuiri4Od1elVTZGKnlPTDfgUlkhk58/iaAyRBashscFlpxxbHXer8b7AARq1g7ZptaESdDn5foHMY6wW+2DoZ64T1F3QawWhduZ399zBWwPxAekMMiSvkdR2UETPKAAE1DA9hlQ+b244LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755583558; c=relaxed/simple;
	bh=bxPgM7yo/aZAhGNQ4NGGRlw3ruzUcR9O3+5SiEZqKnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtfzb7VnWLWuvND53LQKnUKVC5gMvytkd9P3gFcVnuU4psURdnSoL+YRQPcMsQEYU785V2L2NDeoVPjAf/JkuG6jyKOjS/dGFcu9oDSL+XkyvpWt8ix58Xsi5sTdU9153I7Q9keEeGpS0h48PqswrBs4btfpmVBYs2F/jrg0Ogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AGebLq3Q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AGebLq3Q"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b0c52f3so23472635e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 18 Aug 2025 23:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755583552; x=1756188352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyYciVPLbS6snOaAsO4fw3vEl41HECaYwSESuUU0uXk=;
        b=AGebLq3QXIYgoPEFy9zQdiVSrn0fsnTeQsl7Oatbuxbbrli95ElYIz0H48jA8OQW8Z
         8n7aHZ95NZHlKVSG6eX+6FirbK1U6o7JYm0WQkgfCt+Y4XSsbv344lj8m374QZxrOfss
         5puIscq8e9THEnj7aDPIXVWGxeQlEWIhH/3KRRWwvPmv2K4Lm44E3UfTIbd6xYZjv/NB
         n5cMchhuMiFZRPT86smdtxGTUnIlYGzKPy1hXlUGQNWsVvYbEaZVu8gbm5bGbmKO1ADi
         LN4NAhCxaVW2NA5B9ynaBSJ2xh6/10+yO8FxvE28yVR2JO9ZjAwcTD3dTyse+XxJFwrK
         9OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755583552; x=1756188352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyYciVPLbS6snOaAsO4fw3vEl41HECaYwSESuUU0uXk=;
        b=OE7so+4R2Ox8ofvrj/C7tlaqUqiTM4Z9inbXZkQxXiF8ydGPgOoMaH2+kAszXC7Qrv
         KHisic6I6BdrjqD6zRBd2l/xNI5Opezz//XHq2wKcdduuhRnmZMraGBlBX50uhHCxBEv
         eHml2l3m7OLxD5VRvbDHmSD16FxkJ9567+S+bPzo2qBUGcHyE3yszHeCMOHxMN9mEBJB
         eWiK0wd6UeXVY9tj9GXL4y9IYVxMD5pdwjsGqzfzG5M2SIr3rkfextz+eWgwj/LMFKpU
         BwyjkUyk/VnMkbkJtJrs1lYsgULH9EjYUTzzKpHJn4xV58CI1IrilYkJwNghBnZ38wjd
         isMg==
X-Forwarded-Encrypted: i=1; AJvYcCWuwunO/wcxwtnBHs96/zPXAsEr/f82jHJaBgxzaA0D54dMp0YCW15e6jvcDQ6cbyJVNnsWJQ5MojWRsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCN2hWHWAeIDkNIRGFiiRQbTCUctNyhhICz+5dgXUPEjH9r31y
	Ydp9hAv3/W46pAlODIsMxLIsu6DnvMOL57rsvZ8RProl1t9oG0zSpklw8i+ASuZ0VTM=
X-Gm-Gg: ASbGncuw7N2fClLL0O4jMENag2F497ShGRs+P1E4QI8CTdcVaCZ1KRIVOPJx9sVeyQi
	qvHx/amXfRow9+J0KeWr4ySOMKSf5rTAf9p9D+tIKHPFQEsmCBDwsR2gYLGJlc/+rt/DYXtNreS
	KV5BdY5smyN4Ba7TJaKnVrK+mIZFTsmPRjXA2g7oOPMBtgl2VDx8TpbwB19T8DB1u1UFvZH1Olv
	noEZ1buvu6fkQPxfirYwgFueztVY1CJtLJPaqgumqo77ZrZN+TAwUlDi0Yo5LrhpruVcoIr5IVW
	GE4ZplmxbVDvfuGz0spvzKJW4rD2K1hJFJHNf0TwDSYCYKv12omKK83RfmcZQHPdj1RwlvMnTQb
	1o6gkNu3GCTeKGJ0HAdIflKMd7x0zVaAXOA8T5Q==
X-Google-Smtp-Source: AGHT+IFw2BSNTmQYZsrxAeHUw41R54OQHcFGDyt5cWhAdj18Fb+YQS9GQGDyVsvFlrO93e7In/3Z6A==
X-Received: by 2002:a05:600c:3582:b0:459:db5a:b097 with SMTP id 5b1f17b1804b1-45b43e048e9mr9080665e9.16.1755583552442;
        Mon, 18 Aug 2025 23:05:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c6c324fsm194494305e9.1.2025.08.18.23.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:05:51 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:05:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mohammed Guermoud <mohammed.guermoud@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] staging: nvec: Remove unused NVEC_PHD macro
Message-ID: <aKQUPPlr4hJS1UTe@stanley.mountain>
References: <20250818203855.11914-1-mohammed.guermoud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818203855.11914-1-mohammed.guermoud@gmail.com>

On Mon, Aug 18, 2025 at 09:38:55PM +0100, Mohammed Guermoud wrote:
> The NVEC_PHD macro is a debugging helper that is only enabled when
> NVEC_PS2_DEBUG is defined. As this flag is never defined in the kernel,
> the macro and all of its call sites are dead code.
> 
> As suggested by Greg Kroah-Hartman, removing the code is the cleanest
> solution. This also fixes a build error discovered by the kernel test
> robot after the v1 patch modified the macro's body.

We don't reference v1 here.  We would do it under the --- cut off.

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508182005.4PiKxXcN-lkp@intel.com/

Don't add these tags.  They're just confusing because we never merged v1.

> Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
> ---
Here you would put a comment like:

v2: version caused a build error.  It's better to just delete the
    code instead of trying to silence the warning.

Please send v3 with a comment:

v3: Fix commit message.
v2: version caused a build error.  It's better to just delete the
    code instead of trying to silence the warning.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

