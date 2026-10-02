Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3624B4867
	for <linux-tegra@vger.kernel.org>; Fri,  2 Oct 2026 15:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955991; cv=none; b=Yd8qk+nTkEVCNrxOUnKIdcnlC6Y3XjNaig0GZTfM+JQZvmp/Df7wzdWRylE9M0OpvfQQTO4v+QkyYsgGYjXcA6twHcodQsVkwxqm3z8S3VSpNe5ucMvPqnFbd133KTlyfRLrtdXfyi6iUac9WaNs/RfVs0gjMdZhVAk7twsLZqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955991; c=relaxed/simple;
	bh=h28xSIp17OKs/AgiIrNq+DdSPKZiP/ZhWr17OJaw6v0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iXz1aePJ/RXQyWoTen7/cs8GfWO0RqXf7SkiptJ1da8nWiUI6rVLF8mpVioIAFQKvHE76yLZ5tOX5ckNsPE1L2hzqpjzYVa2iuaf2kmag8Vf5ia6TtGYHRFhScZuSZIdoHJXfFaP7Qh2tJHfnZJEaStuZUnwIwF/wSdmqpgyFeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=boSRXA0u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eopCkTTT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="boSRXA0u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eopCkTTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790955989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkAUcAmviJBE+AfFgIHguRjot4BcqQHezlPnJllPFWc=;
	b=boSRXA0uww2VevY/aVLg9v4AFUOOzUCGmolfLvfnq+FOJrGXiTQXexejCYMSHKsAFJsGmn
	XDooiy1VP08H2BzSSb5BmCVuWx6dez890OkGDwbHhxv6CQb2r94iwiD85F48MMpiQHKc/7
	gesjC/rcFrriTGYnv+ef0oxGCy+d+18=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-bGd_JfhgO_i7J2GSULOXPQ-1; Fri, 02 Oct 2026 11:46:28 -0400
X-MC-Unique: bGd_JfhgO_i7J2GSULOXPQ-1
X-Mimecast-MFC-AGG-ID: bGd_JfhgO_i7J2GSULOXPQ_1790955988
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb71b1443so448100685a.2
        for <linux-tegra@vger.kernel.org>; Fri, 02 Oct 2026 08:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790955987; x=1791560787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkAUcAmviJBE+AfFgIHguRjot4BcqQHezlPnJllPFWc=;
        b=eopCkTTTIgHgygBF57ZjL8jbqnAWngZ5pqqHQ5zV356I7kTlMUzwLDF+KIlr6lQqpc
         6V3/ndlGDkbs5YDeOWZQ/FR2cTV3pKDdUatOXUIYUrgBOsSwOOlVW7CuW6cuvIrWRexP
         XJSG+AR3eKWRVOuniShBV/SnRlBfrADRNxKY/bu3J1c9DF+H8mDSXXpYGt6WSRwIkfWd
         pCsKf2oE2gYbKstCqM5zwLIywg1iBnxDtWiwEf6RbcUt8/xPAbd62Hn04bNaVLGnzy8P
         rdgUxd4tKKSpLhvr0ATRVvKzZjpQGpJUEI79pqENg5i3veVKpke+oxA251flaXSgysrP
         P+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955987; x=1791560787;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkAUcAmviJBE+AfFgIHguRjot4BcqQHezlPnJllPFWc=;
        b=P6JoAv6Px8EISr8AO9FX6mYqCnTnoMujv5FPIUzzm1yMo6NHXTj2HddbDJLInATTYS
         Y+MfP0BpjIleiSGpL377UmYJwgdmdvNCxLUnp5+Hxg7GHEuKRNid557mZQkL+xcW7/8M
         2Hf4FeJmQeVP09rII0bM38S35dGwMyPqrj8SQqHIwjO/+hcRNwSNplVbzpCCS9vzR1R7
         JQ/pd06aDRlm7mBU//y7jSHQo/nQalGUzW+8tUbrx0nA06ytS5aGsrx/sn7DdwNMrOVI
         ImW+DsptBAqpQCObar9Q/zvanceGD3JBOknclpLFLAX8dxGfdSWYBrEiEx7SGFO7c/lw
         FVfQ==
X-Forwarded-Encrypted: i=1; AKwUvByoxpQ1gwZFqUz+7JGapi/+LH7KzrTC0chQJpAzpsbUyDJPbRn9/0qQ8a2FRo3iFomvveOr2TRviNorcg==@vger.kernel.org
X-Gm-Message-State: AFuF++kpFkyNK8a4Jc42+ni2ANHudtzPEZj0vuO6lPNBV3ynjFlGdQPe
	bkOEqdPNenKiAvQyC+twso+cWQo43OlPdRE/+2DdZdZ8kNVLTAMcLGn1uQgZeBM7a4DmtA//aRM
	2NLmGxG5jN9jMlm82ihzjYHA1wFub/qi/k32t9rV+K37YedWFP2MDRw1oJipT5XoOHxsMxYSwoA
	CZVnK7V3WGcx8q9hAUmAmPZISJ3u0/UT9b4dRZP5/y8qU+qQg=
X-Gm-Gg: AYBFou3ByyE1ZOy/NIYRj/Id024sCkRIm+kkl7yTS3RNLgzd/Z5QZweEs8XHwxfvCRr
	QPOXhAcshPK1EzkNQYDN4FT+mqIHyW/pkrx5yu6i1q2EyTlBza48WdRj0rS08kHV+T+eZd0FwoO
	zYxmc2eTEQr4k89DeQC4g4jQ7fw+lzUF5d4d2422oMxjM6ZSsznS9Q1I5p5N2lPJ9UkRYL+wizi
	osM89caWYXwyNB6cYbnt8GfF08Z5Jda9hicMEJrILfcBvC0+zSNVvosjly1YlQRTBGvLaU72shW
	m3DiNBu/X0bnReRBFzBS1b/0OQ18Y+JDE934VQJiC3UO+79Q4fT18u5a6ZE1eVwb4fbyT9S8lbk
	1mhA70Oulf7NY351PdEVmSkgG/qqf+gAqdG8JEGjtplHg3mvDv6g=
X-Received: by 2002:a05:620a:1a13:b0:93c:c98d:e1b6 with SMTP id af79cd13be357-93cf178a238mr541165385a.48.1790955987338;
        Fri, 02 Oct 2026 08:46:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:93c:c98d:e1b6 with SMTP id af79cd13be357-93cf178a238mr541159185a.48.1790955986487;
        Fri, 02 Oct 2026 08:46:26 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca209601sm250629285a.20.2026.10.02.08.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:46:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20261001054701.39160-1-rosenp@gmail.com>
References: <20261001054701.39160-1-rosenp@gmail.com>
Subject: Re: [PATCH v2] clk: tegra: bpmp: remove kcalloc
Message-Id: <179095597991.810253.6056329084530494982.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:46:19 -0400
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=267; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=p9s0POduzL50uWCzmc8L//0zD1FZFy8osEfnLmwPpCE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2X7xwlD3q0Mk3N81nbOcpuVDJ4shx5VqkofuNK0t8q
 5zkd/vXd5SyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRac0M/7NLc2IttmQFTU5a
 uPWu9kv/HRz/0lkjLru9WDHz87aLs/4xMlwpS5q7a8bS/AVXHn6vDbqh6rXRLriQfRnnxPz6rHz
 lB4wA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 30 Sep 2026 22:47:01 -0700, Rosen Penev wrote:
> clk: tegra: bpmp: remove kcalloc

Applied, thanks!

[1/1] clk: tegra: bpmp: remove kcalloc
      commit: 2fdfb2abce2fcc157de840949fa3e6af9e915363

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

