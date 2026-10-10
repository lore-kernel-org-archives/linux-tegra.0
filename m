Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956B63E2ADB
	for <linux-tegra@vger.kernel.org>; Sat, 10 Oct 2026 20:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791662492; cv=none; b=gW/rCcTYaDdyFlhxURsieB/m/XldoIK0XOjHHOZHG6mBzYNMDlMvLXSa1Lh4N85zUwz5iE01wRivNpb1CynOVSqQMszJ1n9yn4q8KcctbNvi+mECtlVVZ2t60Kq+pRsYRnLublQnbhQJZusA/kb4emr9HuzoPvhvmtXcuKb9SJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791662492; c=relaxed/simple;
	bh=XRMulLqQ9lTxfpINJFkOFLsDuOIPnmi9UOaet3zqcRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a48luO1SOdBcX02U+bLi212omDD5WtZMrIMzdoL3rtWAdYc9A4y98H08XXNaWwrjGOwojACiLNuF/m3eTtFG1G6znsoLBFowQhmh7UGBhmy+/8P2VDkwakmzoQgU7Yw1h9OsvRrcUFuNmGrFvc03Hds6hvvaQ9IBpmBSXJmR68U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maticrobots.com; spf=pass smtp.mailfrom=matician.com; dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b=JMLdJ07s; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maticrobots.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matician.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b="JMLdJ07s"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3115c4451c8so739031eec.1
        for <linux-tegra@vger.kernel.org>; Sat, 10 Oct 2026 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maticrobots.com; s=google; t=1791662490; x=1792267290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XRMulLqQ9lTxfpINJFkOFLsDuOIPnmi9UOaet3zqcRI=;
        b=JMLdJ07stMbBRhiZGHaVO5NQ+s83usNAru/yE27GGgJTqoLMSGs1lFmtlXxTCaJ4cu
         2+FhWZP7zYQ1iC6WAy0kdIgv+hxS76Kzog+rjp99ik2ihdEcZXQs9dfY/YWppvT+8/vh
         j7kwo7GT1RkL1SJnSSDHe2v+LVHmV4qBezgwdArEMmdUBDfdY0VceNvZVYXlCe1Dq8aV
         GP+zZWksBHOFECvfZE2Y/07ehzADC7KkhCI6Rz8eUGBvSJu/n1vFjZdZgBgCu7oj2sHx
         2w3rtmZXbgMv4wHNVYc0pv09m6O7yJEVCpA7lZH5jXap2Jr4fZ8qOeh9Yx0DMjYL7tT9
         pOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791662490; x=1792267290;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRMulLqQ9lTxfpINJFkOFLsDuOIPnmi9UOaet3zqcRI=;
        b=QiS5gAS2CGHtr+/e9ph54xa9rMQPytPEoiCUEJeCmRBa5P+VmT5z2pi5BRiCRs+z+U
         nnzmxKaUaghZeRegORLUDG/0w5+D67jGvhyg01+beWtGnbyoEX0GODpWlmOxzNfH3iPV
         n+W5hgdRr6E3XuUq4SdE5FGjaRfQdhX7UY9Ql9zoZmrn1tu7pSNILxixOnEpvsqA0pf4
         psmZ0crm8RlJ2BEV2caA1R02JZPcDdoK6QrW1WosxgNiHdn7u1GWcLzNaE1h00L1sBp1
         rVnjz8G1cPLFhFOfTnIuvw0fkT/ue8FZaZOs8lLFwrMPcjzXcPwe3oBSrAWeU/+DxRxl
         MAbw==
X-Forwarded-Encrypted: i=1; AKwUvBxn4jtiI1l1YEEXj/onhTGB0wUehzTuPrEJtXzHd8j8PwzEuIlHlWV3mnwo8F1H63VRpUWoxx+jj+J7mA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLhSfGPorwwnNfm81jEeCDp0sS2hgaGRWv7Ck2a62x8i4cbxqhY
	V9TZmdYEUo3cTNupo3G3XjCxxhANfr80QgYq9FAz8HvMlRI2sAVnFqA56JMU1Iu6UTA=
X-Gm-Gg: AYBFou2tAcjBoyDumxc/EYvw7/nzwEmgjNEmOnkusbdnhnoxLB1Q9zVC4MgdpnpuFLC
	N1bcacAwj3t8rObuL5LpRUtIJw1zCC4hlqsVhLugtcTyqh/Jx8TgfpUnDqNbcSjSbiAGb/bE1hv
	KNKVMggqTWZ5ZXfeZQXYxoXyGPvZ6pDyVHLw/pX+/6psauQF7vvFD7F9Vh44DSTY5GLaQcvjfsX
	xju/xfgndgpZiUCqvtak0Vot8UEHCUr5RjJvf7Kx8DrcTlMpoo/9SHQhmALnurxTqsMXwypEvGH
	bXy6wSMRFLtdGBLzADw7UsT7EFODml/z8jurWnOhMwKPyMga4Saf3oCe2PZwWI2cf5ZL6vFBwx/
	cAi8Ero8NCegFzM3T0VfTmejicFp+tfAy2pGDn6BicrqnST9oSO8iEoMhFo7+8kTHYgwyvBzWS1
	isoUdi/2AM56lxTQwLiuLu+j04EgRk51RRs/U/XUOJDGCTiPj1y1h4A3014CdkIgr5H3YlskRu0
	5pX5F75ZoTGLW8jV+Gk/XRiNDk42HDEWa10TuassGYIMBQ0
X-Received: by 2002:a05:7301:7d19:b0:353:7b3a:1c84 with SMTP id 5a478bee46e88-3537df7772fmr7765406eec.5.1791662489397;
        Sat, 10 Oct 2026 13:01:29 -0700 (PDT)
Received: from abeMaticDesktop.1020marsh.offices.matician.com ([2600:1700:471:807f:88c:2ee5:394c:5592])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm20792549eec.0.2026.10.10.13.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 13:01:28 -0700 (PDT)
From: Abraham Zukor <abe@maticrobots.com>
To: Mark Brown <broonie@kernel.org>
Cc: Abraham Zukor <abe@maticrobots.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-spi@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] spi: tegra114: initialize native chip selects inactive
Date: Sat, 10 Oct 2026 13:01:09 -0700
Message-ID: <20261010200117.625169-1-abe@maticrobots.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916020031.161347-1-abe@maticrobots.com>
References: <20260826000517.631736-1-abe@maticrobots.com> <420de339-53d2-40d9-b04a-a54428450830@nvidia.com> <c6868d2a-f55f-4196-9914-f096420cbabc@sirena.org.uk> <20260916020031.161347-1-abe@maticrobots.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

On Tue, Sep 15, 2026 at 07:00:28PM -0700, Abraham Zukor wrote:
> My v3 needs adjusting for the first case. I will implement this as a v4
> if no one sees an issue.

v4 is out with the change:
https://lore.kernel.org/r/20261010195503.623287-1-abe@maticrobots.com
