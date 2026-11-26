Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682772;
	b=gNSBIVBiijOizlbfALd1w/8xJUTNLcm4vN6ZXYykNA9koMoqd6EjHKhFWXVZXnft7/zO
	 jzICXx/jd6TrFYoGLOG8w+lmGFWOyrA36Xawb0flb7RGZhT81FB06rLJvv9GKBDfAoasY
	 MPk6QRSPfl0EaxEbuhVfCxZpI3j8+ZkTb2i/gmbhsyIuLGlhpPiArNhcNSjf2AqmErWRT
	 JeS+RG9EXmVWp7hAYyh/fmnVKLJd0lcbbnGqXRgUUb0/nk7qgTRfHwnS5NKyx3gLsylql
	 E8WKute6DHN+nct2IeX5/Vdt4bqExaYKj+Je4sFBwTdQE7utt6C52/UEVXQmswtH7zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Ly+iwNCEEn75tDRea4ss7xMGDQP2WimRSELcpuIARng=;
	b=1XAaVMdvasnCBlaNEYJc08VkkFmO1A8sxiVuJd7K0z5u5N7uQiDicA7uOEIAUplYvKTb
	 IyL2JGvDK2ZCKOzXeUS3i1BPdSzSWcgVbyTMhi5AbCtU+A7bzFSqpJrn6I0Q6gzRT6HIG
	 QZYSkNl93pC9jdVV4ARD6pYQiDJ8lNCZw7gvVa/KHsDA1+45pkC49gP1pE2oIB8ekvQyU
	 qQVludP/a+91318DnnvR0RuPxK4xHt2JCmP7GLIpW2SX7H0cRsIxwGPxWLeS15WLi7KQU
	 TQSwFlKwGKu/Spy7h8cVTloBWNLyen47ESsd2bCJSSAgj0y+C9rOcKZSKi/jSOsVoRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bt5WcYRS;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5747606A31E
	for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2026 08:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5747606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bt5WcYRS
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso9003043c88.0
        for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2026 00:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795682771; x=1796287571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ly+iwNCEEn75tDRea4ss7xMGDQP2WimRSELcpuIARng=;
        b=bt5WcYRS6nIC6OIFdBuzIW4GYAFTX/a5NC2+GKEfgJaBv1L5QUXAsPfHh2fzC+bMI+
         SEsKRIR+mA037Fg7i1F7Yv/T1Gvj8HwfNRNoZ1YaD9fBcLAdJiFlvxGgI4uJE6kpB9eu
         IJBT+8dp4TqFtERCFUQfgWsWTFNsNcm1nZ32p/BdnhxhW5D+aiqPA69St5ljMaLjD1rs
         AbEYtb869wYA4jAQtovCJH/RMvzRE5O4JyWZJIICytCgZKyIrpzhN/3lolj7XQRrEynd
         v/smMnCj1N4rcqHyU4IXP3ZPqSDR4a4j8cVQSybtwR+Mh5Q3rmekF7yBLG2HJCvXr8R1
         oI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682771; x=1796287571;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ly+iwNCEEn75tDRea4ss7xMGDQP2WimRSELcpuIARng=;
        b=dyGqABgcUlWmem7Tw7AJZxUk+9Q7DEgrc6OvO37ikriCF1IKve75WyMbU3udgxg1rR
         2hQtxqou1ti9pM1PKgkv1Ey7OchDYozxUxuVQt6ORbIl13+0IDmBBNcRFRUHcuE1Awqi
         QOuQhb7vafo6V3CokRO9+QNNagaT7SR9nEXNItveHj3M9ThdjOm1zJKe5GZlGzuO2HIl
         ucI/WjkG069EbuxStvEbnA5vho4538OAMmmGPK3PCQjg4K6FCvTjR8lhojci0bHmZlTt
         qD3VkpkpCu4L1rJLSPkWdEB3JH7EcXqDNq9jJIYNEzYUDfYmG30J3qMCw6/x12gz/j7/
         1+KQ==
X-Forwarded-Encrypted: i=1; AL+hErHjOWwwLR2bcgZUXRhC8SoXD0GGkQjIQ3xXgf2Hj1Oh24oISZ/1bP0JkVpd144XII1bxbKpHif0n9Tqng==@vger.kernel.org
X-Gm-Message-State: APuU4Z/XlRqcVfHu2ULb144gh5lVJp/N3c/sjJ9Ih0lhtHAXh400zqa2
	UNBWUPSE/i74wPv5Bpva9DUL112XC/ri1OSdltDje7aLasl5++wkTyHt
X-Gm-Gg: AZFdTZc5JeOZOjUGTco9h2XTZniucvaqxUijUJL57uxefZio1Y/Z8LauL6h/osltK4S
	OvVbwfy9SuNF06riJ+HQMSiJyGhU+q9SLlxamm2wkYH+ZR+KlCGmMk3QHlQnlDu6/syz4f7zsHq
	1MLl8wLgaL4wcbcqknODlIpV3LKjZfAkFUspuscupQFaGUu6U7asrNQ1sMYYtAxlr/szRoLP2TJ
	k+RSfzJyBFajgNWUjH16lNt1vtJshZHY818TB4pATd6L69VWhECuuBLIC1E8J4os0QYaz4zesGE
	9li7nz9CN3dFStpWGy7p7TGGT/0ZkJiaJ9EiYPeNbYVyLfc371imNvpJ29oJMBcyfHwIhlkXX0j
	6BitIPvzrTxWOyekrVhpr+v8JCvmMez48/W4wZLwrNdeHsOgHPfwFcVcVnqSFIYaQYS4dTs78Qo
	FtH0TVVa5DaAIM+gUEhuOkTj6h4fKq5DXqwspdSISVM+uc3EgPqSPPOSsOgyvSpJ9TBJTzyV1ZD
	hJk0UtIl9aHq0ldJVCNqwpzkDkMJ2mtDEcdtWQKoidXRJBIRZAw1X7q5MnluVjQxU/cJMP47oae
	ulMxGHp9ftMBdxNJsLIkM/JPXp4TT8wWZ69E5JErotEvMqg=
X-Received: by 2002:a05:701a:844d:10b0:1b5:888a:a1ab with SMTP id a92af1059eb24-1b5888aa35bmr5436082c88.15.1795682770738;
        Thu, 26 Nov 2026 00:46:10 -0800 (PST)
Received: from [127.0.1.1] ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm48473417c88.10.2026.11.26.00.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:46:10 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Document the get, put, mmap and munmap operations
Date: Thu, 26 Nov 2026 08:46:08 +0000
Message-ID: <179568276877.2784410.11651710233519548918@gmail.com>
In-Reply-To: <UAzdHWBlSIO_jTuii3HiZg@nvidia.com>
References: <20261125172022.2344949-1-takano32@gmail.com> <UAzdHWBlSIO_jTuii3HiZg@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

Hi Mikko,

thanks, I found it now: Amit Patole's "gpu: host1x: document the remaining
host1x_bo_ops callbacks" on 2026-11-05

https://lore.kernel.org/all/20261105-kdoc-host1x-bo-ops-v1-1-cc171c9e36a0@gmail.com/

which is the same four members.  My search looked for the lines I add and
for my own subject, and his wording differs, so nothing matched; I have
added a search by file path to the check.  Please drop mine.

TAKANO

