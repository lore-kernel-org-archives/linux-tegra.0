Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275A23A3E7A
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 08:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067512; cv=none; b=s8MqbCg3EHtT0J6obFHqwZFesKDB83u2x64SQ2Z+STnmVnMHbZtKG4PHpftjwLDU/MDBcNPcBFzpQexp3tQ+Hyu/i6Eat/OxLwGlA3LCLNKkQoR/TsV7KzMWzJGHIiqkNNL+Ia+lifvBeoz9fM4lLrPU6W8LyQjf8xeo5QpdUFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067512; c=relaxed/simple;
	bh=cdFk9qYNkWRkyL4yx5fX1+zERqhUHhUkyMOAmjOBvQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxLCMtvEJPhePYT7I+Igw4GVQ27iv+aFLip1LsCX6TBsJh2NJMtpQyJUZy49Xg5Vf21jfVw1rldNTjy7hrFcIGQMAZpC6Vn4ey62OS5nbRtnYbYSLmPYkk4ScfEin+9ZVz4fHU+ZjAiFLg6kntvZp1Cl1oM+iiOmdF3ayzvekok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ineHvU4g; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ineHvU4g"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488afb0427eso51823845e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 01:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067509; x=1776672309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bgVAXUp4ABfEYNGLPdeyADY9E6Zgs1iS/q+7Ud1//rk=;
        b=ineHvU4gXhmxQQ3gBc+nmcpIO6+QMOO4XU64M+LNB2aoviynyOjs4X9qGwxodvu3SJ
         ZWpMb+ff4fA9PvHalRoBsufpQ9wn6gCEGxD+tTcH9Uf5ukkkI0XX0OkH0AN+SS7NDZsy
         SvKvK+Dt5P3FO1XdkXsQSj+k93d/nywDwQOS3GJ/gT9seHkMZsVpRP84z2Y7sgq6evMr
         tktJOwXR9Keutsb0+F8TiFYkVt5GhU4Eq9eD4Xzx2c1x1xrnjtz258yPlpSCwWrLPwQG
         c0Dao5QOMQzccyLg6NsBeQ8FBIpH2R6rVZTXpvQISomxK4wZSyADkNVTy8oIAIQ0o1Ql
         7V6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067509; x=1776672309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgVAXUp4ABfEYNGLPdeyADY9E6Zgs1iS/q+7Ud1//rk=;
        b=aqhQfKHaKT3g0eyDrL7IWOrJdyCyEFYh42YiEj8fQ/K+K9iRc8hS/d+owgR0RWtdm/
         5nJDaRFT3kq676GUYlwONCjlPOY+b0U7Qdg9o/oZLDv+YTbQFO4a0IuRnlZy8Y6kMq0z
         D7UVqCxSNEDTYTpFIDr/MXbiGH++Uj/FnYaqeD9Kzb0HPg1QRwp0NFOW2XDS28LtBYVe
         YlEbEW+zNrcqSZw+imZkRxYRf0SZu3FabLiTf0AmGbLRoj+V09KWuYHn6VvXgTS0R3qQ
         pCfo6636/vmmfQ598LywiqHp5Iy7G0VUUqqh1p5d72LP4mvcvs6x10YSCRMeUbuqjcQA
         b3bA==
X-Forwarded-Encrypted: i=1; AFNElJ8zK/VmTAYZxnvEghlbUoAB+yy0FrLYcrtFpZDYYqhogF/sA13yzXQE8vN2CMJNPEJuJhz7m43vGedSMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqeXFO0xV3yxSPugkiSXlJnskU7W0vC9zDulksSpO/nhgEblrt
	puHl6HLe4VV9RrL2ukYfRyCSgFV9g6UYLTDi6w2y1DDF1RpoZbrx3/YB
X-Gm-Gg: AeBDievm4it9w7ArMfNlXGahb1/+UwPr5/Ktr8uniHkUFRroPfwN6zFCggIyPWebyjB
	jPWhBdp0CcXahBaZGik1diI9demjfGNlJsFBITMG0v2bWgdwpOOARlSodAHiwLMKh6bX96JaOY7
	FiCw0qbP4BK5qBo0JFz4h2/Vd0NsSsp5RqgAvabC+hfW+SQvai3SrvLxx4/pTyZN6afyNhFeb2q
	2WNKNlXHj372AU/qlDlQD99NKw7n+c4cU56L2lgHGBUyn6Eu/xYavd1auJXMqteV5E2JXTnPdgO
	6H06N8nGkldUlNBuXl0Dsx6P/QqBDn3QUSETWnvVo4UoO88/dY6jlWAladQ4KvIRZW+vkGy29mA
	DY1e42iVXXhZYA8I2hkIi+JkFibBZOTyCh53ooO82CgwyhKPKeOo/y7qDFYnnHw9AUbHClfJyV6
	JBuq0OlT2zRRsLWIiCta3xkJ/K1Jn9Zw==
X-Received: by 2002:a05:600c:4f83:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-488d67f0aa2mr148620055e9.12.1776067508380;
        Mon, 13 Apr 2026 01:05:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46713sm31856761f8f.21.2026.04.13.01.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:05:07 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:05:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: tegra210: remove redundant NULL
 check in dequeue_buf_done
Message-ID: <adyjsMVQ0QMr5DUe@stanley.mountain>
References: <20260412172416.33052-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412172416.33052-1-dennylin0707@gmail.com>

On Sun, Apr 12, 2026 at 05:24:16PM +0000, Hungyu Lin wrote:
> list_first_entry() does not returns NULL when the list is known to be
> non-empty. The NULL check before list_del_init() is therefore
> redundant.
> 
> Remove the unnecessary check.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

