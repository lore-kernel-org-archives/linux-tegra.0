Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EF930C601
	for <linux-tegra@vger.kernel.org>; Sat,  4 Apr 2026 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775341569; cv=none; b=uLror7qYmdymjNGmZno1xosArxcgynbCKWEqpDmZTzSbvMM4dXcFLYUQBhMRFq/lsvga7Jl6k6T/Wy5+LsqZikw4ic3bHC9IDW2z8NTBs7fFSwFoYyeaJ10K2tc7kbg1KGsfMN5Bb82HKesSVrybcMkq8pupA43PYjsisVWEJfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775341569; c=relaxed/simple;
	bh=6TXh8DGA2Iql+jn8Sj0qQupqafnc26el1Z4mW9Jm4JE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dOQ4Sbmp+Zj2q2m2jGi2BoZduOUzsNQNm1t7iqquGKsVzE5K3ulwV18fIyGhFapFD6j5ypmRhAqhbpij5ZPxH43BlC8BOgRTLXfN+Nz8B6ZJAqZYZZC+YOBgrwp3Rs7S0nm6IOt4nNeX0ph3QlCq+L5JoiYw2JhQQABzps06qWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBT4asCJ; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBT4asCJ"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-650182d19e0so3326707d50.1
        for <linux-tegra@vger.kernel.org>; Sat, 04 Apr 2026 15:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775341567; x=1775946367; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TXh8DGA2Iql+jn8Sj0qQupqafnc26el1Z4mW9Jm4JE=;
        b=iBT4asCJWYjJa2qSyAUC47hpEaBhYXiY5eJs5OeX5tyeG88SKnxm+zLWXU+dddeyAD
         LieEfDy7E9er6T8vWtWfMigohxPT2yNwEDMdpmuaARLqLNdq/cu/6wHlfKBU0kzBWg1d
         8786Su4tOPBcPEi7iQd2ws3mUMBMIekQBrfKWZ2ev6H5lyxYg7bTwdMDtuHyZSdQ8DwS
         g8GHucn9IBoLOMEP5rZgpSAv24j4a4BfCt1uLRErge3SBHUb620HKvjeM8D03S9CnB8Z
         wRxWZH7iX97xEb3tsRVElHBb1TLnVhog5uvshKIllrDPrmINcdT7kuHdrNv89kcchpAm
         4O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775341567; x=1775946367;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TXh8DGA2Iql+jn8Sj0qQupqafnc26el1Z4mW9Jm4JE=;
        b=OT5dGD7jRENhGr3TVUekfyeRa2rCmH2VckYRT7cjKrmUGJG7IjKbxP04MazkZAy2T0
         MHyWKe7O2KXGr3io8nDwnCZYe07wFi/fR1/Pl7wnzf9ZrxUDDmaGWzRtJU/Tnl4qJpzD
         X5yILrwuI/rIgO7ZAULCB7G0d/eqaRJ9n8SEQWoEj4WDInhVFQHEhikjyYdY0DocAk48
         QuwsuKAE2Gi7HZXvAoLju9WqoTaOodmMJqOC+vfTpgVgWW32aoK6ajmih1mBmoNtp+u+
         kVryqgkcJJwpSTya/pgRBWYBL4mMSjQMwXrYsZzI5llErxcYJx5G7bvRpiaQJ3kPxPVO
         I/nw==
X-Forwarded-Encrypted: i=1; AJvYcCXZV8JyqizxDl5/j2r6n9SVPZfqh/BlCtvFC3nnp0pQeFqTvpHZ0NWRxTqkYTw+qP8z3EfD4BS4qeWh5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9BR3e4NN0sVg5ghCDS8YgTKY0X0IkLEa43KHN2Qz/IWVWwOkl
	P6xA4PRrrDjxnWoirGEH0wwwxtCpHv6C1lTQlXHwfrkjwfzBLxBq1UUE
X-Gm-Gg: AeBDievLueMIIsG+wPiKYvgpGhCvVM2nBdyrlc09Za6aStewTtmvDfd/p65t6j5JRXN
	U+uLZW7baMon5sxxC7gS2bcn+RAiyI0gNOd/oC7YNW/9ChPjzGOTnM1JEJWGzdR/apMCLpE1Bao
	+XrU9ptQoMAxXo/UGfj36cVzbXJVoRFzkFMKoVOgWiOKceZ7fYEdf7B7o1ex9OXpg1mJyu+Wqjl
	EUPXweXWjkJqf1ysdlpyMEKoMrppPqws7lEwKgiTozT2AXfvQgxs/YX8L2mtVtr6ASzXT1dgEeE
	k0dTwB40X5q4IgUcXBJ4/v61JAsqSd0Gzxz7//XiFhsOGg6ACsvsBH7+ljLrvpPABJ2J6jQMMTX
	fafrspvNwVAKp8uDtKNBmE2CgJy6IaSLsLqCChWf7MtG4yw6GNRwikWybRNSleVMY8RoZorZP5X
	BxNFp7ZfQcsL7aEMjHpG7ZEWLdc+PnVTFIV/jc0+nuLw89iS1BHcJUrnh0T1F7Ar15CqNOkNRrZ
	8a2NqwcDYt890mOJJ1N+tvt5bv7boOZek5TS1joNsE=
X-Received: by 2002:a05:690c:4c0a:b0:79a:d067:1b45 with SMTP id 00721157ae682-7a4d6e21e50mr80022697b3.22.1775341567476;
        Sat, 04 Apr 2026 15:26:07 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a3709075besm35562857b3.25.2026.04.04.15.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 15:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 17:26:04 -0500
Message-Id: <DHKQ27MDZEZ6.3TG030YKHRLAH@gmail.com>
Cc: <gregkh@linuxfoundation.org>, <ac100@lists.launchpad.net>,
 <linux-tegra@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix logical continuation style
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Paarth Mahadik" <paarth.mahadik@gmail.com>, <marvin24@gmx.de>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260404072626.134642-1-paarth.mahadik@gmail.com>
In-Reply-To: <20260404072626.134642-1-paarth.mahadik@gmail.com>

On Sat Apr 4, 2026 at 2:26 AM CDT, Paarth Mahadik wrote:
> Logical continuation should be on the previous line,
> move && to the end of the preceding line and align
> the continuation with the opening parenthesis.
>
> Signed-off-by: Paarth Mahadik <paarth.mahadik@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
