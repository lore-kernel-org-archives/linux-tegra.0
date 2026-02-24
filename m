Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E0722DFB8
	for <linux-tegra@vger.kernel.org>; Tue, 24 Feb 2026 05:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771910495; cv=none; b=eAsKWSKYAHdVWeKP9l/hlaJ8TrzGKYDhg8skXGEp1WNTSjezS/9cnStrQbQTlFAJfIZk6Qcv7PYwy3h6SLcPA/IWvGQESm86Oy94rY9wvHuzRVHwNRe4PA42CXPyvo9ugQMrgW/YkkJMWq6Ie7CktYeG68gnBAIVPEZ5Brf2Q6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771910495; c=relaxed/simple;
	bh=BFMA9tA6/qbUG6yrwD+s0ZeviwxXSJupFoeMZs+bE9E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iPpPCjHcZchuQnWIsZX1d6DqzSBPUlT5GKkDFivbEiaD/Zh5BAxU6wvAjmiA2xexGtYq9ayTq1sn0O2lyojnwAKcPjILLKMSobGAHyY+o28USk1YgbAZbY3i4yQz9JtSQDKsUwPOnkPzjZeT1wOVM17zpde5n1/FG/IabbAGhIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQm/4lF2; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQm/4lF2"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-798374d0f44so28481907b3.0
        for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 21:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771910493; x=1772515293; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFMA9tA6/qbUG6yrwD+s0ZeviwxXSJupFoeMZs+bE9E=;
        b=DQm/4lF2bIrteHj70AMoxXn3gxkIO7Lm5ipPoJB5qPhfkU/gBJEwVT713HRegzEGAe
         g1k1FsNPAq/xfzINvcXynf9JXJdbbBRqVWB5757Hx6r07oBkrjw0PhR8AqNSysogeZEJ
         IsJd4KgQZgJ2A+b5a5z5/aqnzzj09KzGOwGgMSGwaYWUkIASwaRjs0PB3zQDO1c4mjw4
         bNHFYjvRufrqmhUmWc8rgoWC0JBmk9RgOfkWCgRCl50hGotJ8KiIZJmUT+SfXflsn8m8
         Pov7BGvmGUYL/VMQiDdIhWyGU1BzwhojaxOP8osAJz/nCJz2/8S3nDewOkmTIWc28P2y
         O5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771910493; x=1772515293;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BFMA9tA6/qbUG6yrwD+s0ZeviwxXSJupFoeMZs+bE9E=;
        b=i5AkXOf/kyLCncmS7AyqPi7u0E5sJ7l9fVMVtusqZqrB1Ac21bjsfPDm2dVLU9eGJC
         KIxSYpkPgXOKvOFX7OP9DTqglc8hlxh7eTj2MoustqX9R9nAkeFRG1A5JNu31m9NalBl
         FIcGgHzFiIRa67kXBYDwoyyQh5fBy0pQIxfPV18znJeU504bNvgvMQmaKupvLKDk+/dz
         wezv+WjWbT6ZoeVgICyFXtQZCkiRIFhSvSBBU1wjCITLlXkCO/f1bMk7WuWPUSXJo1n+
         po0z/oTFaId53zdVZFRgg5GTgqUksF97ln6t+Xt8nHxJQA2Vt8kR63hssy+Jt9blBLWh
         JvWw==
X-Forwarded-Encrypted: i=1; AJvYcCW1R06abqscwtxfYdbzrFB24UvOB1p63AnlXIiTsA2C56lK8tuCF8FLqPcT589mThQKdY+Xsmk20Yg/Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxolp1q9lfmx1qzgj1TZguoxf36BoGGSGv4zSIbq1vKC75iMIBj
	4ngK+um91rogUPp2KEf28lT9e9LoS80hyDyjUZfXeZem8HxQoxPzGOo8
X-Gm-Gg: ATEYQzz2S849FRJSa5Bz6g6o1pY2PpV9Oo4+xMWsg6YZuuwFYDufg/HIAKM1uIfnb/J
	/AaMrAiqFIBrmDR0tQJYEN0hopKi9n/4j57EWACsd5zoJP4qMMnW+/RRmO5AEBfE79wZu5z3No0
	WGAIze7opq4UbqvLtyw/buEepEjR2efbS1Agq2fFdYfDaPfjeaIxy5phQnni71ONDtGM228w0ut
	OSQN4gKtCEJQbmd/+ONqjdjaH9XaELFTgODrbqsRs1l/EeC/tkVSCF96cWgeA/Z3nHxN9atdVAN
	bMbkPuMg9HG1fo+R3nZmWFVXByDoG3vRZs6XrpRz3K8N+e5o2UXUZqPHQ9qkSqHJHh+1l4drkgi
	yC4pIbruhGZFFOmhUJf4KNfLGKoePXEPVBsKNAbNrkXpZXpOfKvD/yfDhmzMPFzDtd5+2JigGEU
	71R1IyBlG3WuGT+I++LYXxegJQZ0Eoa35a7IQZglxhOol9Fj1qVkWH1fxp5UwQMNCmR31P9+zf9
	r5vSnlnNDrhl30Mel6Aai4HTsy7igKb
X-Received: by 2002:a05:690e:b43:b0:645:51c9:7f5b with SMTP id 956f58d0204a3-64c794d8aa0mr8761803d50.25.1771910493021;
        Mon, 23 Feb 2026 21:21:33 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c9fc06d2asm232578d50.3.2026.02.23.21.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 21:21:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 23:21:13 -0600
Message-Id: <DGMXUA7MV0MK.1PY2AL3PHA7KF@gmail.com>
Cc: <ac100@lists.launchpad.net>, <linux-tegra@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: nvec: fix block comment style in
 nvec_interrupt()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Kibaek Yoo" <psykibaek@gmail.com>, <marvin24@gmx.de>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223143101.76552-1-psykibaek@gmail.com>
 <20260224044946.54022-1-psykibaek@gmail.com>
In-Reply-To: <20260224044946.54022-1-psykibaek@gmail.com>

On Mon Feb 23, 2026 at 10:49 PM CST, Kibaek Yoo wrote:
> Fix multi-line block comment to use the preferred kernel comment style
> with leading asterisks on each line and a trailing */ on a separate
> line, as reported by checkpatch.pl.
>
> Signed-off-by: Kibaek Yoo <psykibaek@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
