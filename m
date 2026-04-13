Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B0035F188
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074573; cv=none; b=YUeXp11jCJk/W4/fcvtaEg9ZVbCj9txfHg0LDi5HUmk9lUiqViBafMOlLjW99Y/CwxnwhX8YfmsGzvENeP0qerl2FzkZYFdR9p/mZPPWB1yBu3YL23FyK5D5sc0rqg05a5wIuShxsLKjr8gkV1CoJdLuLVXzsYUmEJh/KA6o0jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074573; c=relaxed/simple;
	bh=/QhB53YIvyMpzYdrzNOUimUEXpIr+DIu/a6bYjSs+Fg=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=nM2s4OwCTvpOE849XJWs1j5jvyRRZzUb+A3GAoz04hAtGEcu3MIIchkFQdZVR/kf9OiVHcbJB02lITUJp9SY3CInqmtoGubFtL3H2BuYQdRnuNdjak0bGZqcEB4cdkcXQohqu5vapSt9rSBlN4bRUIoYq6RcYmAzZLrH1HRxBC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8b/VdKO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8b/VdKO"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so779345266b.2
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074570; x=1776679370; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QhB53YIvyMpzYdrzNOUimUEXpIr+DIu/a6bYjSs+Fg=;
        b=B8b/VdKOTxUvtuTmrjMe3/P1V2azytrsZG7gfrr62bvhVpBdDVM6A/DrDOScQfC9tX
         K90tHVM2ZxYxT7pNFUoDmQEUtCmORda0dFid+1Rx+liNlPZ1PdlmGcVbXa5Ye8j4ZKMg
         MLxBMaUXlL8T/YPbzZsADKi2ieoSvpVq0DpEvOFTi0cs4LLnjwnWv17hW19EAJSqrt5D
         g1glkt98+ycY6qyOij1eHnNEZFsHsYYfz0poq45iw9hFPIThQCiuRPYh1iv/O62S/rhw
         7enmDbnzhMJ/OkyP9Oy1RkZlGbTOwf/FPN1wJjmGTukiEAXFoUERkofRWGrcp0BQs3DE
         grfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074570; x=1776679370;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QhB53YIvyMpzYdrzNOUimUEXpIr+DIu/a6bYjSs+Fg=;
        b=ek2XaIR+ll3RpCEeufnyzJYyZV641iPp98BMGknEPPb7d2sahYS6USJoaZXaX23WcA
         j1IbZ1+72uGEJshEfOR6sLBl7sQ91KeA2IuFaMaqaDgunPYlT1jqKiEUKrs4gVDQuD8R
         pqVSkGUJpGbc+EcLoZ857pJDw/Y4VOFMVEp835Pz/vH9+Zyi2f7cTCIhAIzrfO4agmap
         Osccg9njchPK/bcGoSZ/szD3qNqxs1QJQSDGVDhgeD5MyoHZFSOFeJbOTVywOQxJHVcN
         JAl0+W/xYR0VyPHbHvK4ipOub4MTBW1zoykD7j77L7buUCHQck6ioV7udM+zx+wTaDMy
         VbOA==
X-Gm-Message-State: AOJu0YyGg+8Mo2Bhut/oYtaLDrJ3C1V6COnaFCVMiwgbKEl9VxlNn5kQ
	oGzcGakb3Yg5/EapFazPlIyGgYa2BipHt6kBTVr89ABIOgu542IdAKUu
X-Gm-Gg: AeBDiesXez2KpRbLpEvj84WE3KBakHmIYZAYjZ87WBL+GRqBPwUSwS1gSdwiO7IfyhS
	oxHmo4K3jy2PSUJ/bPUR2qWEB7EMBR5+PMQOvMjnufsXcmntHoBF3KLHPQ7+5413GVnFYvGlYZ/
	nTFdiLSc+0DxaMiPqyl9pC+kAk7ezlWjjyHpazQ5XKCAyz4QHgvMADowzPfHaf4f282313rZNd5
	ZqxNNFEGWUjPOcagCvtpnsTYPD855O2SRlO5WfbrUtS+M1zmIUSsQpswgoPQ/0kVAnPgNEy6MaW
	PCY35MxaGs6bLYL2Vc5w8lCW/p75BnglJv+MvQkrHEx8n/DOHC5FyGFVXbZy4hXR0omLWyL51N3
	XRmLf/WuaTLBqWlSWumurJHaiFegE9UBIB5fzwWyeBdApWMm23N70ACUypkW6EU166WyBjStLbA
	eG8mvv6ADQli740QymnSJhz8K05rqPkzFItTu2+eV+J2jQ4csUO+Xi6eHn/Na8CYTLRbZ0u9FvK
	BLwb8BL1Pef4Qj1ePVwZIoemb5iz8LdVuUVWXSi9oMRYRY4XN9Pj26iFeqHDw==
X-Received: by 2002:a17:906:518a:10b0:b96:e11e:97c4 with SMTP id a640c23a62f3a-b9d72793974mr505593866b.20.1776074569608;
        Mon, 13 Apr 2026 03:02:49 -0700 (PDT)
Received: from ahossu.localdomain ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec4fsm2381250a12.6.2026.04.13.03.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:02:49 -0700 (PDT)
Message-ID: <69dcbf49.a70a0220.194513.9708@mx.google.com>
Date: Mon, 13 Apr 2026 03:02:49 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-tegra@vger.kernel.org, marvin24@gmx.de, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: nvec: fix use-after-free in nvec_rx_completed()
In-Reply-To: <20260412205057.386856-3-hossu.alexandru@gmail.com>
References: <20260412205057.386856-3-hossu.alexandru@gmail.com>

On Mon, Apr 13, 2026, Dan Carpenter wrote:
> Add a Fixes tag.
> Delete this comment. (Obvious).
> Move this declaration to the start of the block.
> Otherwise, it looks good.

Thanks for the review. Will send v2 with:
- Fixes: d6bdcf2e1019 ("staging: nvec: Add battery quirk to ignore incomplete responses")
- Comment removed
- Declaration moved to start of block

Alexandru
