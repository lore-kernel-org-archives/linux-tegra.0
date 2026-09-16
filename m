Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3783AC0ED
	for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 02:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789524058; cv=none; b=WhUC1PMDimQwx9wmnImjT0ukm+lrXA93OUUkLeADgw1j979ROWIkQk57gUjCu0kjN7R70nFodDo1fb1CpRzoIcjL9AdE7boI6BgdSDv3tQq2DYdFCxKE71FP9B6Ta6h7z4gXETdM3M7VscG3VdARVzdQhXuIwE5gNE0ZnvUAbzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789524058; c=relaxed/simple;
	bh=z2vnxYECfe/CK+/EmMjMDlztEhbtnFjpr0RMVFWdXpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=unoSBGygp0hrCOCq74mXr1gG0tbAZIoJuW87ppdnWEeVjVzYZLMW90+fUtTsZ0I56v6j7G+NQkM/TTpekmfRsHXmCe5xv3uduum6mqA9ZxXcNPoVEubCZCJvNMUOG+h+ZwZe9MV5b7CRtdeDD0dHm7MtlgrY7jRUIe4ax+8QeLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maticrobots.com; spf=pass smtp.mailfrom=matician.com; dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b=HVCzwgFK; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maticrobots.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matician.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b="HVCzwgFK"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so325035a91.2
        for <linux-tegra@vger.kernel.org>; Tue, 15 Sep 2026 19:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maticrobots.com; s=google; t=1789524042; x=1790128842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RR+WtBbiVNxPAorgDWRwyWsfbjTaY0Xp64w0w7OzUbY=;
        b=HVCzwgFKkfh6aKjgL2wKm+4FvR5rkaT7Y6nq7I0TtPmzLzpX5BAbJZjdiIXkBnaE3/
         W/y1TWuTikGZGhQtgL0kHC1HA5DrSpHTiI6aZ3+N1s6naSeM7bzUekvVtIA5zcqG4CLT
         h6xI9S17e8cBgdTBtxnLBWxsC7S0BU247nHEq15JXpIYcCgHkC2ZhrpVxbMF3AbOzuYF
         ngIniWzSDSZmhcrJuWB5lRAB537qrktO8t35j4NPnigpAErznE3zZ+A7Sd2KcVijqckb
         i29pA/aPhxrQs1k9r6du4Iq5LZN+pBwc8XVueiThQon6quRBMeg87A91Qn2X+fOw7AUC
         Uzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789524042; x=1790128842;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RR+WtBbiVNxPAorgDWRwyWsfbjTaY0Xp64w0w7OzUbY=;
        b=KEa1el7EI+5J8lkp9xv9xskaS5f1ycZi+FLCPzNDnLj0hkNHu/n659OR1Fb4DmnIkp
         pduFJUxcGpiAxsIxcrMH2DD4SmtzWO9A9r6crGJ6VYuk+arcL6FRwAxvo2fuvA2p3LCd
         m9dmLohm63Lbc1T5PmLvv7qI1LQDDhgKBWyn7KJ4ol3cet2UdeZu1wCxKLUTxeI2Dw4r
         EK6rHri4Ukz1nlk+zCFIW2bEKU4nAEHMN7JnRcU3EZMNx7Gz7vtZdocryEsIPLUNMHEG
         Afp5JD8Oj/7ySK08tTGDXpW+Sa/Ss6oZYWaCNAYv++8QJvuy6kL52zH39m9GbSuY3GlC
         aKaA==
X-Forwarded-Encrypted: i=1; AKwUvByTuas9EsJNcmVx95frqfHTe3U6O2alxlCulSHGrmGieigUwBBQ0lgTNK7LHInrJWFd3aOC8Qg8S8rZVQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mF1wM7+s48gY/VwilcpMrgRE2goaDCEA4FLURqteCQRs2WQpQw
	AI7Yr1uQL6smDDrRB22MrGWxhGLkS/4Zj7MOhNDhyh0JkHD8F+R1oo/iJawSKpSGBAI=
X-Gm-Gg: AYBFou2tKg2iGJMIP8GzXN46hdakUFkCAaw0kGZMwJVy53Jy8ZPd3Y5WzjXwpJgG4+2
	shgZSMI6zTFWD6IaUfI76mQg49P0h7NnCxHBsSqKVoj7NtH2gbpwfeqs38AVoCE/gwT//89Qtlm
	Vro1I+SX1SYeZWqgeMLchOBkncTJPsUNVBGJ6LFsFhuH0m7yVGjLl9qE33FkZ1eDw7mnxyrZLyw
	FHa5ZMSwH8+uixkPvIpWnWS+sReN3NpOb+VWGrHc4oU732ikDeDoSulZfZnWHkiUYlE5X/f9jTg
	3AF9bpuiEQORikF1tvEgHucBbT2WNkOQypJncz+uR2UIMOwXTcQOHLNKLB2dknq8mDKV4AP/4EW
	PAp9oGQcu9bjA/y0NMTSw77NJ1lvfoshD2yOQJG5apgNcZs1U5ydET23UoyZiH29HneaKXRwFMO
	PduVx9YkKYCsYkcvrHXPWUAsCJTypPrA0v4FtlFlH5wAZaGr9L6XyBR6oDKDyhd2JSSSJG5nZSZ
	X4D3fR5KZkW/BydAevm5U+ds2ma57AWDpuwWV1bHRl+7TM0JnqIjlsOIx8=
X-Received: by 2002:a17:90b:390d:b0:39d:f66e:1720 with SMTP id 98e67ed59e1d1-39e1e4907e8mr1658967a91.13.1789524042128;
        Tue, 15 Sep 2026 19:00:42 -0700 (PDT)
Received: from abeMaticDesktop.1020marsh.offices.matician.com ([2600:1700:471:807f:c09a:1c02:505f:9e4c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm3056984eec.28.2026.09.15.19.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:00:41 -0700 (PDT)
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
Date: Tue, 15 Sep 2026 19:00:28 -0700
Message-ID: <20260916020031.161347-1-abe@maticrobots.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <c6868d2a-f55f-4196-9914-f096420cbabc@sirena.org.uk>
References: <20260826000517.631736-1-abe@maticrobots.com> <420de339-53d2-40d9-b04a-a54428450830@nvidia.com> <c6868d2a-f55f-4196-9914-f096420cbabc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Aug 27, 2026 at 04:38:39PM +0100, Mark Brown wrote:
> I can see a system having multiple variants with the bootloader
> selecting which device is active in the DT based on runtime
> enumeration.  Not sure if anyone is *actually* doing that, but given
> the state of the world with overlays...

I think we should handle this per native chip select:

If exactly one node is enabled, use its polarity, ignoring disabled
alternatives.

If none are enabled, use the polarity specified by the disabled nodes
when they agree, including when there is only one. If they disagree, log
a warning and use the polarity of one of them, since no inactive level
can satisfy both polarities.

Multiple enabled nodes using the same CS are a configuration error that
the SPI core already checks.

My v3 needs adjusting for the first case. I will implement this as a v4
if no one sees an issue.
