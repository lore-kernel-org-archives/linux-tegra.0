Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712523C3BF1
	for <linux-tegra@vger.kernel.org>; Mon, 18 May 2026 06:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779084284; cv=pass; b=BNMgSeR62z0fattCc8uFJ6YUgnwEmTMpN+AAve2/DzkpXOIzo3uHQ8Rus5VZwV9RxSu7ZqLKQFScofpQ/A4DmQJGQDRpHomARryY6iDkHTcVJ98PU60dmg+B7V8u6W3EHplC56Eot+RzgIxTYV1ZkdGpIHShgIkM7xhcBWwLu28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779084284; c=relaxed/simple;
	bh=vtHgeV+zQJIv71o+QEkDovvRJUG44luhjTRVE75G6u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPbIiMdoYRuPbOqXeaYBnVMRGKn/A1WoIcCPTAqnpFRmmqWxgU0sJL8vMVC1DriJglsGGrYDDA3yLIeRwla32d7nz7NYxkAk7VKgTY6va7MHyzSW0nux5HOPOiXRhbILVmySXNqrwO3H71b5UNZ/DfNBOXuGIKmfjHI9BF8en0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcuGjW3k; arc=pass smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcuGjW3k"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9116861f004so509764085a.3
        for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 23:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779084281; cv=none;
        d=google.com; s=arc-20240605;
        b=VlO47OVkwR2uqy2U8gQfD0sdjx95TlsJfXkKsEZQx89i3tFiLesW3ggfNsBY/jBArJ
         LqWaNoOzYeXab4m5IoK/P0705yJCUDxMfgQAFUZ+s7ns9kK4oZ4Dl3BJ36poGkOcSJ/8
         zkJV1lwe1+zorJ5/s7n8SM8pdkPVePHeCTtMya3Jxz6pZjlt14uyegnJxPYPl1ht3g3M
         1ErKv7f6Rn35eBRfYsKZLy4w0CT3Ia7Mjd4sJs+slXY0GQSReNxuDtq0mHv5ar5k5l6W
         b6LRfm1AKcwVMvqczE94pM1aBFCkFTGcKFqj4tmY6hDn05tKQI1kY17UaT8xBHrp0oaO
         E3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vtHgeV+zQJIv71o+QEkDovvRJUG44luhjTRVE75G6u0=;
        fh=Lyl5PQRBYeazJ8TXzeU/lAiPnoue12h4DNwzKeSdPBE=;
        b=c8yh+I40fYmnZfNJtOe49913f06StVGTDVdJCPBBZpJOrDjwnSfPqlG1KzoY6xnOK1
         WVa9n2lmZCh4rZaveLnHFyLBm2nHtE4Apmd5Ua6z0nIaHkJglnQovzdjwIAJSDQsmcS1
         Zk7wnrVQubN/0jIGeEGaWMqL1YotRVgmAYbkoIhKMbSaBR/6V7dNYU0/5K33NsmfUhOH
         Jtk3b5IGy1tWUcvmlOhwdys4PoiTgbxrQ3BIJQ/yvfw0HOyxDpOYpw135FIK6/qmh8XY
         lqUE8uwRUHBFnfUDhZG6C53e43hbNbN4oanh/Zu4pznXiqQyUBLJI1KZNaJd0eyloRbR
         dWJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779084281; x=1779689081; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtHgeV+zQJIv71o+QEkDovvRJUG44luhjTRVE75G6u0=;
        b=EcuGjW3ksN6giWzvTreieOrI3/Ek+RtjruNGKNEibARL3VvwiRAGwCYLHq5Sgs5jqG
         Y79JajtxpYqQ8Rxq2Ryi8dZUpxDEf79K0T6Btob1f6+vI/2eMeGd2+42ZLSRnNgaHzpr
         xdP6rgfG84nBfh1d0r785k1cgmyFfMhzZd+Ir3RUAjZIB8srqliLWovP/lCQHjp8h1Rr
         ebabfAnnmGpUPpssYTDHjq6hAiQ9qshfTTY3qxTjUhS7M4txMwQiIc5Y6Kskkm1XDJj9
         P2o97RAFnj9bpzBMlEE5DEZH+RNq1UXk3JgS27cF/hAYD5G8MgDqXrpkSKu4dth0M/PK
         MknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779084281; x=1779689081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtHgeV+zQJIv71o+QEkDovvRJUG44luhjTRVE75G6u0=;
        b=WwtUcC4fzSYx3lB8M8dt2XyIfkryLA/HOQ069gUsA5BWNJvN8CJoKvBJugoHbdFI4w
         MKTCpID50ngYfIZYn/8I1fma9a5az42JkfeuKO3FSQF3Cpn7V2c6wSk4HSUUpNHhCLng
         ICXVgbcHDt9RedfMvF28fRs0fJTrV4rlbVCUsU+rnxcRLxrtKlt3NlqbDjBxdlg48qQD
         iZFmsSSZFKtdNanj15W9kY6SQC3Zl1PMabPsYNoa0NsqLdVlvsJaQKwQitLwgyNORWIi
         2X/VbN0ZEdQ5nfC54IL9W3oQ77lH6fcZRr9a05SGsE065I92sTPyKfGPz91adWsvzUI0
         JfMg==
X-Forwarded-Encrypted: i=1; AFNElJ/j4PVk+FAlbwPptSajNadUUb3VasGZS3UWGspzdxACKVIZdvX2UwP/Fbu2cBkiItw6MtOyiqq8wyvbxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ03Ppse6ZGn88ZCtKKLEg1PrigEc7uoaQGxrsaP6ga0KuDHXY
	XQzPZ//urB566SW+w4v+MKMBKFbU+Ae7/GEJK/mqcSTtmLqiesoo2jP21+YSKWasm+q8nsdUDxC
	6t4bC+7cUOz4Qn+aH+bg0GHzzdEWC0dA=
X-Gm-Gg: Acq92OGwCK+2HhmhLIa6w5gU6kTLQbdLVTNEDJn3f5fC+mI1Qk1NBO6CQGG69OqPhzm
	r2L/7TjkBqzsKbwL9TN17tLX9Tty+d+i4SczTg6iNbg9hHQ7axvX+2x25gcdUSlmUpWnTxYXN+s
	6bfjoA2puNnynZ1zf5Jhn39CwTUhESZNKb22vSzp4lThRTivdgy037iY2bUosQ+oFMMPIXpWs7O
	cAvBwDZDwvywPhfEs/3iTqaIKHc444BPvm+poTcVOVzpMdG4SvPMs+yE7BmGh/LvxVCXhzJHrr1
	CqJGQspP3qEHoIsgvjbOb/nXBkl/kVLSG57+8gU=
X-Received: by 2002:a05:620a:410e:b0:8fc:96f7:fea5 with SMTP id
 af79cd13be357-911ce142977mr2053074585a.20.1779084280878; Sun, 17 May 2026
 23:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517060511.231437-1-diegomancera.dev@gmail.com> <agqeyhCD9g7IjqjS@stanley.mountain>
In-Reply-To: <agqeyhCD9g7IjqjS@stanley.mountain>
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Date: Mon, 18 May 2026 00:04:30 -0600
X-Gm-Features: AVHnY4IBX1C6cTNlrKPXa2psS5dvgVqHLE41K50sutelMdmLDd_-PPa_4a1YKBI
Message-ID: <CALruWrX5Cg2_Vy7up35AapbOAoEjLW5zaWqSxNqKriVaGh_bww@mail.gmail.com>
Subject: Re: [PATCH] staging: media: tegra-video: prefer using the BIT macro
To: Dan Carpenter <error27@gmail.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	luca.ceresoli@bootlin.com, gregkh@linuxfoundation.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thank you for the clear explanation. You are absolutely right; I
completely missed the sequential pattern of the values being shifted
into that register field, and using BIT() there obscures the logic.

I also appreciate the correction on the commit message regarding the
signed overflow.

I will drop this patch. Thanks for taking the time to review it.

Best regards,

Diego
